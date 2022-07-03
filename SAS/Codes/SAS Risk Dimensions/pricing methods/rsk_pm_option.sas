        

/*****************************************************************************
   Copyright (c) 2013 by SAS Institute Inc., Cary, NC, USA.

   NAME: rsk_pm_option.sas

   PURPOSE: Pricing method for vanilla options, as well as simple 
      swaptions and caplets.

   INPUT INSTRUMENT VARIABLES:
      ASSET_VALUE_HAIRCUT_RF_NM - asset value haircut risk factor name
      BERMUDA_EXERCISE_LOOKUP_FLG - either 'Y', if the irregular exercise 
         schedule should be looked up, or 'N' if the exercise schedule 
         should be generated from frequency data.  Note this flag also
         applies to American options with a varying strike curve.
      BERMUDA_EXE_FREQUENCY_UOM_CD - the Bermuda exercise frequency time unit
      BERMUDA_EXE_FREQUENCY_UOM_NO - the Bermuda exercise frequency number
      BINOMIAL_STEPS_PER_YEAR - the number of binomial steps per year, to 
         be scaled by the time left to expiration
      BUY_PRICE_AMT - the buy price
      CALCULATE_CASHFLOW_FLG - Flag indicating whether we should calculate a cash
         flow for this instrument.
      DAY_BASIS_CD - the day counting convention
      DISCOUNT_CURVE_ID - reference to the discouting rates curve
      EXPECTED_EXERCISE_DT - Expected exercise date used to generate a cash flow for
         American and Bermudan options
      EXPECTED_UNDLNG_EXERCISE_AMT - User-supplied expected underlying value at
         option exercise or forward maturity
      FINANCIAL_FUND_RK - the financial fund key
      HOLIDAY_LIST_ID - holiday list identifier to match column in Holidays
         parameter matrix
      ISSUE_KEY - the instrument issue key for fetching an irregular 
         exercise schedule from parameter matrices
      MARGIN_VARIATION_RT - either 1 (for full margining) or anything else (for
         no margining)
      MATURITY_DT - maturity date of the financial contract
      OPTION_DISCRETE_YIELD_TYPE - either 'RELATIVE', for percent rates relative 
         to the spot price, or 'ABSOLUTE', for cash discrete dividends unrelated 
         to the spot price
      OPTION_MODEL_TYPE - the option model type, only currently used for American 
         option pricing (e.g. 'BINOMIAL')
      OPTION_STYLE_CD - the option exercise type, whether European, Bermudan 
         or American (may also be Caplet/Floorlet)
      PAYMENT_FREQUENCY_TIME_UOM_CD - payment term unit for swaptions
      PAYMENT_FREQUENCY_TIME_UOM_NO - payment term number of units for swaptions
      PRODUCT_SUBTYPE - the product subtype, to determine whether this is a swaption
      PUT_CALL_TYPE_CD - either 'PUT' or 'CALL'
      ROLL_HOLIDAY_CONVENTION_CD - which direction/method to roll a date which lands on
         a holiday
      ROLL_WEEKEND_CONVENTION_CD - which direction/method to roll a date which lands on
         a weekend
      START_DT - start date of financial contract
      STRIKE_VALUE_AMT - the strike value
      TRINOMIAL_STEPS_PER_YEAR - the number of trinomial steps per year, to 
         be scaled by the time left to expiration
      UNDERLYING_PRICE_VOL_ID - reference to the underlying asset volatility
      UNDERLYING_RF_ID - reference to the underlying asset price
      UNDERLYING_SCALING_NO - scaling number to be applied to the final price
      UNDERLYING_YIELD_CURVE_ID - reference to the underlying yield curve
      UNDERLYING_YIELD_RT - underlying fixed yield
      UNDRLNG_DISC_DIVIDND_CURVE_ID - identifier for the underlying discrete 
         dividend curve, should correspond to a column in the parameter 
         matrices Discrete_Dividend_Dates and Discrete_Dividend_Values
      UNDRLNG_PRICE_VOL_SURF_ID - reference to the 2-D volatility surface
      VALUE_SCALING_RF_ID - reference to a scaling number to be applied to 
         the final price
      VALUE_SCALING_RT - scaling number to be applied to the final price
      WEEKDAY_INTERVAL_UOM_CD - SAS weekday interval; used to define the workweek

   INPUT PARAMETER MATRICES:
      Discrete_Dividend_Dates - parameter matrix whose columns are each an 
         array whose first value is the size of the array and the rest of the 
         values are the dates in the dividend schedule.  The variable 
         UNDRLNG_DISC_DIVIDND_CURVE_ID should match a column in this matrix, 
         or be the risk special character '_#_'.
      Discrete_Dividend_Values - similar parameter matrix to 
         Discrete_Dividend_Dates, except the values in the array are the 
         values of the dividends (whether percent rate dividends or cash 
         dividends, see OPTION_DISCRETE_YIELD_TYPE)
      Option_Exercise_Dates - parameter matrix whose columns are each an 
         array whose first value is the size of the array and the rest of the 
         values are the dates in the irregular exercise schedule.  If
         BERMUDA_EXERCISE_LOOKUP_FLG is 'Y', then ISSUE_KEY should match a 
         column name in this parameter matrix
      Option_Exercise_Strikes - similar parameter matrix to 
         Option_Exercise_Dates, except the values in the column array are 
         the values of the strikes in the exercise schedule
      Holidays - parameter matrix of holiday lists, similar in format to
         Option_Exercise_Dates.

   DIRECT FUNCTION DEPENDENCY:
      rsk_amercallopt_strkcrv_div2_pf
      rsk_amercallopt_strkcrv_div_pf
      rsk_amercalloption_baw_pf
      rsk_amercalloption_bjs02_pf
      rsk_amercalloption_bjs93_pf
      rsk_amercalloption_tri_pf
      rsk_amerputopt_strkcrv_div2_pf
      rsk_amerputopt_strkcrv_div_pf
      rsk_amerputoption_baw_pf
      rsk_amerputoption_bjs02_pf
      rsk_amerputoption_bjs93_pf
      rsk_amerputoption_tri_pf
      rsk_bermudacalloption_bi_div2_pf
      rsk_bermudacalloption_bi_div_pf
      rsk_bermudaputoption_bi_div2_pf
      rsk_bermudaputoption_bi_div_pf
      rsk_cf_regular_pmt_date
      rsk_daycount
      rsk_europeancalloption_pf
      rsk_europeanputoption_pf
      rsk_id_check_to_nflag
      rsk_intpolate2
      rsk_print_msg_subr

   NOTES: 

 *****************************************************************************/

method Pm_option  desc= "Vanilla option pricing" kind= price;

   beginblock inst_init;

      /* Create numeric flags for faster comparisons */
      UseAssetValueHaircutNFlag = rsk_id_check_to_nflag( ASSET_VALUE_HAIRCUT_RF_NM );
      UseYieldCrvNFlag = rsk_id_check_to_nflag( UNDERLYING_YIELD_CURVE_ID );
      UseVolIdNFlag = rsk_id_check_to_nflag( UNDERLYING_PRICE_VOL_ID );
      UseVolSurfNFlag = rsk_id_check_to_nflag( UNDRLNG_PRICE_VOL_SURF_ID );
      UseValueScalingRfNFlag = rsk_id_check_to_nflag( VALUE_SCALING_RF_ID );
      UseDiscDivCrvfNFlag = rsk_id_check_to_nflag( UNDRLNG_DISC_DIVIDND_CURVE_ID );
      UseHolidayListNFlag = rsk_id_check_to_nflag( HOLIDAY_LIST_ID );
      UseCalculateCashflowFlg = rsk_cflag_to_nflag(Calculate_cashflow_flg);
	  UseForegnDiscCrvNFlag = rsk_id_check_to_nflag( FOREGN_DISCOUNT_CURVE_ID );

      /* Register fx curve */
      CALL REGISTER_FX("FX_CURVE",CURRENCY); /* Reference FX curve */
	  
	  
      

      /* Convert payment frequency to payments per year */
      if not missing(PAYMENT_FREQUENCY_TIME_UOM_NO)
         and not missing(PAYMENT_FREQUENCY_TIME_UOM_CD) then do;
         if PAYMENT_FREQUENCY_TIME_UOM_CD eq 'DAY' then do;
            compare_date = intnx(PAYMENT_FREQUENCY_TIME_UOM_CD, START_DT, PAYMENT_FREQUENCY_TIME_UOM_NO);
            PAYMENTS_PER_YEAR = 1/rsk_daycount(DAY_BASIS_CD, START_DT, compare_date);
         end;
         else do;
            PAYMENTS_PER_YEAR = 1 / rsk_get_frequency_in_year(
               PAYMENT_FREQUENCY_TIME_UOM_NO, PAYMENT_FREQUENCY_TIME_UOM_CD );
         end;
      end;
      else PAYMENTS_PER_YEAR = .;

      /* Generalize Option Type */
      OPTION_TYPE_FIRST_LETTER = upcase(substr(OPTION_STYLE_CD,1,1));

	  /***************************************************/
      /* APPLY HOLIDAYS TO OPTION PRICING
      /***************************************************/
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

	  /***************************************************/
      /* APPLY HOLIDAYS TO QUANTO OPTIONS
      /***************************************************/
	  if QUANTO_OPTION_FLAG = "Y" then do;
	  	 call pmxelem( Holidays, ., "CBRZUSA", quanto_holiday_parm );
      	 array quanto_holiday_list[1] / nosym;

		 /* CARREGA FERIADOS COM FINAIS DE SEMANA PARA QUANTO */
         if quanto_holiday_parm[1] > 0 then do;
            call dynamic_array( quanto_holiday_list, quanto_holiday_parm[1] );
            do i = 1 to quanto_holiday_parm[1];
               quanto_holiday_list[i] = quanto_holiday_parm[i+1];
            end;
         end;
         else call dynamic_array( quanto_holiday_list, 1 );

	  end;

      /* Get the first dimension of the surface */
      if UseVolSurfNFlag eq 1 then do;
         length surface_dimension_1 $32;
         surface_dimension_1 = surface_dimension_name(rf_array.UNDRLNG_PRICE_VOL_SURF_ID,1);
         surface_dimension_1 = upcase(surface_dimension_1);
      end;

      /***************************************************/
      /* READ INTERPOLATION METHODS FOR ALL CURVES       */
      /***************************************************/

      length _yield_crv_int_method_ _discount_crv_int_method_ _vol_surf_int_method_ $32 ;

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
	  	  _vol_surf_int_technique_ = "BI_LINEAR";
		  _vol_surf_int_method_="BLACK";
	  end;

	 put UNDERLYING_PRICE_VOL_SURF_INT=;
	 put FIXING_DATE_BRA=;
	 put FIXING_DATE_COTC=;

	put _vol_surf_int_method_=;

	  /*put _vol_surf_int_method_=; NAO ESTA PEGANDO NO VAR_INFO ACIMA - VERIFICAR */

 
      /***************************************************/
      /* READ OR GENERATE BERMUDA SCHEDULE               */
      /***************************************************/

      /* Declare arrays and default values - be sure to reset the array size (and values)
         with dynamic_array, so that one instrument doesn't carry values over to the next */
      /* Bermudan option with bad schedule information will default to a European option */
      /* In the case of an American with a bad/nonexistent schedule, this defaults to a single strike value */
      array ExerciseDates[1] / nosym;
      array ExerciseTimes[1] / nosym;
      array StrikeValues[1] / nosym;
      call dynamic_array(ExerciseDates,1);
      call dynamic_array(ExerciseTimes,1);
      call dynamic_array(StrikeValues,1);
      ExerciseDates[1] = MATURITY_DT;
      ExerciseTimes[1] = 0;
      StrikeValues[1] = STRIKE_VALUE_AMT;

      /* Only generate a schedule for American and Bermudan options */
      IF OPTION_TYPE_FIRST_LETTER in ( 'A', 'B' ) THEN DO; 

         /* If we should look up the bermuda schedule, then read from the parmeter matrices */
         /* Otherwise, generate it form the bermuda schedule frequency information */
         /* If all else fails, default to European pricing (above) */
         if BERMUDA_EXERCISE_LOOKUP_FLG eq 'Y' then do;

            /* Read Bermuda excercise schedule dates */
            call pmxelem( Option_Exercise_Dates, ., ISSUE_KEY, pmx_exercise_dates );

            /* Read corresponding strike values (individual values may be missing) */
            call pmxelem( Option_Exercise_Strikes, ., ISSUE_KEY, pmx_strike_values );

            /* First element of the dates array is the number of meaningful values */
            /* If this number is positive, then resize arrays to this size and copy values to arrays */
            /* Otherwise, default to European case above */
            if pmx_exercise_dates[1] > 0 then do;
               call dynamic_array( ExerciseDates, pmx_exercise_dates[1] );
               call dynamic_array( ExerciseTimes, pmx_exercise_dates[1] );
               call dynamic_array( StrikeValues, pmx_exercise_dates[1] );
               do i = 1 to dim(StrikeValues) while( i < min(dim(pmx_strike_values),dim(pmx_exercise_dates)) );
                  ExerciseDates[i] = pmx_exercise_dates[i+1];
                  StrikeValues[i] = coalesce( pmx_strike_values[i+1], STRIKE_VALUE_AMT );
               end;
            end;

         end;
         else if not( missing(BERMUDA_EXE_FREQUENCY_UOM_CD) or BERMUDA_EXE_FREQUENCY_UOM_NO le 0 ) then do;

            /* Find the next exercise date */
            NextExerciseDt = START_DT;
            i = 0;
            do while( NextExerciseDt < basedate and not missing(NextExerciseDt) );
               i = i + 1;
               NextExerciseDt = intnx( BERMUDA_EXE_FREQUENCY_UOM_CD, START_DT,
                  BERMUDA_EXE_FREQUENCY_UOM_NO * i, 'S' );
            end;

            /* Get the estimated size of the bermuda schedule array */
            array _temp_exc_dates_[1] / nosym;
            _temp_exc_dates_[1] = MATURITY_DT;
            temp_dt = intnx( BERMUDA_EXE_FREQUENCY_UOM_CD, NextExerciseDt, BERMUDA_EXE_FREQUENCY_UOM_NO, 'S' ); 
            temp_size = ceil( ( MATURITY_DT - NextExerciseDt ) / ( temp_dt - NextExerciseDt ) )+10; /* plus 10 for a buffer */
            call dynamic_array( _temp_exc_dates_, temp_size );

            /* Generate the regular schedule */
            call rsk_cf_regular_pmt_date( MATURITY_DT,  BERMUDA_EXE_FREQUENCY_UOM_CD, 
               BERMUDA_EXE_FREQUENCY_UOM_NO, START_DT, i, _temp_exc_dates_, 
               _berm_exe_num_, dim(_temp_exc_dates_) );

            /* If the generated schedule has positive size, then set the size of the exercise times array */
            /* Otherwise, let it be the default European case */
            if _berm_exe_num_ > 0 then call dynamic_array( ExerciseTimes, _berm_exe_num_ );

            /* Set up strike values array and copy exercise dates */
            /* When the bermuda schedule is generated, the strike value is constant */
            call dynamic_array( StrikeValues, dim(ExerciseTimes) );
            call dynamic_array( ExerciseDates, dim(ExerciseTimes) );
            do i = 1 to dim(StrikeValues);
               StrikeValues[i] = STRIKE_VALUE_AMT;
               ExerciseDates[i] = _temp_exc_dates_[i];
            end;

         end;

      END;


      /***************************************************/
      /* APPLY HOLIDAYS TO GENERATED BERMUDAN SCHEDULE
      /***************************************************/

      /* Get the holiday list, if applicable */
     /* if UseHolidayListNFlag eq 1 then do;

         /* Read the holiday list from the parameter matrix */
       /*  call pmxelem( Holidays, ., HOLIDAY_LIST_ID, parm_holiday_list );
         array holiday_list[1] / nosym;

         /* The first element of parm_holiday_list is the dimension */
         /* If the dimension is positive, then copy the rest of the contents */
         /* Otherwise, default to size 1, with a missing element */
       /*  if parm_holiday_list[1] > 0 then do;
            call dynamic_array( holiday_list, parm_holiday_list[1] );
            do i = 1 to parm_holiday_list[1];
               holiday_list[i] = parm_holiday_list[i+1];
            end;
         end;
         else call dynamic_array( holiday_list, 1 );

      end;*/

      /* Move the dates, according to the date conventions */
      if BERMUDA_EXERCISE_LOOKUP_FLG ne 'Y' and ( UseHolidayListNFlag eq 1
            or not missing(ROLL_WEEKEND_CONVENTION_CD) ) then
            do i = 1 to dim(ExerciseDates);

         ExerciseDates[i] = rsk_calc_next_workday3( "day", 0, 
            WEEKDAY_INTERVAL_UOM_CD, ExerciseDates[i], holiday_list, 
            ROLL_WEEKEND_CONVENTION_CD, ROLL_HOLIDAY_CONVENTION_CD );
      end;


      /***************************************************/
      /* SET UP DISCRETE DIVIDEND SCHEDULE               */
      /***************************************************/

      /* Initialize dividend value */
      DIV = 0; 

      /* Declare arrays */
      array disc_div_times[1] / nosym; 
      array disc_div_values[1] / nosym;

      /* Set default array values */
      call dynamic_array( disc_div_times, 1 );
      call dynamic_array( disc_div_values, 1 );
      disc_div_times[1] = 0;
      disc_div_values[1] = 0;

      /* If we have a discrete dividend curve, then populate disc. div. arrays with meaningful values */
      if UseDiscDivCrvfNFlag eq 1 then do;

         /* Read the discrete dividend dates and values from parameter matrices */
         call pmxelem( Discrete_Dividend_Dates, ., UNDRLNG_DISC_DIVIDND_CURVE_ID, disc_div_dates );
         call pmxelem( Discrete_Dividend_Values, ., UNDRLNG_DISC_DIVIDND_CURVE_ID, temp_disc_div_values );
         
         /* The first value of the array is the size of the array */
         /* If the read size is positive, then copy the values */
         /* Otherwise, use the default array values set above */
         if disc_div_dates[1] > 0 then do;
            call dynamic_array( disc_div_times, disc_div_dates[1] );
            call dynamic_array( disc_div_values, disc_div_dates[1] );
            do i = 1 to disc_div_dates[1];
               disc_div_values[i] = temp_disc_div_values[i+1];
            end;
         end;

      end;
      /* Initialize the array sizes to zero */
      _cashflow_.num = 0;

	  /************************************************************/
      /* CONVERT DATES TO TIMES, SCALE BINOMIAL/TRINOMIAL STEPS   */
      /************************************************************/
  	  /* CUSTOMIZAÇÃO: Contagem de prazo para vencimento para as datas da RiskFree, Cupom e Vol
  	    Variaveis: TimeToExpiration - prazo em anos para a Precificacao e gregas
  				   DaysToExpiration - prazo em dias para a Precificacao e gregas
  				   DaysToExpRisk - prazo em dias para a RiskFree
				   TimeToExpRisk - prazo em anos para a RiskFree
  				   DaysToExpYield - prazo em dias para a Yield
				   TimeToExpYield - prazo em anos para a Yield
				   DaysToExpVol - prazo em dias para a Volatility
				   TimeToExpVol - prazo em anos para a Volatility 
  				   DaysToExpFin - prazo em dias para premio financiado
  				   TimeToExpFin - prazo em anos para premio financiado
  				   DaysToExpFRF - prazo em dias para a Foreign Risk Free
  				   TimeToExpFRF - prazo em anos para a Foreign Risk Free
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

	 DaysToExpInt = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_YIELD_CD, ., '');
	 TimeToExpInt = rsk_daystoyear_bra(_date_, DaysToExpYield, DAY_BASIS_YIELD_CD);

	 if QUANTO_OPTION_FLAG eq 'Y' then do;
		if FIXING_DATE_COTC ne '' then 
			fix = input(scan(fixingdays, -1, '-'), 3.);
		else if FIXING_DATE_BRA ne . then
			fix = rsk_daycount2(baseCalendar, fixingdate, matdate );
		else fix = 0;

		if fix le -1 then
			DaysToExpVol = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_VOL_CD, FIXING_DATE_BRA, FIXING_DATE_COTC);
		else
			DaysToExpVol = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_VOL_CD, ., 'D-1');

		TimeToExpVol = rsk_daystoyear_bra(_date_, DaysToExpVol, DAY_BASIS_VOL_CD);
	 end;
	 else do;
		DaysToExpVol = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_VOL_CD, ., '');
		TimeToExpVol = rsk_daystoyear_bra(_date_, DaysToExpVol, DAY_BASIS_VOL_CD);
	 end;

	 DaysToExpFin = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, 'DU/252', ., '');
	 TimeToExpFin = rsk_daystoyear_bra(_date_, DaysToExpFin, 'DU/252');

	 DaysToExpFRF = rsk_daycount_bra(_date_, MATURITY_DT, holiday_list, DAY_BASIS_FDC_CD, ., '');
	 TimeToExpFRF = rsk_daystoyear_bra(_date_, DaysToExpYield, DAY_BASIS_FDC_CD);

   endblock;

   beginblock main;

      /* Initialize option value to zero */
	  _VALUE_=0;

      /* Only continue pricing if current date is between contract start and end dates */
	  /* Native condition dead due to fixing days. If the ttm eq 1 and fixing eq -1,
	  	 the DaysToExpiration will be 0 */
      /*if START_DT le _date_ and _date_ lt MATURITY_DT then do;*/ 
	  	if DaysToExpiration gt 0 then do;
	
         BINOMIAL_LATTICE_STEPS = round( BINOMIAL_STEPS_PER_YEAR * TimeToExpiration );
         TRINOMIAL_LATTICE_STEPS = round( TRINOMIAL_STEPS_PER_YEAR * TimeToExpiration );
		 
		 put TimeToExpiration= DaysToExpiration= ;
         /************************************************************/
         /* GET DISCOUNTING RATE                                     */
         /************************************************************/

         /* Interpolate the discounting rate from the discount curve */

		 /* De acordo com Sergio Paulino(DCIR), será enviado a curva COMPLETA! Nao precisara de interpolacao */
		 taxa_pre = rsk_find_curve(rf_array.DISCOUNT_CURVE_ID, rf_array.DISCOUNT_CURVE_ID.Mat, DaysToExpRisk/365.25)/100;
		 RiskFreeRate = log(1+taxa_pre);
		 
         /* Asay (1982) Margined premium adjustment*/
         if MARGIN_VARIATION_RT eq 1 then RiskfreeRate = 0;

		 put RiskFreeRate= taxa_pre=;
		
         /************************************************************/
         /* UNDERLYING YIELD                                         */
         /************************************************************/

         /* Default yield values */
         /* TimeToExpiration_Adj_Yield is the percent of time for which the yield is applied,
            which is after all discrete dividends have been applied */
         TimeToExpiration_Adj_Yield = 1;
         Yield = coalesce( UNDERLYING_YIELD_RT, 0 );  /* standard equity case */

         /* If a yield curve is supplied, then interpolate the yield from it */
         /* This is typically used for futures and foreign exchange cases */
         IF UseYieldCrvNFlag eq 1 THEN DO;  
		 	 
		 	 Yield = rsk_find_curve(rf_array.UNDERLYING_YIELD_CURVE_ID, rf_array.UNDERLYING_YIELD_CURVE_ID.Mat, DaysToExpYield/365.25)/100;

	         /* Asay (1982) Margined premium adjustment*/
	         if MARGIN_VARIATION_RT eq 1 then RiskfreeRate = 0;
	            /* Adjust if margined premium for futures */
	            if MARGIN_VARIATION_RT eq 1 then Yield=RiskFreeRate;  
	     END;
		 
	      /* If a discrete dividend schedule is supplied, then use it*/            
         IF UseDiscDivCrvfNFlag eq 1 and QUANTO_OPTION_FLAG eq "N" THEN DO;

            /* Convert dates to times for dividend schedule */
            do i = 1 to disc_div_dates[1]; /* avoids the default to zero case */
               if disc_div_dates[i+1] < _date_ then disc_div_times[i] = - rsk_daycount2( DAY_BASIS_CD, disc_div_dates[i+1], _date_ );
               else disc_div_times[i] = rsk_daycount2( DAY_BASIS_CD, _date_, disc_div_dates[i+1] );
            end;

            /* If this is a European option, then total the present dividend value (stored in DIV) */
/*            if OPTION_TYPE_FIRST_LETTER eq 'E' then do;  */ /*Dividendos são calculados para Americanas também*/

               /* Initialize DIV, depending on the type of dividend:
                  If rate dividends, then DIV will be a discount factor
                  If constant dividends, then DIV will be a sum of present values */
               if OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then DIV = 1;
               else DIV = 0;

               /* Initialize the tracking index, j */
               j = 0;

               /* Loop over all discrete dividend dates strictly before expiration */
               do i=1 to dim(disc_div_values) while( disc_div_times[i] le DaysToExpiration/365.25 );
                  /* Only consider future dividends */
                  if 0 le disc_div_times[i] then do;
                     /* "Sum" DIV, depending on the type */
                     if OPTION_DISCRETE_YIELD_TYPE ne 'RELATIVE' then do; /* cash dividend case */
					 	if DAY_BASIS_CD eq 'DU/252' then do;
							dr = Interpola_Exponencial(disc_div_times[i]/365.25, rf_array.DISCOUNT_CURVE_ID, 
                           		rf_array.DISCOUNT_CURVE_ID.mat);
		 				end;
					 	else do;
                        	dr = rsk_intpolate2( disc_div_times[i]/365.25, rf_array.DISCOUNT_CURVE_ID, 
                           		rf_array.DISCOUNT_CURVE_ID.mat, _discount_crv_int_method_ );
					 	end;

						DIV = DIV + disc_div_values[i] * exp( - dr * disc_div_times[i] );
                     end;
                     else DIV = DIV * ( 1 - disc_div_values[i] );  /* percent yield */

					 j = i;
                   end;
               end;

               /* If using at least one discrete dividend, then the percent of time 
                  the continuous yield is used is equal to the time after the last 
                  dividend date divided by the time left from the current date */
               if j > 0 then TimeToExpiration_Adj_Yield = max( (DaysToExpYield/365.25) - disc_div_times[j]/365.25, 0 ) / (DaysToExpYield/365.25);

/*            end;  */

        END;

		 /* Adjust the underlying value for discrete dividends */
        /* Default case is cash dividends of zero value */
		if QUANTO_OPTION_FLAG eq "N" then do;
	        if UseDiscDivCrvfNFlag eq 1 and OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then
	           UnderlyingValueAdj = riskfactor.UNDERLYING_RF_ID * DIV;
	        else UnderlyingValueAdj = sum( riskfactor.UNDERLYING_RF_ID, -DIV );
		end;
		else UnderlyingValueAdj = riskfactor.UNDERLYING_RF_ID;
		

        /* Adjust continuous yield */
        YieldAdj = Yield * TimeToExpiration_Adj_Yield;

		/************************************************************/
        /* time to expiration adj - para a Yield                    */
		/* and Forward calculation									*/
        /************************************************************/

		Forward = rsk_forward_calc(taxa_pre, TimeToExpRisk, DAY_BASIS_CD, YieldAdj, TimeToExpYield, DAY_BASIS_YIELD_CD, UnderlyingValueAdj, UseYieldCrvNFlag);

		/* the price input for Pricing Functions is defined by the Future Option Flag */
		if FUTURE_OPTION_FLAG = 'Y' then 
			preco = Forward;
		else
			preco = UnderlyingValueAdj;


		/************************************************************/
        /* GET VOLATILITY                                           */
        /************************************************************/

        /* If we have a volatility surface, then interpolate the volatility from that surface */
        /* If we have a volatility risk factor, then copy from the volatility risk factor */
        /* Otherwise, print an error to the log: this pricing method requires volatility */

		if UseVolSurfNFlag eq 1 then
			do;
		 	/* Get the moneyness ratio: strike/spot AJM moneyness ratio is the same*/
			MoneynessRatio = STRIKE_VALUE_AMT / riskfactor.UNDERLYING_RF_ID;
				
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
			impvol = Interpola_GRID(preco, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol,
						rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);

			/* CUSTOMIZACAO EXOTICAS: impvol para limitadores */
			if PUT_CALL_TYPE_CD = 'CAPLET' then
				impvollim = Interpola_GRID(preco, CAP_BRA, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol,
							rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			else if PUT_CALL_TYPE_CD = 'FLOORLET' then
				impvollim = Interpola_GRID(preco, FLOOR_BRA, RiskFreeRate, DaysToExpVol/365.25, TimeToExpVol,
							rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
			else
				impvollim = .;

		 end;

		 else do;
			_VALUE_ = .;
			impvol = .;
			call rsk_print_msg_subr( 'rsk_no_vol_error', INSTID, '', '', '', '', '', '' );
		 end;
		
		 /************************************************************/
         /* VALUE OPTION FOR DIFFERENT EXERCISE CASES                */
         /************************************************************/

		 /************************************************************/
	     /* QUANTO OPTIONS				                 			 */
	     /************************************************************/
		 IF QUANTO_OPTION_FLAG = 'Y' THEN DO;

		 	/************************************/
	        /* QUANTO INPUTS FOR PRICING   	 	*/
	        /************************************/
			/***************************************************************|
			|	Customização: 												|
			|		1- Foreign Risk Free calculation					 	|
			|		2- EWMA Vol and correlation calculation					|
			|		3- Foreign Underlying RF ID for foreign spots 			|
			|		4- Lambda value											|
			|		5- Quanto "q" factor value (Dividend Yield)				|
			|		6- Quanto Adm Fee value									|
			|***************************************************************/
		 	array domestic_rf[1] / nosym;
		 	array foreign_rf[1] / nosym;
			array tempo[1] / nosym;
			call dynamic_array(domestic_rf, QUANTO_HIST_DAY_QTY);
			call dynamic_array(foreign_rf, QUANTO_HIST_DAY_QTY);
			call dynamic_array(tempo, QUANTO_HIST_DAY_QTY);
		 	
		 	/* GET RF AND FOREIGN RF HISTORICAL VALUES */
		 	if UNDERLYING_RF_ID ne '_#_' and UNDERLYING_PRICE_VOL_ID ne '_#_' then do;
			 	do i = 1 to QUANTO_HIST_DAY_QTY;
					if i eq 1 then do;
						dataant = _date_;
						contdata = rsk_workday_to_calendarday(dataant, _date_, quanto_holiday_list);

						tempo[i] = contdata;
					end;
					else do;
						tempo[i] = tempo[i-1] + 1;
						dataant = _date_ - tempo[i];
						contdata = rsk_workday_to_calendarday(dataant, _date_, quanto_holiday_list);

						if tempo[i-1] eq contdata then
							tempo[i] = contdata + 1;
						else
							tempo[i] = contdata;
					end;

					domestic_rf[i] = rlag(riskfactor.UNDERLYING_RF_ID, tempo[i], "day");
					foreign_rf[i] = rlag(riskfactor.UNDERLYING_PRICE_VOL_ID, tempo[i], "day");
				end;
			
				/* Correlation and Exchange Rate Volatility calculation */
				correlation = rsk_ewma_corr(domestic_rf, foreign_rf, QUANTO_LAMBDA_VALUE);
				exchangevol = rsk_ewma_vol(foreign_rf, QUANTO_LAMBDA_VALUE);

			end;
			
			/* Foreign risk free calculation */
			if UseForegnDiscCrvNFlag eq 1 then
				foreignrisk = rsk_find_curve(rf_array.FOREGN_DISCOUNT_CURVE_ID, rf_array.FOREGN_DISCOUNT_CURVE_ID.Mat, DaysToExpFRF/365.25)/100;
				foreignrisk = log(1+foreignrisk);

			/* discrete dividend payout rate average calculation */
			if UseDiscDivCrvfNFlag eq 1 then do;
				sumdiv = 0;
				do j = 1 to dim(disc_div_values);
					sumdiv = sumdiv + disc_div_values[j];
				end;
				avgdiv = sumdiv / dim(disc_div_values);

				avgdiv = sum(avgdiv, QUANTO_ADM_FEE_AMT);

			end;
			else avgdiv = QUANTO_ADM_FEE_AMT;

			/****************************************/
	        /* QUANTO PRICING		   			 	*/
	        /****************************************/
			if PUT_CALL_TYPE_CD = "CALL" then do;
				_VALUE_ = rsk_eurcallquanto_pf(UNDERLYING_SCALING_NO, preco, 
					STRIKE_VALUE_AMT, TimeToExpiration, RiskFreeRate, foreignrisk, avgdiv, 
					impvol, exchangevol, correlation);
			end;
			else do; /* default to put */
				_VALUE_ = rsk_eurputquanto_pf(UNDERLYING_SCALING_NO, preco, 
					STRIKE_VALUE_AMT, TimeToExpiration, RiskFreeRate, foreignrisk, avgdiv, 
					impvol, exchangevol, correlation);
			end;
		 END; /* of quanto option */
		 
		 /************************************************************/
	     /* VANILLA OPTIONS				                 			 */
	     /************************************************************/
		 /**************************************************************|
		 |	Customização: 												|
		 |		1- Caplet e floorlet entrarão no put_call_type_cd pois 	|
		 |			pode haver limitadores para americanas um dia.		|
		 |		2- Inserido os modelos de precificação Black e 			|
		 |			Black & Scholes para as opções européias			|
		 |**************************************************************/
         ELSE IF PUT_CALL_TYPE_CD in ( 'CAPLET', 'FLOORLET' ) THEN DO; /* simple caplet/floorlet */
            if OPTION_MODEL_TYPE = "BLACK_SCHOLES" then do; /*black scholes*/
				/* Determine if it is a put or call */
	            if PUT_CALL_TYPE_CD eq 'CAPLET' then do;
	               _VALUE_ = rsk_europeancalloption_pf_cap( preco, 
	                  STRIKE_VALUE_AMT, RiskFreeRate, YieldAdj, TimeToExpiration, 
	                  impvol, impvollim, CAP_BRA );
	            end; 
	            else do; /* FLOORLET */
	               	_VALUE_=rsk_europeanputoption_pf_floor( preco,
						STRIKE_VALUE_AMT, RiskFreeRate, YieldAdj, TimeToExpiration,
	                  	impvol, impvollim, FLOOR_BRA );
	            end;
			end;
			else do; /*Default to Black*/
				if PUT_CALL_TYPE_CD eq 'CAPLET' then do;
	               _VALUE_ = rsk_eurcallopt_b76_pf_cap( preco, 
	                  STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, 
	                  impvol, impvollim, CAP_BRA );
	            end; 
	            else do; /* FLOORLET */
	               	_VALUE_=rsk_eurputopt_b76_pf_floor( preco,
						STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration,
	                  	impvol, impvollim, FLOOR_BRA );
	            end;
			end;
         END; /* fim Limitadores */

         ELSE IF PRODUCT_SUBTYPE eq 'SWAPTION' THEN DO; /* simple swaption */
            Value_Adj = ( 1 - 1 / (1+riskfactor.UNDERLYING_RF_ID/PAYMENTS_PER_YEAR)**
               (riskfactor.UNDERLYING_RF_ID.mat*PAYMENTS_PER_YEAR) ) / riskfactor.UNDERLYING_RF_ID;
            Spot_Adj = exp( - RiskFreeRate * TimeToExpiration );

            if PUT_CALL_TYPE_CD in ( 'CALL', 'PAYER' ) then do;
               _VALUE_ = Value_Adj * rsk_europeancalloption_pf( riskfactor.UNDERLYING_RF_ID * Spot_Adj, 
                  STRIKE_VALUE_AMT, RiskFreeRate, 0, TimeToExpiration, impvol );
            end;
            else do; /* PUT/RECEIVER */
               _VALUE_ = Value_Adj * rsk_europeanputoption_pf( riskfactor.UNDERLYING_RF_ID * Spot_Adj, 
                  STRIKE_VALUE_AMT, RiskFreeRate, 0, TimeToExpiration, impvol );
            end;
         END;

         ELSE IF OPTION_TYPE_FIRST_LETTER eq 'A' THEN DO; /* American option */
		 	
            /* Determine the American pricing method */
            /* These methods include the Barone-Adesi Whaley, Bjoerksund and 
               Stensland (1993 and 2002), trinomial and binomial approximations */

		 	/* Customization Brazil - Future Option Flag to determine if the value is
		 		forward or spot in the functions for BAW and BJS93 */
            if OPTION_MODEL_TYPE eq 'BAW' then do;

               /* Price differently if option is put or call */
               if PUT_CALL_TYPE_CD eq 'CALL' then do;
                  _VALUE_ = rsk_amercalloption_baw_pf(preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol, FUTURE_OPTION_FLAG );
               end;
               else do; /* default to put */
                  _VALUE_=rsk_amerputoption_baw_pf(preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol, FUTURE_OPTION_FLAG );  
               end;

            end;
            else if OPTION_MODEL_TYPE eq 'BJS93' then do;
            
               /* Price differently if option is put or call */
               if PUT_CALL_TYPE_CD eq 'CALL' then do;
                  _VALUE_=rsk_amercalloption_bjs93_pf(preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol, FUTURE_OPTION_FLAG );
               end;
               else do; /* default to put */
                  _VALUE_=rsk_amerputoption_bjs93_pf( preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol, FUTURE_OPTION_FLAG );
               end;

            end;
            else if OPTION_MODEL_TYPE eq 'BJS02' then do;
            
               /* Price differently if option is put or call */
               if PUT_CALL_TYPE_CD eq 'CALL' then do;
                  _VALUE_=rsk_amercalloption_bjs02_pf( preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol );
               end;
               else do; /* default to put */
                  _VALUE_=rsk_amerputoption_bjs02_pf( preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol );
               end;

            end;
            else if OPTION_MODEL_TYPE eq 'TRINOMIAL' then do;

               /* Price differently if option is put or call */
               if PUT_CALL_TYPE_CD eq 'CALL' then do;
                  _VALUE_=rsk_amercalloption_tri_pf(preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol, TRINOMIAL_LATTICE_STEPS );
               end;
               else do; /* default to put */
                  _VALUE_=rsk_amerputoption_tri_pf(preco,
                     STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration,
                     impvol, TRINOMIAL_LATTICE_STEPS );
               end;

            end;
            /*modelo Binomial Nativo*/
		    else if OPTION_MODEL_TYPE eq 'BINOMIAL' then do;

	            /* Price differently if option is put or call */
		    	if PUT_CALL_TYPE_CD eq 'CALL' then do;
					_VALUE_=rsk_amercalloption_bi_pf(preco, 
						STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration, 
						impvol, BINOMIAL_LATTICE_STEPS );
				end;
				else do; /* default to put */
					_VALUE_=rsk_amerputoption_bi_pf(preco, 
						STRIKE_VALUE_AMT, RiskFreeRate, Yield, TimeToExpiration, 
						impvol, BINOMIAL_LATTICE_STEPS );
				end;
		    end;
            else if OPTION_MODEL_TYPE eq 'LALALA' then do; /* default to BINOMIAL pricing */

               /* Convert exercise dates to times */
               do i = 1 to dim(ExerciseTimes);
                  temp_dt = ExerciseDates[i];
                  if _date_ le temp_dt then ExerciseTimes[i] = rsk_daycount( DAY_BASIS_CD, _date_, temp_dt );
                  else ExerciseTimes[i] = - rsk_daycount( DAY_BASIS_CD, temp_dt, _date_ );
               end;

               /* Price differently if option is put or call */
               if PUT_CALL_TYPE_CD eq 'CALL' then do;

                  /* Price differently for rate or cash discrete dividends */
                  /* Default is cash dividends with zero value */
                  if OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then do;
                     _VALUE_ = rsk_amercallopt_strkcrv_div2_pf( riskfactor.UNDERLYING_RF_ID, 
                        RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues, 
                        ExerciseTimes, disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
                  end;
                  else do;
                     _VALUE_ = rsk_amercallopt_strkcrv_div_pf( riskfactor.UNDERLYING_RF_ID, 
                        RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues, 
                        ExerciseTimes, disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
                  end;

               end;
               else do; /* default to put */

                  /* Price differently for rate or cash discrete dividends */
                  /* Default is cash dividends with zero value */
                  if OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then do;
                     _VALUE_ = rsk_amerputopt_strkcrv_div2_pf( riskfactor.UNDERLYING_RF_ID, 
                        RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues, 
                        ExerciseTimes, disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
                  end;
                  else do;
                     _VALUE_ = rsk_amerputopt_strkcrv_div_pf( riskfactor.UNDERLYING_RF_ID, 
                        RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues, 
                        ExerciseTimes, disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
                  end;

               end;

            end;

         END; /* of American pricing */

         ELSE IF OPTION_TYPE_FIRST_LETTER eq 'B' THEN DO; /* Bermudan option */

            /* Convert exercise dates to times */
            do i = 1 to dim(ExerciseTimes);
               temp_dt = ExerciseDates[i];
               if _date_ le temp_dt then ExerciseTimes[i] = rsk_daycount( DAY_BASIS_CD, _date_, temp_dt );
               else ExerciseTimes[i] = - rsk_daycount( DAY_BASIS_CD, temp_dt, _date_ );
            end;

            /* Price differently if option is put or call */
            if PUT_CALL_TYPE_CD eq 'CALL' then do;

               /* Price differently for rate or cash discrete dividends */
               /* Default is cash dividends with zero value */
               if OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then do;
                  _VALUE_=rsk_bermudacalloption_bi_div2_pf(riskfactor.UNDERLYING_RF_ID,
                     RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues,
                     ExerciseTimes, disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
               end;
               else do;
                  _VALUE_=rsk_bermudacalloption_bi_div_pf(riskfactor.UNDERLYING_RF_ID,
                     RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues,
                     ExerciseTimes, disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
               end;

            end;
            else do; /* default to put */

               /* Price differently for rate or cash discrete dividends */
               /* Default is cash dividends with zero value */
               if OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then do;
                  _VALUE_=rsk_bermudaputoption_bi_div2_pf( riskfactor.UNDERLYING_RF_ID,
                     RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues, ExerciseTimes, 
                     disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
               end;
               else do;
                  _VALUE_=rsk_bermudaputoption_bi_div_pf( riskfactor.UNDERLYING_RF_ID,
                     RiskFreeRate, Yield, TimeToExpiration, impvol, StrikeValues, 
                     ExerciseTimes, disc_div_values, disc_div_times, BINOMIAL_LATTICE_STEPS );
               end;

            end;

         END; /* of Bermudan pricing */
         ELSE DO; /* default to European option */
		 	
		 	if OPTION_MODEL_TYPE = "BLACK_SCHOLES" then do; /*black scholes*/
				/* Determine if it is a put or call */
	            if PUT_CALL_TYPE_CD eq 'CALL' then do;
	               _VALUE_ = rsk_europeancalloption_pf( preco, 
	                  STRIKE_VALUE_AMT, RiskFreeRate, YieldAdj, TimeToExpiration, 
	                  impvol );
	            end; 
	            else do; /* default to put */
	               	_VALUE_=rsk_europeanputoption_pf( preco,
						STRIKE_VALUE_AMT, RiskFreeRate, YieldAdj, TimeToExpiration,
	                  	impvol );
	            end;
			end;
			else do; /*Default to Black*/
				if PUT_CALL_TYPE_CD eq 'CALL' then do;
	               _VALUE_ = rsk_eurcallopt_b76_pf( preco, 
	                  STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, 
	                  impvol );
	            end; 
	            else do; /* default to put */
	               	_VALUE_=rsk_eurputopt_b76_pf( preco,
						STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration,
	                  	impvol );
	            end;
			end;
         END; /* of European pricing (final pricing case) */


		 /****************************************|
		 |*      CUSTOM GREEKS CALCULATION       *|
		 |****************************************/

		 /* calcula delta com método customizado, mas deve sair por sensitivity analysis VER */
		delta_result = Calcula_Delta(preco, STRIKE_VALUE_AMT, RiskFreeRate, YieldAdj, DaysToExpVol/365.25, TimeToExpVol, 
					rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);

		/*atribui o valor do limitador*/
		valor_limitador = .;
		if PUT_CALL_TYPE_CD = "CAPLET" then
			valor_limitador = CAP_BRA;
		else if PUT_CALL_TYPE_CD = "FLOORLET" then
			valor_limitador = FLOOR_BRA;

		/*Calculando variaveis para usar nas gregas*/
		Vol_      		  = Interpola_GRID(preco, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Anual 		  = Interpola_GRID(preco, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Anual_Mais_Delta      = Interpola_GRID(preco + 0.001, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Anual_Menos_Delta     = Interpola_GRID(preco - 0.001, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Anual_Mais_Gamma      = Interpola_GRID(preco + 0.002, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Anual_Menos_Gamma     = Interpola_GRID(preco - 0.002, STRIKE_VALUE_AMT, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
	
		Vol_Lim_Anual 		  = Interpola_GRID(preco, valor_limitador, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Lim_Anual_Mais_Delta  = Interpola_GRID(preco + 0.001, valor_limitador, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Lim_Anual_Menos_Delta = Interpola_GRID(preco - 0.001, valor_limitador, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Lim_Anual_Mais_Gamma  = Interpola_GRID(preco + 0.002, valor_limitador, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
		Vol_Lim_Anual_Menos_Gamma = Interpola_GRID(preco - 0.002, valor_limitador, RiskFreeRate, DaysToExpiration/365.25, TimeToExpiration, rf_array.UNDRLNG_PRICE_VOL_SURF_ID, delta, mat, PUT_CALL_TYPE_CD, _vol_surf_int_method_, _vol_surf_int_technique_);
	
		/*Tipo de Opção*/
					
		if index(UNDERLYING_RF_ID,'DI') ge 1 then do;
			if PUT_CALL_TYPE_CD in ("CALL", "CAPLET") then	do; /*call*/
				if missing (valor_limitador) then do; /*sem limitador*/
					_Delta1  = callPriceBlack(preco + 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Mais_Delta , TimeToExpiration , RiskFreeRate);
					_Delta2  = callPriceBlack(preco - 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Menos_Delta , TimeToExpiration , RiskFreeRate);
					_Deltad  =((2 * 0.001) * exp((TimeToExpiration)*RiskFreeRate));
					_Delta   = abs((_Delta1-_Delta2)/_Deltad);
					_Gama1   = callPriceBlack(preco + 0.002, STRIKE_VALUE_AMT , Vol_Anual_Mais_Gamma , TimeToExpiration , RiskFreeRate);
					_Gama2   = callPriceBlack(preco - 0.002, STRIKE_VALUE_AMT , Vol_Anual_Menos_Gamma, TimeToExpiration , RiskFreeRate);
					_Gama3   = 2*callPriceBlack(preco, STRIKE_VALUE_AMT , Vol_Anual, TimeToExpiration , RiskFreeRate);
					_Gamad   = ((4 * (0.001**2)) * exp((TimeToExpiration)*RiskFreeRate));
					_Gama    = ((_Gama1 +_Gama2 -_Gama3)/_Gamad);
					_Teta    = Theta_Call_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual);
					_Vega    = Vega_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual);
					_Rho     = Rho_Call_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual);
				end /*fim sem limitador*/;
				else do/*com limitador*/;
					_Delta1  = (callPriceBlack(preco + 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Mais_Delta , TimeToExpiration , RiskFreeRate));
					_Delta2  = (callPriceBlack(preco - 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Menos_Delta , TimeToExpiration , RiskFreeRate));
					_Deltad  = ((2 * 0.001) * exp((TimeToExpiration)*RiskFreeRate));
					_Delta3  = ((_Delta1 - _Delta2)/_Deltad);
					_Delta1L = (callPriceBlack(preco + 0.001 , valor_limitador , Vol_Lim_Anual_Mais_Delta , TimeToExpiration , RiskFreeRate));
					_Delta2L = (callPriceBlack(preco - 0.001 , valor_limitador , Vol_Lim_Anual_Menos_Delta , TimeToExpiration , RiskFreeRate));											
					_Delta3L = (_Delta1L - _Delta2L)/_Deltad;
					_Delta   = abs(_Delta3 - _Delta3L);
					_Gama1   = (callPriceBlack(preco + 0.002, STRIKE_VALUE_AMT , Vol_Anual_Mais_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama2   = (callPriceBlack(preco - 0.002, STRIKE_VALUE_AMT , Vol_Anual_Menos_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama3   = (2*callPriceBlack(preco, STRIKE_VALUE_AMT , Vol_Anual, TimeToExpiration , RiskFreeRate));
					_Gamad   = ((4 * (0.001**2)) * exp((TimeToExpiration)*RiskFreeRate));
					_Gama4   = (_Gama1 + _Gama2 - _Gama3)/_Gamad;
					_Gama1L  = (callPriceBlack(preco + 0.002, valor_limitador , Vol_Lim_Anual_Mais_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama2L  = (callPriceBlack(preco - 0.002, valor_limitador , Vol_Lim_Anual_Menos_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama3L  = (2*callPriceBlack(preco, valor_limitador , Vol_Lim_Anual, TimeToExpiration , RiskFreeRate));
					_Gama4L  = (_Gama1L + _Gama2L - _Gama3L)/_Gamad;
					_Gama    = _Gama4 - _Gama4L;
					_Teta    = (Theta_Call_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual)-Theta_Call_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, Vol_Lim_Anual));
					_Vega    = (Vega_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual)-Vega_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, Vol_Lim_Anual));
					_Rho     = (Rho_Call_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual)-Rho_Call_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, Vol_Lim_Anual));
				end/*fim com limitador*/;
			end /*fim call*/;
			if PUT_CALL_TYPE_CD in ("PUT", "FLOORLET") then do/*put*/; 
				/*if OPTION_MODEL_TYPE = "BLACK" then do;*/ /*black*/
				if missing (valor_limitador) then do/*sem limitador*/;
					_Delta1  = putPriceBlack(preco + 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Mais_Delta , TimeToExpiration, RiskFreeRate);
					_Delta2  = putPriceBlack(preco - 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Menos_Delta , TimeToExpiration, RiskFreeRate);
					_Deltad  =((2 * 0.001) * exp((TimeToExpiration)*RiskFreeRate));
					_Delta   = abs((_Delta1-_Delta2)/_Deltad);
					_Gama1   = putPriceBlack(preco + 0.002, STRIKE_VALUE_AMT , Vol_Anual_Mais_Gamma ,TimeToExpiration , RiskFreeRate);
					_Gama2   = putPriceBlack(preco - 0.002, STRIKE_VALUE_AMT , Vol_Anual_Menos_Gamma, TimeToExpiration, RiskFreeRate);
					_Gama3   = 2*putPriceBlack(preco, STRIKE_VALUE_AMT , Vol_Anual, TimeToExpiration , RiskFreeRate);
					_Gamad   = ((4 * (0.001**2)) * exp((TimeToExpiration)*RiskFreeRate));
					_Gama    = ((_Gama1 +_Gama2 -_Gama3)/_Gamad);
					_Teta    = Theta_Put_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual);
					_Vega    = Vega_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual);
					_Rho     = Rho_Put_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual);
				end /*fim sem limitador*/;
				else do/*com limitador*/;
					_Delta1  = (PutPriceBlack(preco + 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Mais_Delta , TimeToExpiration , RiskFreeRate));
					_Delta2  = (PutPriceBlack(preco - 0.001 , STRIKE_VALUE_AMT , Vol_Anual_Menos_Delta , TimeToExpiration , RiskFreeRate));
					_Deltad  = ((2 * 0.001) * exp((TimeToExpiration)*RiskFreeRate));
					_Delta3  = (_Delta1 - _Delta2)/_Deltad;
					_Delta1L = (PutPriceBlack(preco + 0.001 , valor_limitador , Vol_Lim_Anual_Mais_Delta , TimeToExpiration , RiskFreeRate));
					_Delta2L = (PutPriceBlack(preco - 0.001 , valor_limitador , Vol_Lim_Anual_Menos_Delta , TimeToExpiration , RiskFreeRate));
					_Delta3L = (Delta1L - Delta2L)/Deltad;
					_Delta   = abs(_Delta3 - _Delta3L);
					_Gama1   = (PutPriceBlack(preco + 0.002, STRIKE_VALUE_AMT , Vol_Anual_Mais_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama2   = (PutPriceBlack(preco - 0.002, STRIKE_VALUE_AMT , Vol_Anual_Menos_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama3   = (2*PutPriceBlack(preco, STRIKE_VALUE_AMT , Vol_Anual, TimeToExpiration , RiskFreeRate));
					_Gamad   = ((4 * (0.001**2)) * exp((TimeToExpiration)*RiskFreeRate));
					_Gama4   = (_Gama1 + _Gama2 - _Gama3)/_Gamad;
					_Gama1L  = (PutPriceBlack(preco + 0.002, valor_limitador , Vol_Lim_Anual_Mais_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama2L  = (PutPriceBlack(preco - 0.002, valor_limitador , Vol_Lim_Anual_Menos_Gamma , TimeToExpiration , RiskFreeRate));
					_Gama3L  = (2*PutPriceBlack(preco, valor_limitador , Vol_Lim_Anual, TimeToExpiration , RiskFreeRate));
					_Gama4L  = (_Gama1L + _Gama2L - _Gama3L)/_Gamad;
					_Gama    = _Gama4 - _Gama4L;
					_Teta    = (Theta_Put_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual)-Theta_Put_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, Vol_Lim_Anual));
					_Vega    = (Vega_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual)-Vega_Black(preco, valor_limitador, RiskFreeRate,TimeToExpiration, Vol_Lim_Anual));
					_Rho     = (Rho_Put_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, Vol_Anual)-Rho_Put_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, Vol_Lim_Anual));
				end/*fim com limitador*/;
			end/*fim put*/;
		end;
		else do;
			if PUT_CALL_TYPE_CD in ("CALL", "CAPLET") then do;
				_Delta = Delta_Call_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Gama  = Gamma_Black     (preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Teta  = Theta_Call_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Vega  = Vega_Black      (preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Rho   = Rho_Call_Black  (preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);

				if valor_limitador ne . then do; /*valor com limitador*/
					_DeltaL = Delta_Call_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_GamaL  = Gamma_Black     (preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_TetaL  = Theta_Call_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_VegaL  = Vega_Black      (preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_RhoL   = Rho_Call_Black  (preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);

					_Delta = _Delta - _DeltaL;
					_Gama = _Gama - _GamaL;
					_Teta = _Teta - _TetaL;
					_Vega = _Vega - _VegaL;
					_Rho = _Rho - _RhoL;
				end; /*fim valor com limitador*/
		    end;
			else if PUT_CALL_TYPE_CD in ("PUT", "FLOORLET") then do;
				_Delta = Delta_Put_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Gama  = Gamma_Black    (preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Teta  = Theta_Put_Black(preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Vega  = Vega_Black	    (preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);
				_Rho   = Rho_Put_Black  (preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpiration, impvol);

				if valor_limitador ne . then do; /*valor com limitador*/
					_DeltaL = Delta_Put_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_GamaL  = Gamma_Black    (preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_TetaL  = Theta_Put_Black(preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_VegaL  = Vega_Black	    (preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);
					_RhoL   = Rho_Put_Black  (preco, valor_limitador, RiskFreeRate, TimeToExpiration, impvollim);

					_Delta = _Delta - _DeltaL;
					_Gama = _Gama - _GamaL;
					_Teta = _Teta - _TetaL;
					_Vega = _Vega - _VegaL;
					_Rho = _Rho - _RhoL;
				end; /*fim valor com limitador*/
		    end;
			
		end;

		put "Values here";
		put instID= PUT_CALL_TYPE_CD= FUTURE_OPTION_FLAG= STRIKE_VALUE_AMT= DaysToExpiration= DaystoExpRisk= TimeToExpRisk= taxa_pre= 
			RiskFreeRate= Yield= impvol= impvollim= YieldAdj= UnderlyingValueAdj= 
			TimeToExpiration_Adj_Yield= TimeToExpiration_Adj= Forward= preco=
			_VALUE_= delta_result= _DeltaL= _Delta= _GamaL= _Gama= _TetaL= _Teta= _VegaL= _Vega= _RhoL= _Rho=;
		OUT_V_IMPVOL = impvol;
		OUT_V_IMPVOLLIM = impvollim;
		OUT_V_FOWARD = preco;
		OUT_V_TIMETOEXP = DaysToExpiration;
		OUT_V_RISKFREERATE = RiskFreeRate;
		OUT_V_COUPOM = YieldAdj;
		OUT_V_DELTA = delta_result;
		OUT_V_DELTAJ = _Delta;
		OUT_V_GAMA= _Gama;
		OUT_V_VEGA = _Vega;
		OUT_V_Teta = _Teta;
		OUT_V_RHO = _Rho;

		OUT_V_QTORSK = foreignrisk;
		OUT_V_QTODIV = avgdiv;
		OUT_V_QTOVOL = exchangevol;
		OUT_V_QTOCOR = correlation;

         
         /************************************************************/
         /* FINAL ADJUSTMENTS TO VALUE                               */
         /************************************************************/
         IF VALUE_SCALING_RT ne . THEN _VALUE_ = _VALUE_ * VALUE_SCALING_RT;
         if UseValueScalingRfNFlag eq 1 then _VALUE_ = _VALUE_ * riskfactor.VALUE_SCALING_RF_ID;
         if not missing(UNDERLYING_SCALING_NO) and QUANTO_OPTION_FLAG eq "N" then _VALUE_ = _VALUE_ * UNDERLYING_SCALING_NO;

         _INSTRUMENT_VALUE_=_VALUE_;

		 /*premio financiado. Calc: <premio> * (1 + <1a_taxa_da_curva>) ^ (<dias_para_expirar> / <qtd_dias_convencao>) */
		 /*Carlos: validando se a formula é <premio> * (1 + <1a_taxa_da_curva>) ^ (<dias_para_expirar> / <qtd_dias_convencao>)*/
		 OUT_V_FINVAL = _VALUE_ * (1 + FINVAL_OPER_AMT) ** (TimeToExpFin);

         /***************************************************************************/
         /* COMPUTE CASHFLOW                                                        */
         /***************************************************************************/
         /* Return cash flow values if UseCalculateCashflowFlg eq 1 */
         if UseCalculateCashflowFlg eq 1 then do;
            _cashflow_.num = 1;
            _cashflow_.matdate[1] = coalesce(Expected_exercise_dt, Maturity_dt);
            _cashflow_.cfint[1] = 0;
            if _cashflow_.matdate[1] le _date_ then do; 
            /* if exercise date is past(simulation case), use the simulated underlying price*/
               if upcase(PUT_CALL_TYPE_CD) eq 'CALL' then
               _cashflow_.matamt[1] = max(rlag(riskfactor.underlying_rf_id, 
                  rsk_daycount(DAY_BASIS_CD,_cashflow_.matdate[1],_date_)) - STRIKE_VALUE_AMT, 0);
               else _cashflow_.matamt[1] = max(STRIKE_VALUE_AMT - rlag(riskfactor.underlying_rf_id, 
                  rsk_daycount(DAY_BASIS_CD,_cashflow_.matdate[1],_date_)) , 0);
            end;
            else do;
               TimetoExercise = rsk_daycount( DAY_BASIS_CD, _date_, _cashflow_.matdate[1] );
				if DAY_BASIS_CD eq 'DU/252' then do;
					RiskFreeRateToExercise = Interpola_Exponencial(TimetoExercise*365.25,
                  		rf_array.DISCOUNT_CURVE_ID, rf_array.DISCOUNT_CURVE_ID.Mat);
		 		end;
				else do;
               		RiskFreeRateToExercise = rsk_intpolate2( TimetoExercise,
                  		rf_array.DISCOUNT_CURVE_ID, rf_array.DISCOUNT_CURVE_ID.Mat, 
                  		_discount_crv_int_method_ );
				end;
               if not missing(EXPECTED_UNDLNG_EXERCISE_AMT) then do;
                  if upcase(PUT_CALL_TYPE_CD) eq 'CALL' then
                     _cashflow_.matamt[1] = max(EXPECTED_UNDLNG_EXERCISE_AMT - STRIKE_VALUE_AMT, 0);
                  else _cashflow_.matamt[1] = max(STRIKE_VALUE_AMT - EXPECTED_UNDLNG_EXERCISE_AMT , 0);
               end;
               else do;
                  DivToExercise = 0;
                  UnderlyingValueAdj = riskfactor.UNDERLYING_RF_ID;
                  if UseDiscDivCrvfNFlag eq 1 and QUANTO_OPTION_FLAG eq "N" THEN DO;

                     if OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then DivToExercise = 1;
                     else DivToExercise = 0;
                     /* Loop over all discrete dividend dates strictly before expiration */
                     do i=1 to dim(disc_div_values) while(round(TimetoExercise-disc_div_times[i], constant('SQRTMACEPS')) ge 0);
                        /* Only consider future dividends */
                        if 0 le disc_div_times[i] then do;
                           /* "Sum" DIV, depending on the type */
                           if OPTION_DISCRETE_YIELD_TYPE ne 'RELATIVE' then do; /* cash dividend case */
						   	if DAY_BASIS_CD eq 'DU/252' then do;
							dr = Interpola_Exponencial(disc_div_times[i]*365.25, rf_array.DISCOUNT_CURVE_ID, 
                                 rf_array.DISCOUNT_CURVE_ID.mat);
		 					end;
							else do;
                              dr = rsk_intpolate2( disc_div_times[i], rf_array.DISCOUNT_CURVE_ID, 
                                 rf_array.DISCOUNT_CURVE_ID.mat, _discount_crv_int_method_ );
							end;
                                 DivToExercise = DivToExercise + disc_div_values[i] * exp( - dr * disc_div_times[i] );
                           end;
                           else DivToExercise = DivToExercise * ( 1 - disc_div_values[i] );  /* percent yield */
                        end;
                     end;
                     if OPTION_DISCRETE_YIELD_TYPE eq 'RELATIVE' then 
                        UnderlyingValueAdj = riskfactor.UNDERLYING_RF_ID * DivToExercise;
                     else UnderlyingValueAdj = sum( riskfactor.UNDERLYING_RF_ID, -DivToExercise );
                  end;
                  UnderlyingValueAdj = UnderlyingValueAdj * exp(RiskFreeRateToExercise * TimetoExercise);
                  if upcase(PUT_CALL_TYPE_CD) eq 'CALL' then
                     _cashflow_.matamt[1] = max(UnderlyingValueAdj - STRIKE_VALUE_AMT, 0);
                  else _cashflow_.matamt[1] = max(STRIKE_VALUE_AMT - UnderlyingValueAdj , 0);
               end;
            end;
            IF VALUE_SCALING_RT ne . THEN _cashflow_.matamt[1] = _cashflow_.matamt[1] * VALUE_SCALING_RT;
            if UseValueScalingRfNFlag eq 1 then _cashflow_.matamt[1] = _cashflow_.matamt[1] * riskfactor.VALUE_SCALING_RF_ID;
            if not missing(UNDERLYING_SCALING_NO) then _cashflow_.matamt[1] = _cashflow_.matamt[1] * UNDERLYING_SCALING_NO;
         end; /*End cash flow calculation*/

         /***************************************************************************/
         /* COMPUTE RETURN                                                          */
         /***************************************************************************/

         /* Note: these are only used with RMI, not RMB */
         OUTV_BUY_PRICE_AMT = coalesce(BUY_PRICE_AMT,0);
         OUTV_WP_FUND_RK = FINANCIAL_FUND_RK;
         if nmiss(OUTV_BUY_PRICE_AMT,OUTV_WP_FUND_RK) > 0 then do;
            /* Do nothing, this marks these variables as "used" for RMB */
         end;

         /* Apply haircuts to cash flow MTM values */
         if UseAssetValueHaircutNFlag eq 1 then _VALUE_ = _VALUE_ * (1-riskfactor.ASSET_VALUE_HAIRCUT_RF_NM);

      END;

   endblock;

endmethod;
