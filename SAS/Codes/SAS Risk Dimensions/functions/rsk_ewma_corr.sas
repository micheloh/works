/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_ewma_corr.sas

   PURPOSE: Calculate the EWMA Correlation Coefficient

   INPUTS:
      arrx - First Array for correlation
      arry - Second Array for correlation
	  lambda - Lambda Value

   USAGE: 
	  Value = rsk_ewma_corr(arrayX, arrayY, lambda);

   NOTES:
      - It is assumed that the arrays have the same dimension.
	  
   REFERENCES:
	

 *****************************************************************************/

Function rsk_ewma_corr(arrx[*], arry[*], lambda)
		label="Calculate the EWMA Correlation Coefficient";
	
	result = .;
	avgx = 0;
	avgy = 0;
	cov = 0;
	varx = 0;
	vary = 0;
	lambda = 0.94;
	
*	put arrx= arry= ;

	if dim(arrx) = dim(arry) then do;
	
		do i = 1 to dim(arrx)-1;
			avgx = avgx + log(arrx[i+1]/arrx[i]);
			avgy = avgy + log(arry[i+1]/arry[i]);
		end;
		
		avgx = avgx/dim(arrx);
		avgy = avgy/dim(arry);

*		put avgx=;
*		put avgy=;
		tamx = dim(arrx);
		tamy = dim(arry);
*		put tamx=;
*		put tamy=;

		do n = 1 to dim(arrx)-1;
		
			calcx = log(arrx[n+1]/arrx[n])- avgx;
			calcy = log(arry[n+1]/arry[n])- avgy;
				
			
			cov = cov + (lambda)**(n-1) * (calcx * calcy);
			varx = varx + (calcx ** 2);
			vary = vary + (calcy ** 2);
			
		end;
		
*	put calcx= calcy= cov= varx= vary=;

		result = (1-lambda) * cov / sqrt(varx * vary);

*	put calcx= calcy= cov= varx= vary= result=;
			
	end;
	
	else
		call rsk_print_msg_subr( 'rsk_func_unequal_array_error', "rsk_pearson_corr", 'arrx', 'Array X', 'arry', 'Array Y', '', '' );
		
	return(result);
	
Endsub;