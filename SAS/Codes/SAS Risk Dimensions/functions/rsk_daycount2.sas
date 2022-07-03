


/*****************************************************************************
   Copyright (c) 2010 by SAS Institute Inc., Cary, NC, USA.

   NAME: rsk_daycount.sas

   PURPOSE: Calculates the number of years between two dates using
      different date/year conventions

   USAGE:

   NOTES:
      If either date is missing or difference is negative, will return zero.


 *****************************************************************************/



function rsk_daycount2(Convention $,BeginDate,EndDate)

   kind  = "Date management"
   label = "Calculates the number of days between two dates, given a day counting convention";

   /*
   Actual/actual: The actual number of days between two dates is used.
   Leap years count for 366 days, non-leap years count for 365 days. If more than 1 year then
   actual year use actual year rsk_daycount - hence the loop and frac return.

   Actual/360: The actual number of days between two dates is used as the numerator.
   A year is assumed to have 12 months of 30 days each.

   Actual/365: The actual number of days between two dates is used as the numerator.
   All years are assumed to have 365 days. BASECASE

   Actual/366: The actual number of days between two dates is used as the numerator.
   All years are assumed to have 366 days.

   30/360: All months are assumed to have 30 days, resulting in a 360 day year.
   If the first date falls on the 31st, it is changed to the 30th.
   If the second date falls on the 31th, it is changed to the 30th,
   but only if the first date falls on the 30th or the 31st.
   */

   /* Create a local copy of this pass-through character value */
   /* This will make the function more efficient */
   length local_convention $32;
   local_convention = Convention;

   /* Default value to ACT/365 */
   if missing(local_convention) then local_convention = 'ACT/365';

   /* Return zero if EndDate before BeginDate or missing either date */
   if EndDate le BeginDate or missing(BeginDate) then return(0);

   /* Handle cases, for each convention */
   select(local_convention);

      /* ACT/360 must be computed by this function */
      /* Otherwise, use yrdif function */
      when ('ACT/366') do;
         returnval = EndDate - BeginDate ;
      end;
      otherwise do;
         returnval = datdif( BeginDate, EndDate, local_convention );
      end;

   end;

   /* Return the value */
   return(returnval);

endsub;
