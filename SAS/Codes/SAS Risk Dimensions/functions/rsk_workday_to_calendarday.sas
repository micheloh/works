/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_workday_to_calendarday.sas

   PURPOSE: Daycount in workday and convert it to calendar day.

   INPUTS:
      initial_date - The initial date
      end_date - the end date
	  Holiday - holiday days Array

   USAGE: 
	  Value = rsk_workday_to_calendarday(initial_date, end_date, Holiday[*]);

	
   NOTES:
	
	
   REFERENCES:
	

 *****************************************************************************/

Function rsk_workday_to_calendarday(initial_date, end_date, Holiday[*])
		label="Daycount in workday and convert it to calendar day";

	dim_holiday = dim(Holiday);
	initdate = initial_date;
	if initial_date = . or end_date = . then
		Maturity = 1;
	else
		do;

			do j=dim_holiday to 1 by -1;
				if initdate eq holiday[j] then
					initdate = initdate - 1;
			end;

			Maturity = end_date - initdate;
		end;
		return (Maturity);

endsub;