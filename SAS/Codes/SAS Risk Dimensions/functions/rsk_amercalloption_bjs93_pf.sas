


/*****************************************************************************
   Copyright (c) 2008 by SAS Institute Inc., Cary, NC, USA.

   NAME: rsk_amercalloption_bjs93_pf.sas

   PURPOSE: American Call Option pricing by Black and Scholes (1973) and Merton (1973)
      - Bjoerksund and Stensland (1993) method

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
      rsk_utility_bjs93_pf

   REFERENCES:
      Bjerksund, P. and G. Stensland (1993): "Analytic Approximation of
         American Options," Scandinavian Journal of Management, 9, 87-89.

 *****************************************************************************/



function rsk_amercalloption_bjs93_pf(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility, FwdFlag$)
         kind  = "American option analytic pricing"
         label = "Analytic American call option price approximation by Bjerksund and Stensland (1993)";

/**************************************************************************/
/* ERROR CHECKING
/**************************************************************************/

if TimeToExpiration lt 0 then return(0);

/* Initialize the return missing flag to zero
If we find an error in one of the inputs, we will return missing */
/* Set the function name for error reporting */
ReturnMissingFlg = 0;
Fname = 'rsk_amercalloption_bjs93_pf';

/* Make sure some inputs are positive or nonnegative*/
/* Negative and missing values for those inputs may cause problems
if input into another function (e.g. the logarithm function) */  
ReturnMissingFlg = rsk_check_num_missing_pf( RiskFreeRate, Fname, '3', 'RiskFreeRate', ReturnMissingFlg );
ReturnMissingFlg = rsk_check_num_missing_pf( YieldParam, Fname, '4', 'YieldParam', ReturnMissingFlg );
ReturnMissingFlg = rsk_check_num_missing_pf( TimeToExpiration, Fname, '5', 'TimeToExpiration', ReturnMissingFlg );

ReturnMissingFlg = rsk_check_nonpositive_pf( Price, Fname, '1', 'Price', ReturnMissingFlg );   
ReturnMissingFlg = rsk_check_nonpositive_pf( Strike, Fname, '2', 'Strike', ReturnMissingFlg );   
ReturnMissingFlg = rsk_check_nonpositive_pf( Volatility, Fname, '6', 'Volatility', ReturnMissingFlg );   
      
/* Return missing, if errors are found */
if ReturnMissingFlg eq 1 then return(.);

/************************************************************/
/* RESUME STANDARD PRICING
/************************************************************/ 

   if TimeToExpiration eq 0 then return (max(Price-Strike,0));

   /* Compute the cost of carry */
   CostofCarry=RiskFreeRate - YieldParam;

   /* if the cost of carry is greater than or equal to the risk-free rate, then it is never
      optimal to exercise early, thus this has vhe price of a European call option */
   /* Otherwise, continue pricing */

   /* Turnaround: RiskFree ge RiskFree usado para contornar problema de precificação na BJS93.
   	 -- AJUSTAR O BJS93 E ALTERAR PARA A CONDICAO COMENTADA ABAIXO --
   	 if CostofCarry ge RiskFreeRate then do;
	*/
   if RiskFreeRate ge RiskFreeRate then do;
   	if FwdFlag eq 'N' then
	  OptionPrice = rsk_europeancalloption_pf( Price, Strike, RiskFreeRate,
         YieldParam, TimeToExpiration, Volatility );
	else
      OptionPrice = rsk_eurcallopt_b76_pf( Price, Strike, RiskFreeRate, TimeToExpiration, Volatility );
   end;
   else do;
      
      /* Compute constants */
      volsq = Volatility * Volatility;
      beta0 = 0.5 - CostofCarry / volsq;
      beta= beta0 + sqrt( beta0 * beta0 + 2 * RiskFreeRate / volsq  );
      binf = beta / ( beta - 1 ) * Strike;
      b0 = max( Strike, RiskFreeRate / YieldParam * Strike );
      ht =  -( CostofCarry * TimeToExpiration + 2 * Volatility *
         sqrt( TimeToExpiration ) ) * ( b0 / ( binf - b0 ) );
      I = b0 + ( binf - b0 ) * ( 1 - exp( ht ) );
      alpha = ( I - Strike ) * ( I**(-beta) );

      /* If the price is greater than the trigger point, then exercise now */
      /* Otherwise, continue pricing */
      if Price ge I then do;
         OptionPrice=Price - Strike;
      end;
      else do;
         phi1 = rsk_utility_bjs93_pf( beta, I, Price, RiskFreeRate,
            CostofCarry, Volatility, TimeToExpiration, I );
         phi2 = rsk_utility_bjs93_pf( 1, I, Price, RiskFreeRate, CostofCarry,
            Volatility, TimeToExpiration, I );
         phi3 = rsk_utility_bjs93_pf( 1, Strike, Price, RiskFreeRate,
            CostofCarry, Volatility, TimeToExpiration, I );
         phi4 = rsk_utility_bjs93_pf( 0, I, Price, RiskFreeRate, CostofCarry,
            Volatility, TimeToExpiration, I );
         phi5 = rsk_utility_bjs93_pf( 0, Strike, Price, RiskFreeRate,
            CostofCarry, Volatility, TimeToExpiration, I );
         OptionPrice = alpha * ( Price**beta ) - alpha * phi1 + phi2 -
            phi3 + Strike * ( phi5 - phi4 );
      end;

   end;

   /* Return the option value */
   return(OptionPrice);

endsub;
