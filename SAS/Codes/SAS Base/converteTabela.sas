libname STGORI "/sasdata/sasrmb/dados/indata/staging";
libname MAPORI "/sasdata/sasrmb/dados/indata/mapping";


options mlogic mprint symbolgen;

%macro convertTabelas(lib);
 proc sql;
	create table convTable as    
 	select "data "!!trim(libname)!!"."!!trim(memname)!!";"!!"set "!!trim(libname)!!"."!!trim(memname)!!";"!!"run;" as sintaxe
	from sashelp.vtable where upper(datarepname) like "%WIN%" and libname = "&lib.";

	select count(*) into :totreg
	from convTable;
 quit;


	%do i=1 %to &totreg.;
		data _null_;
		x=&i;
			set convTable point=x;
			call symputx("expressao", sintaxe );
			stop;
		run;
		&expressao.
	%end;

%mend;

%convertTabelas (STGORI);
%convertTabelas (MAPORI);


