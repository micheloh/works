/*Inclusão por Jessica*/

	function DiscreteAdjustedBarrier(UnderlyingValueAdj, BARRIER_VALUE_AMT, impvol, dt);

	/*   Ajuste Discreto da Barreira*/
	     
	          If BARRIER_VALUE_AMT > UnderlyingValueAdj Then
	            H_d = BARRIER_VALUE_AMT * Exp(0.5826 * impvol * sqrt(dt));
	         Else If BARRIER_VALUE_AMT < UnderlyingValueAdj Then
	             H_d = BARRIER_VALUE_AMT * Exp(-0.5826 * impvol * sqrt(dt));   

	          return(H_d);    

	endsub;

