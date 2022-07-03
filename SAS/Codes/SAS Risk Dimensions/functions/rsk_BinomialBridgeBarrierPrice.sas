/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_BinomialBridgeBarrierPrice.sas

   PURPOSE: Binomial Bridge Barrier Price function created by Bradesco.

   INPUTS:
      PutCallType - Put/Call Type
	  OptionType - Option Type ('American', 'European', etc)
	  BarrierType - two letter code indicating the barrier type.  The first   
            letter may be 'u' or 'd', for up or down, and the second may be   
            'i' or 'o', for in or out.
	  MonFreqTime - Monitoring frequency of the barrier ('yearly', 'daily', etc)
	  Price - Price
	  Strike - Strike
	  BarrierValue - Barrier Amount
	  LimitValue - Cap/Floor Value
	  Rebate - Rebate Amount
	  TimeToExpNoFix - Time to maturity without fixing days, in years.
	  TimeToExpFix - Time to maturity with fixing days, in years.
	  RiskFreeRate - Risk Free Rate
	  Yield - Yield Value
	  impvol - Implied Volatility Value
	  n - Number of interactions for the path probability in the tree

   USAGE: 
	  value = BinomialBridgeBarrierPrice(PutCallType, OptionType, BarrierType, 
				MonFreqTime, Price, Strike, BarrierValue, LimitValue, Rebate, 
				TimeToExpNoFix, TimeToExpFix,	RiskFreeRate ,Yield, impvol, 1000);
	
   NOTES:
	  - For pricing without Cap/Floor, put value 0 in LimitValue parameter.
	  - For pricing without Rebate, put value . in the Rebate parameter.
	
   REFERENCES:
	

 *****************************************************************************/

Function BinomialBridgeBarrierPrice(PutCallType$, OptionType$, BarrierType$, 
				MonFreqTime$, Price, Strike, BarrierValue, LimitValue, Rebate, 
				TimeToExpNoFix, TimeToExpFix, RiskFreeRate ,Yield, impvol, n);



	/**/
	/*   ## -- Iniciliza as variáveis*/
	if LimitValue = 0.0 then
		LimitValue = .;

	if Rebate = . then
		Rebate = 0.0;

	/*   ## Probabilidade de um determinado caminho*/
	pathProb = 0;

	/*   ## Probabilidade de bater na barreira*/
	barrierHitProb = 0;

	/*   ## Preço da opção*/
	preco = 0;

	/*   ## Rebate*/
	rebateValue = 0;

	/*   ## Ajuste Barreira Monitoramento*/
	if MonFreqTime = 'continuously' then
		BarrierValue = DiscreteAdjustedBarrier( Price, BarrierValue, impvol, 0);

	if MonFreqTime = 'hourly' then
		BarrierValue = DiscreteAdjustedBarrier( Price, BarrierValue, impvol, 1/(24*252));

	if MonFreqTime = 'daily' then
		BarrierValue = DiscreteAdjustedBarrier( Price, BarrierValue, impvol, 1/252);

	if MonFreqTime = 'weekly' then
		BarrierValue = DiscreteAdjustedBarrier( Price, BarrierValue, impvol, 1/5);

	if MonFreqTime = 'monthly' then
		BarrierValue = DiscreteAdjustedBarrier( Price, BarrierValue, impvol, 1/12);

	/*   ## Calcula dt*/
	dt = TimeToExpFix / n;
	rvol = (TimeToExpNoFix/TimeToExpFix)*RiskFreeRate;
	qvol = (TimeToExpNoFix/TimeToExpFix)*Yield;

	/*   ## Up/Down move*/
	u = exp(impvol*sqrt(dt));
	d = exp(-impvol*sqrt(dt));

	/*   ## Growth factor*/
	a = exp((rvol-qvol)*dt);

	/*   ## Probabilidade de Up*/
	p = (a - d)/(u - d);

	/*   ## Acerta o payoff*/
	if PutCallType = 'CALL' then
		z = 1;
	else if PutCallType = 'PUT' then
		z = -1;

	/*   ## Calcula as probabilidade dos caminhos*/
	do i = 0 to n;
		/*   ## Calcula o valor do ativo*/
		St = Price * u ** i * d ** (n - i);

		if BarrierType = "di" OR BarrierType = "do" then do;
			/*              ## Probabilidade de bater a barreira para baixo - down*/
			if St <= BarrierValue then
				barrierHitProb = 1;
			else                      
				if OptionType = 'AMERICAN' then
				barrierHitProb = exp(-2 / (impvol ** 2 * TimeToExpFix) * abs(log(BarrierValue / Price) * log(BarrierValue / St)));
			else if OptionType = "EUROPEAN" then
				barrierHitProb = 0;
		end;
		else if BarrierType = "ui" OR BarrierType = "uo" then do;
			/*              ## Probabilidade de bater a barreira para cima - up*/
			if St >= BarrierValue then
				barrierHitProb = 1;
			else 
				if OptionType = 'AMERICAN' then
				barrierHitProb = exp(-2 / (impvol ** 2 * TimeToExpFix) * abs(log(Price / BarrierValue) * log(St / BarrierValue)));
			else if OptionType = "EUROPEAN" then
				barrierHitProb = 0;
		end;

		/**/
		/*        ## Probabilidade do caminho*/
		if i = 0 then
			pathProb = (PROBBNML( p, n, 0));
		else pathProb = (PROBBNML( p, n, i) - PROBBNML( p, n, i-1));

		/*        ### KnockOut*/
		if BarrierType="uo" OR BarrierType="do" then do;
			preco = preco + (1 - barrierHitProb) * pathProb * Payoff( St, Strike, LimitValue, z);
			rebateValue = rebateValue + barrierHitProb * Rebate * pathProb;
		end;

		/*        ### KnockIn*/
		else if BarrierType="ui" OR BarrierType="di" then do;
			preco = preco + barrierHitProb * pathProb * Payoff( St,Strike, LimitValue, z);
			rebateValue = rebateValue + (1-barrierHitProb) * Rebate * pathProb;
		end;

		if rebateValue = . then
			rebateValue = 0.0;
	end;
teste = (preco + rebateValue) * exp(- RiskFreeRate * TimeToExpNoFix);

put preco=18.16 rebateValue=18.16 RiskFreeRate=18.16 TimeToExpNoFix=18.16 teste=18.16;
	/*   ## Preço a valor presente*/
	return((preco + rebateValue) * exp(- RiskFreeRate * TimeToExpNoFix));

endsub;
