/* Cria a variável para controle do tamanho do array de feriados */
%global holiday_array_size;

/* Recupera o tamanho do array de feriados */
data _null_;
	set DATAIN.HOLIDAY nobs = total;
	call symput ("holiday_array_size", trim(left(total)));
run;

/* Define funções auxiliares para as precificações */
proc fcmp outlib= env.POC.funcs
	library= env.POC;
	/* Calcula a quantidade de dias uteis */
	/* Initial_date = data inicial */
	/* End_Date = data final */
	/* Maturity = variavel resposta com o número de dias úteis entre a data inicial e a final */

	subroutine business_days (initial_date, end_date, Maturity)
		label = "Calcula Período em Dias Úteis" group= "Calendário";
		outargs Maturity;
		array x[1,2] / nosymbols;
		rc = read_array ('DATAIN.HOLIDAY', x, 'DATE', 'COUNT');

		if initial_date = . or end_date = . then
			Maturity = 1;
		else
			do;
				holidays = 0;

				do i=1 to &holiday_array_size;
					if (initial_date le x[i,1] and end_date ge x[i,1]) then
						do;
							holidays= holidays+1;
						end;
				end;
				Maturity = end_date - initial_date - holidays;
			end;
	endsub;


	/* Valida se a data é dia útil e, em caso negativo, retorna o próximo dia útil */
	/* Val_Date = data para validação */
	subroutine Valida_business_days (Val_Date)
		label = "Valida Dia Útil" group= "Calendário";
		outargs Val_Date;
		array vNaoUtil[1] / nosymbols;

		rc = read_array ('DATAIN.HOLIDAY', vNaoUtil, 'DATE');

		do i=1 to &holiday_array_size;
			if Val_Date eq vNaoUtil[i] then do;
				do j=1 to &holiday_array_size;
					Val_Date = Val_Date + 1;
					if Val_Date ne vNaoUtil[i+j] then do;
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

	subroutine EXPONENCIAL_INTERPOLATION (Maturity, curve_array[*], date_grid_array[*], actual_rate)
		label = "Interpolação Exponencial" group= "Interpolação";
		outargs actual_rate;

		/* DEBUG */
		/*				put curve_array[1];*/
		/*				put curve_array[2];*/
		/*				put curve_array[3];*/
		/*				put curve_array[4];*/
		/**/
		/*				put date_grid_array[1];*/
		/*				put date_grid_array[2];*/
		/*				put date_grid_array[3];*/
		/*				put date_grid_array[4];*/
		i = dim(curve_array);

		if (Maturity <= (date_grid_array{1}*365.25)) then
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
	endsub;

	/* Função para encontrar o bucket para alocação de fluxo de caixa */
	function rsk_find_bucket(Prazo, Vertices[*]) kind="Array Utility";
		QtdeVertices = dim(Vertices);
		i = 1;

		do while((Vertices[i] le Prazo) and (i ne QtdeVertices));
			i = i + 1;
		end;
		
		if Prazo gt Vertices[i] then do;
			i = i + 1;
		end;

		return(i);
	endsub;

	/*************************************************************************************/
	/* Função para alocação de fluxos de caixa em vértices para PJUR2, PJUR3 e PJUR4	 */
	/*************************************************************************************/

	subroutine alocacao_pjur234(dias_uteis, valor_cf , vetor_dias[*], vetor_saida[*])
		label = "Alocação de Fluxo de Caixa para PJur234" group= "Alocação de Fluxo de Caixa";
		outargs vetor_dias, vetor_saida ;

		/* verifica que o prazo eh pelo menos igual ou maior o primeiro bucket - senao nao faz nenhuma alocacao */
		if dias_uteis >= vetor_dias[1] then do;
			/* encontra em que bucket o period em dias uteis informado cai */
			r = rsk_find_bucket( dias_uteis, vetor_dias );

			/* se coincidir com o primeiro bucket simplesmete aloca - porque o prazo em dias casa exatamente com days_vector[1] */
			if r=1 then do; 
				vetor_saida[1] = vetor_saida[1] + valor_cf;
			end;
			else if r > dim(vetor_dias) then do;
				/* caso esteja apos o ultimo bucket aplica a regra de proporcao */
				vetor_saida[r-1] = vetor_saida[r-1] + (dias_uteis/vetor_dias[r-1]) * valor_cf;
			end;
			else /* se estiver entre qualquer outro aplica a regra de distribuicao prorata*/
			do;
				denominador = vetor_dias[r] - vetor_dias[r-1];

				/* vertice anterior */
				vetor_saida[r-1] = vetor_saida[r-1] + ((vetor_dias[r] - dias_uteis)/denominador) * valor_cf;

				/* vertice posterior */
				vetor_saida[r] = vetor_saida[r] + ((dias_uteis - vetor_dias[r-1])/denominador) * valor_cf;
			end;
		end;
	endsub;


	/*************************************************************************************/
	/* Função para alocação de fluxos de caixa em vértices para PJUR1					 */
	/*************************************************************************************/

	subroutine alocacao_pjur1(dias_uteis, valor_cf , vetor_dias[*], vetor_saida[*])
		label = "Alocação de Fluxo de Caixa para PJur1" group= "Alocação de Fluxo de Caixa";
		outargs vetor_dias, vetor_saida;

		/* verifica que o prazo eh pelo menos igual ou maior o primeiro bucket - senao nao faz nenhuma alocacao */
		if dias_uteis > vetor_dias[1] then do;
			/* encontra em que bucket o period em dias uteis informado cai */
			r = rsk_find_bucket( dias_uteis, vetor_dias );

			/* se coincidir com o primeiro bucket simplesmete aloca - porque o prazo em dias casa exatamente com days_vector[1] */
			if r=1 then do; 
				vetor_saida[1] = vetor_saida[1] + (dias_uteis/vetor_dias[1]) * valor_cf;
			end;
			else if r > dim(vetor_dias) then do;
				/* caso esteja apos o ultimo bucket aplica a regra de proporcao */
				vetor_saida[r-1] = vetor_saida[r-1] + (dias_uteis/vetor_dias[r-1]) * valor_cf;
			end;
			else /* se estiver entre qualquer outro aplica a regra de distribuicao prorata*/
			do;
				denominador = vetor_dias[r] - vetor_dias[r-1];

				/* vertice anterior */
				vetor_saida[r-1] = vetor_saida[r-1] + ((vetor_dias[r] - dias_uteis)/denominador) * valor_cf;

				/* vertice posterior */
				vetor_saida[r] = vetor_saida[r] + ((dias_uteis - vetor_dias[r-1])/denominador) * valor_cf;
			end;
		end;
		else do;
			/* caso esteja antes do primeiro bucket aplica a regra de proporcao */
			vetor_saida[1] = vetor_saida[1] + (dias_uteis/vetor_dias[1]) * valor_cf;
		end;
	endsub;
	
	/* Função para alocação de fluxo de caixa em vértices para DRM APD */
	/* É utilizado um vértice a mais para apurar o valor total não corrigido do último vértice solicitado pelo regulador */
	subroutine alocacao_pjurAPD(dias_uteis, valor_cf , vetor_dias[*], vetor_saida[*])
		label = "Alocação de Fluxo de Caixa para DRM APD" group= "Alocação de Fluxo de Caixa";
		outargs vetor_dias, vetor_saida ;

		/* verifica que o prazo eh pelo menos igual ou maior o primeiro bucket - senao nao faz nenhuma alocacao */
		if dias_uteis >= vetor_dias[1] then do;
			/* encontra em que bucket o periodo em dias uteis informado cai */
			r = rsk_find_bucket( dias_uteis, vetor_dias );

			/* se coincidir com o primeiro bucket simplesmete aloca */
			if r=1 then do; 
				vetor_saida[r] = vetor_saida[r] + valor_cf;
			end;
			else if r > dim(vetor_dias) then do;
				/* caso esteja apos o ultimo bucket aplica a regra de proporcao */
				vetor_saida[r] = vetor_saida[r] + (dias_uteis / vetor_dias[r - 1]) * valor_cf;
				/* também apura o valor sem correção para efeito regulatório */
				vetor_saida[r+1] = vetor_saida[r+1] + valor_cf;
			end;
			else /* se estiver entre qualquer outro aplica a regra de distribuicao prorata*/
			do;
				denominador = vetor_dias[r] - vetor_dias[r-1];

				/* vertice anterior */
				vetor_saida[r-1] = vetor_saida[r-1] + ((vetor_dias[r] - dias_uteis)/denominador) * valor_cf;

				/* vertice posterior */
				vetor_saida[r] = vetor_saida[r] + ((dias_uteis - vetor_dias[r-1])/denominador) * valor_cf;
			end;
		end;
	endsub;
run;