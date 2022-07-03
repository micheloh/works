/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_daycount_bra.sas

   PURPOSE: Daycount customized for the Brazil local rules.

   INPUTS:
      basedate - Base date of the option
      matdate - maturity date
	  holiday_list - holiday days Array
	  baseCalendar - Base calendar for the daycount
	  fixingdate - Fixing date for maturity date (date format)
	  fixingdays - Fixing date for maturity date (format '"D-"<days>')

   USAGE: 
	  For daycount with fixing:
	  Value = rsk_daycount_bra(basedate, matdate, holiday_list[*], 
								baseCalendar, fixingdate, fixingdays);
	
	  For daycount without fixing:
	  Value = rsk_daycount_bra(basedate, matdate, holiday_list[*], 
								baseCalendar, ., '');
	
   NOTES:
	
	
   REFERENCES:
	

 *****************************************************************************/

Function rsk_daycount_bra(basedate, matdate, holiday_list[*], baseCalendar$, fixingdate, fixingdays$)
		label="Daycount customized for the Brazil local rules";

	/* tratamento da convencao para DU/252 (dias uteis) */
	if baseCalendar eq 'DU/252' then do; 
		DaysToExp = business_days(basedate, matdate, holiday_list);  
	end;
	/* tratamento da convencao DU/180 (semi anual) */
	else if baseCalendar eq 'DC/180' then do;
		DaysToExp = (rsk_daycount2('ACT/360', basedate, matdate ));
	end;
	/* tratamento para as demais convencoes, considerando o tratamento feito no SAS Base */
	else do;
		DaysToExp = rsk_daycount2(baseCalendar, basedate, matdate );
	end;

	/* Verificacao para ver se existe Fixing para se considerar no prazo para vencimento */
	if fixingdate ne . then do; /* Ha fixing enviado no formato data */
		_fixingdays = rsk_daycount2(baseCalendar, fixingdate, matdate );
	end;
	else if fixingdays ne '' then do; /* Ha fixing enviado no formato D-1 */
		_fixingdays = input(scan(fixingdays, -1, '-'), 3.);
	end;
	else do; /* Nao ha fixing */
		_fixingdays = 0;
	end;

	DaysToExp = DaysToExp - _fixingdays;	
	return(DaysToExp);

Endsub;