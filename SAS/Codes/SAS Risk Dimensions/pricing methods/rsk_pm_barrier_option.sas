

/*****************************************************************************
   Copyright (c) 2012 by SAS Institute Inc., Cary, NC, USA.
  
   NAME: rsk_pm_barrier_option.sas
  
   PURPOSE: Pricing method for barrier options
  
   INPUTS: 
      ASSET_VALUE_HAIRCUT_RF_NM - asset value haircut risk factor name
      BARRIER_CASH_REBATE_AMT - the cash received in the event that the barrier 
         is knocked-out (at hit) or fails to be knocked-in (at expiration).
      DAY_BASIS_CD - the day basis/convention for counting between dates
      DISCOUNT_CURVE_ID - the discount curve reference
      LOWER_BARRIER_KIND_CD - the lower barrier kind, whether in or out.
      LOWER_BARRIER_VALUE - the lower barrier value.  If non-missing, 
         indicates this is an "DOWN" type barrier option.
      MATURITY_DT - maturity date of the financial contract
      OPT_MONITOR_FREQ_TIME_UOM_CD - the option monitoring frequency time unit 
         for discretely monitored barriers (optional)
      OPT_MONITOR_FREQ_TIME_UOM_NO - the option monitoring frequency number 
         for discretely monitored barriers (optional)
      OPT_MONITOR_PERIOD_END_DT - the barrier end date, for this method
      OPTION_STYLE_CD - the option type, whether European or American
      PUT_CALL_TYPE_CD - whether a put or call
      START_DT - the start date of the financial contract
      STRIKE_VALUE_AMT - the stike value
      UNDERLYING_PRICE_MAX_AMT - the observed underlying price maximum during 
         the life of the option
      UNDERLYING_PRICE_MIN_AMT - the observed underlying price minimum during 
         the life of the option
      UNDERLYING_VOL_CURVE_ID - reference to the underlying volatilities curve
      UNDERLYING_PRICE_VOL_ID - the underlying price volatility reference
      UNDERLYING_RF_ID - the underlying price reference
      UNDERLYING_YIELD_CURVE_ID - the underlying yield curve reference
      UNDERLYING_YIELD_RT - the underlying yield rate, if no curve is supplied
      UPPER_BARRIER_VALUE - the upper barrier value.  If non-missing, 
         indicates this is an "UP" type barrier option.
      UPPER_BARRIER_KIND_CD - the upper barrier kind, whether in or out.
  
   DIRECT FUNCTION DEPENDENCY:
      rsk_id_check_to_nflag
      rsk_daycount
      rsk_intpolate2
      rsk_barrieroption_pf
      rsk_barrieroption_disc_pf
      rsk_barrieroption_parttime_pf
      rsk_barrieropt_parttime_disc_pf
      rsk_amer_ui_put_barrieroption_pf
      rsk_amer_di_call_barrieropt_pf

   NOTES: 
      Only for inclusion in a proc compile statement.
      For American barrier options, only prices up-and-in puts and
         down-and-in calls.
      For part-time options, does not allow for cash rebate.
  
 *****************************************************************************/


  method Pm_barrier_option desc= "Barrier option pricing" kind= price;

      beginblock inst_init;

         /* Create numeric flags for faster comparisons */
         UseAssetValueHaircutNFlag = rsk_id_check_to_nflag( ASSET_VALUE_HAIRCUT_RF_NM );
         UseYieldCrvNFlag = rsk_id_check_to_nflag( UNDERLYING_YIELD_CURVE_ID );
         UseVolCrvNFlag = rsk_id_check_to_nflag( UNDERLYING_VOL_CURVE_ID );
		 UseVolSurfNFlag = rsk_id_check_to_nflag( UNDRLNG_PRICE_VOL_SURF_ID );
		 UseHolidayListNFlag = rsk_id_check_to_nflag( HOLIDAY_LIST_ID );

         /*- Populate interpolation method variables  -*/
         length _yield_crv_int_method_ _discount_crv_int_method_ _vol_crv_int_method_ $32 ;

         if UseYieldCrvNFlag eq 1 then
            call var_info(vname(rf_array.UNDERLYING_YIELD_CURVE_ID),"INTERPOLATE",_yield_crv_int_method_) ;
         else _yield_crv_int_method_ = 'LINEAR' ;

         if DISCOUNT_CURVE_ID ne '_#_' then
            call var_info(vname(rf_array.DISCOUNT_CURVE_ID),"INTERPOLATE",_discount_crv_int_method_) ;
         else _discount_crv_int_method_ = 'LINEAR' ;
         
         if UseVolCrvNFlag eq 1 then
            call var_info(vname(rf_array.UNDERLYING_VOL_CURVE_ID),"INTERPOLATE",_vol_crv_int_method_) ;
         else _vol_crv_int_method_ = 'LINEAR' ;

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

         /* Set barrier type and single barrier value */
         /* Note this defaults to "UP" type when both barriers are populated */
         length BarrierTypeKind $8;
         if not missing(UPPER_BARRIER_VALUE) then do;
            BarrierTypeKind = lowcase( compress( 'u' || substr(UPPER_BARRIER_KIND_CD,1,1) ) );
         end;
         else if not missing(LOWER_BARRIER_VALUE) then do;
            BarrierTypeKind = lowcase( compress( 'd' || substr(LOWER_BARRIER_KIND_CD,1,1) ) );
         end;
         BARRIER_VALUE_AMT = coalesce( UPPER_BARRIER_VALUE, LOWER_BARRIER_VALUE );

         /* Check for parttime barrier */
         if OPT_MONITOR_PERIOD_END_DT < MATURITY_DT and not missing(OPT_MONITOR_PERIOD_END_DT) then OPTION_PARTTIME_FLG = 1;
         else OPTION_PARTTIME_FLG = 0;

         /* Get extra monitoring information */
         if not missing(OPT_MONITOR_FREQ_TIME_UOM_CD) and not missing(OPT_MONITOR_FREQ_TIME_UOM_NO) then do;

		 	/* CUSTOMIZACAO: DePara dos dominios de monitoramento */
		 	if lowcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'daily' then
				freqTimeCd = 'DAY';
			else if lowcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'hourly' then
				freqTimeCd = 'HOUR';
			else if lowcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'weekly' then
				freqTimeCd = 'WEEK';
			else if lowcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'monthly' then
				freqTimeCd = 'MONTH';
			else 
				freqTimeCd = 'YEAR';

            /* Generate the base next monitoring date */
            BaseNextMonitoringDate = START_DT;
            do while( BaseNextMonitoringDate < BaseDate and not missing(BaseNextMonitoringDate) );
               BaseNextMonitoringDate = intnx( freqTimeCd, BaseNextMonitoringDate, OPT_MONITOR_FREQ_TIME_UOM_NO, 'S' );
            end;

            /* Extract the monitoring delta time from monitoring frequencies */
            if freqTimeCd eq 'YEAR' then MonitoringDeltaTime = OPT_MONITOR_FREQ_TIME_UOM_NO;
            else if freqTimeCd eq 'MONTH' then MonitoringDeltaTime = OPT_MONITOR_FREQ_TIME_UOM_NO/12;
            else do;
               temp_dt = intnx( freqTimeCd, BaseNextMonitoringDate, OPT_MONITOR_FREQ_TIME_UOM_NO, 'S' );
               MonitoringDeltaTime = rsk_daycount( DAY_BASIS_CD, BaseNextMonitoringDate, temp_dt );
            end;

         end;
         else MonitoringDeltaTime = .;
		 
		 /******************************************/
         /* DATES TO TIMES                         */
         /******************************************/
         /* CUSTOMIZAÇÃO: Contagem de prazo para vencimento para as datas da RiskFree, Cupom e Vol
	   	    Variaveis: TimeToExpiration - prazo em anos para a Precificacao considerando fixing
	   				   DaysToExpiration - prazo em dias para a Precificacao considerando fixing
	  				   DaysToExpRisk - prazo em dias para a RiskFree
					   TimeToExpRisk - prazo em anos para a RiskFree
	  				   DaysToExpYield - prazo em dias para a Yield
					   TimeToExpYield - prazo em anos para a Yield
					   DaysToExpVol - prazo em dias para a Volatility 
					   TimeToExpVol - prazo em anos para a Volatility 
		 			   DaysToExpFin - prazo em dias para premio financiado
		 			   TimeToExpFin - prazo em anos para premio financiado
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

		 DaysToExpVol = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_VOL_CD, ., '');
		 TimeToExpVol = rsk_daystoyear_bra(_date_, DaysToExpVol, DAY_BASIS_VOL_CD);

		 DaysToExpFin = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, 'DU/252', ., '');
	 	 TimeToExpFin = rsk_daystoyear_bra(_date_, DaysToExpFin, 'DU/252');

      endblock;

      beginblock main;

         _VALUE_=0;

         /* Native condition dead due to fixing days. If the ttm eq 1 and fixing eq -1,
	  	 the DaysToExpiration will be 0 */
         /*IF START_DT le _date_ and MATURITY_DT ge _date_ THEN DO;*/
		 IF DaysToExpiration gt 0 THEN DO;
		
            /******************************************/
            /* SPOT PRICE                             */
            /******************************************/
            Val_underl=riskfactor.UNDERLYING_RF_ID;
            if BaseCase eq 1 then Val_underl_Base = Val_underl; /* used for discrete monitoring */

			/* TODO: Verificar onde usa a este tempo, pois será desprezado. NOT IN SCOPE! */
            IF OPTION_PARTTIME_FLG eq 1 THEN do;
               if _date_ < OPT_MONITOR_PERIOD_END_DT then TimeToEndofBarrier=rsk_daycount(DAY_BASIS_CD, _date_, OPT_MONITOR_PERIOD_END_DT);
               else TimeToEndofBarrier=-rsk_daycount(DAY_BASIS_CD, OPT_MONITOR_PERIOD_END_DT, _date_);
            end;
            else TimeToEndofBarrier=TimeToExpiration;


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
    
	/* Encontrando o valor do limitador*/
         *valor_limitador = coalesce(UNDERLYING_PRICE_MAX_AMT,UNDERLYING_PRICE_MIN_AMT);
		 valor_limitador = .;

         if not missing(UNDERLYING_PRICE_MAX_AMT) and UNDERLYING_PRICE_MAX_AMT ne 0 then do;
            valor_limitador = UNDERLYING_PRICE_MAX_AMT;
         end;
         else if not missing(UNDERLYING_PRICE_MIN_AMT) and UNDERLYING_PRICE_MIN_AMT ne 0 then do;
            valor_limitador = UNDERLYING_PRICE_MIN_AMT;
         end;
        

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
				impvol = Interpola_GRID(preco, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol,
							rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);

				if valor_limitador ne . then
					impvollim = Interpola_GRID(preco, valor_limitador, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol,
							rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
				else
					impvollim = .;

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
                  IF BarrierTypeKind in ( 'ui', 'uo' ) THEN DO;
                     BARR_OPTION_CHK_LEVEL=0;
                  END;
                  ELSE DO;
                     BARR_OPTION_CHK_LEVEL=1000000000;
                  END;
                  NextMonitoringDate = BaseNextMonitoringDate;
               end;

               /* Update the max/min only on past monitoring dates and only such dates
                  that are before or on the barrier end date (OPT_MONITOR_PERIOD_END_DT) */
               tempdate = NextMonitoringDate;
               do while( tempdate le min(_date_,OPT_MONITOR_PERIOD_END_DT) and not missing(tempdate) );
                  compare_value = rlag( riskfactor.UNDERLYING_RF_ID, (_date_-tempdate)/365.25 );
                  IF BarrierTypeKind in ( 'ui', 'uo' ) THEN DO;
                     BARR_OPTION_CHK_LEVEL=max(BARR_OPTION_CHK_LEVEL,compare_value);
                  END;
                  ELSE DO;
                     BARR_OPTION_CHK_LEVEL=min(BARR_OPTION_CHK_LEVEL,compare_value);
                  END;
                  tempdate = intnx( freqTimeCd, tempdate, OPT_MONITOR_FREQ_TIME_UOM_NO, 'S' );
               end;
               NextMonitoringDate = tempdate;

            end;
            else if OPTION_PARTTIME_FLG ne 1 or TimeToEndofBarrier ge 0 then do; /* continuous monitoring */

               /* Reset the max/min tracking if we're starting a new simulation path */
               IF BaseCase eq 1 or SimulationTime in ( ., 1 ) THEN DO;
                  IF BarrierTypeKind in ( 'ui', 'uo' ) THEN DO;
                     BARR_OPTION_CHK_LEVEL=max(UNDERLYING_PRICE_MAX_AMT,Val_underl_Base);
                  END;
                  ELSE DO;
                     BARR_OPTION_CHK_LEVEL=max(UNDERLYING_PRICE_MIN_AMT,Val_underl_Base);
                  END;
               END;

               /* Always update the max/min for continuous monitoring */
               IF BaseCase ne 1 THEN DO;
                  IF BarrierTypeKind in ( 'ui', 'uo' ) THEN DO;
                     BARR_OPTION_CHK_LEVEL=max(BARR_OPTION_CHK_LEVEL,riskfactor.UNDERLYING_RF_ID);
                  END;
                  ELSE DO;
                     BARR_OPTION_CHK_LEVEL=min(BARR_OPTION_CHK_LEVEL,riskfactor.UNDERLYING_RF_ID);
                  END;
               END;

            end;
            else do;
               /* This is the case of continuous part-time monitoring that is past the monitoring period.
                  Don't update the max/min here. */
            end;
            

            /******************************************/
            /* OPTION VALUE                           */
            /******************************************/
  			/* Partial-time or full observation period */
			/*CUSTOMIZACAO: Todas as opcoes serao full*/
            IF OPTION_PARTTIME_FLG ne 1 THEN DO;

				/* European or American */
				/* Discrete or continuous monitoring */ 
				/************************************************/
            	/* CUSTOMIZACAO BRADESCO                        */
				/* Precificacao pela arvore binomial brad.      */
				/* Esta funcao faz também o monitoramento       */
				/* da barreira. Por isso, o DeltaMonitoringTime */
				/* nao e necessario.    						*/
            	/************************************************/
				
				if lowcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'daily' and BarrierTypeKind eq 'uo' and BARR_OPTION_CHK_LEVEL ge BARRIER_VALUE_AMT then do;
					_VALUE_ = 0;
				end;
				else if lowcase(OPT_MONITOR_FREQ_TIME_UOM_CD) eq 'daily' and BarrierTypeKind eq 'do' and BARR_OPTION_CHK_LEVEL le BARRIER_VALUE_AMT then do;
					_VALUE_ = 0;
				end;
				else
					_VALUE_= BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,
								BarrierTypeKind,"daily",preco,
								STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,
								coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol, TimeToExpiration, 
								RiskFreeRate,Yield,impvol,1000);

            END;

            ELSE if OPTION_STYLE_CD eq 'EUROPEAN' then DO; /* Partial Time */
               
               /* Discrete or continuous monitoring */
               IF MonitoringDeltaTime > 0 THEN DO;
                  _VALUE_=rsk_barrieropt_parttime_disc_pf( PUT_CALL_TYPE_CD, BarrierTypeKind, MonitoringDeltaTime, 
                        Val_underl, BARR_OPTION_CHK_LEVEL, STRIKE_VALUE_AMT, BARRIER_VALUE_AMT, 
                        RiskFreeRate, Yield, TimeToExpiration, TimeToEndofBarrier, impvol);
               END;
               ELSE DO;
                  _VALUE_=rsk_barrieroption_parttime_pf( PUT_CALL_TYPE_CD, BarrierTypeKind, Val_underl, 
                        BARR_OPTION_CHK_LEVEL, STRIKE_VALUE_AMT, BARRIER_VALUE_AMT, 
                        RiskFreeRate, Yield, TimeToExpiration, TimeToEndofBarrier, 
                        impvol);
               END;

            END;
            else _VALUE_ = .;

            /****************************************|
			|*      CUSTOM GREEKS CALCULATION       *|
			|****************************************/

			/* calcula delta com método customizado, mas deve sair por sensitivity analysis VER */
			delta_result = Calcula_Delta(preco, STRIKE_VALUE_AMT, RiskFreeRate, YieldAdj, DaysToExpVol/365.25, TimeToExpVol, 
						rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);

			if valor_limitador eq 0 then
				valor_limitador = .;

			epsilon = Epsilon(STRIKE_VALUE_AMT);

			Vol_Anual 		  = Interpola_GRID(preco, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			Vol_Anual_Mais_Delta      = Interpola_GRID(preco + epsilon, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			Vol_Anual_Menos_Delta     = Interpola_GRID(preco - epsilon, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			Vol_Anual_Mais_Gamma      = Interpola_GRID(preco + 2*epsilon, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			Vol_Anual_Menos_Gamma     = Interpola_GRID(preco - 2*epsilon, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);


			_Delta1 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco + epsilon,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual_Mais_Delta,1000);
			_Delta2 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco - epsilon,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual_Menos_Delta,1000);
			_Deltad = (2*epsilon) * exp(TimeToExpiration*RiskFreeRate);
			_Delta = (_Delta1-_Delta2)/_Deltad;

			_Gama1 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco + 2*epsilon,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual_Mais_Gamma,1000);
			_Gama2 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco - 2*epsilon,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual_Menos_Gamma,1000);
			_Gama3 = 2*BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual,1000);
			_Gamad = (4*(epsilon**2)) * exp(TimeToExpiration*RiskFreeRate);

			/*Fix rouding problem when working with more than 15 decimal places*/
			Gama1 = put(_Gama1, 32.29);
			Gama2 = put(_Gama2, 32.29);
			Gama3 = put(_Gama3, 32.29);
			Gamad = put(_Gamad, 32.29);

			Gamanum = Gama1 + Gama2 - Gama3;

			_Gama  = Gamanum/Gamad;


			/*para avaliação*/
			/*Theta*/
			Choque_Theta     = 0.01 * TimeToExpVol;
			Choque_Theta_dias= 0.01 * DaysToExpVol;
			Vol_Anual_Menos_Theta     = Interpola_GRID(preco *Exp(Choque_Theta * (Yield - RiskFreeRate)), STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol-Choque_Theta, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);

			_Theta1 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual,1000);
			_Theta2 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol-Choque_Theta,TimeToExpiration-Choque_Theta,RiskFreeRate,Yield,Vol_Anual_Menos_Theta,1000);
			_Teta  = - (_Theta1 - _Theta2)/Choque_Theta;

			/*Vega*/
			Choque_Vega     = 0.001 * Vol_Anual;
			_Vega1 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual+Choque_Vega,1000);
			_Vega2 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate,Yield,Vol_Anual-Choque_Vega,1000);
			_Vega  = (_Vega1 - _Vega2)/(2*Choque_Vega);


			/*Rho*/
			Choque_Rho     = 0.01 * RiskFreeRate;
			Vol_Anual_Mais_Rho 		  = Interpola_GRID(preco* Exp(Choque_Rho * TimeToExpVol), STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			Vol_Anual_Menos_Rho 	  = Interpola_GRID(preco/ Exp(Choque_Rho * TimeToExpVol), STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			_Rho1 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate+Choque_Rho,Yield,Vol_Anual_Mais_Rho,1000);
			_Rho2 = BinomialBridgeBarrierPrice(PUT_CALL_TYPE_CD,OPTION_STYLE_CD,BarrierTypeKind,"daily",preco,STRIKE_VALUE_AMT,BARRIER_VALUE_AMT, valor_limitador,coalesce(BARRIER_CASH_REBATE_AMT,0),TimeToExpVol,TimeToExpiration,RiskFreeRate-Choque_Rho,Yield,Vol_Anual_Menos_Rho,1000);
			_Rho  = (_Rho1 - _Rho2)/(2*Choque_Rho);


			put "Values here";
			put instID= PUT_CALL_TYPE_CD= STRIKE_VALUE_AMT= DaysToExpiration= DaystoExpRisk= TimeToExpRisk= taxa_pre= 
				RiskFreeRate= Yield= impvol=  
				riskfactor.UNDERLYING_RF_ID= Forward= preco=
				_VALUE_= delta_result= _Delta= _Gama= _Teta= _Vega= _Rho=;

			OUT_V_IMPVOL = impvol;
			OUT_V_IMPVOLLIM = impvollim;
			OUT_V_FOWARD = preco;
			OUT_V_TIMETOEXP = DaysToExpiration;
			OUT_V_RISKFREERATE = RiskFreeRate;
			OUT_V_COUPOM = Yield;
			OUT_V_DELTA = delta_result;
			OUT_V_DELTAJ = _Delta;
			OUT_V_GAMA= _Gama;
			OUT_V_VEGA = _Vega;
			OUT_V_Teta = _Teta;
			OUT_V_RHO = _Rho; 

			_INSTRUMENT_VALUE_=_VALUE_;

			/*premio financiado. Calc: <premio> * (1 + <1a_taxa_da_curva>) ^ (<dias_para_expirar> / <qtd_dias_convencao>) */
			/*Carlos: validando se a formula é <premio> * (1 + <1a_taxa_da_curva>) ^ (<dias_para_expirar> / <qtd_dias_convencao>)*/
			OUT_V_FINVAL = _VALUE_ * (1 + FINVAL_OPER_AMT) ** (TimeToExpFin);

            /* Apply haircuts to cash flow MTM values */
            if UseAssetValueHaircutNFlag eq 1 then _VALUE_ = _VALUE_ * (1-riskfactor.ASSET_VALUE_HAIRCUT_RF_NM);

         END;

      endblock;

   endmethod;

