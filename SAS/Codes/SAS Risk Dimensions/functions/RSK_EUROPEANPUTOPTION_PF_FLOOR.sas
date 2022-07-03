function RSK_EUROPEANPUTOPTION_PF_FLOOR(Price,Strike,RiskFreeRate,YieldParam,TimeToExpiration,Volatility,FloorVolatility,Floor_primium)
	label="European put option pricing by Black (1976) with floor"
	kind="European option analytic pricing";

	/**************************************************************************/
	/* ERROR CHECKING
	/**************************************************************************/
	IF TimeToExpiration lt 0 THEN
		return(0);

	IF TimeToExpiration eq 0 THEN
		return (max(min(Strike-Price,Strike-Floor_primium),0));

	/* Initialize the return missing flag to zero
	If we find an error in one of the inputs, we will return missing */
	/* Set the function name for error reporting */
	ReturnMissingFlg = 0;
	Fname = 'rsk_europeanputoption_pf_floor';

	/* Make sure some inputs are positive or nonnegative*/
	/* Negative and missing values for those inputs may cause problems
	if input into another function (e.g. the logarithm function) */
	ReturnMissingFlg = rsk_check_num_missing_pf( RiskFreeRate, Fname, '3', 'RiskFreeRate', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( YieldParam, Fname, '4', 'YieldParam', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( TimeToExpiration, Fname, '5', 'TimeToExpiration', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_num_missing_pf( Price, Fname, '1', 'Price', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Strike, Fname, '2', 'Strike', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Floor_primium, Fname, '8', 'Floor_primium', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( Volatility, Fname, '6', 'Volatility', ReturnMissingFlg );
	ReturnMissingFlg = rsk_check_nonpositive_pf( FloorVolatility, Fname, '7', 'FloorVolatility', ReturnMissingFlg );

	/* Return missing, if errors are found */
	if ReturnMissingFlg eq 1 then
		return(.);

	/************************************************************/
	/* RESUME STANDARD PRICING
	/************************************************************/
	CostofCarry=RiskFreeRate - YieldParam;
	g = Volatility * sqrt(TimeToExpiration);
	d1 = (log(Price / Strike) + CostofCarry * TimeToExpiration )/g + 0.5 * g;
	d2 = d1 - g;
	OptionPrice = -Price * exp(-YieldParam* TimeToExpiration) * probnorm(-d1) + Strike * exp(-RiskFreeRate * TimeToExpiration) * probnorm(-d2);
	CostofCarry=RiskFreeRate - YieldParam;

	g = FloorVolatility * sqrt(TimeToExpiration);
	d1 = (log(Price / Floor_primium) + CostofCarry * TimeToExpiration )/g + 0.5 * g;
	d2 = d1 - g;
	OptionPrice_floor = -Price * exp(-YieldParam* TimeToExpiration) * probnorm(-d1) + Floor_primium * exp(-RiskFreeRate * TimeToExpiration) * probnorm(-d2);

	return(OptionPrice-OptionPrice_floor);

endsub;