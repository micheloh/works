Function Interpola_GRID(S, K, r, T, T_Delta, Grid[*], delta[*], maturity[*], Tipo$, Model$, Tecnica$);
		 
	error = 1.0;
	n = 0;
	dim_delta = dim(delta);
	dim_maturity = dim(maturity);

	array grid_copia [1, 1] /nosymbols;	* Array para receber o grid;
	array vol_interp [1] /nosymbols;	* Array para armazenar a vol interpolada no tempo;
	array aux [1] /nosymbols; * Array para armazenar a vol para certo delta;

	call dynamic_array (grid_copia, dim_delta, dim_maturity);

*	T = T * 252; /*Transforma o prazo em dias úteis */

	/*Copia o grid*/
	z = 1;
	do j=1 to dim_maturity;
		do i=1 to dim_delta;
			if z le dim_maturity * dim_delta then do;
				grid_copia[i,j] = Grid[z];
				z = z + 1;
			end;
		/*grid_copia[i,j] =  SURFACE_VALUE(Grid, delta[i], maturity[j]);*/ /*surface_value dá problema com grid do RMB */
		end;
	end;
	/* Verifica T para extrapolação*/
	call dynamic_array (vol_interp, dim_delta);
	
	/* Tecnica para Grid CONE deve ser feito uma interpolação em uma dimensão, considerando o "DELTA" como 0.5 */
	if tecnica = "CONE" then do;
		iDelta = rsk_find(0.5, delta);

		if T LE maturity[1] then
			vol_implied2 = grid_copia[iDelta,1];
		else if T GE maturity[dim_maturity] then
			vol_implied2 = grid_copia[iDelta,dim_maturity];
		else do;
			call dynamic_array (aux, dim_maturity);
			do m =1 to dim_maturity;
				aux[m] = grid_copia[iDelta,m];
			end;
			
			/* acordado que tecnica padrão para interp de CONE é Constrained Cubic */
			vol_implied2 = interpSpline(T, maturity, aux);
		end;
	end;

	else do;
		if T LE maturity[1] then do;
			do v = 1 to dim_delta;
				vol_interp[v] = grid_copia[v,1];
			end;
		end;

		else if T GE maturity[dim_maturity] then do;
			do v = 1 to dim_delta;
				vol_interp[v] = grid_copia[v, dim_maturity];
			end;
		end;

		else do;
			/* Interpola a vol no tempo e armazena */
			do l=1 to dim_delta;
				call dynamic_array (aux, dim_maturity);
				do m =1 to dim_maturity;
					aux[m] = grid_copia[l,m];
				end;

				/* interpola pela tecnica escolhida */
				if tecnica = "BI_CONSTRAINED_CUBIC" then
					vol_interp[l] = interpSpline(T, maturity, aux);
				else if tecnica = "BI_LINEAR" then
					vol_interp[l] = rsk_intpolate2( T, aux, maturity, "LINEAR" );
				else if tecnica = "BI_CUBIC" then
					vol_interp[l] = rsk_intpolate2( T, aux, maturity, "CUBIC" );

			end;
		end;

		if Model = "BLACK_SCHOLES" then /* MAPPING CUSTOMIZADO PARA OPÇÕES DE AÇÃO */
	    	do;

	*	    T = verify_Time_Acoes(T);

			if( Tipo in ("CALL","CAPLET")) then
				do;
				delta_cb = 0.5; /*Chute Inicial com a volatilidade at-the-money*/
				do while( (error > 1.0e-12)  AND (n < 1000) );
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied1 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					delta_cb = Delta_Call_BS(S, K, r, T_Delta, vol_implied1);
					delta_cb = verify_delta_Acoes(delta_cb, Tipo);
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied2 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					error = abs(vol_implied2 - vol_implied1);
					n = n + 1;
				end;
			end;

			if( Tipo IN("PUT","FLOORLET")) then
				do;	 
				delta_cb = 0.5; /*Chute Inicial com a volatilidade at-the-money*/
				do while( (error > 1.0e-12)  AND (n < 1000) );
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied1 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					delta_cb = abs(Delta_Put_BS(S, K, r, T_Delta, vol_implied1));
					delta_cb = verify_delta_Acoes(delta_cb, Tipo);
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied2 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					error = abs(vol_implied2 - vol_implied1);
					n = n + 1;
				end;
			end;
		 end;

		 else if Model = "BLACK" then
		 	do;

	*       T = verify_Time(T);

	        if( Tipo in("CALL","CAPLET")) then
				do;
				delta_cb = 0.5; /*Chute Inicial com a volatilidade at-the-money*/
				do while( (error > 1.0e-12)  AND (n < 1000) );
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied1 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					delta_cb = Delta_Call_Black(S, K, r, T_Delta, vol_implied1);
					delta_cb = verify_delta(delta_cb);
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied2 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					error = abs(vol_implied2 - vol_implied1);
					n = n + 1;

				end;
			end;

	        if( Tipo IN("PUT","FLOORLET")) then
	        	do;
				delta_cb = 0.5; /*Chute Inicial com a volatilidade at-the-money*/
				do while( (error > 1.0e-12)  AND (n < 1000) );									
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied1 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied1 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					delta_cb = abs(Delta_Put_Black(S, K, r, T_Delta, vol_implied1));
					delta_cb = verify_delta(delta_cb);								
					/*Ajustando a volatilidade para ser percentual no resultado*/
					/* interpola pela tecnica escolhida */
					if tecnica = "BI_CONSTRAINED_CUBIC" then
						vol_implied2 = interpSpline(delta_cb, delta, vol_interp) / 100;
					else if tecnica = "BI_LINEAR" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "LINEAR" );
					else if tecnica = "BI_CUBIC" then
						vol_implied2 = rsk_intpolate2( delta_cb, vol_interp, delta, "CUBIC" );
					error = abs(vol_implied2 - vol_implied1);
					n = n + 1;

				end;
			end;
		end;
	end;

	return(vol_implied2);

Endsub;

Function interpSpline(x, vetorX[*], vetorY[*]);

	if x LE vetorX[1] then
		xx = vetorY[1];
	else if x GE vetorX[hbound(vetorX)] then
		xx = vetorY[hbound(vetorY)];
	else 
		xx = RF_BI_CONSTRAINED_CUBIC (x, vetorY, vetorX);

	return(xx);

Endsub;

Function RF_BI_CONSTRAINED_CUBIC(Time, Spotval[*], Mat[*]);
	Npoint = dim(spotval);

	If( Time <= mat{1} ) then
		spotrate = Spotval[1];

	If( Time >= mat{npoint} ) then
		spotrate = Spotval[npoint];

	If ( Time > mat{1} ) and (Time < mat{Npoint} ) then Do;
		do j = 1 to Npoint-1;
			If( Time >= mat{j}) and (Time <= mat{j+1} ) then do;
				/* verificar com sergio este trecho */
				if j = 1 then do;
					if ( (spotval{j+2} - spotval{j+1}) = 0) OR ((spotval{j+1} - spotval{j}) = 0) then
						dfxi2=0;
					else do;
						if ( ((mat{j+2} - mat{j+1})/(spotval{j+2} - spotval{j+1})) * ((mat{j+1} - mat{j})/(spotval{j+1} - spotval{j})) ) < 0 then
							dfxi2=0;
						else
							dfxi2 = 2/ (((mat{j+2} - mat{j+1})/(spotval{j+2} - spotval{j+1})) + ((mat{j+1} - mat{j})/(spotval{j+1} - spotval{j})) );
					end;

					dfxi1 = ( (3*(spotval{j+1} - spotval{j})) / (2*(mat{j+1} - mat{j})) )  -dfxi2/2;
				end;
				/* fim do trecho */
				else if j = (Npoint -1) then do;
					if ( (spotval{j} - spotval{j-1}) = 0) OR ( (spotval{j+1} - spotval{j}) = 0) then
						dfxi1 = 0;
					else do;
						if ( ((mat{j+1} - mat{j})/(spotval{j+1} - spotval{j})) * ((mat{j} - mat{j-1})/(spotval{j} - spotval{j-1})) ) < 0 then
							dfxi1 = 0;
						else
							dfxi1 = 2/ (((mat{j+1} - mat{j})/(spotval{j+1} - spotval{j})) + ((mat{j} - mat{j-1})/(spotval{j} - spotval{j-1})) );
					end;

					dfxi2 = ( (3*(spotval{j+1} - spotval{j})) / (2*(mat{j+1} - mat{j})) ) -dfxi1/2;
				end;
				else do;
					if ( (spotval{j} - spotval{j-1}) = 0) OR ( (spotval{j+1} - spotval{j}) = 0) then
						dfxi1=0;
					else do;
						if ( ((mat{j+1} - mat{j})/(spotval{j+1} - spotval{j})) * ((mat{j} - mat{j-1})/(spotval{j} - spotval{j-1})) ) < 0 then
							dfxi1=0;
						else
							dfxi1 = 2/ (((mat{j+1} - mat{j})/ (spotval{j+1} - spotval{j})) + ((mat{j} - mat{j-1})/(spotval{j} - spotval{j-1})) );
					end;

					if ( (spotval{j+2} - spotval{j+1}) = 0) OR ((spotval{j+1} - spotval{j}) = 0) then
						dfxi2 =0;
					else do;
						if ( ((mat{j+2} - mat{j+1})/(spotval{j+2} - spotval{j+1})) * ((mat{j+1} - mat{j})/(spotval{j+1} - spotval{j})) ) < 0 then
							dfxi2 =0;
						else
							dfxi2 = 2/ (((mat{j+2} - mat{j+1})/(spotval{j+2} - spotval{j+1})) + ((mat{j+1} - mat{j})/(spotval{j+1} - spotval{j})) );
					end;
				end;

				/* verificar com sergio este trecho */
				ddfxi1 = -(2*(dfxi2 + 2*dfxi1))/(mat{j+1} - mat{j}) + (6*(spotval{j+1} - spotval{j}))/((mat{j+1} - mat{j})**2);
				ddfxi2 = (2*(2*dfxi2 + dfxi1))/(mat{j+1} - mat{j}) - (6*(spotval{j+1} - spotval{j}))/((mat{j+1} - mat{j})**2);
				d = (ddfxi2 - ddfxi1)/(6*(mat{j+1} - mat{j}));
				c = (mat{j+1}*ddfxi1 - mat{j}*ddfxi2)/(2*(mat{j+1} - mat{j}));
				b = ( (spotval{j+1} - spotval{j}) - c*(mat{j+1}**2 - mat{j}**2) -d*(mat{j+1}**3 - mat{j}**3) ) / (mat{j+1} - mat{j});
				a = spotval{j} -b*mat{j} -c*mat{j}**2 -d*mat{j}**3;
				spotrate = a +time*b + (time**2)*c + (time**3)*d;
				/* fim do trecho */

				
			End;
		End;
	End;

	Return (spotrate);  
               
Endsub;

Function Delta_Option(Price, Strike, T, RiskFreeRate, YieldParam, Volatility, Tipo$, Model$);

	CostofCarry=RiskFreeRate - YieldParam;
	g = Volatility*sqrt(T);
  	d1 = (log(Price / Strike) + CostofCarry * T )/g + 0.5 * g;
  	d2 = d1 - g;

	if(Volatility < 0.000001) then
		Delta_Option =  CDF('NORMAL', 100000);
	else do;
		if (Model = "BLACK") then
		do;
			if (Tipo = "CALL") then
				Delta_Option = exp(-RiskFreeRate*T)*CDF('NORMAL',d1);
			else /*PUT*/
				Delta_Option = Abs(exp(-RiskFreeRate*T)*(CDF('NORMAL', d1) - 1));
		end;
		else if (Model = "BLACK_SCHOLES") then
		do;
			if (Tipo = "CALL") then
				Delta_Option = exp(-RiskFreeRate*T)*CDF('NORMAL',d1);
			else /*PUT*/
				Delta_Option = Abs(exp(-RiskFreeRate*T)*(CDF('NORMAL', d1) - 1));
		end;
		else /* Tratar casos de erro de model e tipo*/
			Delta_Option = 0;
	end;
	return(Delta_Option);
endsub;

Function verify_Time(DU);

	      if (DU >= 252) then
	                DU = 252;

	          if (DU <= 11) then
	                DU = 11;
	          return(DU);
Endsub;

Function verify_Time_Acoes(DU);

	          if (DU >= 63) then
	                DU = 63;

	          if (DU <= 11) then
	                DU = 11;
	          return(DU);
Endsub;

Function verify_delta( delta);

	          if (delta >= 0.95) then
	                delta = 0.95;

	          if (delta <= 0.05) then
	                delta = 0.05;
	          return(delta);
 Endsub;
	
Function verify_delta_Acoes(delta, Tipo$);

	          if ( Tipo in ("CALL","CAPLET")) then
	                do;
	                     if (delta >= 0.8) then
	                          delta = 0.8;

	                     if (delta <= 0.1) then
	                          delta = 0.1;
	               	end;

	          if ( Tipo in ("PUT","FLOORLET")) then
	                do;
	                     if (delta >= 0.9) then
	                          delta = 0.9;

	                     if (delta <= 0.2) then
	                          delta = 0.2;
	                end;

	return(delta);
Endsub;

Function Calcula_Delta(S, K, r, y, T, T_Delta, Grid[*], delta[*], maturity[*], Tipo$, Model$, tecnica$);

	Vol_Anual_Mais_Delta  = Interpola_GRID(S + 0.001, K, r, T, T_Delta, Grid, delta, maturity, Tipo, Model, tecnica);					
	Vol_Anual_Menos_Delta = Interpola_GRID(S - 0.001, K, r, T, T_Delta, Grid, delta, maturity, Tipo, Model, tecnica);					

	/*Tipo de Opção e cálculo do delta*/
	if Tipo = "CALL" then
		do;
			Delta1  = rsk_eurcallopt_b76_pf(S + 0.001 , K ,r, T_Delta, Vol_Anual_Mais_Delta);
			Delta2  = rsk_eurcallopt_b76_pf(S - 0.001 , K ,r, T_Delta, Vol_Anual_Menos_Delta);
		 end;

	else if Tipo = "PUT" then
		do;
			Delta1  = rsk_eurputopt_b76_pf(S + 0.001 , K ,r, T_Delta, Vol_Anual_Mais_Delta);
			Delta2  = rsk_eurputopt_b76_pf(S - 0.001 , K ,r, T_Delta, Vol_Anual_Menos_Delta);
		end;

	Deltad  = ((2 * 0.001) * exp((T_Delta)*r));
	Delta_result   = abs((Delta1-Delta2)/Deltad);

	return (Delta_result);

Endsub;
