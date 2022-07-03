
/*****************************************************************************
   Copyright (c) 2011 by SAS Institute Inc., Cary, NC, USA.

   NAME: rsk_amercalloption_baw_pf.sas

   PURPOSE: American option analytic pricing call option pricing by Barone-Adesi and Whaley (1987)

   INPUTS:
      Price - underlying price
      Strike - option strike
      RiskFreeRate - continuous risk-free rate
      YieldParam - underlying continuous yield rate
      TimeToExpiration - time to expiration, in years
      Volatility - Black-Scholes volatility

	  -- Customization for Brazil --
	  FwdFlag - Flag for future option

   FUNCTION DEPENDENCY:
      rsk_europeancalloption_pf

   REFERENCES:
      Barone-Adesi, G. and R. E. Whaley (1987): "Efficient Analytic
         Approximation of American Option Values," Journal of Finance, 42(2),
         301-320.

 *****************************************************************************/


Function rsk_amercalloption_baw_pf(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility,FwdFlag$)
         kind  = "American option analytic pricing"
         label = "Analytic American call option price approximation by Barone-Adesi and Whaley";

/**************************************************************************/
/* ERROR CHECKING
/**************************************************************************/

if TimeToExpiration lt 0 then return(0);

/* Initialize the return missing flag to zero
If we find an error in one of the inputs, we will return missing */
/* Set the function name for error reporting */
ReturnMissingFlg = 0;
Fname = 'rsk_amercalloption_baw_pf';

/* Make sure some inputs are positive or nonnegative*/
/* Negative and missing values for those inputs may cause problems
if input into another function (e.g. the logarithm function) */  
ReturnMissingFlg = rsk_check_num_missing_pf( RiskFreeRate, Fname, '3', 'RiskFreeRate', ReturnMissingFlg );
ReturnMissingFlg = rsk_check_num_missing_pf( YieldParam, Fname, '4', 'YieldParam', ReturnMissingFlg );
ReturnMissingFlg = rsk_check_num_missing_pf( TimeToExpiration, Fname, '5', 'TimeToExpiration', ReturnMissingFlg );

if RiskFreeRate = 0 then do;
   call rsk_print_msg_subr( 'rsk_func_zero_inputs_error', Fname, '3', 'RiskFreeRate', '', '', '', '' );
   ReturnMissingFlg = 1;
end;

ReturnMissingFlg = rsk_check_nonpositive_pf( Price, Fname, '1', 'Price', ReturnMissingFlg );   
ReturnMissingFlg = rsk_check_nonpositive_pf( Strike, Fname, '2', 'Strike', ReturnMissingFlg );   
ReturnMissingFlg = rsk_check_nonpositive_pf( Volatility, Fname, '6', 'Volatility', ReturnMissingFlg );   
      
/* Return missing, if errors are found */
if ReturnMissingFlg eq 1 then return(.);

/************************************************************/
/* RESUME STANDARD PRICING
/************************************************************/ 

   if TimeToExpiration eq 0 then return (max(Price-Strike,0));

   /*if the m1 is zero, return value as missing and quit. otherwise it throws a divide zero error*/
   if RiskFreeRate eq 0 then return(.);

   /* Compute cost of carry */
   CostofCarry=RiskFreeRate - YieldParam;

   /* If the cost of carry is greater than or equal to the risk-free rate, then it is never
      optimal to exercise early, thus this has vhe price of a European call option */
   /* Otherwise, continue pricing */
   if CostofCarry ge RiskFreeRate then do;
    if FwdFlag eq 'N' then
	  OptionPrice = rsk_europeancalloption_pf( Price, Strike, RiskFreeRate,
         YieldParam, TimeToExpiration, Volatility );
	else
      OptionPrice = rsk_eurcallopt_b76_pf( Price, Strike, RiskFreeRate, TimeToExpiration, Volatility );
   end;
   else do;

      /* Compute constants */
      g = Volatility * sqrt(TimeToExpiration);
      Volsq = Volatility * Volatility;
      N = 2 * CostofCarry / Volsq;
      N1 = N - 1;
      M = 2 * RiskFreeRate / Volsq;
      K = 1 - exp( -RiskFreeRate * TimeToExpiration );
      q2 = ( -N1 + sqrt( N1 * N1 + 4 * M / K ) ) * 0.5;
      q2inv = 1/q2;
      yielddisc = exp( -YieldParam*TimeToExpiration );

      /* Store some values for efficient computation of d1 */
      /* d1(S) = log(S)/g + d1base */
      d1base = -log(Strike)/g + ( CostofCarry / Volsq + 0.5 ) * g; 

      /* Store some values for efficient computation of bi */
      /* bi = bibase1*probnorm(-d1)+bibase2*exp(-d1*d1*0.5)-q2inv */
      bibase1 = yielddisc * ( 1 - q2inv ); 
      bibase2 = - yielddisc * q2inv / ( g * sqrt(2*constant('PI')) );

      /* Initialize Sstar, RHSi and LHSi */
      Sstarinf = Strike / ( 1 + 2 / ( N1 - sqrt( N1 * N1 + 4 * M ) ) );
      h2 = -( CostOfCarry * TimeToExpiration + 2 * g ) * Strike / ( Sstarinf - Strike );
      Sstar = Strike + ( Sstarinf - Strike ) * ( 1 - exp( h2 ) );
      LHSi = Sstar - Strike;
      callval = rsk_europeancalloption_pf(Sstar,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility);
      d1 = log(Sstar)/g + d1base;
      RHSi = callval + ( 1 - yielddisc * probnorm(d1) ) * Sstar * q2inv;

      /* Solve for Sstar using Newton-Raphson */
      tol = 1e-6;
      do i = 1 to 100 while( abs( RHSi - LHSi ) / Strike ge tol );
         bi = bibase1*probnorm(d1)+bibase2*exp(-d1*d1*0.5)+q2inv;
         Sstar = ( Strike + RHSi - bi * Sstar ) / ( 1 - bi );
         LHSi = Sstar - Strike;
         callval = rsk_europeancalloption_pf(Sstar,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility);
         d1 = log(Sstar)/g + d1base;
         RHSi = callval + ( 1 - yielddisc * probnorm(d1) ) * Sstar * q2inv;
      end;

      /* Compute option price */
      if Price ge Sstar then OptionPrice = Price - Strike;
      else do;
         /* The next commented value is computed in the previous do loop 
         d1 = log(Sstar)/g + dlbase; */;
         callval = rsk_europeancalloption_pf(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility);
         A2 = Sstar * q2inv * ( 1 - yielddisc * probnorm(d1) );
         OptionPrice = callval + A2 * ( Price / Sstar ) ** q2;
      end;

   end;

   return(OptionPrice);

  endsub;
