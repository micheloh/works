

/*****************************************************************************
 * Copyright (c) 2008 by SAS Institute Inc., Cary, NC, USA.
 *
 *    NAME: rsk_amerputoption_bjs93_pf.sas
 *
 * PURPOSE: American Put Option pricing by Black and Scholes (1973) and Merton (1973) 
 *          - Bjoerksund and Stensland (1993) method
 *
 *   USAGE: 
 *	
 *   NOTES: 
 *    -- Customization for Brazil --
 *	  FwdFlag - Flag for future option
 *
 *****************************************************************************/
 


function rsk_amerputoption_bjs93_pf(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility, FwdFlag$)
         kind  = "American option analytic pricing"
         label = "Analytic American put option price approximation by Bjerksund and Stensland (1993)"; 
/**************************************************************************/
/* ERROR CHECKING
/**************************************************************************/

if TimeToExpiration lt 0 then return(0);

/* Initialize the return missing flag to zero
If we find an error in one of the inputs, we will return missing */
/* Set the function name for error reporting */
ReturnMissingFlg = 0;
Fname = 'rsk_amerputoption_bjs93_pf';

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

   if TimeToExpiration eq 0 then return (max(Strike-Price,0));

   	/* Compute the cost of carry */
   	CostofCarry=RiskFreeRate - YieldParam;

   /* if the cost of carry is greater than or equal to the risk-free rate, then it is never
      optimal to exercise early, thus this has vhe price of a European put option */
   /* Otherwise, continue pricing */

   /* Turnaround: RiskFree ge RiskFree usado para contornar problema de precificação na BJS93.
   	 -- AJUSTAR O BJS93 E ALTERAR PARA A CONDICAO COMENTADA ABAIXO --
   	 if CostofCarry ge RiskFreeRate then do;
	*/
   if RiskFreeRate ge RiskFreeRate then do;
   	if FwdFlag eq 'N' then
	  OptionPrice = rsk_europeanputoption_pf( Price, Strike, RiskFreeRate,
         YieldParam, TimeToExpiration, Volatility );
	else
      OptionPrice = rsk_eurputopt_b76_pf( Price, Strike, RiskFreeRate, TimeToExpiration, Volatility );
   end;

   else do;
   /* Use Bjerklund and Stensland put-call transformation */
   OptionPrice=rsk_amercalloption_bjs93_pf (Strike, Price, YieldParam,
      RiskFreeRate, TimeToExpiration, Volatility, FwdFlag ); 
   end;

   return(OptionPrice);
endsub;
