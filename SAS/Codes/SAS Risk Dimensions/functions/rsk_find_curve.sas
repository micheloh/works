/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_find_curve.sas

   PURPOSE: Find the correct value in a complete curve 
			(interpolation not needed).

   INPUTS:
      price - Price Array
      mat - maturity Array
	  time - Time to maturity in years

   USAGE: 
	  Value = rsk_ewma_vol(pricevector, lambda);

   NOTES:
      - It is assumed that the arrays are sorted by time.
	  - Extrapolation will be considered value 0.
	  
   REFERENCES:
	

 *****************************************************************************/

Function rsk_find_curve(price[*], mat[*], time)
		label="Find Value in complete curve";

	j = rsk_find( time, mat );

	if j < 1 then
		value = 0;
	else if j > dim(price) then
		value = 0;
	else
		value = price[j];
	
	return(value);
	
Endsub;