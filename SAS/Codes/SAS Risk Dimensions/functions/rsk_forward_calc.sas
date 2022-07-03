/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_forward_calc.sas

   PURPOSE: Forward calculation.
			Customized for the Brazil local rules.
			

   INPUTS:
      RiskFree - Risk Free Rate Value
      TimeToExpRisk - Risk Free Time To Expiration (in years)
	  RiskBaseCal - Risk Free Base calendar for the daycount
	  Yield - Yield Rate Value
      TimeToExpYield - Yield Time To Expiration (in years)
	  YieldBaseCal - Yield Base calendar for the daycount
	  rfValue - Risk Factor Value
	  UseYieldCrvNFlag - Flag to check if the Yield is to be considered in
						 forward calculation

   USAGE: 
	  Value = rsk_forward_calc(RiskFree, TimeToExpRisk, RiskBaseCal, Yield,  
							TimeToExpYield, YieldBaseCal, rfValue, UseYieldCrvNFlag);

   NOTES:
      
	  
   REFERENCES:
	

 *****************************************************************************/

Function rsk_forward_calc(RiskFree, TimeToExpRisk, RiskBaseCal$, Yield, TimeToExpYield, YieldBaseCal$, rfValue, UseYieldCrvNFlag)
		label="Forward calculation";
	
	/* Customização - Caso Yield = 252, eleva pelo tempo. Se for 360, multiplica pelo tempo. */
	/* Caso ON-SHORE e OFF-SHORE para RiskFree */
	if RiskBaseCal eq 'DU/252' then
		numerador = ((1+RiskFree)**(TimeToExpRisk));
	else if RiskBaseCal eq 'DC/180' then
		numerador = ((1 + (RiskFree / 2))**(TimeToExpRisk*2)); 
	else
		numerador = ((1+RiskFree)*(TimeToExpRisk));

	if UseYieldCrvNFlag eq 1 then do;
		/* Caso ON-SHORE e OFF-SHORE para Cupom */
		if YieldBaseCal eq 'DU/252' then
			denominador = ((1+Yield)**(TimeToExpYield));
		else if YieldBaseCal eq 'DC/180' then
			denominador = ((1 + (Yield / 2))**(TimeToExpYield*2));
		else
			denominador = ((1+Yield)*(TimeToExpYield));
			
		Forward = (numerador/denominador)*rfValue;
	end;
	else
		Forward = numerador * rfValue;
	
	return (Forward);
	
Endsub;