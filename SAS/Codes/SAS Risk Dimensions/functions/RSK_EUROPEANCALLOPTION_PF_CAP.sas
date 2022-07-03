function RSK_EUROPEANCALLOPTION_PF_CAP(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility,CapVolatility,Cap_premium)
	label="European call option pricing by Black and Scholes (1973) with cap primium"
	kind="European option analytic pricing";

	/**************************************************************************/
	/* ERROR CHECKING
	/**************************************************************************/
	IF TimeToExpiration lt 0 THEN
		return(0);

	IF TimeToExpiration eq 0 THEN
		return (max(min(Price-Strike,Cap_premium-Strike),0));

	/* Initialize the return missing flag to zero
	If we find an error in one of the inputs, we will return missing */
	/* Set the function name for error reporting */
	ReturnMissingFlg = 0;
	Fname = 'rsk_europeancalloption_pf_cap';

	/* Make sure some inputs are positive or nonnegative*/
	/* Negative and missing values for those inputs may cause problems
	if input into another function (e.g. the logarithm function) */
	ReturnMissingFlg = rsk_check_num_missing_pf( RiskFreeRate, Fname, '3', 'RiskFreeRate', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( YieldParam, Fname, '4', 'YieldParam', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( TimeToExpiration, Fname, '5', 'TimeToExpiration', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( Price, Fname, '1', 'Price', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Strike, Fname, '2', 'Strike', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Cap_premium, Fname, '8', 'Cap_premium', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Volatility, Fname, '6', 'Volatility', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( CapVolatility, Fname, '7', 'CapVolatility', ReturnMissingFlg );

	/* Return missing, if errors are found */
	if ReturnMissingFlg eq 1 then
		return(.);

	/************************************************************/
	/* RESUME STANDARD PRICING
	/************************************************************/
	CostofCarry=RiskFreeRate - YieldParam;
	g = Volatility*sqrt(TimeToExpiration);
	d1 = (log(Price / Strike) + CostofCarry * TimeToExpiration )/g + 0.5 * g;
	d2 = d1 - g;
	OptionPrice = Price * exp( -YieldParam * TimeToExpiration) * probnorm(d1) - Strike * exp(-RiskFreeRate * TimeToExpiration) * probnorm(d2);
	CostofCarry=RiskFreeRate - YieldParam;

	g = CapVolatility*sqrt(TimeToExpiration);
	d1 = (log(Price / Cap_premium) + CostofCarry * TimeToExpiration )/g + 0.5 * g;
	d2 = d1 - g;
	OptionPrice_cap = Price * exp( -YieldParam * TimeToExpiration) * probnorm(d1) - Cap_premium * exp(-RiskFreeRate * TimeToExpiration) * probnorm(d2);

	return(OptionPrice-OptionPrice_cap);

endsub;