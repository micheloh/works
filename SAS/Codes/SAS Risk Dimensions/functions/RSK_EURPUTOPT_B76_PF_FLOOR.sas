function RSK_EURPUTOPT_B76_PF_FLOOR(ForwardPrice, Strike, RiskFreeRate, TimeToExpiration, Volatility, FloorVolatility, Floor_premium)
	label="European put option pricing by Black and Scholes (1973) with floor"
	kind="European option analytic pricing";

	/**************************************************************************/
	/* ERROR CHECKING
	/**************************************************************************/
	if TimeToExpiration lt 0 then
		return(0);

	/* Initialize the return missing flag to zero
	If we find an error in one of the inputs, we will return missing */
	/* Set the function name for error reporting */
	ReturnMissingFlg = 0;
	Fname = 'rsk_eurputopt_b76_pf_floor';

	/* Make sure some inputs are positive or nonnegative*/
	/* Negative and missing values for those inputs may cause problems
	if input into another function (e.g. the logarithm function) */
	ReturnMissingFlg = rsk_check_num_missing_pf( RiskFreeRate, Fname, '3', 'RiskFreeRate', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( TimeToExpiration, Fname, '4', 'TimeToExpiration', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( ForwardPrice, Fname, '1', 'ForwardPrice', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Strike, Fname, '2', 'Strike', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Volatility, Fname, '5', 'Volatility', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( FloorVolatility, Fname, '6', 'FloorVolatility', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Floor_premium, Fname, '7', 'Floor_premium', ReturnMissingFlg );

	/* Return missing, if errors are found */
	if ReturnMissingFlg eq 1 then
		return(.);

	/************************************************************/
	/* RESUME STANDARD PRICING
	/************************************************************/
	IF TimeToExpiration eq 0 THEN
		return (max(min(Strike-ForwardPrice,Floor_premium-ForwardPrice),0));

	g = Volatility*sqrt(TimeToExpiration);
	d1 = log(ForwardPrice / Strike) /g + 0.5 * g;
	d2 = d1 - g;
	OptionPrice = exp(- RiskFreeRate * TimeToExpiration) * (Strike * probnorm(-d2) - ForwardPrice * probnorm(-d1));

	g = FloorVolatility*sqrt(TimeToExpiration);
	d1 = log(ForwardPrice / Floor_premium) /g + 0.5 * g;
	d2 = d1 - g;
	OptionPrice_floor = exp(- RiskFreeRate * TimeToExpiration) * (Floor_premium * probnorm(-d2) - ForwardPrice * probnorm(-d1));

	return(OptionPrice-OptionPrice_floor);

endsub;