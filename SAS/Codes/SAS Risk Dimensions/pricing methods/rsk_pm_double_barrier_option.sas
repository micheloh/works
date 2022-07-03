

/*****************************************************************************
   Copyright (c) 2013 by SAS Institute Inc., Cary, NC, USA.
  
   NAME: rsk_pm_double_barrier_option.sas
  
   PURPOSE: Pricing method for double barrier options.
  
   INPUT INSTRUMENT VARIABLES: 
      ASSET_VALUE_HAIRCUT_RF_NM - asset value haircut risk factor name
      DAY_BASIS_CD - the day counting basis
      DISCOUNT_CURVE_ID - reference to the discouting rate risk factor curve
      LOWER_BARRIER_KIND_CD - whether the lower barrier is in or out
      LOWER_BARRIER_VALUE - the lower barrier value
      MATURITY_DT - maturity date of the financial contract
      OPT_MONITOR_FREQ_TIME_UOM_CD - discrete monitoring time unit
      OPT_MONITOR_FREQ_TIME_UOM_NO - discrete monitoring number
      PUT_CALL_TYPE_CD - either 'PUT' or 'CALL'
      START_DT - start date of the financial contract
      STRIKE_VALUE_AMT - the strike value
      UNDERLYING_PRICE_MAX_AMT - observed underlying maximimum price for this option
      UNDERLYING_PRICE_MIN_AMT - observed underlying minimum price for this option
      UNDERLYING_PRICE_VOL_ID - reference to underlying volatility risk factor
      UNDERLYING_RF_ID - reference to underlying price risk factor
      UNDERLYING_YIELD_CURVE_ID - reference to underlying yield rate risk factor curve
      UNDERLYING_YIELD_RT - fixed underlying yield rate
      UPPER_BARRIER_KIND_CD - whether the upper barrier is in or out
      UPPER_BARRIER_VALUE - the upper barrier value
  
   INPUT PARAMETER MATRICES:

   DIRECT FUNCTION DEPENDENCY:
      rsk_daycount
      rsk_double_barrieroption_disc_pf
      rsk_double_barrieroption_pf
      rsk_id_check_to_nflag
      rsk_intpolate2

   NOTES: 
      Only for inclusion in a compile procedure.
      Only supports when either both barriers are in or both out.
  
 *****************************************************************************/


   method Pm_double_barrier_option  desc= "Double barrier option pricing" kind= price;

      beginblock inst_init;

         /* Create numeric flags for faster comparisons */
         UseAssetValueHaircutNFlag = rsk_id_check_to_nflag( ASSET_VALUE_HAIRCUT_RF_NM );
         UseYieldCrvNFlag = rsk_id_check_to_nflag( UNDERLYING_YIELD_CURVE_ID );
		 UseVolSurfNFlag = rsk_id_check_to_nflag( UNDRLNG_PRICE_VOL_SURF_ID );
		 UseHolidayListNFlag = rsk_id_check_to_nflag( HOLIDAY_LIST_ID );

         /*- Populate interpolation method variables  -*/
         length _yield_crv_int_method_ _discount_crv_int_method_ $32 ;

         if UseYieldCrvNFlag eq 1 then
            call var_info(vname(rf_array.UNDERLYING_YIELD_CURVE_ID),"INTERPOLATE",_yield_crv_int_method_) ;
         else _yield_crv_int_method_ = 'LINEAR' ;

         if DISCOUNT_CURVE_ID ne '_#_' then
            call var_info(vname(rf_array.DISCOUNT_CURVE_ID),"INTERPOLATE",_discount_crv_int_method_) ;
         else _discount_crv_int_method_ = 'LINEAR' ; 

		 /* CUSTOMIZAÇÃO: Verifica a tecnica de interpolacao */
		 if UseVolSurfNFlag eq 1 then do;
		  	_vol_surf_int_technique_ = UNDERLYING_PRICE_VOL_SURF_INT;
		  	_vol_surf_int_method_ = UNDERLYING_PRICE_VOL_SURF_MTD;
		 end;
		 else do;
		    _vol_surf_int_technique_ = "LINEAR";
		  	_vol_surf_int_method_="BLACK";
		 end;


		 /******************************************/
         /* HOLIDAY LIST                           */
         /******************************************/
		 if UseHolidayListNFlag eq 1 then do;
	         /* Read the holiday list from the parameter matrix */
	         call pmxelem( Holidays, ., HOLIDAY_LIST_ID, parm_holiday_list );
	         array holiday_list[1] / nosym;

			 /* CARREGA FERIADOS COM FINAIS DE SEMANA */
	         /* The first element of parm_holiday_list is the dimension */
	         /* If the dimension is positive, then copy the rest of the contents */
	         /* Otherwise, default to size 1, with a missing element */
	         if parm_holiday_list[1] > 0 then do;
	            call dynamic_array( holiday_list, parm_holiday_list[1] );
	            do i = 1 to parm_holiday_list[1];
	               holiday_list[i] = parm_holiday_list[i+1];
	            end;
	         end;
	         else call dynamic_array( holiday_list, 1 );

      	 end;

         /* Set barrier type */
         length BarrierTypeKind $8;
         BarrierTypeKind = lowcase( compress( 'u' || substr(UPPER_BARRIER_KIND_CD,1,1) || 'd' || substr(LOWER_BARRIER_KIND_CD,1,1) ) );

         /* Get extra monitoring information */
         if not missing(OPT_MONITOR_FREQ_TIME_UOM_CD) and not missing(OPT_MONITOR_FREQ_TIME_UOM_NO) then do;

            /* Generate the base next monitoring date */
            BaseNextMonitoringDate = START_DT;
            do while( BaseNextMonitoringDate < BaseDate and not missing(BaseNextMonitoringDate) );
               BaseNextMonitoringDate = intnx( OPT_MONITOR_FREQ_TIME_UOM_CD, BaseNextMonitoringDate, OPT_MONITOR_FREQ_TIME_UOM_NO, 'S' );
            end;

            /* Extract the monitoring delta time from monitoring frequencies */
            if upcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'YEAR' then MonitoringDeltaTime = OPT_MONITOR_FREQ_TIME_UOM_NO;
            else if upcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'MONTH' then MonitoringDeltaTime = OPT_MONITOR_FREQ_TIME_UOM_NO/12;
            else do;
               temp_dt = intnx( OPT_MONITOR_FREQ_TIME_UOM_CD, BaseNextMonitoringDate, OPT_MONITOR_FREQ_TIME_UOM_NO, 'S' );
               MonitoringDeltaTime = rsk_daycount( DAY_BASIS_CD, BaseNextMonitoringDate, temp_dt );
            end;

         end;
         else MonitoringDeltaTime = .;

      endblock;

      beginblock main;

         _VALUE_=0;

         IF START_DT le _date_ and MATURITY_DT ge _date_ THEN DO;

            /******************************************/
            /* SPOT PRICE                             */
            /******************************************/
            Val_underl=riskfactor.UNDERLYING_RF_ID;
            if BaseCase eq 1 then Val_underl_Base = Val_underl; /* used for discrete monitoring */

            /******************************************/
            /* DATE TO TIME                           */
            /******************************************/
            /* CUSTOMIZAÇÃO: Contagem de prazo para vencimento para as datas da RiskFree, Cupom e Vol
		  	    Variaveis: TimeToExpiration - prazo em anos para a Precificacao
		  				   DaysToExpiration - prazo em dias para a Precificacao
		  				   DaysToExpRisk - prazo em dias para a RiskFree
						   TimeToExpRisk - prazo em anos para a RiskFree
		  				   DaysToExpYield - prazo em dias para a Yield
						   TimeToExpYield - prazo em anos para a Yield
						   DaysToExpVol - prazo em dias para a Volatility 
						   TimeToExpVol - prazo em anos para a Volatility 
		     */

		  	 /* DAY_BASIS_CD - Calendário de contagem de dias para a RiskFree */
			 /* DAY_BASIS_YIELD_CD - Calendário de contagem de dias para a Cupom */
			 /* DAY_BASIS_VOL_CD - Calendário de contagem de dias para a Vol */
		  	 
			DaysToExpiration = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_CD, FIXING_DATE_BRA, FIXING_DATE_COTC);
			TimeToExpiration = rsk_daystoyear_bra(_date_, DaysToExpiration, DAY_BASIS_CD);

			DaysToExpRisk = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_CD, ., '');
			TimeToExpRisk = rsk_daystoyear_bra(_date_, DaysToExpRisk, DAY_BASIS_CD);

			DaysToExpYield = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_YIELD_CD, ., '');
			TimeToExpYield = rsk_daystoyear_bra(_date_, DaysToExpYield, DAY_BASIS_YIELD_CD);

			DaysToExpVol = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_VOL_CD, FIXING_DATE_BRA, FIXING_DATE_COTC);
			TimeToExpVol = rsk_daystoyear_bra(_date_, DaysToExpVol, DAY_BASIS_VOL_CD);

            /******************************************/
            /* DISCOUNTING RATE                       */
            /******************************************/
            /* De acordo com Sergio Paulino(DCIR), será enviado a curva COMPLETA! Nao precisara de interpolacao */
			taxa_pre = rsk_find_curve(rf_array.DISCOUNT_CURVE_ID, rf_array.DISCOUNT_CURVE_ID.Mat, DaysToExpRisk/365.25)/100;
		 	RiskFreeRate = log(1+taxa_pre);


			/******************************************/
            /* UNDERLYING YIELD                       */
            /******************************************/
            IF UseYieldCrvNFlag eq 1 THEN DO;
	             Yield = rsk_find_curve(rf_array.UNDERLYING_YIELD_CURVE_ID, rf_array.UNDERLYING_YIELD_CURVE_ID.Mat, DaysToExpYield/365.25)/100;
            END;
            else Yield = coalesce( UNDERLYING_YIELD_RT, 0 );


			/************************************************************/
			/* Forward calculation		   								*/
	        /************************************************************/

			Forward = rsk_forward_calc(taxa_pre, TimeToExpRisk, DAY_BASIS_CD, Yield, TimeToExpYield, DAY_BASIS_YIELD_CD, riskfactor.UNDERLYING_RF_ID, UseYieldCrvNFlag);

			/* the price input for Pricing Functions is defined by the Future Option Flag */
			if FUTURE_OPTION_FLAG = 'Y' then 
				preco = Forward;
			else
				preco = riskfactor.UNDERLYING_RF_ID;


            /******************************************/
            /* VOLATILITY                             */
            /******************************************/
            /*CUSTOMIZAÇÃO: MÉTODO CONSTRAINED PARA SUPERFÍCIES */
			if UseVolSurfNFlag eq 1 then
				do;
					
				/* dimension 1 */
				surface_dimension_1 = surface_dimension_name(rf_array.UNDRLNG_PRICE_VOL_SURF_ID,1);
				dimension_length1 = surface_dimension_length(rf_array.UNDRLNG_PRICE_VOL_SURF_ID,1);

				/* dimension 2 */
				surface_dimension_2 = surface_dimension_name(rf_array.UNDRLNG_PRICE_VOL_SURF_ID,2);
				dimension_length2 = surface_dimension_length(rf_array.UNDRLNG_PRICE_VOL_SURF_ID,2);

				/* ATENÇÃO: ASSUMINDO AQUI SUPERFICIE DELTA X PRAZO - VERIFICAR COM ATENÇÃO */
				array dim1_aux[1] / nosym;
				array dim2_aux[1] / nosym;
				call dynamic_array(dim1_aux, dimension_length1);
				call dynamic_array(dim2_aux, dimension_length2);
				call surface_coordinates(rf_array.UNDRLNG_PRICE_VOL_SURF_ID, dim1_aux, dim2_aux);
				array delta[1] / nosym;
				array mat[1] / nosym;
				
				put OPTION_MODEL_TYPE=;

				/* CUSTOMIZAÇÃO: superficies DELTA x PRAZO */
				/* Caso DELTA: a 1a dimensão é DELTA e a 2a dimensão é PRAZO */
				if surface_dimension_1 eq 'DELTA' then
					do;
					call dynamic_array(delta, dimension_length1);
					call dynamic_array(mat, dimension_length2);

					Do i=1 to dimension_length1;
				       delta[i] = dim1_aux[i];
					End;
					Do i=1 to dimension_length2;
				       mat[i] = dim2_aux[((dimension_length1)*i - dimension_length1) + 1];
					End;
					
				end;

				/* caso MONEYNESS/STRIKE: a 1a dimensão é PRAZO e a 2a dimensão é DELTA */
				else do;
					call dynamic_array(delta, dimension_length2);
					call dynamic_array(mat, dimension_length1);

					Do i=1 to dimension_length2;
				       delta[i] = dim2_aux[((dimension_length1)*i - dimension_length1) + 1];
					End;
					Do i=1 to dimension_length1;
				       mat[i] = dim1_aux[i];
					End;

				end;
			
				/*CUSTOMIZAÇÃO: Interpolação por GRID */
				impvol = Interpola_GRID(preco, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpRisk/365.25, TimeToExpRisk,
							rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);

			end;

			else do;
				_VALUE_ = .;
				impvol = .;
				call rsk_print_msg_subr( 'rsk_no_vol_error', INSTID, '', '', '', '', '', '' );
        	end;
            
            


            /******************************************/
            /* PATH DEPENDENCY                        */
            /******************************************/
            
            /* Discrete or continuous monitoring */
            if MonitoringDeltaTime > 0 then do; /* discrete monitoring */

               /* Reset the max/min tracking if we're starting a new simulation path */
               if basecase eq 1 or SimulationTime in ( ., 1 ) then do;
                  DBAR_OPTION_CHK_LEVEL_MAX=UNDERLYING_PRICE_MAX_AMT;
                  /* For the next line, the functions favor the lower barrier breaching first, so the 
                     functions need to know if the upper barrier breaches first */
                  if DBAR_OPTION_CHK_LEVEL_MAX < UPPER_BARRIER_VALUE then
                     DBAR_OPTION_CHK_LEVEL_MIN=UNDERLYING_PRICE_MIN_AMT;
                  NextMonitoringDate = BaseNextMonitoringDate;
               end;

               /* Update the max/min only on past monitoring dates */
               tempdate = NextMonitoringDate;
               do while( tempdate le _date_ and not missing(tempdate) );
                  compare_value = rlag( riskfactor.UNDERLYING_RF_ID, (_date_-tempdate)/365.25 );
                  DBAR_OPTION_CHK_LEVEL_MAX=max(UNDERLYING_PRICE_MAX_AMT,compare_value);
                  /* For the next line, the functions favor the lower barrier breaching first, so the 
                     functions need to know if the upper barrier breaches first */
                  if DBAR_OPTION_CHK_LEVEL_MAX < UPPER_BARRIER_VALUE then
                     DBAR_OPTION_CHK_LEVEL_MIN=min(UNDERLYING_PRICE_MIN_AMT,compare_value);
                  tempdate = intnx( OPT_MONITOR_FREQ_TIME_UOM_CD, tempdate, OPT_MONITOR_FREQ_TIME_UOM_NO, 'S' );
               end;
               NextMonitoringDate = tempdate;

            end;
            else do; /* continuous monitoring */

               /* Reset the max/min tracking if we're starting a new simulation path */
               IF BaseCase eq 1 or SimulationTime in ( ., 1 ) THEN DO;
                  DBAR_OPTION_CHK_LEVEL_MAX=max(UNDERLYING_PRICE_MAX_AMT,Val_underl_Base);
                  /* For the next line, the functions favor the lower barrier breaching first, so the 
                     functions need to know if the upper barrier breaches first */
                  if DBAR_OPTION_CHK_LEVEL_MAX < UPPER_BARRIER_VALUE then
                     DBAR_OPTION_CHK_LEVEL_MIN=min(UNDERLYING_PRICE_MIN_AMT,Val_underl_Base);
               END;

               /* Always update the max/min for continuous monitoring */
               IF BaseCase ne 1 THEN DO;
                  DBAR_OPTION_CHK_LEVEL_MAX=max(DBAR_OPTION_CHK_LEVEL_MAX,Val_underl);
                  /* For the next line, the functions favor the lower barrier breaching first, so the 
                     functions need to know if the upper barrier breaches first */
                  if DBAR_OPTION_CHK_LEVEL_MAX < UPPER_BARRIER_VALUE then
                     DBAR_OPTION_CHK_LEVEL_MIN=min(DBAR_OPTION_CHK_LEVEL_MIN,Val_underl);
               END;
            
            end;


            /******************************************/
            /* OPTION VALUE                           */
            /******************************************/

            /* Discrete or continuous monitoring */
            IF MonitoringDeltaTime > 0 THEN DO;
               _VALUE_=rsk_double_barrieroption_disc_pf(PUT_CALL_TYPE_CD, BarrierTypeKind, Val_underl, 
                  MonitoringDeltaTime, STRIKE_VALUE_AMT, UPPER_BARRIER_VALUE, LOWER_BARRIER_VALUE, 
                  DBAR_OPTION_CHK_LEVEL_MAX, DBAR_OPTION_CHK_LEVEL_MIN, 0, 0, /* flat boundaries */
                  RiskFreeRate, Yield, TimeToExpiration, impvol);
            END;
            ELSE DO;
               _VALUE_=rsk_double_barrieroption_pf(PUT_CALL_TYPE_CD, BarrierTypeKind, Val_underl, 
                  STRIKE_VALUE_AMT, UPPER_BARRIER_VALUE, LOWER_BARRIER_VALUE, 
                  DBAR_OPTION_CHK_LEVEL_MAX, DBAR_OPTION_CHK_LEVEL_MIN, 0, 0, /* flat boundaries */
                  RiskFreeRate, Yield, TimeToExpiration, impvol );
            END;

            _INSTRUMENT_VALUE_=_VALUE_;

            /* Apply haircuts to cash flow MTM values */
            if UseAssetValueHaircutNFlag eq 1 then _VALUE_ = _VALUE_ * (1-riskfactor.ASSET_VALUE_HAIRCUT_RF_NM);

         END;

      endblock;

   endmethod;
