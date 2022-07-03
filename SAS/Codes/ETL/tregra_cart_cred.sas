*  Begin EG generated code (do not edit this line);
*
*  Stored process registered by
*  Enterprise Guide Stored Process Manager V5.1
*
*  ====================================================================
*  Stored process name: tregra_cart_cred
*  ====================================================================
*
*  Stored process prompt dictionary:
*  ____________________________________
*  A_CBIN_CATAO
*       Type: Numeric
*      Label: Bin Cart�o
*       Attr: Visible
*  ____________________________________
*  A_CGRP_ATGDO_PERDA
*       Type: Numeric
*      Label: Grupo Atingido Perda
*       Attr: Visible
*  ____________________________________
*  A_CSGRP_ATGDO_PERDA
*       Type: Text
*      Label: SubGrupo Atingido Perda
*       Attr: Visible
*  ____________________________________
*  E_CBIN_CATAO
*       Type: Numeric
*      Label: Bin Cart�o
*       Attr: Visible
*  ____________________________________
*  I_CBIN_CATAO
*       Type: Numeric
*      Label: Bin Cart�o
*       Attr: Visible
*  ____________________________________
*  I_CGRP_ATGDO_PERDA
*       Type: Numeric
*      Label: Grupo Atingido Perda
*       Attr: Visible
*  ____________________________________
*  I_CSGRP_ATGDO_PERDA
*       Type: Text
*      Label: SubGrupo Atingido Perda
*       Attr: Visible
*  ____________________________________
*;


*ProcessBody;

%global A_CBIN_CATAO
        A_CGRP_ATGDO_PERDA
        A_CSGRP_ATGDO_PERDA
        E_CBIN_CATAO
        I_CBIN_CATAO
        I_CGRP_ATGDO_PERDA
        I_CSGRP_ATGDO_PERDA;

%STPBEGIN;

OPTIONS VALIDVARNAME=ANY;

%macro ExtendValidMemName;

%if %sysevalf(&sysver>=9.3) %then options validmemname=extend;

%mend ExtendValidMemName;

%ExtendValidMemName;

*  End EG generated code (do not edit this line);

%LET comp_i = ;
%LET comp_a = ;
%LET comp_e = ;

%global comp_i;
%global comp_a;
%global comp_e;

libname stp "/RODATAPRD/ROPRODUTIVO/EGRC_RO/DADOS/PARAMETROS/TABELA";


%macro formulario;
options mprint mlogic symbolgen ;

/*INCLUS�O*/
	%if &I_CBIN_CATAO ne  %then %do;
		proc sql noprint;
			select CBIN_CATAO into: comp_i
			from stp.TREGRA_CART_CRED where CBIN_CATAO=&I_CBIN_CATAO;
		quit;
		%if &comp_i ^= %then %do;
			%put "********** Bin Cart�o &I_CBIN_CATAO j� existe na tabela ***********";
			data mensagem;
				Mensagem="Bin Cart�o &I_CBIN_CATAO j� existe na tabela";
			run;
			proc print data=mensagem noobs;
			run;
			
		%end;
		%else %do;
		   %if &I_CGRP_ATGDO_PERDA =  or &I_CSGRP_ATGDO_PERDA=  %then %do;
				%put "********** Favor preencher todos os campos ***********";
				data mensagem;
					Mensagem="Favor preencher todos os campos";
				run;
				proc print data=mensagem noobs;
				run;
				
			%end;
			%else %do;	
				proc sql;
					insert into stp.TREGRA_CART_CRED values(&I_CBIN_CATAO, &I_CGRP_ATGDO_PERDA, "&I_CSGRP_ATGDO_PERDA");
				    %put "********** Bin Cart�o &I_CBIN_CATAO inserido com sucesso ***********";
				quit;
				data mensagem;
					Mensagem="Bin Cart�o &I_CBIN_CATAO inserido com sucesso";
				run;
				proc print data=mensagem noobs;
				run;
					
			%end;					
		%end;
	%end;
/*ALTERA��O*/
	%else %if  &A_CBIN_CATAO ne  %then %do;
				proc sql noprint;
				select CBIN_CATAO into: comp_a
				from stp.TREGRA_CART_CRED where CBIN_CATAO=&A_CBIN_CATAO;
				quit;
			%if &comp_a = %then %do;
				%put "********** Bin Cart�o &A_CBIN_CATAO n�o existe na tabela ***********";
				data mensagem;
					Mensagem="Bin Cart�o &A_CBIN_CATAO n�o existe na tabela";
				run;
				proc print data=mensagem noobs;
				run;
				
			%end;

			%else %do;
				%if &A_CGRP_ATGDO_PERDA = and &A_CSGRP_ATGDO_PERDA=  %then %do;
					%put "********** N�o h� informa��es para atualizar para o Bin Cart�o &A_CBIN_CATAO ***********";
					data mensagem;
						Mensagem="N�o h� informa��es para atualizar para o Bin Cart�o &A_CBIN_CATAO";
					run;
					proc print data=mensagem noobs;
					run;
					
				%end;
			
				%else %do;
					data stp.TREGRA_CART_CRED;
						set stp.TREGRA_CART_CRED;
						if CBIN_CATAO = &A_CBIN_CATAO then do;
							if "&A_CGRP_ATGDO_PERDA" ne '' then 
							CGRP_ATGDO_PERDA = input("&A_CGRP_ATGDO_PERDA", best12.);
							if "&A_CSGRP_ATGDO_PERDA" ne '' then 
							CSGRP_ATGDO_PERDA = "&A_CSGRP_ATGDO_PERDA";
						end;
						%put *************** "Bin Cart�o &A_CBIN_CATAO atualizado com sucesso" **************;
					run;
					data mensagem;
						Mensagem="Bin Cart�o &A_CBIN_CATAO atualizado com sucesso";
					run;
					proc print data=mensagem noobs;
					run;
				%end;
			%end;
	%end;
/*EXCLUS�O*/
	%else %if &E_CBIN_CATAO ne  %then %do;
				proc sql noprint;
				select CBIN_CATAO into: comp_e
				from stp.TREGRA_CART_CRED where CBIN_CATAO=&E_CBIN_CATAO;
				quit;
			%if &comp_e = %then %do;
				%put "********** Bin Cart�o &E_CBIN_CATAO n�o existe na tabela ***********";
				data mensagem;
					Mensagem="Bin Cart�o &E_CBIN_CATAO n�o existe na tabela";
				run;
				proc print data=mensagem noobs;
				run;
				
			%end;
			%else %do;
		 	proc sql;
			    delete from stp.TREGRA_CART_CRED where CBIN_CATAO = &E_CBIN_CATAO;
				%put "********** "Bin Cart�o &E_CBIN_CATAO excluido com sucesso" ***********";
				quit;
				data mensagem;
					Mensagem="Bin Cart�o &E_CBIN_CATAO excluido com sucesso";
				run;
				proc print data=mensagem noobs;
				run;
				
			%end;
	%end;
%mend;

%formulario;

*  Begin EG generated code (do not edit this line);
;*';*";*/;quit;
%STPEND;

*  End EG generated code (do not edit this line);
