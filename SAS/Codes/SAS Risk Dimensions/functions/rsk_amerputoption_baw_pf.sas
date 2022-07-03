
/*****************************************************************************
   Copyright (c) 2011 by SAS Institute Inc., Cary, NC, USA.

   NAME: rsk_amercalloption_baw_pf.sas

   PURPOSE: American option analytic pricing put option pricing by Barone-Adesi and Whaley (1987)

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
      rsk_europeanputoption_pf

   REFERENCES:
      Barone-Adesi, G. and R. E. Whaley (1987): "Efficient Analytic
         Approximation of American Option Values," Journal of Finance, 42(2),
         301-320.

 *****************************************************************************/


function rsk_amerputoption_baw_pf(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility, FwdFlag$)
         kind  = "American option analytic pricing"
         label = "Analytic American put option price approximation by Barone-Adesi and Whaley";

/**************************************************************************/
/* ERROR CHECKING
/**************************************************************************/

if TimeToExpiration lt 0 then return(0);

/* Initialize the return missing flag to zero
If we find an error in one of the inputs, we will return missing */
/* Set the function name for error reporting */
ReturnMissingFlg = 0;
Fname = 'rsk_amerputoption_baw_pf';

/* Make sure some inputs are positive or nonnegative*/
/* Negative and missing values for those inputs may cause problems
if input into another function (e.g. the logarithm function) */  
ReturnMissingFlg = rsk_check_num_missing_pf( RiskFreeRate, Fname, '3', 'RiskFreeRate', ReturnMissingFlg );
ReturnMissingFlg = rsk_check_num_missing_pf( YieldParam, Fname, '2', 'YieldParam', ReturnMissingFlg );
ReturnMissingFlg = rsk_check_num_missing_pf( TimeToExpiration, Fname, '5', 'TimeToExpiration', ReturnMissingFlg );

if RiskFreeRate = 0 then do;
   file log;
   put "ERROR: RiskFreeRate can not be 0 for rsk_amerputoption_baw_pf." ;
   file print;   
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

   if TimeToExpiration eq 0 then return (max(Strike-Price,0));

   /* If the cost of carry is greater than or equal to the risk-free rate, then it is never
      optimal to exercise early, thus this has vhe price of a European put option */
   /* Otherwise, continue pricing */
   CostofCarry=RiskFreeRate - YieldParam;
   if CostofCarry ge RiskFreeRate then do;
   	if FwdFlag eq 'N' then
      OptionPrice=rsk_europeanputoption_pf(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility);
	else
	  OptionPrice=rsk_eurputopt_b76_pf(Price,Strike,RiskFreeRate,TimeToExpiration,Volatility);
   end;
   else do;

      /* Compute constants */
      g = Volatility * sqrt(TimeToExpiration);
      Volsq = Volatility * Volatility;
      N = 2 * CostofCarry / Volsq;
      N1 = N - 1;
      M = 2 * RiskFreeRate / Volsq;
      K = 1 - exp( -RiskFreeRate * TimeToExpiration );
      q1 = -( N1 + sqrt( N1 * N1 + 4 * M / K ) ) * 0.5;
      q1inv = 1/q1;
      yielddisc = exp( -YieldParam*TimeToExpiration );

      /* Store some values for efficient computation of d1 */
      /* d1(S) = log(S)/g + d1base */
      d1base = -log(Strike)/g + ( CostofCarry / Volsq + 0.5 ) * g; 

      /* Store some values for efficient computation of bi */
      /* bi = bibase1*probnorm(-d1)+bibase2*exp(-d1*d1*0.5)-q1inv */
      bibase1 = - yielddisc * ( 1 - q1inv ); 
      bibase2 = - yielddisc * q1inv / ( g * sqrt(2*constant('PI')) );

      /* Initialize Sstar, HSi and VSi */
      Sstarinf = Strike / ( 1 + 2 / ( N1 + sqrt( N1 * N1 + 4 * M ) ) );
      h1 = ( CostOfCarry * TimeToExpiration - 2 * g ) * Strike / ( Strike - Sstarinf );
      Sstar = Sstarinf + ( Strike - Sstarinf ) * exp( h1 );
      VSi = Strike - Sstar;
      putval = rsk_europeanputoption_pf(Sstar,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility);
      d1 = log(Sstar)/g + d1base;
      HSi = putval - ( 1 - yielddisc * probnorm(-d1) ) * Sstar * q1inv;

      /* Solve for Sstar using Newton-Raphson */
      tol = 1e-6;
      do i = 1 to 100 while( abs( HSi - VSi ) / Strike ge tol );
         bi = bibase1*probnorm(-d1)+bibase2*exp(-d1*d1*0.5)-q1inv;
         Sstar = ( Strike - Hsi + bi * Sstar ) / ( 1 + bi );
         VSi = Strike - Sstar;
         putval = rsk_europeanputoption_pf(Sstar,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility);
         d1 = log(Sstar)/g + d1base;
         HSi = putval - ( 1 - yielddisc * probnorm(-d1) ) * Sstar * q1inv;
      end;

      /* Compute option price */
      if Price le Sstar then OptionPrice = Strike - Price;
      else do;
         /* The next commented value is computed in the previous do loop 
         d1 = log(Sstar)/g + dlbase; */;
         putval = rsk_europeanputoption_pf(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility);
         A1 = - Sstar * q1inv * ( 1 - yielddisc * probnorm(-d1) );
         OptionPrice = putval + A1 * ( Price / Sstar ) ** q1;
      end;

   end;

   return(OptionPrice);

endsub;
