Function rsk_quanto_vol_interp(Grid[*], delta[*], maturity[*], T, Tecnica$);
		 
	dim_delta = dim(delta);
	dim_maturity = dim(maturity);

	array grid_copia [1, 1] /nosymbols;	* Array para receber o grid;
	array vol_interp [1] /nosymbols;	* Array para armazenar a vol interpolada no tempo;
	array aux [1] /nosymbols; * Array para armazenar a vol para certo delta;

	call dynamic_array (grid_copia, dim_delta, dim_maturity);

	/*Copia o grid*/
	z = 1;
	do j=1 to dim_maturity;
		do i=1 to dim_delta;
			if z le dim_maturity * dim_delta then do;
				grid_copia[i,j] = Grid[z];
				z = z + 1;
			end;
		end;
	end;
	/* Verifica T para extrapolação*/
	call dynamic_array (vol_interp, dim_delta);
	
	/* Tecnica para Grid CONE deve ser feito uma interpolação em uma dimensão, considerando o "DELTA" como 0.5 */
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
		
		/* interpola pela tecnica escolhida */
		if tecnica in ("BI_CONSTRAINED_CUBIC", "CONE") then
			vol_implied2 = interpSpline(T, maturity, aux);
		else if tecnica = "BI_LINEAR" then
			vol_implied2 = rsk_intpolate2( T, aux, maturity, "LINEAR" );
		else if tecnica = "BI_CUBIC" then
			vol_implied2 = rsk_intpolate2( T, aux, maturity, "CUBIC" );

	end;

	return(vol_implied2);

Endsub;
