/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_eurputquanto_pf.sas

   PURPOSE: Quanto pricing put option pricing by Reiner (1992).

   INPUTS:
      CurrencyValue - Predetermined exchange rate specified in units of
					  domestic currency per unit of foreign currency
      Price - Underlying asset price in foreign currency
	  Strike - Delivery price in foreign currency
	  TimeToExpiration - Time to maturity in years
	  RiskFreeRate - Domestic interest rate
	  ForeignRiskFree - Foreign interest rate
	  DivYield - Instantaneous proportional dividend payout rate of the
				 underlying asset
	  PriceVol - Volatility of the underlying asset
	  CurrencyVol - Volatility of the domestic exchange rate
	  Correlation - Correlation between asset and domestic exchange rate

   USAGE: 
	  Value = rsk_eurputquanto_pf( CurrencyValue, Price, Strike, TimeToExpiration, RiskFreeRate,
                ForeignRiskFree, DivYield, PriceVol, CurrencyVol, Correlation);

   NOTES:
      - Only implemented the Option Pricing in Domestic Currency.
	  
   REFERENCES:
   	Reiner, E. (1992). Quanto mechanics. Risk, 5(3), 59-63.

 *****************************************************************************/

function rsk_eurputquanto_pf(CurrencyValue, Price, Strike, TimeToExpiration, RiskFreeRate,
                ForeignRiskFree, DivYield, PriceVol, CurrencyVol, Correlation)
		 kind  = "Quanto option pricing"
         label = "European quanto call option pricing by Reiner (1992)";

	/**************************************************************************/
	/* ERROR CHECKING
	/**************************************************************************/

	IF TimeToExpiration lt 0 THEN return(0);
	IF TimeToExpiration eq 0 THEN return (CurrencyValue*max(Price-Strike,0));

	/* Initialize the return missing flag to zero
	If we find an error in one of the inputs, we will return missing */
	/* Set the function name for error reporting */
	ReturnMissingFlg = 0;
	Fname = 'rsk_eurputquanto_pf';

	/* Make sure some inputs are positive or nonnegative*/
	/* Negative and missing values for those inputs may cause problems
	if input into another function (e.g. the logarithm function) */  
	ReturnMissingFlg = rsk_check_num_missing_pf( RiskFreeRate, Fname, '5', 'RiskFreeRate', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( ForeignRiskFree, Fname, '6', 'ForeignRiskFree', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( DivYield, Fname, '7', 'DivYield', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( TimeToExpiration, Fname, '4', 'TimeToExpiration', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( Price, Fname, '2', 'Price', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( Correlation, Fname, '10', 'Correlation', ReturnMissingFlg );

	ReturnMissingFlg = rsk_check_nonpositive_pf( CurrencyValue, Fname, '1', 'CurrencyValue', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Strike, Fname, '3', 'Strike', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( PriceVol, Fname, '8', 'PriceVol', ReturnMissingFlg );   
	ReturnMissingFlg = rsk_check_nonpositive_pf( CurrencyVol, Fname, '9', 'CurrencyVol', ReturnMissingFlg );   
	      
	/* Return missing, if errors are found */
	if ReturnMissingFlg eq 1 then return(.);

	/************************************************************/
	/* RESUME STANDARD PRICING
	/************************************************************/ 

	cost = ForeignRiskFree - DivYield - Correlation * PriceVol * CurrencyVol;
	g = PriceVol * sqrt(TimeToExpiration);
    d1 = (Log(Price/Strike) + cost * TimeToExpiration) / g + 0.5 * g;
    d2 = d1 - g;
    
    OptionPrice = CurrencyValue * (Strike * exp(-RiskFreeRate * TimeToExpiration) * probnorm(d2)
					- Price * exp((cost - RiskFreeRate) * TimeToExpiration) * probnorm(d1));

	return(OptionPrice);

endsub;