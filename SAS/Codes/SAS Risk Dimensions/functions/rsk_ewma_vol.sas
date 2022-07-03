/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_ewma_vol.sas

   PURPOSE: Calculation for Exponentially Weighted Volatility (EWMA) used
			for Quanto Options.

   INPUTS:
      PriceVector - Price Array
      Lambda - Lambda Value

   USAGE: 
	  Value = rsk_ewma_vol(pricevector, lambda);

   NOTES:
      DaysPerYear - Time To Maturity will be considered only for business
					days. 
					Checking if this field needs to be filled by
					other parameter in the method.
	  
   REFERENCES:
	  http://www.itl.nist.gov/div898/handbook/pmc/section3/pmc324.htm
      Montgomery, Douglas (2005). Introduction to Statistical Quality Control. 
	  Hoboken, New Jersey: John Wiley & Sons, Inc. 
	  ISBN 978-0-471-65631-9. OCLC 56729567.

 *****************************************************************************/

Function rsk_ewma_vol(pricevector[*], lambda)
		label="Exponentially Weighted Volatility (EWMA)";

	DaysPerYear = 252;
	
	if dim(pricevector) > 1 then do;
		/* Initial value guess to start the calculation loop */
		expvol = log(pricevector[2]/pricevector[1]) ** 2;
		
		do i = 2 to dim(pricevector) - 1;
			expvol = lambda * expvol + (1 - lambda) * log(pricevector[i+1]/pricevector[i]) ** 2;
		end;
		
		ExpWeightVol = sqrt(expvol * DaysPerYear);
		
	end;
	
	return(ExpWeightVol);
	
Endsub;