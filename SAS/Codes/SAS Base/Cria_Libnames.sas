/* alterar para path correto no servidor a ser executado */
libname RMB_MAP "D:\SAS\SASBI\Lev1\AppData\SASRiskManagementForBanking\3.2\indata\mapping";
libname RMB_STG "D:\SAS\SASBI\Lev1\AppData\SASRiskManagementForBanking\3.2\indata\staging";
libname RMB_STA "D:\SAS\SASBI\Lev1\AppData\SASRiskManagementForBanking\3.2\indata\static";
libname MAPORI "D:\SAS\SASBI\Lev1\AppData\SASRiskManagementForBanking\3.2\indata\mapping_original";
libname STGORI "D:\SAS\SASBI\Lev1\AppData\SASRiskManagementForBanking\3.2\indata\staging_original";
libname teste 'D:\sem_sample\staging';

%macro deletaRegistro;

	proc sql noprint;
		create table deleteTable as
			select "delete from "!!trim(libname)!!"."!!trim(memname)!!";" as campo
				from sashelp.vtable
					where libname like '%TESTE%';
		select count(*) into: totReg
			from deleteTable;
	quit;

	%let i = 1;

	%do %while (&i. <= &totReg. );

		proc sql noprint;
			select campo into :query
				from deleteTable
					where monotonic() = &i.;
		quit;

		proc sql noprint;
			&query.;
		quit;

		%let i = %eval(&i+1);
	%end;
%mend;

%deletaRegistro;


%let tab = RF_CURVE_X_RF_GROUP;
%let clausula = monotonic() > 85;

proc sql;

insert into teste.&tab.
select * from rmb_stg.&tab.
where &clausula.;

quit;