/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_Payoff.sas

   PURPOSE: Payoff function created by Bradesco. 
		    Used for BinomialBridgeBarrierPrice Price calculation.

   INPUTS:
      St - Price of the option adjusted in the time.
	  Strike - Option Strike Value
	  LimitValue - Cap/Floor Value
	  z - Put/Call Adjusting. For call, use 1 and for put use -1.

   USAGE: 
	  price = Payoff( St, Strike, LimitValue, z);
	
   NOTES:
	  
	
   REFERENCES:
	

 *****************************************************************************/

function Payoff( St, Strike, LimitValue, z);

     if LimitValue = . then
          p = max(0, z * (St - Strike));
     else 
          p = max(0,  min( z*(LimitValue - Strike), z*(St - Strike)) );

     return(p);

endsub;
