/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_daystoyear_bra.sas

   PURPOSE: Days to Year conversion based on the convention calendar.
			Customized for the Brazil local rules.
			

   INPUTS:
      basedate - Base date of the option
      DaysToExp - Days To Expiration
	  BaseCalendar - Base calendar for the daycount

   USAGE: 
	  Value = rsk_daystoyear_bra(basedate, DaysToExp, BaseCalendar);

   NOTES:
      
	  
   REFERENCES:
	

 *****************************************************************************/

Function rsk_daystoyear_bra(basedate, DaysToExp, BaseCalendar$)
		label="Days to Year conversion based on the convention calendar";
	
	/* tratamento da convenção para DU/252 (dias úteis) */
	if BaseCalendar eq 'DU/252' then do; 
		totalDays = 252;
		TimeToExp = DaysToExp/totalDays;
	end;
	/* tratamento da convenção DU/180 (semi anual) */
	else if BaseCalendar eq 'DC/180' then do;
		totalDays = 360;
		TimeToExp = DaysToExp/totalDays;
	end;
	/* tratamento para as demais convenções, considerando o tratamento feito no SAS Base */
	else do;
		TimeToExp = yrdif(basedate, basedate + DaysToExp, BaseCalendar);
	end;
	
	return (TimeToExp);
	
Endsub;