/*****************************************************************************
   Copyright (c) 2016 by SAS Brasil, Sao Paulo, SP, Brazil.

   NAME: rsk_pearson_corr.sas

   PURPOSE: Calculate the Pearson Correlation Coefficient

   INPUTS:
      arrx - First Array for correlation
      arry - Second Array for correlation

   USAGE: 
	  Value = rsk_pearson_corr(arrayX, arrayY);

   NOTES:
      - It is assumed that the arrays have the same dimension.
	  
   REFERENCES:
	

 *****************************************************************************/

Function rsk_pearson_corr(arrx[*], arry[*])
		label="Calculate the Pearson Correlation Coefficient";
	
	result = .;
	avgx = 0;
	avgy = 0;
	cov = 0;
	varx = 0;
	vary = 0;
	
	if dim(arrx) = dim(arry) then do;
	
		do i = 1 to dim(arrx);
			avgx = avgx + arrx[i];
			avgy = avgy + arry[i];
		end;
		
		avgx = avgx/dim(arrx);
		avgy = avgy/dim(arry);
		
		do n = 1 to dim(arrx);
			calcx = arrx[n] - avgx;
			calcy = arry[n] - avgy;
			
			cov = cov + (calcx * calcy);
			varx = varx + (calcx ** 2);
			vary = vary + (calcy ** 2);
			
		end;
		
		result = cov / sqrt(varx * vary);
		
	end;
	
	else
		call rsk_print_msg_subr( 'rsk_func_unequal_array_error', "rsk_pearson_corr", 'arrx', 'Array X', 'arry', 'Array Y', '', '' );
		
	return(result);
	
Endsub;