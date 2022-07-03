 
	function business_days (initial_date, end_date, Holiday[*]);

		dim_holiday = dim(Holiday);

		if initial_date = . or end_date = . then
			Maturity = 1;
		else
			do;
				holidays = 0;

				do i=1 to dim_holiday;
					if (initial_date le Holiday[i] and end_date ge Holiday[i]) then
						do;
							holidays = holidays + 1;
						end;
				end;
				Maturity = end_date - initial_date - holidays;
			end;
			return (Maturity);
	endsub;


	/* Valida se a data é dia útil e, em caso negativo, retorna o próximo dia útil */
	/* Val_Date = data para validação */
	subroutine Valida_business_days (Val_Date, Holiday[*]);
		
		outargs Val_date;
		/*rc = read_array ('DATAIN.HOLIDAY', vNaoUtil, 'DATE');*/
		dim_holiday = dim(Holiday);

		do i=1 to dim_holiday;
			if Val_Date eq Holiday[i] then do;
				do j=1 to dim_holiday;
					Val_Date = Val_Date + 1;
					if i = dim_holiday then return;
					if Val_Date ne Holiday[i+j] then do;
						return;
					end;
				end;
			end;
		end;
	endsub;

	/* Interpolação Exponencial */
	/* Maturity = prazo remanescente em dias */
	/* Curve_array = vertices da curva de juros */
	/* Date_grid_array = maturity dos vertices da curva */
	/* Actual Rate = retorno com a taxa de juros interpolada */

	function Interpola_Exponencial (Maturity, curve_array[*], date_grid_array[*]);
		i = dim(curve_array);
		if (Maturity <= (date_grid_array{1}*366.25)) then
			rate = curve_array{1};

		if (Maturity >= (date_grid_array{i}*365.25)) then
			rate = (((1 + curve_array{i}) * (((1 + curve_array{i}) / 
			(1 + curve_array{i-1})) ** ((Maturity - (date_grid_array{i}*365.25)) / 
			((date_grid_array{i}*365.25) - (date_grid_array{i-1}*365.25))))) -1 );

		if (Maturity > (date_grid_array{1}*365.25)) and 
			(Maturity < (date_grid_array{i}*365.25)) then
			do;
				do j= 1 to i-1;
					if (Maturity > (date_grid_array{j}*365.25)) and 
						(Maturity <= (date_grid_array{j+1}*365.25)) then
						do;
							rate = (((((1 + curve_array{j}) ** (date_grid_array{j}*365.25)) * 
								(((1 + curve_array{j+1}) ** (date_grid_array{j+1}*365.25)) / 
								((1 + curve_array{j}) ** (date_grid_array{j}*365.25))) ** 
								((Maturity - date_grid_array{j}*365.25) / (date_grid_array{j+1}*365.25 - 
								date_grid_array{j}*365.25))) ** (1 / Maturity)) - 1);
						end;
				end;
			end;
		actual_rate = rate;
		return(actual_rate);
	endsub;

	



	