FUNCTION putPriceBlackScholes(S , x , sigma , maturity , RiskFree );
	          putPriceBlackScholes = putPriceGeneralizedBS(S, x, sigma, maturity, RiskFree, RiskFree);
	          return (putPriceBlackScholes);
ENDSUB;

FUNCTION callPriceBlackScholes(S , x , sigma , maturity , RiskFree );
	          callPriceBlackScholes = callPriceGeneralizedBS(S, x, sigma, maturity, RiskFree, RiskFree);
	          return (callPriceBlackScholes);
ENDSUB;

FUNCTION  callPriceGeneralizedBS(S , x , sigma , maturity , RiskFree, costOfCarry );
		d1 = (Log(S / x) + (costOfCarry + 0.5 * sigma ** 2) * maturity) / (sigma * Sqrt(maturity));
		d2 = d1 - sigma * Sqrt(maturity);
		callPriceGeneralizedBS = S * Exp((costOfCarry - RiskFree) * maturity) * CDF('NORMAL', d1) - x * Exp(-RiskFree * maturity) * CDF('NORMAL',d2);
		return(callPriceGeneralizedBS);
ENDSUB;

FUNCTION  putPriceGeneralizedBS(S , x , sigma , maturity , RiskFree, costOfCarry );
		d1 = (Log(S / x) + (costOfCarry + 0.5 * sigma ** 2) * maturity) / (sigma * Sqrt(maturity));
		d2 = d1 - sigma * Sqrt(maturity);
		putPriceGeneralizedBS = -S * Exp((costOfCarry - RiskFree) * maturity) * CDF('NORMAL',-d1) + x * Exp(-RiskFree * maturity) *CDF('NORMAL',-d2);			  							
		return(putPriceGeneralizedBS);
ENDSUB;


FUNCTION callPriceBlack(S , x , sigma , maturity , RiskFree );
		callPriceBlack = callPriceGeneralizedBS(S, x, sigma, maturity, RiskFree, 0);
		return (callPriceBlack);
ENDSUB;

FUNCTION putPriceBlack(S , x , sigma , maturity , RiskFree );
		putPriceBlack = putPriceGeneralizedBS(S, x, sigma, maturity, RiskFree, 0);
		return (putPriceBlack);
ENDSUB;

function Delta_Call_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Call_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		d2 = d1 - sigma*sqrt(T);
		Delta_Call_BS =  CDF('NORMAL', d1);
		return(Delta_Call_BS);
Endsub;

function Delta_Put_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Put_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		d2 = d1 - sigma*sqrt(T);
		Delta_Put_BS = CDF('NORMAL', d1)-1;
		return(Delta_Put_BS);
Endsub;

function Gamma_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Call_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		pi = 4*atan(1); /*pi*/
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);/*gaussiana*/
		d1_ds = 1 / (S*sigma*sqrt(T));
		Delta_Call_BS = CDF('NORMAL', d1);
		Gamma_BS = phi_d1 * d1_ds;
		return(Gamma_BS);
Endsub;

function Theta_Call_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Call_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		d2 = d1 - sigma*sqrt(T);
		pi = 4*atan(1);
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);
		Delta_Call_BS = CDF('NORMAL', d1);
		Theta_Call_BS = S*phi_d1*sigma / (2*sqrt(T)) - K*r*exp(-r*T)*CDF('NORMAL', d2);
		return(Theta_Call_BS);
Endsub;

function Theta_Put_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Put_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		d2 = d1 - sigma*sqrt(T);
		pi = 4*atan(1);
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);
		Delta_Put_BS = (-CDF('NORMAL', -d1));
		Theta_Put_BS = S*phi_d1*sigma / (2*sqrt(T)) + K*r*exp(-r*T)*CDF('NORMAL', -d2);
		return(Theta_Put_BS);
Endsub;

function Vega_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Call_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		pi = 4*atan(1);
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);
		Delta_Call_BS = CDF('NORMAL', d1);
		Vega_BS = S*phi_d1*sqrt(T);
		return(Vega_BS);
Endsub;

function Rho_Call_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Call_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		d2 = d1 - sigma*sqrt(T);
		Delta_Call_BS = CDF('NORMAL', d1);
		Rho_Call_BS = K*-T*exp(-r*T)*CDF('NORMAL', d2);
		return(Rho_Call_BS);
Endsub;

function Rho_Put_BS(S, K, r, T, sigma);
		if(sigma < 0.000001) then
			return(Delta_Put_BS =  CDF('NORMAL', 100000));
		d1 = (log(S/K) + (r + 0.5*(sigma**2))*T)/(sigma*sqrt(T));
		d2 = d1 - sigma*sqrt(T);
		Delta_Put_BS = (-CDF('NORMAL', -d1));
		Rho_Put_BS = -K*-T*exp(-r*T)*CDF('NORMAL', -d2);
		return(Rho_Put_BS);
Endsub;

function Delta_Call_Black(F, K, r, T, sigma);
		d1 = (log(F/K) + 0.5*(sigma**2)*T)/(sigma*sqrt(T));
		d2 = (log(F/K) - 0.5*(sigma**2)*T)/(sigma*sqrt(T));
		Delta_Call_Black = exp(-r*T)*CDF('NORMAL', d1);
		if(sigma < 0.000001) then
			Delta_Call_Black =  CDF('NORMAL', 100000);
		return(Delta_Call_Black);
Endsub;

function Delta_Put_Black(F, K, r, T, sigma);
		d1 = (log(F/K) + (0.5*sigma**2)*T)/(sigma*sqrt(T));
		Delta_Put_Black = exp(-r*T)*(CDF('NORMAL', d1) - 1);
		if(sigma < 0.000001) then
			Delta_Put_Black =  CDF('NORMAL', 100000);
		return(Delta_Put_Black);
Endsub;

function Gamma_Black(F, K, r, T, sigma);
		d1 = (log(F/K) + 0.5*(sigma**2)*T)/(sigma*sqrt(T));
		d2 = d1-(sigma*sqrt(T));
		Delta_Call_Black = exp(-r*T)*CDF('NORMAL', d1);
		pi     = 4*atan(1);
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);
		d1_ds  = 1 / (F*sigma*sqrt(T));
		Gamma_Black = exp(-r*T)*phi_d1 * d1_ds;
		if(sigma < 0.000001) then
			Delta_Call_Black =  CDF('NORMAL', 100000);
		return(Gamma_Black);
Endsub;

function Theta_Call_Black(F, K, r, T, sigma);
		d1 = (log(F/K) + 0.5*(sigma**2)*T)/(sigma*sqrt(T));
		d2 = d1-(sigma*sqrt(T));
		Delta_Call_Black = exp(-r*T)*CDF('NORMAL', d1);
		pi     = 4*atan(1);
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);
		d1_ds  = 1 / (F*sigma*sqrt(T));
		Theta_Call_Black = (-F*exp(-r*T)*phi_d1*sigma / (2*sqrt(T)))- (-r*F*Delta_Call_Black) - K*r*exp(-r*T)*CDF('NORMAL', d2);
		if(sigma < 0.000001) then
			Delta_Call_Black =  CDF('NORMAL', 100000);
		return(Theta_Call_Black);
Endsub;

function Theta_Put_Black(F, K, r, T, sigma);
		d1 = (log(F/K) + 0.5*(sigma**2)*T)/(sigma*sqrt(T));
		d2 = d1-(sigma*sqrt(T));
		Delta_Put_Black = abs(exp(-r*T)*(-CDF('NORMAL', -d1)));
		pi = 4*atan(1);
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);
		d1_ds = 1 / (F*sigma*sqrt(T));
		Theta_Put_Black = -F*exp(-r*T)*phi_d1*sigma / (2*sqrt(T)) + (-r*F*exp(-r*T)*(CDF('NORMAL', -d1))) + K*r*exp(-r*T)*(CDF('NORMAL', -d2));
		if(sigma < 0.000001) then
			Delta_Put_Black =  CDF('NORMAL', 100000);
		return(Theta_Put_Black);
Endsub;

function Vega_Black(F, K, r, T, sigma);
		d1 = (log(F/K) + 0.5*(sigma**2)*T)/(sigma*sqrt(T));
		d2 = d1-(sigma*sqrt(T));
		Delta_Call_Black = exp(-r*T)*CDF('NORMAL', d1);
		pi     = 4*atan(1);
		phi_d1 = exp(-0.5*d1**2) / sqrt(2*pi);
		d1_ds  = 1 / (F*sigma*sqrt(T));
		Vega_Black = F*exp(-r*T)*phi_d1*sqrt(T);
		if(sigma < 0.000001) then
			Delta_Call_Black =  CDF('NORMAL', 100000);
		return(Vega_Black);
Endsub;

function Rho_Call_Black(F, K, r, T, sigma);
/*		preco, STRIKE_VALUE_AMT, RiskFreeRate, TimeToExpRisk, impvol*/
		premio=callPriceBlack(F, K, sigma, T, r);
		Rho_Call_Black = premio*-T;
		return(Rho_Call_Black);
Endsub;

function Rho_Put_Black(F, K, r, T, sigma);
		premio=putPriceBlack(F, K, sigma, T, r);
		Rho_Put_Black=premio*-T;
		return(Rho_Put_Black);
Endsub;

Function Epsilon(Strike);
	j=1;
	do k=1 to 20;
		Strikej = Strike/j;
		Strikej1 = 10*Strike/j;
		Ordem= Round(Strikej,1);
		Ordem_Ant = Round(Strikej1,1);
		if (Ordem=0 and Ordem_Ant ne 0) then Epsilon=10**(Log10(j/10)-5);
		j=j*10;
	end;
	Return(Epsilon);
EndSub;

/*Function Epsilon(Strike);*/
/*	j=1;*/
/*	do k=1 to 20;*/
/*		Strikej = Strike/j;*/
/*		Strikej1 = 10*Strike/j;*/
/*		Ordem= Round(Strikej,0.01);*/
/*		Ordem_Ant = Round(Strikej1,0.01);*/
/*		if (Ordem=0 and Ordem_Ant ne 0) then Epsilon=10**(Log10(j/10)-5);*/
/*		j=j*10;*/
/*	end;*/
/**/
/*	Return(Epsilon);*/
/**/
/*Endsub;*/