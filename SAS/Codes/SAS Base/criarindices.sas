libname STGORI "/sasdata/sasrmb/dados/indata/staging";
libname MAPORI "/sasdata/sasrmb/dados/indata/mapping";


libname STGORI2 "/sasdata/sasrmb/dados/indata/staging_original";
libname MAPORI2 "/sasdata/sasrmb/dados/indata/mapping_original";


proc sort data=sashelp.vindex out=vindex;
	by libname memname indxname;
	where libname in ("STGORI2" "MAPORI2");
run;

proc transpose data=vindex out=indextable;
	by libname memname indxname;
	var name;
run;


%macro criaindices;
	proc sql noprint;
		select count(*) into :totreg 
		from indextable;
	quit;

	%do i=1 %to &totreg.;
		data _null_;
			x=&i;
			set indextable point=x;
			call symputx("mcridxname", indxname);
			call symputx("mcrtablename", memname);
			call symputx("mcrcolnames", catx(",", col1 , col2 , col3, col4 , col5, col6));
			call symputx("libname", substr(libname,1,length(libname)-1));
			stop;
		run;



		proc sql noprint;
			create unique index &mcridxname. on &libname..&mcrtablename. (&mcrcolnames.);
		quit;
	%end;
%mend;
options mprint;
%criaindices
	
