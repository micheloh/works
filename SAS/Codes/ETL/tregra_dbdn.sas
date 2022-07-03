*  Begin EG generated code (do not edit this line);
*
*  Stored process registered by
*  Enterprise Guide Stored Process Manager V5.1
*
*  ====================================================================
*  Stored process name: tregra_dbdn
*  ====================================================================
*
*  Stored process prompt dictionary:
*  ____________________________________
*  A_CCAUSA_ATGDO_PERDA
*       Type: Text
*      Label: Causa Perda
*       Attr: Visible
*  ____________________________________
*  A_CEVNTO_PERDA
*       Type: Text
*      Label: Evento Perda
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
*  A_RSTATUS
*       Type: Text
*      Label: Status
*       Attr: Visible
*  ____________________________________
*  E_RSTATUS
*       Type: Text
*      Label: Status
*       Attr: Visible
*  ____________________________________
*  I_CCAUSA_ATGDO_PERDA
*       Type: Text
*      Label: Causa Perda
*       Attr: Visible
*  ____________________________________
*  I_CEVNTO_PERDA
*       Type: Text
*      Label: Evento Perda
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
*  I_RSTATUS
*       Type: Text
*      Label: Status
*       Attr: Visible
*  ____________________________________
*;


*ProcessBody;

%global A_CCAUSA_ATGDO_PERDA
        A_CEVNTO_PERDA
        A_CGRP_ATGDO_PERDA
        A_CSGRP_ATGDO_PERDA
        A_RSTATUS
        E_RSTATUS
        I_CCAUSA_ATGDO_PERDA
        I_CEVNTO_PERDA
        I_CGRP_ATGDO_PERDA
        I_CSGRP_ATGDO_PERDA
        I_RSTATUS;

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

/*libname stp "/RODATAPRD/ROQUALITATIVO/EGRC/DADOS/CARGA/CONTROLE/DEPARA/TEMP";*/
libname stp "/RODATAPRD/ROPRODUTIVO/EGRC_RO/DADOS/PARAMETROS/TABELA";


%macro formulario;
options mprint mlogic symbolgen ;

/*INCLUSÃO*/
	%if &I_RSTATUS ne  %then %do;
		proc sql noprint;
			select RSTATUS into: comp_i
			from stp.TREGRA_DBDN where RSTATUS="&I_RSTATUS";
		quit;
		%if &comp_i ^= %then %do;
			%put "********** Status &I_RSTATUS já existe na tabela ***********";
			%mensagem(_tipoMsg=ALERTA:, _corTipoMsg=red, _msg=Status &I_RSTATUS já existe na tabela);
		%end;
		%else %do;
		   %if &I_CGRP_ATGDO_PERDA =  or &I_CSGRP_ATGDO_PERDA=  or &I_CCAUSA_ATGDO_PERDA = or &I_CEVNTO_PERDA = %then %do;
				%put "********** Favor preencher todos os campos ***********";
				%mensagem(_tipoMsg=ALERTA:, _corTipoMsg=red, _msg=Favor preencher todos os campos);
			%end;
			%else %do;	
				proc sql;
					insert into stp.TREGRA_DBDN values("&I_RSTATUS", &I_CGRP_ATGDO_PERDA, "&I_CSGRP_ATGDO_PERDA", "&I_CCAUSA_ATGDO_PERDA","&I_CEVNTO_PERDA");
				    %put "********** Status &I_REVENTO inserido com sucesso ***********";
				quit;
					%mensagem(_tipoMsg=MENSAGEM:, _corTipoMsg=green, _msg=Status &I_RSTATUS inserido com sucesso);
			%end;					
		%end;
	%end;
/*ALTERAÇÃO*/
	%else %if  &A_RSTATUS ne  %then %do;
				proc sql noprint;
				select RSTATUS into: comp_a
				from stp.TREGRA_DBDN where RSTATUS="&A_RSTATUS";
				quit;
			%if &comp_a = %then %do;
				%put "********** Status &A_RSTATUS não existe na tabela ***********";
				%mensagem(_tipoMsg=ALERTA:, _corTipoMsg=red, _msg=Evento &A_RSTATUS não existe na tabela);
			%end;

			%else %do;
				%if &A_CGRP_ATGDO_PERDA = and &A_CSGRP_ATGDO_PERDA=  and &A_CCAUSA_ATGDO_PERDA = and &A_CEVNTO_PERDA = %then %do;
					%put "********** Não há informações para atualizar para o Status &A_RSTATUS ***********";
					%mensagem(_tipoMsg=ALERTA:, _corTipoMsg=red, _msg=Não há informações para atualizar para o Status &A_RSTATUS);
				%end;
			
				%else %do;
					data stp.TREGRA_DBDN;
						set stp.TREGRA_DBDN;
						if RSTATUS = "&A_RSTATUS" then do;
							if "&A_CGRP_ATGDO_PERDA" ne '' then 
							CGRP_ATGDO_PERDA = input("&A_CGRP_ATGDO_PERDA", best12.);
							if "&A_CSGRP_ATGDO_PERDA" ne '' then 
							CSGRP_ATGDO_PERDA = "&A_CSGRP_ATGDO_PERDA";
							if "&A_CCAUSA_ATGDO_PERDA" ne '' then 
							CCAUSA_ATGDO_PERDA = "&A_CCAUSA_ATGDO_PERDA";
							if "&A_CEVNTO_PERDA" ne '' then 
							CEVNTO_PERDA = "&A_CEVNTO_PERDA";
						end;
						%put "*************** Status &A_RSTATUS atualizado com sucesso **************";
					run;
					%mensagem(_tipoMsg=MENSAGEM:, _corTipoMsg=green, _msg=Status &A_RSTATUS atualizado com sucesso);
				%end;
			%end;
	%end;
/*EXCLUSÃO*/
	%else %if &E_RSTATUS ne  %then %do;
				proc sql noprint;
				select RSTATUS into: comp_e
				from stp.TREGRA_DBDN where RSTATUS="&E_RSTATUS";
				quit;
			%if &comp_e = %then %do;
				%put "********** Status &E_RSTATUS não existe na tabela ***********";
				%mensagem(_tipoMsg=ALERTA:, _corTipoMsg=red, _msg=Status &E_RSTATUS não existe na tabela);
			%end;
			%else %do;
		 	proc sql;
			    delete from stp.TREGRA_DBDN where RSTATUS="&E_RSTATUS";
				%put "********** Status &E_RSTATUS excluido com sucesso ***********";
				quit;
				%mensagem(_tipoMsg=MENSAGEM:, _corTipoMsg=green, _msg=Status &E_RSTATUS excluido com sucesso);
			%end;
	%end;
%mend;
	%macro mensagem(_tipoMsg=, _corTipoMsg=, _msg=);
	data mensagem;
		Mensagem="&_tipoMsg &_msg";
	run;
	proc print data=mensagem noobs;
	run;
	%mend mensagem;
%formulario;

*  Begin EG generated code (do not edit this line);
;*';*";*/;quit;
%STPEND;

*  End EG generated code (do not edit this line);

