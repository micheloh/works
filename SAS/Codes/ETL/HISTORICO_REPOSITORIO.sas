/**************************************************************************** 
 * Job:             HISTORICO_REPOSITORIO                 A5J3RISO.AA00003N * 
 * Description:                                                             * 
 *                                                                          * 
 * Metadata Server: au-fx-ap-001                                            * 
 * Port:            8562                                                    * 
 * Location:        /Risco                                                  * 
 *                   Operacional/EGRC/Produtivo/02_Repositorio/03_Jobs      * 
 *                                                                          * 
 * Server:          SASApp                                A5OWOFMB.AR000002 * 
 *                                                                          * 
 * Source Tables:   TGPAP_HIST - EGRC.TGPAP_HIST          A5J3RISO.AQ0000B6 * 
 *                  HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 *                  BBI_HIST - EGRC.BBI_HIST              A5J3RISO.AQ0000A6 * 
 *                  TBRAM_HIST - EGRC.TBRAM_HIST          A5J3RISO.AQ0000B1 * 
 *                  HIST_SGRE - EGRC.HIST_SGRE            A5J3RISO.AQ0000AI * 
 *                  TAMEX_HIST - EGRC.TAMEX_HIST          A5J3RISO.AQ0000AU * 
 *                  HistoricoBradescard_P1 -              A5J3RISO.AQ0000AJ * 
 *                   EGRC.TCATAO_Bradescard_P1_HIST                         * 
 *                  AGORA_CORRETORA_HIST -                A5J3RISO.AQ0000A5 * 
 *                   EGRC.AGORA_CORRETORA_HIST                              * 
 *                  HistoricoCartoesFidelity -            A5J3RISO.AQ0000AK * 
 *                   EGRC.TCARTOES_FIDELITY                                 * 
 *                  BRAD_CORRETORA_HIST -                 A5J3RISO.AQ0000AG * 
 *                   EGRC.BRAD_CORRETORA_HIST                               * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  BRAD PROM JURID HIST -                A5J3RISO.AQ0000AD * 
 *                   EGRC.tbrad_prom_jur_hist                               * 
 *                  BRAD PROM FRAUDE HIST -               A5J3RISO.AQ0000AC * 
 *                   EGRC.tbrad_promo_fraude_hist                           * 
 *                  Brad Finan Fraude HIST -              A5J3RISO.AQ0000A7 * 
 *                   EGRC.tbrad_finan_fraud_hist                            * 
 *                  TBRAD_FINAN_JUR_HIST -                A5J3RISO.AQ0000AY * 
 *                   EGRC.tbrad_financ_jur_hist                             * 
 *                  HistoricoGrupoSeguradorTrabalhista -  A5J3RISO.AQ0000AL * 
 *                   EGRC.TGRSETR_HIST                                      * 
 *                  BRAD_P2_JURID_HIST -                  A5J3RISO.AQ0000AH * 
 *                   EGRC.tbrad_p2_jurd_hist                                * 
 *                  TBradescar_p2_Fraude_hist -           A5J3RISO.AQ0000AZ * 
 *                   EGRC.tbradescar_p2_fraude_hist                         * 
 *                  Brad Financ Trab STBY -               A5J3RISO.AQ0000A9 * 
 *                  CTRL_SB.tbrad_finan_jurid_trab_hon_                     * 
 *                  stby                                                    * 
 *                  JurHoTrBANKPAR_stby -                 A5J3RISO.AQ0000AP * 
 *                   CTRL_SB.JurHoTrBANKPAR_stby                            * 
 *                  JurHoTrTEMPO_stby -                   A5J3RISO.AQ0000AQ * 
 *                   CTRL_SB.JurHoTrTEMPO_stby                              * 
 *                  BRAD PROM TRAB HON STBY -             A5J3RISO.AQ0000AE * 
 *                  CTRL_SB.tbrad_prom_jurid_trab_hon_s                     * 
 *                  tby                                                     * 
 *                  JuridicoTrabalhistaHonorarioStandby - A5J3RISO.AQ0000AS * 
 *                   CTRL_SB.TJURID_TRABA_HONOR_STAND                       * 
 *                  BRAD P2 STBY -                        A5J3RISO.AQ0000AA * 
 *                   CTRL_SB.tbrad_p2_civ_stby                              * 
 *                  BRAD PROM CIVEL HON STBY -            A5J3RISO.AQ0000AB * 
 *                  CTRL_SB.tbrad_prom_jurid_civel_hon_                     * 
 *                  stby                                                    * 
 *                  JurHoCiBANKPAR_STBY -                 A5J3RISO.AQ0000AN * 
 *                   CTRL_SB.JurHoCiBANKPAR_STBY                            * 
 *                  JurHoCiTEMPO_STBY -                   A5J3RISO.AQ0000AO * 
 *                   CTRL_SB.JurHoCiTEMPO_STBY                              * 
 *                  Brad Financ Civel STBY -              A5J3RISO.AQ0000A8 * 
 *                  CTRL_SB.tbrad_finan_jurid_civel_hon                     * 
 *                  _stby                                                   * 
 *                  JuridicoCivelHonorarioStandby -       A5J3RISO.AQ0000AR * 
 *                   CTRL_SB.TJURID_CIVEL_HONOR_STAND                       * 
 *                  TGRUPO_SEG_TRAB_STBY -                A5J3RISO.AQ0000B7 * 
 *                   CTRL_SB.TGRUPO_SEG_TRAB_STBY                           * 
 *                  TREEM_CARTAO_DEB_HIST -               A5J3RISO.AQ0000BC * 
 *                   EGRC.TREEM_CARTAO_DEB_HIST                             * 
 *                  TREEM_CARTAO_CRED_HIST -              A5J3RISO.AQ0000BB * 
 *                   EGRC.TREEM_CARTAO_CRED_HIST                            * 
 *                  TREF_SEGURANCA_HIST -                 A5J3RISO.AQ0000BD * 
 *                   EGRC.TREF_SEGURANCA_HIST                               * 
 *                  TPLAN_SEGURANCA_HIST -                A5J3RISO.AQ0000BA * 
 *                   EGRC.TPLAN_SEGURANCA_HIST                              * 
 *                  TFRET_CARRET_DSTN_HIST -              A5J3RISO.AQ0000B4 * 
 *                   EGRC.TFRET_CARRET_DSTN_HIST                            * 
 *                  TPATRIM_AQUISICAO_HIST -              A5J3RISO.AQ0000B8 * 
 *                   EGRC.TPATRIM_AQUISICAO_HIST                            * 
 *                  TPATRIM_RO_HIST -                     A5J3RISO.AQ0000B9 * 
 *                   EGRC.TPATRIM_RO_HIST                                   * 
 *                  TDBDN_HIST - EGRC.TDBDN_HIST          A5J3RISO.AQ0000B3 * 
 *                  TBRAD_EXPR_PA_HIST -                  A5J3RISO.AQ0000AX * 
 *                   EGRC.TBRAD_EXPR_PA_HIST                                * 
 *                  T_LEAS_CIPRINC_HIST -                 A5J3RISO.AQ0000AT * 
 *                   EGRC.t_leas_ciprinc_hist                               * 
 *                  TDBDN_BDN_HIST - EGRC.TDBDN_BDN_HIST  A5J3RISO.AQ0000B2 * 
 *                  TBRADESCARD CBSS CIVEL HIST -         A5J3RISO.AQ0000B0 * 
 *                   EGRC.TBRADESCARD_CBSS_CIVEL_HIST                       * 
 *                  BRAD_CBSS_JURID_HIST -                A5J3RISO.AQ0000AF * 
 *                   EGRC.BRAD_CBSS_JURID_HIST                              * 
 *                  TAUX_DOENCA_HIST -                    A5J3RISO.AQ0000AW * 
 *                   EGRC.TAUX_DOENCA_HIST                                  * 
 *                  TGBS_MULTAS_FRA_HIST -                A5J3RISO.AQ0000B5 * 
 *                   EGRC.TGBS_MULTAS_FRA_HIST                              * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 *                  TBRAD_FINAN_JUR_HIST -                A5J3RISO.AQ0000AY * 
 *                   EGRC.tbrad_financ_jur_hist                             * 
 *                  TBRAD_FINAN_JUR_HIST -                A5J3RISO.AQ0000AY * 
 *                   EGRC.tbrad_financ_jur_hist                             * 
 *                  BRAD_P2_JURID_HIST -                  A5J3RISO.AQ0000AH * 
 *                   EGRC.tbrad_p2_jurd_hist                                * 
 *                  BRAD_P2_JURID_HIST -                  A5J3RISO.AQ0000AH * 
 *                   EGRC.tbrad_p2_jurd_hist                                * 
 *                  BRAD PROM JURID HIST -                A5J3RISO.AQ0000AD * 
 *                   EGRC.tbrad_prom_jur_hist                               * 
 *                  TGPAP_HIST - EGRC.TGPAP_HIST          A5J3RISO.AQ0000B6 * 
 *                  HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 *                  HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 *                  HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 *                  TPLCC_SAS_HIST - EGRC.TPLCC_SAS_HIST  A5J3RISO.AQ0000BF * 
 *                  TSGRE_TRANSACOES_HIST -               A5J3RISO.AQ0000BG * 
 *                   EGRC.TSGRE_TRANSACOES_HIST                             * 
 *                  HIST_SGRE - EGRC.HIST_SGRE            A5J3RISO.AQ0000AI * 
 * Target Table:    TREP_PERDAS_OP -                      A5J3RISO.AQ00007W * 
 *                   RO_REP.TREP_PERDAS_OP                                  * 
 *                                                                          * 
 * Generated on:    Terça-feira, 3 de Novembro de 2015 11h34min41s BRST     * 
 * Generated by:    l970882                                                 * 
 * Version:         SAS Data Integration Studio 4.6                         * 
 ****************************************************************************/ 

/* General macro variables  */ 
%let jobID = %quote(A5J3RISO.AA00003N);
%let etls_jobName = %nrquote(HISTORICO_REPOSITORIO);
%let etls_userID = %nrquote(l970882);

/* Setup to capture return codes  */ 
%global job_rc trans_rc sqlrc ;
%let sysrc = 0;
%let job_rc = 0;
%let trans_rc = 0;
%let sqlrc = 0;
%global etls_stepStartTime; 
/* initialize syserr to 0 */
data _null_; run;

%macro rcSet(error); 
   %if (&error gt &trans_rc) %then 
      %let trans_rc = &error;
   %if (&error gt &job_rc) %then 
      %let job_rc = &error;
%mend rcSet; 

%macro rcSetDS(error); 
   if &error gt input(symget('trans_rc'),12.) then 
      call symput('trans_rc',trim(left(put(&error,12.))));
   if &error gt input(symget('job_rc'),12.) then 
      call symput('job_rc',trim(left(put(&error,12.))));
%mend rcSetDS; 

/* Create metadata macro variables */
%let IOMServer      = %nrquote(SASApp);
%let metaPort       = %nrquote(8562);
%let metaServer     = %nrquote(au-fx-ap-001);

/* Set metadata options */
options metaport       = &metaPort 
        metaserver     = "&metaServer"; 

/* Setup for capturing job status  */ 
%let etls_startTime = %sysfunc(datetime(),datetime.);
%let etls_recordsBefore = 0;
%let etls_recordsAfter = 0;
%let etls_lib = 0;
%let etls_table = 0;

%global etls_debug; 
%macro etls_setDebug; 
   %if %str(&etls_debug) ne 0 %then 
      OPTIONS MPRINT%str(;); 
%mend; 
%etls_setDebug; 

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001A5 * 
 * Transform:       Extract                                                 * 
 * Description:     PLCCRO                                                  * 
 *                                                                          * 
 * Source Table:    TGPAP_HIST - EGRC.TGPAP_HIST          A5J3RISO.AQ0000B6 * 
 * Target Table:    Extract - work.W34SR1R0               A5J3RISO.AI0001F9 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001A5);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

/* Access the data for EGRC_HISTORICO  */ 
LIBNAME EGRC BASE "/RODATAPRD/ROQUALITATIVO/EGRC/DADOS/CARGA/TABELA/HISTORICO";
%rcSet(&syslibrc); 

%let SYSLAST = %nrquote(EGRC.TGPAP_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W34SR1R0;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W34SR1R0 as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CGRP_ATGDO_PERDA,
         CIDTFD_CNTRL,
         ('GPAP') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TGPAP_HIST') as ITAB length = 50,
         RHIST length = 3410   
            informat = $3410.,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('INSPETORIA GPAP') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR length = 3,
         COD_LACTO,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('PLCCRO') as IARQUIVO_LEGADO length = 255,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA
   from &SYSLAST
      where CIDTFD_CNTRL CONTAINS("PLCCGPAP")
   ;
quit;

%let SYSLAST = work.W34SR1R0;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001A6 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    JurHoTrTEMPO_stby -                   A5J3RISO.AQ0000AQ * 
 *                   CTRL_SB.JurHoTrTEMPO_stby                              * 
 * Target Table:    Extract - work.W1IQDCS                A5J3RISO.AI0001FA * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001A6);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

/* Access the data for EGRC_CONTROLE_STANDBY  */ 
LIBNAME CTRL_SB BASE "/RODATAPRD/ROQUALITATIVO/EGRC/DADOS/CARGA/CONTROLE/STANDBY";
%rcSet(&syslibrc); 

%let SYSLAST = %nrquote(CTRL_SB.JurHoTrTEMPO_stby); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1IQDCS;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W1IQDCS as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         (IFN(VPERDA<0,VPERDA*-1,VPERDA)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (ifc(VPERDA<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DAJUIZ as DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRT   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO as CJUN_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            label = 'cdIdentificadorCentral',
         ('AMEX') as Origem length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         CJUNC_DSTNO,
         CEMPR,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         CCORRL,
         CEMPR_CIVEL,
         CDEPDC
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1IQDCS;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001A7 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Extract - work.W1IQDCS                A5J3RISO.AI0001FA * 
 * Target Table:    Extract - work.W1IQPMR                A5J3RISO.AI0001FB * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CDEPDC is too short for the specified source * 
 *  column CDEPDC.  Values will be truncated.                               * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001A7);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(work.W1IQDCS); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1IQPMR;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CDEPDC is too short"
        " for the specified source column CDEPDC.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1IQPMR as
      select
         CDEPDC length = 5   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL length = 5,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRT as CCORRL,
         CJUN_DSTNO as CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CGRP_ATGDO_PERDA,
         CIDTFD_CNTRL   
            format = $30.
            informat = $30.,
         Origem,
         ('TRAB') as ID_BASE length = 8,
         ('JurHoTrTEMPO_stby') as ITAB length = 50,
         CGCPJ,
         DDESCB,
         ('AMEX JURÍDICO TRABALHISTA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CCORRT,
         CJUN_DSTNO,
         CEMPR,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         CEMPR_CIVEL,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("HONORARIOS_TRABALHISTA_TEMPO") as IARQUIVO_LEGADO length = 255,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1IQPMR;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001A8 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    BRAD PROM TRAB HON STBY -             A5J3RISO.AQ0000AE * 
 *                  CTRL_SB.tbrad_prom_jurid_trab_hon_s                     * 
 *                  tby                                                     * 
 * Target Table:    Extract - work.W1JXHMU                A5J3RISO.AI0001FC * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001A8);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.tbrad_prom_jurid_trab_hon_stby); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1JXHMU;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1JXHMU as
      select
         CRZ_CTBIL length = 5,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         (IFN(VPERDA<0,VPERDA*-1,VPERDA)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (IFC(VPERDA<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DAJUIZ as DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         ('BRADESCO PROMOTORA') as Origem length = 50,
         ('TRAB') as ID_BASE length = 8,
         ('TBMCTR_STBY') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCO PROMOTORA TRABALHISTA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR length = 3,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         CEMPR_CIVEL,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_PROM_TRAB") as IARQUIVO_LEGADO length = 255,
         CDEPDC,
         CIDTFD_CNTRL,
         CCORRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1JXHMU;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001A9 * 
 * Transform:       Extract                                                 * 
 * Description:     TRAB_HON                                                * 
 *                                                                          * 
 * Source Table:    HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 * Target Table:    Extract - work.W34YQS6O               A5J3RISO.AI0001FD * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001A9);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TJURIDICO); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W34YQS6O;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W34YQS6O as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         (Compress(put(CGCPJ,10.)||"4040"||"BCOTRAB")) as CIDTFD_CNTRL length = 50
            format = $50.
            informat = $50.
            label = 'cdIdentificadorCentral',
         ('BANCO BRADESCO') as Origem length = 50,
         (substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)) as ID_BASE length = 8,
         ('TJURIDICO') as ITAB length = 50,
         CGCPJ,
         DDESCB,
         ('JURÍDICO BRADESCO ' || ifc(substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)='CIVEL','CÍVEL','TRABALHISTA')) as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         IENVDO,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         CCLASF_ENVDO length = 3,
         CCPF_CNPJ,
         IRECMT,
         CEMPR length = 3,
         REMPR,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("TRAB_HON") as IARQUIVO_LEGADO length = 255,
         CDEPDC,
         CCORRL,
         CSGMTO,
         RHIST length = 3410
   from &SYSLAST
      where CCORRL = 4040 & CRZ_CTBIL ^= "526" & CCTA_CTBIL ^= "90001" & CIDTFD_CNTRL CONTAINS("TRAB")
   ;
quit;

%let SYSLAST = work.W34YQS6O;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AA * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    BBI_HIST - EGRC.BBI_HIST              A5J3RISO.AQ0000A6 * 
 * Target Table:    Extract - work.W2GZ66                 A5J3RISO.AI0001FE * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AA);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.BBI_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2GZ66;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W2GZ66 as
      select
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 30   
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BBI') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('BBI_HIST') as ITAB length = 50,
         RHIST length = 3410   
            informat = $3410.,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BBI') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CFUNC,
         CSECAO,
         CCORRL2,
         COSIF,
         CLANC,
         (TRIM(LEFT(PUT(CCPF_CNPJ,BEST32.)))) as CCPF_CNPJ length = 15
            format = $15.
            informat = $15.,
         CBOLSA,
         SEG_CTVM,
         ASSESSOR,
         MESA_OPER,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('BBI') as IARQUIVO_LEGADO length = 255,
         CCORRL,
         CDEPDC,
         CTIPO_PERDA length = 2,
         CJUNC_DSTNO
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W2GZ66;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AB * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TBRAM_HIST - EGRC.TBRAM_HIST          A5J3RISO.AQ0000B1 * 
 * Target Table:    Extract - work.W6094K                 A5J3RISO.AI0001FF * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AB);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TBRAM_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W6094K;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W6094K as
      select
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BRAM') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TBRAM_HIST') as ITAB length = 50,
         RHIST length = 3410   
            informat = $3410.,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BRAM') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CCPF_CNPJ,
         CHIST_PERDA,
         CPROD,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('BRAM') as IARQUIVO_LEGADO length = 255,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W6094K;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AC * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    HIST_SGRE - EGRC.HIST_SGRE            A5J3RISO.AQ0000AI * 
 * Target Table:    Extract - work.W7Q5R5                 A5J3RISO.AI0001FG * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AC);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.HIST_SGRE); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W7Q5R5;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W7Q5R5 as
      select
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CLIN_NEGOC   
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         ('SEGURANÇA CORPORATIVA') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('HIST_SGRE') as ITAB length = 50,
         RHIST length = 3410   
            informat = $3410.,
         DDESCB   
            label = 'dtDescoberta',
         ('SGRE') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CCTA_CLIE,
         VREEMB_BDN,
         VREEMB,
         VENC_BDN,
         VENC_TRANS,
         VCPMF_TRANS,
         CPEDIDO,
         CTP_CTA_BDN,
         CTP_OCORR_BDN,
         CAG_CLIE,
         CMAQUINA,
         CLOC_EQUIP,
         CELAB_BO,
         CAUX_TERC,
         CFORM_REEB_BDN,
         CCPMF_BDN,
         CREINCIDENTE,
         CEMPR length = 3,
         CTP_EQUIP,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("SGREROCI") as IARQUIVO_LEGADO length = 255,
         CSGMTO,
         CCORRL,
         CJUNC_DSTNO,
         CDEPDC,
         CIDTFD_CNTRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W7Q5R5;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AD * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TAMEX_HIST - EGRC.TAMEX_HIST          A5J3RISO.AQ0000AU * 
 * Target Table:    Extract - work.W8OIWI                 A5J3RISO.AI0001FH * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AD);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEX_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W8OIWI;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: Origem, DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W8OIWI as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CIDTFD_CNTRL   
            informat = $30.,
         "" as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TAMEX_HIST') as ITAB length = 50,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('AMEX FRAUDE') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         (TRIM(LEFT(PUT(NCATAO,BEST32.)))) as NCATAO length = 16
            format = $16.
            informat = $16.
            label = 'nrCartao',
         CPRODU,
         RPRODU,
         RTIPO_FRAUD,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('AMEX_FRAUDE') as IARQUIVO_LEGADO length = 255,
         CCAUSA_ATGDO_PERDA,
         CCORRL,
         CDEPDC,
         CJUNC_DSTNO,
         CSGMTO,
         CSGRP_ATGDO_PERDA,
         CTIPO_FRAUD
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W8OIWI;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AE * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    HistoricoBradescard_P1 -              A5J3RISO.AQ0000AJ * 
 *                   EGRC.TCATAO_Bradescard_P1_HIST                         * 
 * Target Table:    Extract - work.WBUP0F                 A5J3RISO.AI0001FI * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCAUSA_ATGDO_PERDA is too short for the     * 
 *  specified source column CCAUSA_ATGDO_PERDA.  Values will be truncated.  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AE);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TCATAO_Bradescard_P1_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WBUP0F;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCAUSA_ATGDO_PERDA is"
        " too short for the specified source column CCAUSA_ATGDO_PERDA. "
        " Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WBUP0F as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CLIN_NEGOC,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CIDTFD_CNTRL   
            informat = $30.,
         ('BANCO BRADESCO CARTOES') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TCARTOES_SUCO') as ITAB length = 50,
         DDESCB   
            label = 'dtDescoberta',
         ('BRADESCARD P1') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         NCATAO,
         DARQUI,
         CBIN_CATAO,
         (INPUT(CTIPO_FRAUD,BEST32.)) as CTIPO_FRAUD length = 3
            label = 'cdTipoFraude',
         CEMPR length = 3,
         CCPF_CNPJ,
         IUF,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('Bradescard_P1') as IARQUIVO_LEGADO length = 255,
         CCORRL,
         CDEPDC,
         CSGMTO,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CJUNC_DSTNO
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WBUP0F;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AF * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    AGORA_CORRETORA_HIST -                A5J3RISO.AQ0000A5 * 
 *                   EGRC.AGORA_CORRETORA_HIST                              * 
 * Target Table:    Extract - work.WGKF05                 A5J3RISO.AI0001FJ * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCPF_CNPJ is too short for the specified    * 
 *  source column CCPF_CNPJ.  Values will be truncated.                     * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AF);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.AGORA_CORRETORA_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WGKF05;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCPF_CNPJ is too short"
        " for the specified source column CCPF_CNPJ.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WGKF05 as
      select
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CLIN_NEGOC,
         CEVNTO_PERDA   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA   
            format = $8.
            informat = $8.,
         ('AGORA CORRETORA') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('AGORA_CORRETORA_HIST') as ITAB length = 50,
         RHIST   
            informat = $3410.,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('AGORA CORRETORA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CFUNCI,
         CCPF_CNPJ length = 15,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8
            label = 'Data Referencia Arquivo Legado (AAAAMM)',
         ('AGORACORRETAGEM') as IARQUIVO_LEGADO length = 255,
         CCORRL,
         CDEPDC,
         CJUNC_DSTNO,
         CSGMTO,
         CIDTFD_CNTRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WGKF05;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AG * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    HistoricoCartoesFidelity -            A5J3RISO.AQ0000AK * 
 *                   EGRC.TCARTOES_FIDELITY                                 * 
 * Target Table:    Extract - work.WHQ1H2                 A5J3RISO.AI0001FK * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column RPRODU is too short for the specified source * 
 *  column RPRODU.  Values will be truncated.                               * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AG);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TCARTOES_FIDELITY); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WHQ1H2;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RPRODU is too short"
        " for the specified source column RPRODU.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WHQ1H2 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CIDTFD_CNTRL length = 50   
            format = $30.
            informat = $30.,
         ('BANCO BRADESCO CARTOES') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TCARTOES_FIDELITY') as ITAB length = 50,
         IPAIS_TRANS,
         DDESCB,
         ('CARTÕES FIDELITY') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CCPF_CNPJ length = 15,
         CBANDE,
         (INPUT(CPRODU,BEST32.)) as CPRODU length = 8
            label = 'cdProduto',
         RPRODU length = 30,
         (TRIM(LEFT(PUT(CBIN_CATAO,BEST32.)))) as CBIN_CATAO length = 3
            format = $3.
            informat = $3.
            label = 'cdBinCartao',
         NCATAO,
         CSTUS,
         ICIDAD_CLINT,
         IESTAD_CLINT,
         CTRANS,
         RTIPO_TRANS,
         CESTAB_TRANS,
         ICIDAD_ESTAB,
         IESTAD_ESTAB,
         CMOTVO_CANC length = 3,
         CFLAG_SEG,
         CSEQ_REGIS,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("FIALTFR") as IARQUIVO_LEGADO length = 255,
         NREF,
         CCATEG_ESTAB
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WHQ1H2;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AH * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    BRAD_CORRETORA_HIST -                 A5J3RISO.AQ0000AG * 
 *                   EGRC.BRAD_CORRETORA_HIST                               * 
 * Target Table:    Extract - work.WK4M6I                 A5J3RISO.AI0001FL * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AH);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.BRAD_CORRETORA_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WK4M6I;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WK4M6I as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CIDTFD_CNTRL   
            format = $30.
            informat = $30.,
         ('BRADESCO CORRETORA') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('BRAD_CORRETORA_HIST') as ITAB length = 50,
         RHIST   
            informat = $3410.,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BRADESCO CORRETORA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CFUNCI,
         CCPF_CNPJ,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('BRADESCO_CORRETORA') as IARQUIVO_LEGADO length = 255,
         CDEPDC,
         CSGMTO,
         CJUNC_DSTNO
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WK4M6I;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AI * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract - work.WM2LZ8                 A5J3RISO.AI0001FM * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AI);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WM2LZ8;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WM2LZ8 as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            format = $35.
            informat = $35.
            label = 'cdIdentificadorCentral',
         ('AMEX') as Origem length = 50,
         (substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)) as ID_BASE length = 8,
         ('TAMEXJURID_HIST') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('AMEX JURÍDICO ' || ifc(substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)='CIVEL','CÍVEL','TRABALHISTA')) as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR length = 3,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('AMEX_FRAUDE') as IARQUIVO_LEGADO length = 255,
         CDEPDC,
         CTIPO_ACAO length = 4,
         CSBTPO_ACAO length = 3,
         RHIST length = 3410,
         CCORRL,
         CTIPO_PERDA
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WM2LZ8;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AJ * 
 * Transform:       Extract                                                 * 
 * Description:     BRAD_PROM_CIVEL                                         * 
 *                                                                          * 
 * Source Table:    BRAD PROM JURID HIST -                A5J3RISO.AQ0000AD * 
 *                   EGRC.tbrad_prom_jur_hist                               * 
 * Target Table:    Extract - work.WNF0OC                 A5J3RISO.AI0001FN * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AJ);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_prom_jur_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WNF0OC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WNF0OC as
      select
         CRZ_CTBIL   
            format = $4.
            informat = $4.,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 40   
            format = $40.
            informat = $40.
            label = 'cdIdentificadorCentral',
         ('BRADESCO PROMOTORA') as Origem length = 50,
         (substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)) as ID_BASE length = 8,
         ('BMC_JUR_HIST') as ITAB length = 50,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCO PROMOTORA ' || ifc(substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)='CIVEL','CÍVEL','TRABALHISTA')) as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR length = 3,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VPERDA_RCUPC,
         VDESP_VDDOR,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_PROM_CIVEL") as IARQUIVO_LEGADO length = 255,
         CJUNC_DSTNO,
         CDEPDC,
         CTIPO_ACAO length = 4,
         CSBTPO_ACAO length = 3,
         CTIPO_PERDA length = 2,
         CSGMTO,
         CCORRL,
         RHIST length = 3410
   from &SYSLAST
      where CIDTFD_CNTRL CONTAINS("BMCCIVEL")
   ;
quit;

%let SYSLAST = work.WNF0OC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AK * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    BRAD PROM FRAUDE HIST -               A5J3RISO.AQ0000AC * 
 *                   EGRC.tbrad_promo_fraude_hist                           * 
 * Target Table:    Extract - work.WPWH52                 A5J3RISO.AI0001FO * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AK);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_promo_fraude_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WPWH52;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WPWH52 as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA   
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         ('BRADESCO PROMOTORA') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TBMC_FRAUDE_HIST') as ITAB length = 50,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BRADESCO PROMOTORA FRAUDE') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         NOper,
         CCPF_CNPJ,
         CPROM,
         IMUN,
         IUF,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_PROM_FRAUDE") as IARQUIVO_LEGADO length = 255,
         CJUNC_DSTNO,
         CIDTFD_CNTRL,
         CDEPDC,
         CCORRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WPWH52;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AL * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Brad Finan Fraude HIST -              A5J3RISO.AQ0000A7 * 
 *                   EGRC.tbrad_finan_fraud_hist                            * 
 * Target Table:    Extract - work.WS6HAX                 A5J3RISO.AI0001FP * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCPF_CNPJ is too short for the specified    * 
 *  source column CCPF_CNPJ.  Values will be truncated.                     * 
 * Mapping of the target column CTIPO_FRAUD is too short for the specified  * 
 *  source column CTIPO_FRAUD.  Values will be truncated.                   * 
 * Mapping of the target column CLIN_NEGOC is too short for the specified   * 
 *  source column CLIN_NEGOC.  Values will be truncated.                    * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AL);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_finan_fraud_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WS6HAX;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCPF_CNPJ is too short"
        " for the specified source column CCPF_CNPJ.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_FRAUD is too"
        " short for the specified source column CTIPO_FRAUD.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CLIN_NEGOC is too"
        " short for the specified source column CLIN_NEGOC.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WS6HAX as
      select
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA   
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         ('BRADESCO FINANCIAMENTOS') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('FINASA_FRAUDE_HIST') as ITAB length = 50,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BRADESCO FINANCIAMENTOS FRAUDE') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CFUNCI,
         CPRODU,
         CCANAL_ATEND,
         CREGIS_CORRT,
         CEMPR length = 3,
         DCONTR,
         CCPF_CNPJ length = 15   
            format = $15.
            informat = $15.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('BRADFINAN_FRAUDE') as IARQUIVO_LEGADO length = 255,
         CDEPDC,
         RHIST_OCORR,
         CTIPO_FRAUD length = 3   
            format = 3.
            informat = 3.,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC length = 3   
            format = $3.
            informat = $3.,
         CCORRL,
         CIDTFD_CNTRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WS6HAX;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AM * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TBRAD_FINAN_JUR_HIST -                A5J3RISO.AQ0000AY * 
 *                   EGRC.tbrad_financ_jur_hist                             * 
 * Target Table:    Extract - work.WUHF63                 A5J3RISO.AI0001FQ * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column NPROCS is too short for the specified source * 
 *  column NPROCS.  Values will be truncated.                               * 
 * Mapping of the target column RMOTVO_BAIXA is too short for the specified * 
 *  source column RMOTVO_BAIXA.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AM);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_financ_jur_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WUHF63;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column NPROCS is too short"
        " for the specified source column NPROCS.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RMOTVO_BAIXA is too"
        " short for the specified source column RMOTVO_BAIXA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WUHF63 as
      select
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         (COALESCE(DOCORR ,DCTBIL )) as DOCORR length = 8
            format = DDMMYY10.
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         ('BRADESCO FINANCIAMENTOS') as Origem length = 50,
         (substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)) as ID_BASE length = 8,
         ('TFINASA_PROM_JUR_HIST') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BRADESCO FINANCIAMENTOS ' || ifc(substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)='CIVEL','CÍVEL','TRABALHISTA')) as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR length = 3,
         REMPR,
         RDEPDC,
         IRECLA,
         (INPUT(CCLASF_ENVDO,BEST32.)) as CCLASF_ENVDO length = 3
            format = 1.
            informat = 1.
            label = 'CLASSIFICACAO_RECLAMANTE',
         NRO_DOCUMENTO,
         TIPO_ENVOLVIMENTO,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         NPROCS length = 20,
         DBAIXA,
         CBAIXA,
         RMOTVO_BAIXA length = 35,
         VBAIXA,
         TPDESP,
         DCAD,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_FIN_CIVEL") as IARQUIVO_LEGADO length = 255,
         CDEPDC,
         CTIPO_ACAO length = 4   
            format = 4.
            informat = 4.,
         CSBTPO_ACAO length = 3,
         CJUNC_DSTNO,
         CCORRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WUHF63;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AN * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    HistoricoGrupoSeguradorTrabalhista -  A5J3RISO.AQ0000AL * 
 *                   EGRC.TGRSETR_HIST                                      * 
 * Target Table:    Extract - work.WW42K1                 A5J3RISO.AI0001FR * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AN);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TGRSETR_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WW42K1;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WW42K1 as
      select
         (IFN((CRECLA  > 9999 & CRECLA <= 19999)  |  CRECLA > 29999, CSEGUN_RECLA ,
            IFN(CRECLA  >= 20000 &  CRECLA <= 29999 ,CRECLA - 20000,CRECLA ))) as CDEPDC length = 5
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DCTBIL as DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CIDTFD_CNTRL,
         ('GRUPO SEGURADOR') as Origem length = 50,
         ('TRAB') as ID_BASE length = 8,
         ('HistoricoGrupoSeguradorTrabalhista') as ITAB length = 50,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCO SEGUROS TRABALHISTA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR length = 3,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VBAIXA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('BVPTRAB') as IARQUIVO_LEGADO length = 255,
         CGCPJ
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WW42K1;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AO * 
 * Transform:       Extract                                                 * 
 * Description:     Bradescar_P2_civhon                                     * 
 *                                                                          * 
 * Source Table:    BRAD_P2_JURID_HIST -                  A5J3RISO.AQ0000AH * 
 *                   EGRC.tbrad_p2_jurd_hist                                * 
 * Target Table:    Extract - work.WYTN1A                 A5J3RISO.AI0001FS * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AO);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_p2_jurd_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WYTN1A;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WYTN1A as
      select
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         ('BANCO BRADESCO CARTOES') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('TIBICIVEL_HIST') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCARD P2 '|| ifc(substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)='CIVEL','CÍVEL','TRABALHISTA')) as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR length = 3,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('Bradescard_P2_civhon') as IARQUIVO_LEGADO length = 255,
         CDEPDC,
         CSGMTO
   from &SYSLAST
      where CCORRL = 5404 & CCTA_CTBIL  ^= "8199910018" & CIDTFD_CNTRL CONTAINS("BRADP2CIVEL")
   ;
quit;

%let SYSLAST = work.WYTN1A;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AP * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TBradescar_p2_Fraude_hist -           A5J3RISO.AQ0000AZ * 
 *                   EGRC.tbradescar_p2_fraude_hist                         * 
 * Target Table:    Extract - work.W10AKLC                A5J3RISO.AI0001FT * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CJUNC_DSTNO is too short for the specified  * 
 *  source column CJUNC_DSTNO.  Values will be truncated.                   * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AP);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbradescar_p2_fraude_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W10AKLC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CJUNC_DSTNO is too"
        " short for the specified source column CJUNC_DSTNO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W10AKLC as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (INPUT(CTIPO_PERDA,$2.)) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DOCORR   
            label = 'cdOcorrencia',
         CCORRL   
            format = 4.
            informat = 4.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 4.
            informat = 4.
            label = 'cdJuncaoDestino',
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BANCO BRADESCO CARTOES') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TIBIFRAUDE_HIST') as ITAB length = 50,
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BRADESCARD P2 FRAUDE') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8
            format = 8.
            label = 'Data Referencia Arquivo Legado (AAAAMM)',
         ('BRADESCAR_P2_FR') as IARQUIVO_LEGADO length = 255
            format = $255.
            label = 'Nome Arquivo Legado',
         NCATAO,
         COSIF,
         RCTA,
         (put(CMOTVO_CANC, 3.)) as CMOTVO_CANC length = 3,
         CEMPR length = 3,
         REMPR,
         RLOCAL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W10AKLC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AQ * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Brad Financ Trab STBY -               A5J3RISO.AQ0000A9 * 
 *                  CTRL_SB.tbrad_finan_jurid_trab_hon_                     * 
 *                  stby                                                    * 
 * Target Table:    Extract - work.W3715W5X               A5J3RISO.AI0001FU * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AQ);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.tbrad_finan_jurid_trab_hon_stby); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W3715W5X;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W3715W5X as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         (ifn(VPERDA<0,VPERDA*-1,VPERDA)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (ifc(VPERDA<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         (COALESCE(DAJUIZ ,DCTBIL )) as DOCORR length = 8
            format = DDMMYY10.
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 30   
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BRADESCO FINANCIAMENTOS') as Origem length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         CJUNC_DSTNO,
         CEMPR,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         CDEPDC
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W3715W5X;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AR * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Extract - work.W3715W5X               A5J3RISO.AI0001FU * 
 * Target Table:    Extract - work.W371KSEP               A5J3RISO.AI0001FV * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CJUNC_DSTNO is too short for the specified  * 
 *  source column CJUNC_DSTNO.  Values will be truncated.                   * 
 * Mapping of the target column CDEPDC is too short for the specified source * 
 *  column CDEPDC.  Values will be truncated.                               * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AR);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(work.W3715W5X); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W371KSEP;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CDEPDC is too short"
        " for the specified source column CDEPDC.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CJUNC_DSTNO is too"
        " short for the specified source column CJUNC_DSTNO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: CCORRL, CCORRT, CJUN_DSTNO";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W371KSEP as
      select
         CDEPDC length = 5   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         . as CCORRL length = 4
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO,
         CLIN_NEGOC,
         CGRP_ATGDO_PERDA,
         CIDTFD_CNTRL,
         Origem,
         ('TRAB') as ID_BASE length = 8,
         ('JurHonTrabFinasa_STBY') as ITAB length = 50,
         CGCPJ,
         DDESCB,
         ('BRADESCO FINANCIAMENTOS TRABALHISTA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         . as CCORRT length = 4
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         . as CJUN_DSTNO length = 5
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CEMPR length = 3,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA length = 35   
            informat = $CHAR32.,
         VBAIXA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_FIN_TRAB") as IARQUIVO_LEGADO length = 255,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CEVNTO_PERDA
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W371KSEP;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AS * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    JurHoTrBANKPAR_stby -                 A5J3RISO.AQ0000AP * 
 *                   CTRL_SB.JurHoTrBANKPAR_stby                            * 
 * Target Table:    Extract - work.W375EFIS               A5J3RISO.AI0001FW * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AS);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.JurHoTrBANKPAR_stby); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W375EFIS;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W375EFIS as
      select
         (IFN((CRECLA  > 9999 & CRECLA <= 19999)  |  CRECLA > 29999, CSEGUN_RECLA ,
            IFN(CRECLA  >= 20000 &  CRECLA <= 29999 ,CRECLA - 20000,CRECLA ))) as CDEPDC length = 5
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         (IFN(VPERDA<0,VPERDA*-1,VPERDA)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         DAJUIZ as DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRT   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO as CJUN_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         ('AMEX') as Origem length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         CJUNC_DSTNO,
         CEMPR,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         RTIPO_PERDA,
         CCORRL,
         CEMPR_CIVEL,
         CTIPO_PERDA,
         CIDTFD_CNTRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W375EFIS;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AT * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Extract - work.W375EFIS               A5J3RISO.AI0001FW * 
 * Target Table:    Extract - work.W375EQ8G               A5J3RISO.AI0001FX * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column RRECLA is too short for the specified source * 
 *  column RRECLA.  Values will be truncated.                               * 
 * Mapping of the target column CIDTFD_CNTRL is too short for the specified * 
 *  source column CIDTFD_CNTRL.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AT);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(work.W375EFIS); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W375EQ8G;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CIDTFD_CNTRL is too"
        " short for the specified source column CIDTFD_CNTRL.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RRECLA is too short"
        " for the specified source column RRECLA.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W375EQ8G as
      select
         CDEPDC,
         CRZ_CTBIL length = 5,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         DOCORR,
         CCORRT as CCORRL,
         CJUN_DSTNO as CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CGRP_ATGDO_PERDA,
         CIDTFD_CNTRL length = 30   
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         Origem,
         ('TRAB') as ID_BASE length = 8,
         ('JurHoTrBANKPAR_stby') as ITAB length = 50,
         CGCPJ,
         DDESCB,
         ('AMEX JURÍDICO TRABALHISTA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CCORRT,
         CJUN_DSTNO,
         CEMPR,
         REMPR,
         CRECLA,
         RRECLA length = 50,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         RTIPO_PERDA,
         CEMPR_CIVEL,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("TRABALHISTA_HONORARIOS_BBC") as IARQUIVO_LEGADO length = 255,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W375EQ8G;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AU * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    JuridicoTrabalhistaHonorarioStandby - A5J3RISO.AQ0000AS * 
 *                   CTRL_SB.TJURID_TRABA_HONOR_STAND                       * 
 * Target Table:    Extract - work.W1MH5IP                A5J3RISO.AI0001FY * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column NPROCS is too short for the specified source * 
 *  column NPROCS.  Values will be truncated.                               * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AU);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.TJURID_TRABA_HONOR_STAND); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1MH5IP;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column NPROCS is too short"
        " for the specified source column NPROCS.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: CJUN_DSTNO";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1MH5IP as
      select
         (IFN((CRECLA  > 9999 & CRECLA <= 19999)  |  CRECLA > 29999, CSEGUN_RECLA ,
            IFN(CRECLA  >= 20000 &  CRECLA <= 29999 ,CRECLA - 20000,CRECLA ))) as CDEPDC length = 5
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         (IFN(VDESP_ACESS<0,VDESP_ACESS*-1,VDESP_ACESS)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (ifc(VDESP_ACESS<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DAJUIZ as DOCORR   
            format = DDMMYY10.
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         (compress(PUT(CGCPJ,20.) || PUT(4040 ,4.) || PUT('BCOTRAB',$4.))) as CIDTFD_CNTRL length = 30
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BANCO BRADESCO') as Origem length = 50,
         ('TRAB') as ID_BASE length = 8,
         ('TJURID_TRABA_HONOR_STAND') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('JURÍDICO BRADESCO TRABALHISTA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            format = 1.
            informat = 1.,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS length = 20,
         ICOMAR,
         IUF,
         VDESP_ACESS,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VBAIXA,
         CCARGA,
         . as CJUN_DSTNO length = 5,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("TRAB_HON") as IARQUIVO_LEGADO length = 255,
         CSGMTO
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1MH5IP;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AV * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    BRAD P2 STBY -                        A5J3RISO.AQ0000AA * 
 *                   CTRL_SB.tbrad_p2_civ_stby                              * 
 * Target Table:    Extract - work.W1RWILD                A5J3RISO.AI0001FZ * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AV);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.tbrad_p2_civ_stby); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1RWILD;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1RWILD as
      select
         CRZ_CTBIL length = 5   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         (IFN(VPERDA_RCUPC<0,VPERDA_RCUPC*-1,VPERDA_RCUPC)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (ifc(VPERDA_RCUPC<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         (COMPRESS(PUT(CGCPJ,20.) || PUT(5404,4.) || PUT('IBICIVEL',$8.))) as CIDTFD_CNTRL length = 30
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BANCO BRADESCO CARTOES') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('TIBICIV_HO_STBY') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCARD P2 CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         VPERDA_RCUPC,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('Bradescard_P2_civhon') as IARQUIVO_LEGADO length = 255,
         CDEPDC
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1RWILD;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AW * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    BRAD PROM CIVEL HON STBY -            A5J3RISO.AQ0000AB * 
 *                  CTRL_SB.tbrad_prom_jurid_civel_hon_                     * 
 *                  stby                                                    * 
 * Target Table:    Extract - work.W1WPEK2                A5J3RISO.AI0001G0 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AW);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.tbrad_prom_jurid_civel_hon_stby); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1WPEK2;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1WPEK2 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL length = 5,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         (IFN(VDESP_BDSCO<0,VDESP_BDSCO*-1,VDESP_BDSCO)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (IFC(VDESP_BDSCO<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            format = $35.
            informat = $35.
            label = 'cdIdentificadorCentral',
         ('BRADESCO PROMOTORA') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('TBMCCIVEL_STBY') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCO PROMOTORA CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR length = 3,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VPERDA_RCUPC,
         VDESP_BDSCO,
         VDESP_VDDOR,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_PROM_CIVEL") as IARQUIVO_LEGADO length = 255,
         CCORRL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1WPEK2;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AX * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    JurHoCiBANKPAR_STBY -                 A5J3RISO.AQ0000AN * 
 *                   CTRL_SB.JurHoCiBANKPAR_STBY                            * 
 * Target Table:    Extract - work.W28C4CU                A5J3RISO.AI0001G1 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AX);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.JurHoCiBANKPAR_STBY); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W28C4CU;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W28C4CU as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         (IFN(VDESP_BDSCO<0,VDESP_BDSCO*-1,VDESP_BDSCO)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (IFC(VDESP_BDSCO<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         (compress(PUT(CGCPJ,20.) || PUT(5202 ,4.) || PUT('AMEXCIVEL',$9.))) as CIDTFD_CNTRL length = 30
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('AMEX') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('JurHoCiBANKPAR_STBY') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('AMEX JURÍDICO CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('HONORARIOS_CIVEL_BBC') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W28C4CU;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AY * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    JurHoCiTEMPO_STBY -                   A5J3RISO.AQ0000AO * 
 *                   CTRL_SB.JurHoCiTEMPO_STBY                              * 
 * Target Table:    Extract - work.W2C9UK7                A5J3RISO.AI0001G2 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AY);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.JurHoCiTEMPO_STBY); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2C9UK7;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W2C9UK7 as
      select
         CRZ_CTBIL length = 5,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VDESP_BDSCO as VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (ifc(VDESP_BDSCO<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO length = 6   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         (compress(PUT(CGCPJ,20.) || PUT(5210 ,4.) || PUT('AMEXCIVEL',$9.))) as CIDTFD_CNTRL length = 30
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('AMEX') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('JurHoCiTEMPO_STBY') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('AMEX JURÍDICO CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_HONORARIOS_TEMPO") as IARQUIVO_LEGADO length = 255,
         CDEPDC
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W2C9UK7;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001AZ * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Brad Financ Civel STBY -              A5J3RISO.AQ0000A8 * 
 *                  CTRL_SB.tbrad_finan_jurid_civel_hon                     * 
 *                  _stby                                                   * 
 * Target Table:    Extract - work.W326OIY                A5J3RISO.AI0001G3 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column RMOTVO_BAIXA is too short for the specified * 
 *  source column RMOTVO_BAIXA.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001AZ);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.tbrad_finan_jurid_civel_hon_stby); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W326OIY;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RMOTVO_BAIXA is too"
        " short for the specified source column RMOTVO_BAIXA.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W326OIY as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         (ifn(VPERDA<0,VPERDA*-1,VPERDA)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (ifc(VPERDA<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 10   
            format = $14.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         (compress(PUT(CGCPJ,20.) || PUT(7290 ,4.) || PUT('FINCIVEL',$9.))) as CIDTFD_CNTRL length = 30
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BRADESCO FINANCIAMENTOS') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('JurHonCiFinasa_STBY') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCO FINANCIAMENTOS CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR length = 3,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         VBAIXA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_FIN_CIVEL") as IARQUIVO_LEGADO length = 255,
         RMOTVO_BAIXA length = 35,
         CTIPO_REGIS
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W326OIY;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B0 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    JuridicoCivelHonorarioStandby -       A5J3RISO.AQ0000AR * 
 *                   CTRL_SB.TJURID_CIVEL_HONOR_STAND                       * 
 * Target Table:    Extract - work.W3HYQVG                A5J3RISO.AI0001G4 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B0);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.TJURID_CIVEL_HONOR_STAND); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W3HYQVG;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W3HYQVG as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         (IFN(VDESP_BDSCO<0,VDESP_BDSCO*-1,VDESP_BDSCO)) as VPERDA_BDSCO length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (IFC(VDESP_BDSCO>0,'1','3')) as CTIPO_PERDA_BDSCO length = 2
            format = $2.
            informat = $2.,
         (IFN(VDESP_VDDOR<0,VDESP_VDDOR*-1,VDESP_VDDOR)) as VPERDA_VDDOR length = 8
            format = COMMAX17.2
            informat = 17.2,
         (IFC(VDESP_VDDOR>0,'1','3')) as CTIPO_PERDA_VDDOR length = 2
            format = $2.
            informat = $2.,
         DFATOR_GERDR as DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUNC_DSTNO as CCORRT   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO as CJUN_DSTNO length = 5   
            format = 5.
            informat = 5.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         (compress(PUT(CGCPJ,20.) || PUT(4040 ,4.) || PUT('BCOCIVEL',$5.))) as CIDTFD_CNTRL length = 30
            format = $30.
            informat = $30.
            label = 'cdIdentificadorCentral',
         ('BANCO BRADESCO') as Origem length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CJUNC_DSTNO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DFATOR_GERDR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         CCARGA,
         CSGMTO
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W3HYQVG;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Splitter                              A5J3RISO.AC0001B1 * 
 * Transform:       Splitter                                                * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Extract - work.W3HYQVG                A5J3RISO.AI0001G4 * 
 * Target Tables:   Splitter 0 - work.W3I2XC2             A5J3RISO.AI0001G5 * 
 *                  Splitter 1 - work.W3I2YJE             A5J3RISO.AI0001G6 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B1);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(work.W3HYQVG); 

proc datasets lib=work nolist nowarn memtype = (data view);
   delete W3I2XC2;
   delete W3I2YJE;
quit;

data 
     work.W3I2XC2
     work.W3I2YJE ;
   set &SYSLAST;
   if VPERDA_VDDOR  ^= 0 & VPERDA_VDDOR  ^= . then 
      output work.W3I2XC2;
   if VPERDA_BDSCO  ^= 0 & VPERDA_BDSCO  ^= . then 
      output work.W3I2YJE;
run;

%rcSet(&syserr); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete etls_mapped;
quit;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: CSGMTO";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.etls_mapped as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA_VDDOR,
         CTIPO_PERDA_VDDOR,
         DOCORR,
         CCORRT,
         CJUN_DSTNO,
         . as CSGMTO length = 6
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         Origem,
         VPERDA_BDSCO,
         CTIPO_PERDA_BDSCO,
         CGCPJ,
         DDESCB,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CJUNC_DSTNO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DFATOR_GERDR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         CCARGA
   from work.W3I2XC2
   ;
quit;

%let SYSLAST = work.etls_mapped;

data work.W3I2XC2;
  set work.etls_mapped;
run;

proc datasets lib = work nolist nowarn memtype = (data view);
   delete etls_mapped;
quit;

%rcSet(&syscc); 



/**  Step end Splitter **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B2 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Splitter 1 - work.W3I2YJE             A5J3RISO.AI0001G6 * 
 * Target Table:    Extract - work.W3I5VV0                A5J3RISO.AI0001G7 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B2);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(work.W3I2YJE); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W3I5VV0;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W3I5VV0 as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA_BDSCO as VPERDA,
         CTIPO_PERDA_BDSCO as CTIPO_PERDA,
         DOCORR,
         CCORRT,
         CJUN_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         Origem,
         ('CIVEL') as ID_BASE length = 8,
         ('TJURID_CIVEL_HONOR_STAND') as ITAB length = 50,
         CGCPJ,
         DDESCB,
         ('JURÍDICO BRADESCO CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         VPERDA_BDSCO,
         CTIPO_PERDA_BDSCO,
         VPERDA_VDDOR,
         CTIPO_PERDA_VDDOR,
         CJUNC_DSTNO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DFATOR_GERDR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         CCARGA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_HON") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W3I5VV0;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B3 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Splitter 0 - work.W3I2XC2             A5J3RISO.AI0001G5 * 
 * Target Table:    Extract - work.W3I5H6D                A5J3RISO.AI0001G8 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B3);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(work.W3I2XC2); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W3I5H6D;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W3I5H6D as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA_VDDOR as VPERDA   
            label = 'vrPerda',
         CTIPO_PERDA_VDDOR as CTIPO_PERDA,
         DOCORR,
         CCORRT,
         CJUN_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         Origem,
         ('CIVEL') as ID_BASE length = 8,
         ('TJURID_CIVEL_HONOR_STAND') as ITAB length = 50,
         CGCPJ,
         DDESCB,
         ('JURÍDICO BRADESCO CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         VPERDA_VDDOR,
         CTIPO_PERDA_VDDOR,
         VPERDA_BDSCO,
         CTIPO_PERDA_BDSCO,
         CJUNC_DSTNO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DFATOR_GERDR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         CCARGA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_HON") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W3I5H6D;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Append                                A5J3RISO.AC0001B4 * 
 * Transform:       Append                                                  * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Tables:   Extract - work.W3I5H6D                A5J3RISO.AI0001G8 * 
 *                  Extract - work.W3I5VV0                A5J3RISO.AI0001G7 * 
 * Target Table:    Append - work.W3IAFSX                 A5J3RISO.AI0001G9 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B4);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let dbxrc = %eval(%sysfunc(exist(work.W3I5H6D, DATA)) or 
      %sysfunc(exist(work.W3I5H6D, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOPFK;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOPFK as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRT as CCORRL,
         CJUN_DSTNO as CJUNC_DSTNO,
         CSGMTO length = 8   
            format = 2.
            informat = 2.,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CCORRT,
         CJUN_DSTNO,
         VPERDA_VDDOR,
         CTIPO_PERDA_VDDOR,
         VPERDA_BDSCO,
         CTIPO_PERDA_BDSCO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DFATOR_GERDR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         CCARGA,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.W3I5H6D
   ;
quit;

%let SYSLAST = work.W2SBOPFK;

%let dbxrc = %eval(%sysfunc(exist(work.W3I5VV0, DATA)) or 
      %sysfunc(exist(work.W3I5VV0, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOPFW;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOPFW as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRT as CCORRL,
         CJUN_DSTNO as CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CCORRT,
         CJUN_DSTNO,
         VPERDA_VDDOR,
         CTIPO_PERDA_VDDOR,
         VPERDA_BDSCO,
         CTIPO_PERDA_BDSCO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DFATOR_GERDR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         CCARGA,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.W3I5VV0
   ;
quit;

%let SYSLAST = work.W2SBOPFW;

proc datasets lib = work nolist nowarn memtype = (data view);
   delete W3IAFSX;
quit;

data work.W3IAFSX;
   set work.W2SBOPFK
       work.W2SBOPFW;
   keep CDEPDC CRZ_CTBIL CCTA_CTBIL DCTBIL VPERDA CTIPO_PERDA DOCORR CCORRL 
    CJUNC_DSTNO CSGMTO CLIN_NEGOC CEVNTO_PERDA CGRP_ATGDO_PERDA CSGRP_ATGDO_PERDA 
    CCAUSA_ATGDO_PERDA CIDTFD_CNTRL Origem ID_BASE ITAB CGCPJ DDESCB NOME_BASE 
    CTIPO_ACAO CSBTPO_ACAO CCORRT CJUN_DSTNO VPERDA_VDDOR CTIPO_PERDA_VDDOR 
    VPERDA_BDSCO CTIPO_PERDA_BDSCO CEMPR REMPR RDEPDC IENVDO CCPF_CNPJ 
    CCLASF_ENVDO DFATOR_GERDR DAJUIZ DCAD NPROCS ICOMAR IUF RTIPO_ACAO 
    RSBTPO_ACAO IDESP DBAIXA RMOTVO_BAIXA VBAIXA VDESP_BDSCO VDESP_VDDOR CCARGA 
    DREFERENCIA_LEGADO IARQUIVO_LEGADO; 
run;

%rcSet(&syserr); 



/**  Step end Append **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B5 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TGRUPO_SEG_TRAB_STBY -                A5J3RISO.AQ0000B7 * 
 *                   CTRL_SB.TGRUPO_SEG_TRAB_STBY                           * 
 * Target Table:    Extract - work.WWAV3WF                A5J3RISO.AI0001GA * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B5);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(CTRL_SB.TGRUPO_SEG_TRAB_STBY); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WWAV3WF;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WWAV3WF as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL length = 5,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         (IFN(VDESP_ACESS<0,VDESP_ACESS*-1,VDESP_ACESS)) as VPERDA length = 8
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         (IFC(VDESP_ACESS<0,'3','1')) as CTIPO_PERDA length = 2
            format = $2.
            informat = $2.,
         DCTBIL as DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL length = 8   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO length = 8   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('GRUPO SEGURADOR') as Origem length = 50,
         ('TRAB') as ID_BASE length = 8,
         ('TGRUPO_SEG_TRAB_STBY') as ITAB length = 50,
         CGCPJ,
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCO SEGUROS TRABALHISTA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR,
         REMPR,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCPF_CNPJ,
         CCLASF_RECLA,
         DDEMIS,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         VDESP_ACESS,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VBAIXA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('BVPTRAB') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WWAV3WF;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B6 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TREEM_CARTAO_CRED_HIST -              A5J3RISO.AQ0000BB * 
 *                   EGRC.TREEM_CARTAO_CRED_HIST                            * 
 * Target Table:    Extract - work.W51UCT4                A5J3RISO.AI0001GB * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B6);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TREEM_CARTAO_CRED_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W51UCT4;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W51UCT4 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL length = 8   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('REEMISSAO CARTAO CRED') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TREEM_CARTAO_CRED_HIST') as ITAB length = 50,
         DDESCB,
         ('REEMISSÃO DE CARTÕES DE CRÉDITO') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR,
         NCATAO,
         RMOTVO_CANC,
         IBANDE,
         (TRIM(LEFT(PUT(CBANDE,BEST32.)))) as CBANDE length = 1
            informat = $1.
            label = 'cdBandeira',
         TP_CARTAO,
         (TRIM(LEFT(PUT(CBIN_CATAO,BEST32.)))) as CBIN_CATAO length = 6
            label = 'cdBinCartao',
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('CART_REEM_CRED') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W51UCT4;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B7 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TREEM_CARTAO_DEB_HIST -               A5J3RISO.AQ0000BC * 
 *                   EGRC.TREEM_CARTAO_DEB_HIST                             * 
 * Target Table:    Extract - work.W51D383                A5J3RISO.AI0001GC * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B7);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TREEM_CARTAO_DEB_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W51D383;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W51D383 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('REEMISSAO CARTAO DEB') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TREEM_CARTAO_DEB_HIST') as ITAB length = 50,
         DDESCB,
         ('REEMISSÃO DE CARTÕES DE DÉBITO') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CEMPR length = 3,
         (TRIM(LEFT(PUT(CBIN_CATAO,BEST32.)))) as CBIN_CATAO length = 6
            format = $6.
            informat = $6.
            label = 'cdBinCartao',
         CMOTVO_CANC length = 3,
         NCATAO,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('CART_REEM_DEB') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CEVNTO_PERDA ^= "98.01.01"
   ;
quit;

%let SYSLAST = work.W51D383;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B8 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TFRET_CARRET_DSTN_HIST -              A5J3RISO.AQ0000B4 * 
 *                   EGRC.TFRET_CARRET_DSTN_HIST                            * 
 * Target Table:    Extract - work.W1QG3NPR               A5J3RISO.AI0001GD * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CRZ_CTBIL is too short for the specified    * 
 *  source column CRZ_CTBIL.  Values will be truncated.                     * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B8);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TFRET_CARRET_DSTN_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1QG3NPR;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CRZ_CTBIL is too short"
        " for the specified source column CRZ_CTBIL.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1QG3NPR as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CCTA_CTBIL length = 13   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.,
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TFRET_CARRET_DSTN_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('DSTN FRETES E CARRETOS') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         NCOTACAO,
         NOBJETO,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('Fretes_Carretos') as IARQUIVO_LEGADO length = 255,
         CRZ_CTBIL length = 5
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1QG3NPR;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001B9 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TPLAN_SEGURANCA_HIST -                A5J3RISO.AQ0000BA * 
 *                   EGRC.TPLAN_SEGURANCA_HIST                              * 
 * Target Table:    Extract - work.W1QG3CN3               A5J3RISO.AI0001GE * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CRZ_CTBIL is too short for the specified    * 
 *  source column CRZ_CTBIL.  Values will be truncated.                     * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001B9);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TPLAN_SEGURANCA_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1QG3CN3;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CRZ_CTBIL is too short"
        " for the specified source column CRZ_CTBIL.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1QG3CN3 as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CCTA_CTBIL length = 13   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TPLAN_SEGURANCA_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('DSTN PLANO DE SEGURANÇA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         IPLANO_SEG,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("PLAN_SEG") as IARQUIVO_LEGADO length = 255,
         CRZ_CTBIL length = 5
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1QG3CN3;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BA * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TREF_SEGURANCA_HIST -                 A5J3RISO.AQ0000BD * 
 *                   EGRC.TREF_SEGURANCA_HIST                               * 
 * Target Table:    Extract - work.W1QG30HF               A5J3RISO.AI0001GF * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CRZ_CTBIL is too short for the specified    * 
 *  source column CRZ_CTBIL.  Values will be truncated.                     * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BA);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TREF_SEGURANCA_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1QG30HF;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CRZ_CTBIL is too short"
        " for the specified source column CRZ_CTBIL.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1QG30HF as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CCTA_CTBIL length = 13   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL length = 8   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TREF_SEGURANCA_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('DSTN REFORÇO DE SEGURANÇA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         NBDN,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("Ref_Seg") as IARQUIVO_LEGADO length = 255,
         CRZ_CTBIL length = 5
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1QG30HF;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BB * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TPATRIM_AQUISICAO_HIST -              A5J3RISO.AQ0000B8 * 
 *                   EGRC.TPATRIM_AQUISICAO_HIST                            * 
 * Target Table:    Extract - work.WIT718H                A5J3RISO.AI0001GG * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BB);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TPATRIM_AQUISICAO_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WIT718H;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WIT718H as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TPATRIM_AQUISICAO_HIST') as ITAB length = 50,
         RHIST length = 3410   
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('PATRIMÔNIO AQUISIÇÃO') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         REVENTO,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("PATRIMONIO_AQUIS") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WIT718H;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BC * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TPATRIM_RO_HIST -                     A5J3RISO.AQ0000B9 * 
 *                   EGRC.TPATRIM_RO_HIST                                   * 
 * Target Table:    Extract - work.WJ47WFD                A5J3RISO.AI0001GH * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCPF_CNPJ is too short for the specified    * 
 *  source column CCPF_CNPJ.  Values will be truncated.                     * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BC);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TPATRIM_RO_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WJ47WFD;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCPF_CNPJ is too short"
        " for the specified source column CCPF_CNPJ.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WJ47WFD as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TPATRIM_RO_HIST') as ITAB length = 50,
         RHIST length = 3410   
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('PATRIMÔNIO RO') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CCPF_CNPJ length = 15   
            format = $15.
            informat = $15.,
         COBJETO,
         CPROJ,
         DCAD,
         REVENTO,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("PATRIMONIO_RO") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WJ47WFD;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BD * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TDBDN_HIST - EGRC.TDBDN_HIST          A5J3RISO.AQ0000B3 * 
 * Target Table:    Extract - work.WIZY56K                A5J3RISO.AI0001GI * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BD);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TDBDN_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete WIZY56K;
quit;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.WIZY56K as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL length = 13   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TDBDN_HIST') as ITAB length = 50,
         RSTATUS as RHIST length = 3410   
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('DBDN') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         RSTATUS,
         (TRIM(LEFT(PUT(NBDN,BEST32.)))) as NBDN length = 10
            format = $10.
            informat = $10.
            label = 'Número do BDN',
         RSGMTO_DBDN,
         (INPUT(PUT(CEMPR, 3.),3.)) as CEMPR length = 3
            label = 'cdEmpresa',
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('DBDN') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.WIZY56K;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BE * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TBRAD_EXPR_PA_HIST -                  A5J3RISO.AQ0000AX * 
 *                   EGRC.TBRAD_EXPR_PA_HIST                                * 
 * Target Table:    Extract - work.W12CTY8                A5J3RISO.AI0001GJ * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column NBDN is too short for the specified source  * 
 *  column NBDN.  Values will be truncated.                                 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BE);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TBRAD_EXPR_PA_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W12CTY8;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column NBDN is too short for"
        " the specified source column NBDN.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W12CTY8 as
      select
         CDEPDC,
         CRZ_CTBIL   
            format = $5.
            informat = $5.
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TBRAD_EXPR_PA_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('BRADESCO EXPRESSO PA') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CMOTVO_CANC length = 3,
         NBDN length = 10,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('BRAD_EXPRESSO_PA') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W12CTY8;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BF * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    T_LEAS_CIPRINC_HIST -                 A5J3RISO.AQ0000AT * 
 *                   EGRC.t_leas_ciprinc_hist                               * 
 * Target Table:    Extract - work.W1KP59F                A5J3RISO.AI0001GK * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BF);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.t_leas_ciprinc_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1KP59F;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W1KP59F as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.,
         CRZ_CTBIL length = 5,
         CCTA_CTBIL length = 13,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 8   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         ('BANCO BRADESCO') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('T_LEAS_CIPRINC_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         CGCPJ   
            format = 20.
            informat = 20.,
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('LEASING CÍVEL') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         ISBTPO_ACAO,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_PRINC_LEAS") as IARQUIVO_LEGADO length = 255,
         CTIPO_PERDA length = 2
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1KP59F;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BG * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TDBDN_BDN_HIST - EGRC.TDBDN_BDN_HIST  A5J3RISO.AQ0000B2 * 
 * Target Table:    Extract - work.W17FIU3                A5J3RISO.AI0001GL * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BG);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TDBDN_BDN_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W17FIU3;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, CGCPJ, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W17FIU3 as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO') as Origem length = 50,
         (PUT(CEVNTO_PERDA,$2.)) as ID_BASE length = 8,
         ('TDBDN_BDN_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         . as CGCPJ length = 8
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DDESCB   
            label = 'dtDescoberta',
         ('DBDN_BDN') as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         NBDN length = 10,
         RSTATUS,
         CEMPR length = 3,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('DBDN_BDN') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W17FIU3;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BH * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TBRADESCARD CBSS CIVEL HIST -         A5J3RISO.AQ0000B0 * 
 *                   EGRC.TBRADESCARD_CBSS_CIVEL_HIST                       * 
 * Target Table:    Extract - work.W27MSDT                A5J3RISO.AI0001GM * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BH);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TBRADESCARD_CBSS_CIVEL_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W27MSDT;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, IPAIS_TRANS";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W27MSDT as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL length = 5   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL length = 8   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 8   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         ('BANCO BRADESCO CARTOES') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('TBRADESCARD_CBSS_CIVEL_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         DCAD as DDESCB   
            label = 'dtDescoberta',
         ('BRADESCARD CBSS '|| ifc(substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)='CIVEL','CÍVEL','TRABALHISTA')) as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO   
            format = 4.
            informat = 4.
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            format = 3.
            informat = BEST12.
            label = 'cdSubtipoAcao',
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('Bradescard_CBSS_civel') as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W27MSDT;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BI * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    BRAD_CBSS_JURID_HIST -                A5J3RISO.AQ0000AF * 
 *                   EGRC.BRAD_CBSS_JURID_HIST                              * 
 * Target Table:    Extract - work.W27PTQW                A5J3RISO.AI0001GN * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BI);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.BRAD_CBSS_JURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W27PTQW;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: RHIST, IPAIS_TRANS, DDESCB";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.W27PTQW as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL length = 5   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 8   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 10   
            format = $10.
            informat = $10.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 8   
            format = $8.
            informat = $8.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         ('BANCO BRADESCO CARTOES') as Origem length = 50,
         ('CIVEL') as ID_BASE length = 8,
         ('BRAD_CBSS_JURID_HIST') as ITAB length = 50,
         "" as RHIST length = 3410
            format = $CHAR3870.
            informat = $3410.,
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         "" as IPAIS_TRANS length = 2
            format = $2.
            informat = $2.
            label = 'nmPaisTransacao',
         . as DDESCB length = 8
            format = DDMMYY10.
            label = 'dtDescoberta',
         ('BRADESCARD CBSS '|| ifc(substr(CIDTFD_CNTRL, length(CIDTFD_CNTRL)-4, 5)='CIVEL','CÍVEL','TRABALHISTA')) as NOME_BASE length = 50
            format = $50.
            informat = $50.,
         CTIPO_ACAO   
            format = 4.
            informat = 4.
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            format = 3.
            informat = BEST12.
            label = 'cdSubtipoAcao',
         CEMPR length = 3,
         IENVDO,
         CCLASF_ENVDO length = 3,
         NDOC,
         CFUNCI,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         NPROCS,
         ICOMAR,
         IUF,
         CAREA,
         (INPUT(CPRODU,BEST32.)) as CPRODU length = 8,
         CRAIZ,
         RDEPDC,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ('Bradescard_CBSS_gr5') as IARQUIVO_LEGADO length = 255,
         CTIPO_PERDA length = 2
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W27PTQW;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BJ * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TAUX_DOENCA_HIST -                    A5J3RISO.AQ0000AW * 
 *                   EGRC.TAUX_DOENCA_HIST                                  * 
 * Target Table:    Extract - work.W5GYJ1K                A5J3RISO.AI0001GO * 
 *==========================================================================*
 *                                                                          * 
 * Nothing will be generated for this process because the "Exclude          * 
 *  transformation from run" option is selected.                            * 
 *                                                                          * 
 *==========================================================================*/ 

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BK * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    TGBS_MULTAS_FRA_HIST -                A5J3RISO.AQ0000B5 * 
 *                   EGRC.TGBS_MULTAS_FRA_HIST                              * 
 * Target Table:    Extract - work.WSL6VT                 A5J3RISO.AI0001GP * 
 *==========================================================================*
 *                                                                          * 
 * Nothing will be generated for this process because the "Exclude          * 
 *  transformation from run" option is selected.                            * 
 *                                                                          * 
 *==========================================================================*/ 

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BL * 
 * Transform:       Extract                                                 * 
 * Description:     CIVEL_PRINCIPAL_BBC                                     * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract - work.CIVEL_PRINCIPAL_BBC    A5J3RISO.AI0001GQ * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BL);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete CIVEL_PRINCIPAL_BBC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.CIVEL_PRINCIPAL_BBC as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_PRINCIPAL_BBC") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5202 & CCTA_CTBIL = "86"
   ;
quit;

%let SYSLAST = work.CIVEL_PRINCIPAL_BBC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BM * 
 * Transform:       Extract                                                 * 
 * Description:     HONORARIOS_CIVEL_BBC                                    * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract - work.HONORARIOS_CIVEL_BBC   A5J3RISO.AI0001GR * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BM);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete HONORARIOS_CIVEL_BBC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.HONORARIOS_CIVEL_BBC as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("HONORARIOS_CIVEL_BBC") as IARQUIVO_LEGADO length = 255,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.
   from &SYSLAST
      where CCORRL = 5202 & CCTA_CTBIL ^= "86" & CIDTFD_CNTRL CONTAINS("AMEX_CIVEL")
   ;
quit;

%let SYSLAST = work.HONORARIOS_CIVEL_BBC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BN * 
 * Transform:       Extract                                                 * 
 * Description:     TRABALHISTA_PRINCIPAL_BBC                               * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract -                             A5J3RISO.AI0001GS * 
 *                   work.TRABALHISTA_PRINCIPAL_BBC                         * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BN);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete TRABALHISTA_PRINCIPAL_BBC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.TRABALHISTA_PRINCIPAL_BBC as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("TRABALHISTA_PRINCIPAL_BBC") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5202 & CCTA_CTBIL = "0000000000003"
   ;
quit;

%let SYSLAST = work.TRABALHISTA_PRINCIPAL_BBC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BO * 
 * Transform:       Extract                                                 * 
 * Description:     TRABALHISTA_HONORARIOS_BBC                              * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract -                             A5J3RISO.AI0001GT * 
 *                   work.TRABALHISTA_HONORARIOS_BBC                        * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BO);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete TRABALHISTA_HONORARIOS_BBC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.TRABALHISTA_HONORARIOS_BBC as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("TRABALHISTA_HONORARIOS_BBC") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5202 & CCTA_CTBIL ^= "0000000000003" & CIDTFD_CNTRL CONTAINS("AMEX_CIVEL")
   ;
quit;

%let SYSLAST = work.TRABALHISTA_HONORARIOS_BBC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BP * 
 * Transform:       Extract                                                 * 
 * Description:     CIVEL_PRINCIPAL_TEMPO                                   * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract - work.CIVEL_PRINCIPAL_TEMPO  A5J3RISO.AI0001GU * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BP);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete CIVEL_PRINCIPAL_TEMPO;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.CIVEL_PRINCIPAL_TEMPO as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_PRINCIPAL_TEMPO") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5210 & CCTA_CTBIL  = "819990067183"
   ;
quit;

%let SYSLAST = work.CIVEL_PRINCIPAL_TEMPO;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BQ * 
 * Transform:       Extract                                                 * 
 * Description:     CIVEL_HONORARIOS_TEMPO                                  * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract - work.CIVEL_HONORARIOS_TEMPO A5J3RISO.AI0001GV * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BQ);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete CIVEL_HONORARIOS_TEMPO;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.CIVEL_HONORARIOS_TEMPO as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_HONORARIOS_TEMPO") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5210 & CCTA_CTBIL ^= "819990067183" & CIDTFD_CNTRL CONTAINS("AMEX_CIVEL")
   ;
quit;

%let SYSLAST = work.CIVEL_HONORARIOS_TEMPO;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BR * 
 * Transform:       Extract                                                 * 
 * Description:     TRABALHISTA_PRINCIPAL_TEMPO                             * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract -                             A5J3RISO.AI0001GW * 
 *                   work.TRABALHISTA_PRINCIPAL_TEMPO                       * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BR);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete TRABALHISTA_PRINCIPAL_TEMPO;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.TRABALHISTA_PRINCIPAL_TEMPO as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("TRABALHISTA_PRINCIPAL_TEMPO") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5210 & CCTA_CTBIL="817330040664"
   ;
quit;

%let SYSLAST = work.TRABALHISTA_PRINCIPAL_TEMPO;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BS * 
 * Transform:       Extract                                                 * 
 * Description:     HONORARIOS_TRABALHISTA_TEMPO                            * 
 *                                                                          * 
 * Source Table:    TAMEXJURID_HIST -                     A5J3RISO.AQ0000AV * 
 *                   EGRC.TAMEXJURID_HIST                                   * 
 * Target Table:    Extract -                             A5J3RISO.AI0001GX * 
 *                   work.HONORARIOS_TRABALHISTA_TEMPO                      * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BS);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TAMEXJURID_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete HONORARIOS_TRABALHISTA_TEMPO;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.HONORARIOS_TRABALHISTA_TEMPO as
      select
         CGCPJ,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CIDTFD_CNTRL,
         CCORRL,
         VBAIXA,
         VPERDA,
         DCTBIL,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("HONORARIOS_TRABALHISTA_TEMPO") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5210 & CCTA_CTBIL ^= "817330040664" & CIDTFD_CNTRL CONTAINS("AMEXTRAB")
   ;
quit;

%let SYSLAST = work.HONORARIOS_TRABALHISTA_TEMPO;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BT * 
 * Transform:       Extract                                                 * 
 * Description:     BRAD_FIN_CIVEL                                          * 
 *                                                                          * 
 * Source Table:    TBRAD_FINAN_JUR_HIST -                A5J3RISO.AQ0000AY * 
 *                   EGRC.tbrad_financ_jur_hist                             * 
 * Target Table:    Extract - work.BRAD_FIN_CIVEL         A5J3RISO.AI0001GY * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column NPROCS is too short for the specified source * 
 *  column NPROCS.  Values will be truncated.                               * 
 * Mapping of the target column RMOTVO_BAIXA is too short for the specified * 
 *  source column RMOTVO_BAIXA.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BT);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_financ_jur_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete BRAD_FIN_CIVEL;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column NPROCS is too short"
        " for the specified source column NPROCS.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RMOTVO_BAIXA is too"
        " short for the specified source column RMOTVO_BAIXA.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.BRAD_FIN_CIVEL as
      select
         CDEPDC,
         CGCPJ,
         CEMPR length = 3   
            format = 3.,
         REMPR,
         RDEPDC,
         DOCORR,
         IRECLA,
         (INPUT(CCLASF_ENVDO,3.)) as CCLASF_ENVDO length = 3
            format = 1.
            informat = BAST12.
            label = 'CLASSIFICACAO_RECLAMANTE',
         NRO_DOCUMENTO,
         TIPO_ENVOLVIMENTO,
         CTIPO_ACAO length = 4   
            format = 4.,
         RTIPO_ACAO,
         CSBTPO_ACAO length = 3   
            format = 3.,
         RSBTPO_ACAO,
         NPROCS length = 20   
            format = $20.
            informat = $20.,
         DBAIXA,
         CBAIXA,
         RMOTVO_BAIXA length = 35   
            format = $35.
            informat = $CHAR32.,
         VBAIXA,
         DCTBIL,
         CCTA_CTBIL,
         VPERDA,
         CJUNC_DSTNO,
         CRZ_CTBIL,
         TPDESP,
         CIDTFD_CNTRL,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CTIPO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         CCORRL,
         DCAD,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_FIN_CIVEL") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CIDTFD_CNTRL CONTAIS("FINCIVEL")
   ;
quit;

%let SYSLAST = work.BRAD_FIN_CIVEL;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BU * 
 * Transform:       Extract                                                 * 
 * Description:     BRAD_FIN_TRAB                                           * 
 *                                                                          * 
 * Source Table:    TBRAD_FINAN_JUR_HIST -                A5J3RISO.AQ0000AY * 
 *                   EGRC.tbrad_financ_jur_hist                             * 
 * Target Table:    Extract - work.BRAD_FIN_TRAB          A5J3RISO.AI0001GZ * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column NPROCS is too short for the specified source * 
 *  column NPROCS.  Values will be truncated.                               * 
 * Mapping of the target column RMOTVO_BAIXA is too short for the specified * 
 *  source column RMOTVO_BAIXA.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BU);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_financ_jur_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete BRAD_FIN_TRAB;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column NPROCS is too short"
        " for the specified source column NPROCS.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RMOTVO_BAIXA is too"
        " short for the specified source column RMOTVO_BAIXA.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.BRAD_FIN_TRAB as
      select
         CDEPDC,
         CGCPJ,
         CEMPR length = 3   
            format = 3.,
         REMPR,
         RDEPDC,
         DOCORR,
         IRECLA,
         (INPUT(CCLASF_ENVDO,3.)) as CCLASF_ENVDO length = 3
            format = 1.
            informat = BEST12.
            label = 'CLASSIFICACAO_RECLAMANTE',
         NRO_DOCUMENTO,
         TIPO_ENVOLVIMENTO,
         CTIPO_ACAO length = 4   
            format = 4.,
         RTIPO_ACAO,
         CSBTPO_ACAO length = 3   
            format = 3.,
         RSBTPO_ACAO,
         NPROCS length = 20   
            format = $20.
            informat = $20.,
         DBAIXA,
         CBAIXA,
         RMOTVO_BAIXA length = 35   
            format = $35.
            informat = $CHAR35.,
         VBAIXA,
         DCTBIL,
         CCTA_CTBIL,
         VPERDA,
         CJUNC_DSTNO,
         CRZ_CTBIL,
         TPDESP,
         CIDTFD_CNTRL,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         CSGMTO,
         CLIN_NEGOC,
         CCORRL,
         DCAD,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_FIN_TRAB") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CIDTFD_CNTRL CONTAIS("FINTRAB")
   ;
quit;

%let SYSLAST = work.BRAD_FIN_TRAB;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BV * 
 * Transform:       Extract                                                 * 
 * Description:     Bradescard_P2_civprinc                                  * 
 *                                                                          * 
 * Source Table:    BRAD_P2_JURID_HIST -                  A5J3RISO.AQ0000AH * 
 *                   EGRC.tbrad_p2_jurd_hist                                * 
 * Target Table:    Extract - work.Bradescard_P2_civprinc A5J3RISO.AI0001H0 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BV);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_p2_jurd_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete Bradescard_P2_civprinc;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.Bradescard_P2_civprinc as
      select
         CGCPJ,
         CRZ_CTBIL,
         CCTA_CTBIL,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            format = 1.
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO   
            format = 4.
            informat = BEST12.,
         RTIPO_ACAO,
         CSBTPO_ACAO   
            format = 3.
            informat = BEST12.,
         RSBTPO_ACAO,
         DCTBIL,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         CCORRL,
         VPERDA,
         CTIPO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("Bradescard_P2_civprinc") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5404 & CCTA_CTBIL = "8199910018"
   ;
quit;

%let SYSLAST = work.Bradescard_P2_civprinc;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BW * 
 * Transform:       Extract                                                 * 
 * Description:     Bradescard_P2_gr5                                       * 
 *                                                                          * 
 * Source Table:    BRAD_P2_JURID_HIST -                  A5J3RISO.AQ0000AH * 
 *                   EGRC.tbrad_p2_jurd_hist                                * 
 * Target Table:    Extract - work.Bradescard_P2_gr5      A5J3RISO.AI0001H1 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BW);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_p2_jurd_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete Bradescard_P2_gr5;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.Bradescard_P2_gr5 as
      select
         CGCPJ,
         CRZ_CTBIL,
         CCTA_CTBIL,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         REMPR,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            format = 1.
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO   
            format = 4.
            informat = BEST12.,
         RTIPO_ACAO,
         CSBTPO_ACAO   
            format = 3.
            informat = BEST12.,
         RSBTPO_ACAO,
         DCTBIL,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         CCORRL,
         VPERDA,
         CTIPO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("Bradescard_P2_gr5") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 5404 & CRZ_CTBIL is not missing
   ;
quit;

%let SYSLAST = work.Bradescard_P2_gr5;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BX * 
 * Transform:       Extract                                                 * 
 * Description:     BRAD_PROM_TRAB                                          * 
 *                                                                          * 
 * Source Table:    BRAD PROM JURID HIST -                A5J3RISO.AQ0000AD * 
 *                   EGRC.tbrad_prom_jur_hist                               * 
 * Target Table:    BRAD_PROM_TRAB - work.BRAD_PROM_TRAB  A5J3RISO.AI0001H2 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CTIPO_ACAO is too short for the specified   * 
 *  source column CTIPO_ACAO.  Values will be truncated.                    * 
 * Mapping of the target column CSBTPO_ACAO is too short for the specified  * 
 *  source column CSBTPO_ACAO.  Values will be truncated.                   * 
 * Mapping of the target column CTIPO_PERDA is too short for the specified  * 
 *  source column CTIPO_PERDA.  Values will be truncated.                   * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BX);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.tbrad_prom_jur_hist); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete BRAD_PROM_TRAB;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_ACAO is too"
        " short for the specified source column CTIPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CSBTPO_ACAO is too"
        " short for the specified source column CSBTPO_ACAO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CTIPO_PERDA is too"
        " short for the specified source column CTIPO_PERDA.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.BRAD_PROM_TRAB as
      select
         CGCPJ,
         CRZ_CTBIL,
         CCTA_CTBIL,
         CJUNC_DSTNO,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         CDEPDC,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DOCORR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         CTIPO_ACAO length = 4   
            informat = BEST12.,
         RTIPO_ACAO,
         CSBTPO_ACAO length = 3   
            informat = BEST12.,
         RSBTPO_ACAO,
         DCTBIL,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VPERDA_RCUPC,
         VPERDA,
         CTIPO_PERDA length = 2   
            format = $2.
            informat = $2.,
         VDESP_VDDOR,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL,
         CCORRL,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("BRAD_PROM_TRAB") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CIDTFD_CNTRL CONTAINS("BMCTRAB")
   ;
quit;

%let SYSLAST = work.BRAD_PROM_TRAB;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BY * 
 * Transform:       Extract                                                 * 
 * Description:     GPAPROCI                                                * 
 *                                                                          * 
 * Source Table:    TGPAP_HIST - EGRC.TGPAP_HIST          A5J3RISO.AQ0000B6 * 
 * Target Table:    Extract - work.GPAPROCI               A5J3RISO.AI0001H3 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BY);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TGPAP_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete GPAPROCI;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.GPAPROCI as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CEMPR length = 3   
            format = 3.
            informat = BEST12.,
         CIDTFD_CNTRL,
         COD_LACTO,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("GPAPROCI") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CIDTFD_CNTRL CONTAINS("GPAP")
   ;
quit;

%let SYSLAST = work.GPAPROCI;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001BZ * 
 * Transform:       Extract                                                 * 
 * Description:     TRAB_PRINC                                              * 
 *                                                                          * 
 * Source Table:    HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 * Target Table:    Extract - work.TRAB_PRINC             A5J3RISO.AI0001H4 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001BZ);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TJURIDICO); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete TRAB_PRINC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.TRAB_PRINC as
      select
         CGCPJ,
         CDEPDC,
         DOCORR,
         IENVDO,
         CTIPO_ACAO,
         RTIPO_ACAO,
         CSBTPO_ACAO,
         RSBTPO_ACAO,
         CCLASF_ENVDO,
         DDESCB,
         CCPF_CNPJ,
         CCORRL,
         CRZ_CTBIL,
         CCTA_CTBIL,
         CTIPO_PERDA,
         DCTBIL,
         CJUNC_DSTNO,
         CIDTFD_CNTRL,
         IRECMT,
         CEMPR length = 3   
            informat = BEST12.,
         REMPR,
         VPERDA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("TRAB_PRINC") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 4040 & CRZ_CTBIL="526" & CCTA_CTBIL = "90001"
   ;
quit;

%let SYSLAST = work.TRAB_PRINC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001C0 * 
 * Transform:       Extract                                                 * 
 * Description:     CIVEL_HON                                               * 
 *                                                                          * 
 * Source Table:    HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 * Target Table:    Extract - work.CIVEL_HON              A5J3RISO.AI0001H5 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C0);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TJURIDICO); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete CIVEL_HON;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.CIVEL_HON as
      select
         CGCPJ,
         CDEPDC,
         DOCORR,
         IENVDO,
         CTIPO_ACAO,
         RTIPO_ACAO,
         CSBTPO_ACAO,
         RSBTPO_ACAO,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DDESCB,
         CCPF_CNPJ,
         CCORRL,
         CRZ_CTBIL,
         CCTA_CTBIL,
         CTIPO_PERDA,
         DCTBIL,
         CJUNC_DSTNO,
         (Compress(put(CGCPJ,30.)||"4040"||"BCOCIVEL")) as CIDTFD_CNTRL length = 50
            format = $50.
            informat = $50.
            label = 'cdIdentificadorCentral',
         IRECMT,
         CEMPR length = 3   
            informat = BEST12.,
         REMPR,
         VPERDA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_HON") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 4040 & CRZ_CTBIL ^= "5617" & CCTA_CTBIL ^= "3" & CIDTFD_CNTRL CONTAINS("CIVEL")
   ;
quit;

%let SYSLAST = work.CIVEL_HON;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001C1 * 
 * Transform:       Extract                                                 * 
 * Description:     CIVEL_PRINC                                             * 
 *                                                                          * 
 * Source Table:    HistoricoJuridico - EGRC.TJURIDICO    A5J3RISO.AQ0000AM * 
 * Target Table:    Extract - work.CIVEL_PRINC            A5J3RISO.AI0001H6 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCLASF_ENVDO is too short for the specified * 
 *  source column CCLASF_ENVDO.  Values will be truncated.                  * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 * Mapping of the target column RHIST is too short for the specified source * 
 *  column RHIST.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C1);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TJURIDICO); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete CIVEL_PRINC;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCLASF_ENVDO is too"
        " short for the specified source column CCLASF_ENVDO.  Values will be"
        " truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column RHIST is too short for"
        " the specified source column RHIST.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.CIVEL_PRINC as
      select
         CGCPJ,
         CDEPDC,
         DOCORR,
         IENVDO,
         CTIPO_ACAO,
         RTIPO_ACAO,
         CSBTPO_ACAO,
         RSBTPO_ACAO,
         CCLASF_ENVDO length = 3   
            informat = BEST12.,
         DDESCB,
         CCPF_CNPJ,
         CCORRL,
         CRZ_CTBIL,
         CCTA_CTBIL,
         CTIPO_PERDA,
         DCTBIL,
         CJUNC_DSTNO,
         CIDTFD_CNTRL,
         IRECMT,
         CEMPR length = 3   
            informat = BEST12.,
         REMPR,
         VPERDA,
         CEVNTO_PERDA,
         CSGRP_ATGDO_PERDA,
         CGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CSGMTO,
         CLIN_NEGOC,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8,
         ("CIVEL_PRINC") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
      where CCORRL = 4040 & CRZ_CTBIL = "5617" & CCTA_CTBIL = "3"
   ;
quit;

%let SYSLAST = work.CIVEL_PRINC;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001C2 * 
 * Transform:       Extract                                                 * 
 * Description:     plcc_sas                                                * 
 *                                                                          * 
 * Source Table:    TPLCC_SAS_HIST - EGRC.TPLCC_SAS_HIST  A5J3RISO.AQ0000BF * 
 * Target Table:    Extract - work.plcc_sas               A5J3RISO.AI0001H7 * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CCORRT is too short for the specified source * 
 *  column CCORRT.  Values will be truncated.                               * 
 * Mapping of the target column CEMPR is too short for the specified source * 
 *  column CEMPR.  Values will be truncated.                                * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C2);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TPLCC_SAS_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete plcc_sas;
quit;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CCORRT is too short"
        " for the specified source column CCORRT.  Values will be truncated.";
run;

data _null_;
   put "WARNING%QUOTE(:) Mapping of the target column CEMPR is too short for"
        " the specified source column CEMPR.  Values will be truncated.";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.plcc_sas as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         VPERDA,
         DCTBIL,
         CJUN_DSTNO   
            format = 5.
            informat = 5.,
         DDESCB,
         TP_MOVIM,
         RHIST length = 3410   
            format = $3410.
            informat = $3410.,
         DOCORR,
         CDEPDC,
         CTIPO_PERDA,
         CLIN_NEGOC,
         CSGMTO,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CEVNTO_PERDA,
         CCORRT length = 4   
            format = 5.
            informat = 5.,
         CEMPR length = 3   
            informat = BEST12.,
         CIDTFD_CNTRL,
         ("plcc_sas") as IARQUIVO_LEGADO length = 255,
         (input((put(year(DCTBIL), 4.) || compress(put(month(DCTBIL), Z2.)) || "01"), 8.)) as DREFERENCIA_LEGADO length = 8
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.plcc_sas;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001C3 * 
 * Transform:       Extract                                                 * 
 * Description:     SGREROCITRANS                                           * 
 *                                                                          * 
 * Source Table:    TSGRE_TRANSACOES_HIST -               A5J3RISO.AQ0000BG * 
 *                   EGRC.TSGRE_TRANSACOES_HIST                             * 
 * Target Table:    Extract - work.W1W4GLI                A5J3RISO.AI0001H8 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C3);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.TSGRE_TRANSACOES_HIST); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W1W4GLI;
quit;

data _null_;
   put "NOTE: The following column(s) do not have a column mapping, so the"
        " value(s) will be set to missing: DREFERENCIA_LEGADO";
run;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W1W4GLI as
      select
         DTRANS,
         VTRANS,
         CTRANS,
         CPEDIDO,
         . as DREFERENCIA_LEGADO length = 8,
         ("SGREROCITRANS") as IARQUIVO_LEGADO length = 255
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.W1W4GLI;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001C4 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    HIST_SGRE - EGRC.HIST_SGRE            A5J3RISO.AQ0000AI * 
 * Target Table:    Extract - work.W24JAJ9                A5J3RISO.AI0001H9 * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C4);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(EGRC.HIST_SGRE); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W24JAJ9;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W24JAJ9 as
      select distinct
         CPEDIDO,
         (MIN(DCTBIL)) as DCTBIL length = 8
            format = DDMMYY10.
            informat = DDMMYY10.
   from &SYSLAST
   group by
      CPEDIDO
   ;
quit;

%let SYSLAST = work.W24JAJ9;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Join                                  A5J3RISO.AC0001C5 * 
 * Transform:       Join                                                    * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Tables:   Extract - work.W1W4GLI                A5J3RISO.AI0001H8 * 
 *                  Extract - work.W24JAJ9                A5J3RISO.AI0001H9 * 
 * Target Table:    Join - work.W213KDX                   A5J3RISO.AI0001HA * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C5);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

proc datasets lib = work nolist nowarn memtype = (data view);
   delete W213KDX;
quit;

proc sql;
   create view work.W213KDX as
   select
      W1W4GLI.DTRANS length = 8   
         format = DDMMYY10.
         informat = DDMMYY8.,
      W1W4GLI.VTRANS length = 8   
         format = 13.2
         informat = 13.2,
      W1W4GLI.CTRANS length = 8,
      W1W4GLI.CPEDIDO length = 26,
      input((put(year(W24JAJ9.DCTBIL), 4.) || compress(put(month(W24JAJ9.DCTBIL), Z2.)) || "01"), 8.) as DREFERENCIA_LEGADO length = 8,
      W1W4GLI.IARQUIVO_LEGADO length = 255,
      W24JAJ9.DCTBIL length = 8   
         format = DDMMYY10.
         informat = DDMMYY10.
   from
      work.W1W4GLI as W1W4GLI left join 
      work.W24JAJ9 as W24JAJ9
         on
         (
            W1W4GLI.CPEDIDO = W24JAJ9.CPEDIDO
         )
   ;
quit;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Join **/

/*==========================================================================* 
 * Step:            Extract                               A5J3RISO.AC0001C6 * 
 * Transform:       Extract                                                 * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Join - work.W213KDX                   A5J3RISO.AI0001HA * 
 * Target Table:    Extract - work.SGREROCITRANS          A5J3RISO.AI0001HB * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C6);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let SYSLAST = %nrquote(work.W213KDX); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete SGREROCITRANS;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create table work.SGREROCITRANS as
      select
         DTRANS,
         VTRANS,
         CTRANS,
         CPEDIDO,
         (IFN(DREFERENCIA_LEGADO = .,19430401,DREFERENCIA_LEGADO,19430401)) as DREFERENCIA_LEGADO length = 8,
         IARQUIVO_LEGADO,
         DCTBIL
   from &SYSLAST
   ;
quit;

%let SYSLAST = work.SGREROCITRANS;

%global etls_sql_pushDown;
%let etls_sql_pushDown = &sys_sql_ip_all;

%rcSet(&sqlrc); 



/**  Step end Extract **/

/*==========================================================================* 
 * Step:            Append                                A5J3RISO.AC0001C7 * 
 * Transform:       Append                                                  * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Tables:   Append - work.W3IAFSX                 A5J3RISO.AI0001G9 * 
 *                  Extract - work.W1RWILD                A5J3RISO.AI0001FZ * 
 *                  Extract - work.W2C9UK7                A5J3RISO.AI0001G2 * 
 *                  Extract - work.W326OIY                A5J3RISO.AI0001G3 * 
 *                  Extract - work.W1WPEK2                A5J3RISO.AI0001G0 * 
 *                  Extract - work.W371KSEP               A5J3RISO.AI0001FV * 
 *                  Extract - work.W10AKLC                A5J3RISO.AI0001FT * 
 *                  Extract - work.WW42K1                 A5J3RISO.AI0001FR * 
 *                  Extract - work.W1MH5IP                A5J3RISO.AI0001FY * 
 *                  Extract - work.W1JXHMU                A5J3RISO.AI0001FC * 
 *                  Extract - work.WS6HAX                 A5J3RISO.AI0001FP * 
 *                  Extract - work.WUHF63                 A5J3RISO.AI0001FQ * 
 *                  Extract - work.W28C4CU                A5J3RISO.AI0001G1 * 
 *                  Extract - work.WYTN1A                 A5J3RISO.AI0001FS * 
 *                  Extract - work.WBUP0F                 A5J3RISO.AI0001FI * 
 *                  Extract - work.W8OIWI                 A5J3RISO.AI0001FH * 
 *                  Extract - work.WK4M6I                 A5J3RISO.AI0001FL * 
 *                  Extract - work.W7Q5R5                 A5J3RISO.AI0001FG * 
 *                  Extract - work.W1IQPMR                A5J3RISO.AI0001FB * 
 *                  Extract - work.W375EQ8G               A5J3RISO.AI0001FX * 
 *                  Extract - work.W6094K                 A5J3RISO.AI0001FF * 
 *                  Extract - work.WM2LZ8                 A5J3RISO.AI0001FM * 
 *                  Extract - work.WPWH52                 A5J3RISO.AI0001FO * 
 *                  Extract - work.W34YQS6O               A5J3RISO.AI0001FD * 
 *                  Extract - work.W34SR1R0               A5J3RISO.AI0001F9 * 
 *                  Extract - work.WGKF05                 A5J3RISO.AI0001FJ * 
 *                  Extract - work.WNF0OC                 A5J3RISO.AI0001FN * 
 *                  Extract - work.W2GZ66                 A5J3RISO.AI0001FE * 
 *                  Extract - work.WHQ1H2                 A5J3RISO.AI0001FK * 
 *                  Extract - work.WWAV3WF                A5J3RISO.AI0001GA * 
 *                  Extract - work.W51UCT4                A5J3RISO.AI0001GB * 
 *                  Extract - work.W51D383                A5J3RISO.AI0001GC * 
 *                  Extract - work.W1QG3NPR               A5J3RISO.AI0001GD * 
 *                  Extract - work.W1QG3CN3               A5J3RISO.AI0001GE * 
 *                  Extract - work.W1QG30HF               A5J3RISO.AI0001GF * 
 *                  Extract - work.WIT718H                A5J3RISO.AI0001GG * 
 *                  Extract - work.WJ47WFD                A5J3RISO.AI0001GH * 
 *                  Extract - work.WIZY56K                A5J3RISO.AI0001GI * 
 *                  Extract - work.W12CTY8                A5J3RISO.AI0001GJ * 
 *                  Extract - work.W1KP59F                A5J3RISO.AI0001GK * 
 *                  Extract - work.W17FIU3                A5J3RISO.AI0001GL * 
 *                  Extract - work.W27MSDT                A5J3RISO.AI0001GM * 
 *                  Extract - work.W27PTQW                A5J3RISO.AI0001GN * 
 *                  BRAD_PROM_TRAB - work.BRAD_PROM_TRAB  A5J3RISO.AI0001H2 * 
 *                  Extract - work.TRAB_PRINC             A5J3RISO.AI0001H4 * 
 *                  Extract - work.CIVEL_HON              A5J3RISO.AI0001H5 * 
 *                  Extract - work.CIVEL_PRINC            A5J3RISO.AI0001H6 * 
 *                  Extract -                             A5J3RISO.AI0001GS * 
 *                   work.TRABALHISTA_PRINCIPAL_BBC                         * 
 *                  Extract -                             A5J3RISO.AI0001GT * 
 *                   work.TRABALHISTA_HONORARIOS_BBC                        * 
 *                  Extract - work.HONORARIOS_CIVEL_BBC   A5J3RISO.AI0001GR * 
 *                  Extract - work.CIVEL_PRINCIPAL_BBC    A5J3RISO.AI0001GQ * 
 *                  Extract - work.CIVEL_HONORARIOS_TEMPO A5J3RISO.AI0001GV * 
 *                  Extract - work.CIVEL_PRINCIPAL_TEMPO  A5J3RISO.AI0001GU * 
 *                  Extract -                             A5J3RISO.AI0001GW * 
 *                   work.TRABALHISTA_PRINCIPAL_TEMPO                       * 
 *                  Extract -                             A5J3RISO.AI0001GX * 
 *                   work.HONORARIOS_TRABALHISTA_TEMPO                      * 
 *                  Extract - work.Bradescard_P2_civprinc A5J3RISO.AI0001H0 * 
 *                  Extract - work.Bradescard_P2_gr5      A5J3RISO.AI0001H1 * 
 *                  Extract - work.BRAD_FIN_CIVEL         A5J3RISO.AI0001GY * 
 *                  Extract - work.BRAD_FIN_TRAB          A5J3RISO.AI0001GZ * 
 *                  Extract - work.GPAPROCI               A5J3RISO.AI0001H3 * 
 *                  Extract - work.plcc_sas               A5J3RISO.AI0001H7 * 
 *                  Extract - work.SGREROCITRANS          A5J3RISO.AI0001HB * 
 * Target Table:    Append - work.WXVVVBI                 A5J3RISO.AI0001HC * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C7);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

%let dbxrc = %eval(%sysfunc(exist(work.W3IAFSX, DATA)) or 
      %sysfunc(exist(work.W3IAFSX, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQ50;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQ50 as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ length = 8   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CCORRT,
         CJUN_DSTNO,
         VPERDA_VDDOR,
         CTIPO_PERDA_VDDOR,
         VPERDA_BDSCO,
         CTIPO_PERDA_BDSCO,
         CEMPR,
         REMPR,
         RDEPDC,
         IENVDO,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DFATOR_GERDR,
         DAJUIZ,
         DCAD,
         NPROCS,
         ICOMAR,
         IUF,
         RTIPO_ACAO,
         RSBTPO_ACAO,
         IDESP,
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         VDESP_BDSCO,
         VDESP_VDDOR,
         CCARGA,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.W3IAFSX
   ;
quit;

%let SYSLAST = work.W2SBOQ50;

%let dbxrc = %eval(%sysfunc(exist(work.W1RWILD, DATA)) or 
      %sysfunc(exist(work.W1RWILD, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQ6G;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQ6G as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            format = 4.
            informat = BEST12.
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            format = 3.
            informat = BEST12.
            label = 'cdSubtipoAcao',
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         REMPR   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         IENVDO   
            format = $50.
            informat = $CHAR41.
            label = 'nmEnvolvido',
         CCPF_CNPJ   
            format = $15.
            label = 'cdCpfCnpj',
         CCLASF_ENVDO   
            format = 1.
            informat = BEST12.
            label = 'cdClassificacaoEnvolvido',
         DAJUIZ   
            informat = DATE9.
            label = 'dtAjuizamento',
         DCAD   
            informat = DATE9.
            label = 'dtCadastro',
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.
            label = 'nmComarca',
         IUF   
            format = $2.
            informat = $CHAR2.
            label = 'nmUF',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            informat = $CHAR50.
            label = 'dsSubtipoAcao',
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         VPERDA_RCUPC
   from work.W1RWILD
   ;
quit;

%let SYSLAST = work.W2SBOQ6G;

%let dbxrc = %eval(%sysfunc(exist(work.W2C9UK7, DATA)) or 
      %sysfunc(exist(work.W2C9UK7, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQ7Z;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQ7Z as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         IDESP   
            informat = $CHAR23.,
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.,
         VDESP_BDSCO   
            format = COMMAX16.2
            informat = COMMA12.,
         VDESP_VDDOR   
            format = COMMAX16.2
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.W2C9UK7
   ;
quit;

%let SYSLAST = work.W2SBOQ7Z;

%let dbxrc = %eval(%sysfunc(exist(work.W326OIY, DATA)) or 
      %sysfunc(exist(work.W326OIY, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQ9R;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQ9R as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ length = 8   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            format = 3.
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         IDESP   
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.,
         VBAIXA   
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.W326OIY
   ;
quit;

%let SYSLAST = work.W2SBOQ9R;

%let dbxrc = %eval(%sysfunc(exist(work.W1WPEK2, DATA)) or 
      %sysfunc(exist(work.W1WPEK2, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQB9;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQB9 as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ length = 8   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            format = 3.
            informat = BEST12.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         IDESP   
            informat = $CHAR23.,
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VDESP_BDSCO   
            format = COMMAX16.2
            informat = COMMA12.,
         VDESP_VDDOR   
            format = COMMAX16.2
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         VPERDA_RCUPC
   from work.W1WPEK2
   ;
quit;

%let SYSLAST = work.W2SBOQB9;

%let dbxrc = %eval(%sysfunc(exist(work.W371KSEP, DATA)) or 
      %sysfunc(exist(work.W371KSEP, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQCP;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQCP as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CCORRT,
         CJUN_DSTNO,
         CEMPR   
            format = 3.
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         CCPF_CNPJ,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA   
            format = $35.,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CRECLA,
         RRECLA,
         CSEGUN_RECLA,
         RSEGUN_RECLA,
         IRECLA,
         CCLASF_RECLA,
         DDEMIS
   from work.W371KSEP
   ;
quit;

%let SYSLAST = work.W2SBOQCP;

%let dbxrc = %eval(%sysfunc(exist(work.W10AKLC, DATA)) or 
      %sysfunc(exist(work.W10AKLC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQE5;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQE5 as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO length = 8   
            format = 5.
            informat = 5.,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         REMPR length = 50   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NCATAO,
         COSIF,
         RCTA,
         CMOTVO_CANC,
         RLOCAL
   from work.W10AKLC
   ;
quit;

%let SYSLAST = work.W2SBOQE5;

%let dbxrc = %eval(%sysfunc(exist(work.WW42K1, DATA)) or 
      %sysfunc(exist(work.WW42K1, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQFJ;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQFJ as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         CCPF_CNPJ,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CRECLA length = 8,
         RRECLA,
         CSEGUN_RECLA length = 8,
         RSEGUN_RECLA,
         IRECLA,
         CCLASF_RECLA length = 8,
         DDEMIS
   from work.WW42K1
   ;
quit;

%let SYSLAST = work.W2SBOQFJ;

%let dbxrc = %eval(%sysfunc(exist(work.W1MH5IP, DATA)) or 
      %sysfunc(exist(work.W1MH5IP, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQGZ;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQGZ as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ length = 8   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CJUN_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         CCPF_CNPJ,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            format = DDMMYY10.,
         DCAD,
         NPROCS   
            format = $20.
            informat = $20.,
         ICOMAR   
            informat = $CHAR27.,
         IUF,
         IDESP   
            label = 'nnmDespesa',
         DBAIXA,
         RMOTVO_BAIXA,
         VBAIXA,
         CCARGA   
            label = 'cdCarga',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CRECLA   
            informat = 7.,
         RRECLA   
            informat = $50.,
         CSEGUN_RECLA length = 8   
            informat = 7.,
         RSEGUN_RECLA   
            informat = $50.,
         IRECLA   
            informat = $50.,
         DDEMIS   
            informat = DDMMYY10.,
         VDESP_ACESS
   from work.W1MH5IP
   ;
quit;

%let SYSLAST = work.W2SBOQGZ;

%let dbxrc = %eval(%sysfunc(exist(work.W1JXHMU, DATA)) or 
      %sysfunc(exist(work.W1JXHMU, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQIG;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQIG as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         REMPR   
            format = $50.
            informat = $CHAR42.,
         CCPF_CNPJ,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.,
         IUF   
            format = $2.
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CRECLA length = 8,
         RRECLA   
            format = $50.
            informat = $50.,
         CSEGUN_RECLA length = 8,
         RSEGUN_RECLA   
            format = $50.
            informat = $50.,
         IRECLA   
            format = $50.
            informat = $50.,
         CCLASF_RECLA length = 8   
            format = 1.
            informat = 1.,
         DDEMIS,
         CEMPR_CIVEL
   from work.W1JXHMU
   ;
quit;

%let SYSLAST = work.W2SBOQIG;

%let dbxrc = %eval(%sysfunc(exist(work.WS6HAX, DATA)) or 
      %sysfunc(exist(work.WS6HAX, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQJX;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQJX as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         Origem,
         ID_BASE,
         ITAB,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            label = 'cdEmpresa',
         CCPF_CNPJ   
            label = 'cdCpfCnpj',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         RHIST_OCORR,
         CFUNCI,
         CTIPO_FRAUD,
         CPRODU,
         CCANAL_ATEND,
         CREGIS_CORRT,
         DCONTR
   from work.WS6HAX
   ;
quit;

%let SYSLAST = work.W2SBOQJX;

%let dbxrc = %eval(%sysfunc(exist(work.WUHF63, DATA)) or 
      %sysfunc(exist(work.WUHF63, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQLC;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQLC as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            format = 3.
            label = 'cdSubtipoAcao',
         CEMPR   
            format = 3.
            label = 'cdEmpresa',
         REMPR length = 50   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC length = 50   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         CCLASF_ENVDO   
            informat = BEST12.
            label = 'cdClassificacaoEnvolvido',
         DCAD   
            format = DDMMYY10.
            informat = DATE9.,
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            label = 'dsSubtipoAcao',
         DBAIXA   
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IRECLA length = 50   
            format = $50.
            informat = $50.
            label = 'nmReclamante',
         NRO_DOCUMENTO,
         TIPO_ENVOLVIMENTO,
         CBAIXA,
         TPDESP
   from work.WUHF63
   ;
quit;

%let SYSLAST = work.W2SBOQLC;

%let dbxrc = %eval(%sysfunc(exist(work.W28C4CU, DATA)) or 
      %sysfunc(exist(work.W28C4CU, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQMU;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQMU as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         IDESP   
            informat = $CHAR23.,
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.,
         VDESP_BDSCO   
            format = COMMAX16.2
            informat = COMMA12.,
         VDESP_VDDOR   
            format = COMMAX16.2
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.W28C4CU
   ;
quit;

%let SYSLAST = work.W2SBOQMU;

%let dbxrc = %eval(%sysfunc(exist(work.WYTN1A, DATA)) or 
      %sysfunc(exist(work.WYTN1A, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQOA;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQOA as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            format = 4.
            informat = BEST12.
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            format = 3.
            informat = BEST12.
            label = 'cdSubtipoAcao',
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         REMPR   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         IENVDO   
            format = $50.
            informat = $CHAR41.
            label = 'nmEnvolvido',
         CCPF_CNPJ   
            format = $15.
            label = 'cdCpfCnpj',
         CCLASF_ENVDO   
            format = 1.
            informat = BEST12.
            label = 'cdClassificacaoEnvolvido',
         DAJUIZ   
            informat = DATE9.
            label = 'dtAjuizamento',
         DCAD   
            informat = DATE9.
            label = 'dtCadastro',
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.
            label = 'nmComarca',
         IUF   
            format = $2.
            informat = $CHAR2.
            label = 'nmUF',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            informat = $CHAR50.
            label = 'dsSubtipoAcao',
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            label = 'dsMotivoBaixa',
         VBAIXA   
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.WYTN1A
   ;
quit;

%let SYSLAST = work.W2SBOQOA;

%let dbxrc = %eval(%sysfunc(exist(work.WBUP0F, DATA)) or 
      %sysfunc(exist(work.WBUP0F, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQPS;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQPS as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         DDESCB,
         NOME_BASE,
         CEMPR   
            informat = BEST12.,
         CCPF_CNPJ length = 15   
            format = $15.,
         IUF   
            informat = $CHAR2.
            label = 'nmUF',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NCATAO   
            format = $16.
            informat = $16.,
         CTIPO_FRAUD   
            format = 3.
            informat = 3.,
         DARQUI,
         CBIN_CATAO
   from work.WBUP0F
   ;
quit;

%let SYSLAST = work.W2SBOQPS;

%let dbxrc = %eval(%sysfunc(exist(work.W8OIWI, DATA)) or 
      %sysfunc(exist(work.W8OIWI, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQR7;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQR7 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NCATAO,
         CPRODU   
            format = BEST12.
            informat = BEST12.,
         RPRODU,
         RTIPO_FRAUD
   from work.W8OIWI
   ;
quit;

%let SYSLAST = work.W2SBOQR7;

%let dbxrc = %eval(%sysfunc(exist(work.WK4M6I, DATA)) or 
      %sysfunc(exist(work.WK4M6I, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQSL;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQSL as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST length = 3410   
            format = $3410.,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         CCPF_CNPJ,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CFUNCI   
            format = BEST12.
            informat = BEST12.
   from work.WK4M6I
   ;
quit;

%let SYSLAST = work.W2SBOQSL;

%let dbxrc = %eval(%sysfunc(exist(work.W7Q5R5, DATA)) or 
      %sysfunc(exist(work.W7Q5R5, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQU0;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQU0 as
      select
         CDEPDC   
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CCTA_CLIE,
         VREEMB_BDN,
         VREEMB,
         VENC_BDN,
         VENC_TRANS,
         VCPMF_TRANS,
         CPEDIDO,
         CTP_CTA_BDN,
         CTP_OCORR_BDN,
         CAG_CLIE,
         CMAQUINA,
         CLOC_EQUIP,
         CELAB_BO,
         CAUX_TERC,
         CFORM_REEB_BDN,
         CCPMF_BDN,
         CREINCIDENTE,
         CTP_EQUIP
   from work.W7Q5R5
   ;
quit;

%let SYSLAST = work.W2SBOQU0;

%let dbxrc = %eval(%sysfunc(exist(work.W1IQPMR, DATA)) or 
      %sysfunc(exist(work.W1IQPMR, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQVF;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQVF as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CCORRT,
         CJUN_DSTNO,
         CEMPR   
            format = 3.
            informat = BEST12.,
         REMPR   
            format = $50.
            informat = $CHAR42.,
         CCPF_CNPJ   
            format = $15.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.,
         IUF   
            format = $2.
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CRECLA length = 8   
            format = 7.
            informat = 7.,
         RRECLA   
            format = $50.
            informat = $50.,
         CSEGUN_RECLA length = 8   
            format = 7.
            informat = 7.,
         RSEGUN_RECLA   
            format = $50.
            informat = $50.,
         IRECLA   
            format = $50.
            informat = $50.,
         CCLASF_RECLA   
            format = 1.
            informat = 1.,
         DDEMIS,
         CEMPR_CIVEL   
            label = 'cdEmpresaCivel'
   from work.W1IQPMR
   ;
quit;

%let SYSLAST = work.W2SBOQVF;

%let dbxrc = %eval(%sysfunc(exist(work.W375EQ8G, DATA)) or 
      %sysfunc(exist(work.W375EQ8G, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQWX;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQWX as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CCORRT,
         CJUN_DSTNO,
         CEMPR   
            format = 3.
            informat = BEST12.,
         REMPR   
            format = $50.
            informat = $CHAR42.,
         CCPF_CNPJ   
            format = $15.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.,
         IUF   
            format = $2.
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CRECLA length = 8   
            format = 7.
            informat = 7.,
         RRECLA   
            format = $50.
            informat = $50.,
         CSEGUN_RECLA length = 8   
            format = 7.
            informat = 7.,
         RSEGUN_RECLA   
            format = $50.
            informat = $50.,
         IRECLA   
            format = $50.
            informat = $50.,
         CCLASF_RECLA   
            format = 1.
            informat = 1.,
         DDEMIS   
            format = DDMMYY10.
            informat = DDMMYY10.,
         CEMPR_CIVEL   
            label = 'cdEmpresaCivel',
         RTIPO_PERDA
   from work.W375EQ8G
   ;
quit;

%let SYSLAST = work.W2SBOQWX;

%let dbxrc = %eval(%sysfunc(exist(work.W6094K, DATA)) or 
      %sysfunc(exist(work.W6094K, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQYE;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQYE as
      select
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         CCPF_CNPJ length = 15   
            format = $15.
            label = 'cdCpfCnpj',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CHIST_PERDA,
         CPROD
   from work.W6094K
   ;
quit;

%let SYSLAST = work.W2SBOQYE;

%let dbxrc = %eval(%sysfunc(exist(work.WM2LZ8, DATA)) or 
      %sysfunc(exist(work.WM2LZ8, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOQZS;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOQZS as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.
            informat = $3410.,
         CGCPJ   
            format = 20.
            informat = 20.,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            format = 3.
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.WM2LZ8
   ;
quit;

%let SYSLAST = work.W2SBOQZS;

%let dbxrc = %eval(%sysfunc(exist(work.WPWH52, DATA)) or 
      %sysfunc(exist(work.WPWH52, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOR19;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOR19 as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         CCPF_CNPJ,
         IUF   
            informat = $CHAR2.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NOper,
         CPROM,
         IMUN
   from work.WPWH52
   ;
quit;

%let SYSLAST = work.W2SBOR19;

%let dbxrc = %eval(%sysfunc(exist(work.W34YQS6O, DATA)) or 
      %sysfunc(exist(work.W34YQS6O, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOR2N;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOR2N as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.
            informat = $3410.,
         CGCPJ length = 8   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            informat = BEST12.,
         REMPR   
            format = $50.
            informat = $CHAR42.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ   
            label = 'cdCpfCnpj',
         CCLASF_ENVDO   
            informat = BEST12.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IRECMT
   from work.W34YQS6O
   ;
quit;

%let SYSLAST = work.W2SBOR2N;

%let dbxrc = %eval(%sysfunc(exist(work.W34SR1R0, DATA)) or 
      %sysfunc(exist(work.W34SR1R0, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOR42;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOR42 as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         COD_LACTO
   from work.W34SR1R0
   ;
quit;

%let SYSLAST = work.W2SBOR42;

%let dbxrc = %eval(%sysfunc(exist(work.WGKF05, DATA)) or 
      %sysfunc(exist(work.WGKF05, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOR5F;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOR5F as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         CCPF_CNPJ,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CFUNCI   
            format = BEST12.
            informat = BEST12.
   from work.WGKF05
   ;
quit;

%let SYSLAST = work.W2SBOR5F;

%let dbxrc = %eval(%sysfunc(exist(work.WNF0OC, DATA)) or 
      %sysfunc(exist(work.WNF0OC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOR6T;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOR6T as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.
            informat = $3410.,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            format = 3.
            informat = BEST12.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         IDESP   
            informat = $CHAR23.,
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VDESP_VDDOR   
            format = COMMAX16.2
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         VPERDA_RCUPC
   from work.WNF0OC
   ;
quit;

%let SYSLAST = work.W2SBOR6T;

%let dbxrc = %eval(%sysfunc(exist(work.W2GZ66, DATA)) or 
      %sysfunc(exist(work.W2GZ66, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOR8A;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOR8A as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR,
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         DDESCB,
         NOME_BASE,
         CCPF_CNPJ   
            label = 'cdCpfCnpj',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CFUNC,
         CSECAO,
         CCORRL2,
         CLANC,
         CBOLSA,
         SEG_CTVM,
         ASSESSOR,
         MESA_OPER
   from work.W2GZ66
   ;
quit;

%let SYSLAST = work.W2SBOR8A;

%let dbxrc = %eval(%sysfunc(exist(work.WHQ1H2, DATA)) or 
      %sysfunc(exist(work.WHQ1H2, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOR9O;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOR9O as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL   
            format = $45.
            informat = $45.,
         Origem,
         ID_BASE,
         ITAB,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         CCPF_CNPJ   
            format = $15.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NCATAO   
            informat = $16.,
         CMOTVO_CANC,
         CPRODU   
            format = BEST12.
            informat = BEST12.,
         CBIN_CATAO length = 6   
            format = $6.,
         RPRODU   
            format = $30.
            informat = $23.,
         CBANDE,
         CSTUS,
         ICIDAD_CLINT,
         IESTAD_CLINT,
         CTRANS,
         RTIPO_TRANS,
         CESTAB_TRANS,
         ICIDAD_ESTAB,
         IESTAD_ESTAB,
         CFLAG_SEG,
         CSEQ_REGIS
   from work.WHQ1H2
   ;
quit;

%let SYSLAST = work.W2SBOR9O;

%let dbxrc = %eval(%sysfunc(exist(work.WWAV3WF, DATA)) or 
      %sysfunc(exist(work.WWAV3WF, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORB4;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORB4 as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         CGCPJ,
         DDESCB,
         NOME_BASE,
         CEMPR   
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         CCPF_CNPJ,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS   
            label = 'nuProcesso',
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA,
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CRECLA length = 8,
         RRECLA,
         CSEGUN_RECLA length = 8,
         RSEGUN_RECLA,
         IRECLA,
         CCLASF_RECLA length = 8,
         DDEMIS,
         VDESP_ACESS   
            format = COMMAX16.2
            informat = COMMA12.
   from work.WWAV3WF
   ;
quit;

%let SYSLAST = work.W2SBORB4;

%let dbxrc = %eval(%sysfunc(exist(work.W51UCT4, DATA)) or 
      %sysfunc(exist(work.W51UCT4, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORCK;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORCK as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         DDESCB,
         NOME_BASE,
         CEMPR   
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NCATAO   
            format = $16.,
         CBIN_CATAO   
            format = $6.,
         CBANDE,
         RMOTVO_CANC,
         IBANDE,
         TP_CARTAO
   from work.W51UCT4
   ;
quit;

%let SYSLAST = work.W2SBORCK;

%let dbxrc = %eval(%sysfunc(exist(work.W51D383, DATA)) or 
      %sysfunc(exist(work.W51D383, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORDX;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORDX as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NCATAO   
            format = $16.,
         CMOTVO_CANC,
         CBIN_CATAO
   from work.W51D383
   ;
quit;

%let SYSLAST = work.W2SBORDX;

%let dbxrc = %eval(%sysfunc(exist(work.W1QG3NPR, DATA)) or 
      %sysfunc(exist(work.W1QG3NPR, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORFA;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORFA as
      select
         CDEPDC,
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NCOTACAO,
         NOBJETO
   from work.W1QG3NPR
   ;
quit;

%let SYSLAST = work.W2SBORFA;

%let dbxrc = %eval(%sysfunc(exist(work.W1QG3CN3, DATA)) or 
      %sysfunc(exist(work.W1QG3CN3, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORGO;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORGO as
      select
         CDEPDC,
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IPLANO_SEG
   from work.W1QG3CN3
   ;
quit;

%let SYSLAST = work.W2SBORGO;

%let dbxrc = %eval(%sysfunc(exist(work.W1QG30HF, DATA)) or 
      %sysfunc(exist(work.W1QG30HF, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORI1;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORI1 as
      select
         CDEPDC,
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NBDN
   from work.W1QG30HF
   ;
quit;

%let SYSLAST = work.W2SBORI1;

%let dbxrc = %eval(%sysfunc(exist(work.WIT718H, DATA)) or 
      %sysfunc(exist(work.WIT718H, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORJF;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORJF as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         REVENTO
   from work.WIT718H
   ;
quit;

%let SYSLAST = work.W2SBORJF;

%let dbxrc = %eval(%sysfunc(exist(work.WJ47WFD, DATA)) or 
      %sysfunc(exist(work.WJ47WFD, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORKS;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORKS as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         CCPF_CNPJ   
            label = 'cdCpfCnpj',
         DCAD   
            informat = DATE9.
            label = 'dtCadastro',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         REVENTO,
         COBJETO,
         CPROJ
   from work.WJ47WFD
   ;
quit;

%let SYSLAST = work.W2SBORKS;

%let dbxrc = %eval(%sysfunc(exist(work.WIZY56K, DATA)) or 
      %sysfunc(exist(work.WIZY56K, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORM6;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORM6 as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NBDN,
         RSTATUS,
         RSGMTO_DBDN
   from work.WIZY56K
   ;
quit;

%let SYSLAST = work.W2SBORM6;

%let dbxrc = %eval(%sysfunc(exist(work.W12CTY8, DATA)) or 
      %sysfunc(exist(work.W12CTY8, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORNJ;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORNJ as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CMOTVO_CANC,
         NBDN   
            format = $10.
            informat = $10.
   from work.W12CTY8
   ;
quit;

%let SYSLAST = work.W2SBORNJ;

%let dbxrc = %eval(%sysfunc(exist(work.W1KP59F, DATA)) or 
      %sysfunc(exist(work.W1KP59F, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORP1;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORP1 as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR   
            informat = BEST12.,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ length = 15,
         CCLASF_ENVDO   
            informat = BEST12.,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         ISBTPO_ACAO
   from work.W1KP59F
   ;
quit;

%let SYSLAST = work.W2SBORP1;

%let dbxrc = %eval(%sysfunc(exist(work.W17FIU3, DATA)) or 
      %sysfunc(exist(work.W17FIU3, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORQI;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORQI as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         NBDN   
            format = $10.
            informat = $10.,
         RSTATUS
   from work.W17FIU3
   ;
quit;

%let SYSLAST = work.W2SBORQI;

%let dbxrc = %eval(%sysfunc(exist(work.W27MSDT, DATA)) or 
      %sysfunc(exist(work.W27MSDT, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORRW;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORRW as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO,
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         REMPR   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         IENVDO   
            format = $50.
            informat = $CHAR41.
            label = 'nmEnvolvido',
         CCPF_CNPJ   
            format = $15.
            label = 'cdCpfCnpj',
         CCLASF_ENVDO   
            format = 1.
            informat = BEST12.
            label = 'cdClassificacaoEnvolvido',
         DAJUIZ   
            informat = DATE9.
            label = 'dtAjuizamento',
         DCAD   
            informat = DATE9.
            label = 'dtCadastro',
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.
            label = 'nmComarca',
         IUF   
            format = $2.
            informat = $CHAR2.
            label = 'nmUF',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            informat = $CHAR50.
            label = 'dsSubtipoAcao',
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            label = 'dsMotivoBaixa',
         VBAIXA   
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.W27MSDT
   ;
quit;

%let SYSLAST = work.W2SBORRW;

%let dbxrc = %eval(%sysfunc(exist(work.W27PTQW, DATA)) or 
      %sysfunc(exist(work.W27PTQW, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORTE;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORTE as
      select
         CDEPDC,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL,
         CJUNC_DSTNO,
         CSGMTO,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.,
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.,
         CIDTFD_CNTRL,
         Origem,
         ID_BASE,
         ITAB,
         RHIST   
            format = $3410.,
         CGCPJ,
         IPAIS_TRANS,
         DDESCB,
         NOME_BASE,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO,
         CEMPR   
            format = 3.
            informat = BEST12.
            label = 'cdEmpresa',
         RDEPDC   
            informat = $CHAR21.,
         IENVDO length = 50   
            format = $50.
            informat = $CHAR41.
            label = 'nmEnvolvido',
         CCLASF_ENVDO   
            format = 1.
            informat = BEST12.
            label = 'cdClassificacaoEnvolvido',
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR length = 40   
            format = $40.
            informat = $CHAR27.
            label = 'nmComarca',
         IUF   
            format = $2.
            informat = $CHAR2.
            label = 'nmUF',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            informat = $CHAR50.
            label = 'dsSubtipoAcao',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CFUNCI   
            format = BEST12.
            informat = BEST12.,
         CPRODU   
            format = BEST12.
            informat = BEST12.,
         NDOC,
         CAREA,
         CRAIZ
   from work.W27PTQW
   ;
quit;

%let SYSLAST = work.W2SBORTE;

%let dbxrc = %eval(%sysfunc(exist(work.BRAD_PROM_TRAB, DATA)) or 
      %sysfunc(exist(work.BRAD_PROM_TRAB, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORUV;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORUV as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         IDESP   
            informat = $CHAR23.,
         DBAIXA   
            informat = DATE9.,
         RMOTVO_BAIXA   
            informat = $CHAR32.,
         VDESP_VDDOR   
            format = COMMAX16.2
            informat = COMMA12.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         VPERDA_RCUPC
   from work.BRAD_PROM_TRAB
   ;
quit;

%let SYSLAST = work.W2SBORUV;

%let dbxrc = %eval(%sysfunc(exist(work.TRAB_PRINC, DATA)) or 
      %sysfunc(exist(work.TRAB_PRINC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORWC;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORWC as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            format = $45.
            informat = $45.,
         RHIST,
         CGCPJ length = 8   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         DDESCB,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR,
         REMPR   
            format = $50.
            informat = $CHAR42.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ   
            label = 'cdCpfCnpj',
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IRECMT
   from work.TRAB_PRINC
   ;
quit;

%let SYSLAST = work.W2SBORWC;

%let dbxrc = %eval(%sysfunc(exist(work.CIVEL_HON, DATA)) or 
      %sysfunc(exist(work.CIVEL_HON, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORXS;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORXS as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            format = $45.
            informat = $45.,
         RHIST,
         CGCPJ length = 8   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         DDESCB,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR,
         REMPR   
            format = $50.
            informat = $CHAR42.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ   
            label = 'cdCpfCnpj',
         CCLASF_ENVDO,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IRECMT
   from work.CIVEL_HON
   ;
quit;

%let SYSLAST = work.W2SBORXS;

%let dbxrc = %eval(%sysfunc(exist(work.CIVEL_PRINC, DATA)) or 
      %sysfunc(exist(work.CIVEL_PRINC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBORZ8;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBORZ8 as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.,
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL   
            format = $45.
            informat = $45.,
         RHIST,
         CGCPJ length = 8   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         DDESCB,
         CTIPO_ACAO   
            informat = BEST12.,
         CSBTPO_ACAO   
            informat = BEST12.,
         CEMPR,
         REMPR   
            format = $50.
            informat = $CHAR42.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ   
            label = 'cdCpfCnpj',
         CCLASF_ENVDO,
         RTIPO_ACAO   
            informat = $CHAR40.,
         RSBTPO_ACAO   
            informat = $CHAR50.,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IRECMT
   from work.CIVEL_PRINC
   ;
quit;

%let SYSLAST = work.W2SBORZ8;

%let dbxrc = %eval(%sysfunc(exist(work.TRABALHISTA_PRINCIPAL_BBC, DATA)) or 
      %sysfunc(exist(work.TRABALHISTA_PRINCIPAL_BBC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOS0P;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOS0P as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.TRABALHISTA_PRINCIPAL_BBC
   ;
quit;

%let SYSLAST = work.W2SBOS0P;

%let dbxrc = %eval(%sysfunc(exist(work.TRABALHISTA_HONORARIOS_BBC, DATA)) or 
      %sysfunc(exist(work.TRABALHISTA_HONORARIOS_BBC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOS26;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOS26 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.TRABALHISTA_HONORARIOS_BBC
   ;
quit;

%let SYSLAST = work.W2SBOS26;

%let dbxrc = %eval(%sysfunc(exist(work.HONORARIOS_CIVEL_BBC, DATA)) or 
      %sysfunc(exist(work.HONORARIOS_CIVEL_BBC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOS3N;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOS3N as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.HONORARIOS_CIVEL_BBC
   ;
quit;

%let SYSLAST = work.W2SBOS3N;

%let dbxrc = %eval(%sysfunc(exist(work.CIVEL_PRINCIPAL_BBC, DATA)) or 
      %sysfunc(exist(work.CIVEL_PRINCIPAL_BBC, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOS54;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOS54 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.CIVEL_PRINCIPAL_BBC
   ;
quit;

%let SYSLAST = work.W2SBOS54;

%let dbxrc = %eval(%sysfunc(exist(work.CIVEL_HONORARIOS_TEMPO, DATA)) or 
      %sysfunc(exist(work.CIVEL_HONORARIOS_TEMPO, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOS6L;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOS6L as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.CIVEL_HONORARIOS_TEMPO
   ;
quit;

%let SYSLAST = work.W2SBOS6L;

%let dbxrc = %eval(%sysfunc(exist(work.CIVEL_PRINCIPAL_TEMPO, DATA)) or 
      %sysfunc(exist(work.CIVEL_PRINCIPAL_TEMPO, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOS82;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOS82 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.CIVEL_PRINCIPAL_TEMPO
   ;
quit;

%let SYSLAST = work.W2SBOS82;

%let dbxrc = %eval(%sysfunc(exist(work.TRABALHISTA_PRINCIPAL_TEMPO, DATA)) or 
      %sysfunc(exist(work.TRABALHISTA_PRINCIPAL_TEMPO, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOS9J;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOS9J as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.TRABALHISTA_PRINCIPAL_TEMPO
   ;
quit;

%let SYSLAST = work.W2SBOS9J;

%let dbxrc = %eval(%sysfunc(exist(work.HONORARIOS_TRABALHISTA_TEMPO, DATA)) or 
      %sysfunc(exist(work.HONORARIOS_TRABALHISTA_TEMPO, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSB0;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSB0 as
      select
         CDEPDC   
            format = 5.
            informat = 5.,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL   
            informat = DDMMYY8.,
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.,
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         CGCPJ   
            format = 20.
            informat = 20.,
         CTIPO_ACAO,
         CSBTPO_ACAO,
         CEMPR,
         REMPR   
            informat = $CHAR42.,
         RDEPDC   
            informat = $CHAR21.,
         IENVDO   
            informat = $CHAR41.,
         CCPF_CNPJ,
         CCLASF_ENVDO,
         DAJUIZ   
            informat = DATE9.,
         DCAD   
            informat = DATE9.,
         NPROCS,
         ICOMAR   
            informat = $CHAR27.,
         IUF   
            informat = $CHAR2.,
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.HONORARIOS_TRABALHISTA_TEMPO
   ;
quit;

%let SYSLAST = work.W2SBOSB0;

%let dbxrc = %eval(%sysfunc(exist(work.Bradescard_P2_civprinc, DATA)) or 
      %sysfunc(exist(work.Bradescard_P2_civprinc, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSCH;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSCH as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL length = 8   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 8   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         CTIPO_ACAO   
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            label = 'cdSubtipoAcao',
         CEMPR   
            label = 'cdEmpresa',
         REMPR   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         IENVDO   
            format = $50.
            informat = $CHAR41.
            label = 'nmEnvolvido',
         CCPF_CNPJ   
            format = $15.
            label = 'cdCpfCnpj',
         CCLASF_ENVDO   
            label = 'cdClassificacaoEnvolvido',
         DAJUIZ   
            informat = DATE9.
            label = 'dtAjuizamento',
         DCAD   
            informat = DATE9.
            label = 'dtCadastro',
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.
            label = 'nmComarca',
         IUF   
            format = $2.
            informat = $CHAR2.
            label = 'nmUF',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            informat = $CHAR50.
            label = 'dsSubtipoAcao',
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.Bradescard_P2_civprinc
   ;
quit;

%let SYSLAST = work.W2SBOSCH;

%let dbxrc = %eval(%sysfunc(exist(work.Bradescard_P2_gr5, DATA)) or 
      %sysfunc(exist(work.Bradescard_P2_gr5, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSE1;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSE1 as
      select
         CDEPDC length = 8   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2,
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL length = 8   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO length = 8   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.,
         CGRP_ATGDO_PERDA length = 8   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         CTIPO_ACAO   
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            label = 'cdSubtipoAcao',
         CEMPR   
            label = 'cdEmpresa',
         REMPR   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         IENVDO   
            format = $50.
            informat = $CHAR41.
            label = 'nmEnvolvido',
         CCPF_CNPJ   
            format = $15.
            label = 'cdCpfCnpj',
         CCLASF_ENVDO   
            label = 'cdClassificacaoEnvolvido',
         DAJUIZ   
            informat = DATE9.
            label = 'dtAjuizamento',
         DCAD   
            informat = DATE9.
            label = 'dtCadastro',
         NPROCS   
            format = $20.
            informat = $20.
            label = 'nuProcesso',
         ICOMAR   
            format = $40.
            informat = $CHAR27.
            label = 'nmComarca',
         IUF   
            format = $2.
            informat = $CHAR2.
            label = 'nmUF',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            informat = $CHAR50.
            label = 'dsSubtipoAcao',
         IDESP   
            format = $25.
            informat = $CHAR23.
            label = 'nnmDespesa',
         DBAIXA   
            informat = DATE9.
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            format = $35.
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.Bradescard_P2_gr5
   ;
quit;

%let SYSLAST = work.W2SBOSE1;

%let dbxrc = %eval(%sysfunc(exist(work.BRAD_FIN_CIVEL, DATA)) or 
      %sysfunc(exist(work.BRAD_FIN_CIVEL, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSFL;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSFL as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA   
            format = $2.
            informat = $2.,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         CTIPO_ACAO   
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            label = 'cdSubtipoAcao',
         CEMPR   
            label = 'cdEmpresa',
         REMPR length = 50   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC length = 50   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         CCLASF_ENVDO   
            informat = BEST12.
            label = 'cdClassificacaoEnvolvido',
         DCAD   
            format = DDMMYY10.
            informat = DATE9.,
         NPROCS   
            label = 'nuProcesso',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            label = 'dsSubtipoAcao',
         DBAIXA   
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IRECLA length = 50   
            format = $50.
            informat = $50.
            label = 'nmReclamante',
         NRO_DOCUMENTO,
         TIPO_ENVOLVIMENTO,
         CBAIXA,
         TPDESP
   from work.BRAD_FIN_CIVEL
   ;
quit;

%let SYSLAST = work.W2SBOSFL;

%let dbxrc = %eval(%sysfunc(exist(work.BRAD_FIN_TRAB, DATA)) or 
      %sysfunc(exist(work.BRAD_FIN_TRAB, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSH3;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSH3 as
      select
         CDEPDC   
            format = 5.
            informat = 5.
            label = 'cdDependencia',
         CRZ_CTBIL   
            label = 'cdRazaoContabil',
         CCTA_CTBIL   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CCORRL   
            format = 5.
            informat = 5.
            label = 'cdCorrelata',
         CJUNC_DSTNO   
            format = 5.
            informat = 5.
            label = 'cdJuncaoDestino',
         CSGMTO length = 8   
            format = 10.
            informat = 10.,
         CLIN_NEGOC,
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         CGCPJ   
            format = 20.
            informat = 20.
            label = 'cdGCPJ',
         CTIPO_ACAO   
            label = 'cdTipoAcao',
         CSBTPO_ACAO   
            label = 'cdSubtipoAcao',
         CEMPR   
            label = 'cdEmpresa',
         REMPR length = 50   
            format = $50.
            informat = $CHAR42.
            label = 'dsEmpresa',
         RDEPDC length = 50   
            format = $50.
            informat = $CHAR21.
            label = 'dsDependencia',
         CCLASF_ENVDO   
            label = 'cdClassificacaoEnvolvido',
         DCAD   
            format = DDMMYY10.
            informat = DATE9.,
         NPROCS   
            label = 'nuProcesso',
         RTIPO_ACAO   
            format = $50.
            informat = $CHAR40.
            label = 'dsTipoAcao',
         RSBTPO_ACAO   
            format = $50.
            label = 'dsSubtipoAcao',
         DBAIXA   
            label = 'dtBaixa',
         RMOTVO_BAIXA   
            informat = $CHAR32.
            label = 'dsMotivoBaixa',
         VBAIXA   
            format = COMMAX16.2
            informat = COMMA12.
            label = 'vrBaixa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         IRECLA length = 50   
            format = $50.
            informat = $50.
            label = 'nmReclamante',
         NRO_DOCUMENTO,
         TIPO_ENVOLVIMENTO,
         CBAIXA,
         TPDESP
   from work.BRAD_FIN_TRAB
   ;
quit;

%let SYSLAST = work.W2SBOSH3;

%let dbxrc = %eval(%sysfunc(exist(work.GPAPROCI, DATA)) or 
      %sysfunc(exist(work.GPAPROCI, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSIL;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSIL as
      select
         CDEPDC length = 8,
         CRZ_CTBIL,
         CCTA_CTBIL,
         DCTBIL,
         VPERDA,
         CTIPO_PERDA,
         DOCORR,
         CCORRL length = 8,
         CJUNC_DSTNO length = 8,
         CSGMTO length = 8,
         CLIN_NEGOC,
         CEVNTO_PERDA,
         CGRP_ATGDO_PERDA,
         CSGRP_ATGDO_PERDA,
         CCAUSA_ATGDO_PERDA,
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.,
         RHIST,
         CEMPR,
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         COD_LACTO
   from work.GPAPROCI
   ;
quit;

%let SYSLAST = work.W2SBOSIL;

%let dbxrc = %eval(%sysfunc(exist(work.plcc_sas, DATA)) or 
      %sysfunc(exist(work.plcc_sas, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSJY;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSJY as
      select
         CDEPDC   
            label = 'cdDependencia',
         CCTA_CTBIL length = 13   
            label = 'cdContaContabil',
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         VPERDA   
            format = COMMAX17.2
            informat = 17.2
            label = 'vrPerda',
         CTIPO_PERDA,
         DOCORR   
            format = DDMMYY10.
            informat = DDMMYY8.
            label = 'cdOcorrencia',
         CJUN_DSTNO as CJUNC_DSTNO   
            label = 'cdJuncaoDestino',
         CSGMTO   
            format = 10.
            informat = 10.
            label = 'cdSegmento',
         CLIN_NEGOC   
            label = 'cdLinhaNegocio',
         CEVNTO_PERDA length = 14   
            format = $14.
            informat = $14.
            label = 'cdEventoPerda',
         CGRP_ATGDO_PERDA   
            format = BEST13.
            label = 'cdGrupoAtingidosPerda',
         CSGRP_ATGDO_PERDA length = 17   
            format = $17.
            informat = $17.
            label = 'cdSubgrupoAtingidosPerda',
         CCAUSA_ATGDO_PERDA length = 16   
            format = $16.
            informat = $16.
            label = 'cdCausaAtingidosPerda',
         CIDTFD_CNTRL length = 50   
            format = $45.
            informat = $45.
            label = 'cdIdentificadorCentral',
         RHIST,
         DDESCB   
            format = DDMMYY10.
            label = 'dtDescoberta',
         CCORRT   
            label = 'cdCorrelata',
         CEMPR   
            label = 'cdEmpresa',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO
   from work.plcc_sas
   ;
quit;

%let SYSLAST = work.W2SBOSJY;

%let dbxrc = %eval(%sysfunc(exist(work.SGREROCITRANS, DATA)) or 
      %sysfunc(exist(work.SGREROCITRANS, VIEW))); 

/*---- Map the columns  ----*/ 
proc datasets lib = work nolist nowarn memtype = (data view);
   delete W2SBOSLC;
quit;

%put %str(NOTE: Mapping columns ...);
proc sql;
   create view work.W2SBOSLC as
      select
         DCTBIL   
            informat = DDMMYY8.
            label = 'dtContabil',
         DREFERENCIA_LEGADO,
         IARQUIVO_LEGADO,
         CPEDIDO   
            format = $26.
            informat = $26.,
         CTRANS   
            format = 4.
            informat = 4.
            label = 'cdTransacao',
         DTRANS,
         VTRANS
   from work.SGREROCITRANS
   ;
quit;

%let SYSLAST = work.W2SBOSLC;

proc datasets lib = work nolist nowarn memtype = (data view);
   delete WXVVVBI;
quit;

data work.WXVVVBI;
   set work.W2SBOQ50
       work.W2SBOQ6G
       work.W2SBOQ7Z
       work.W2SBOQ9R
       work.W2SBOQB9
       work.W2SBOQCP
       work.W2SBOQE5
       work.W2SBOQFJ
       work.W2SBOQGZ
       work.W2SBOQIG
       work.W2SBOQJX
       work.W2SBOQLC
       work.W2SBOQMU
       work.W2SBOQOA
       work.W2SBOQPS
       work.W2SBOQR7
       work.W2SBOQSL
       work.W2SBOQU0
       work.W2SBOQVF
       work.W2SBOQWX
       work.W2SBOQYE
       work.W2SBOQZS
       work.W2SBOR19
       work.W2SBOR2N
       work.W2SBOR42
       work.W2SBOR5F
       work.W2SBOR6T
       work.W2SBOR8A
       work.W2SBOR9O
       work.W2SBORB4
       work.W2SBORCK
       work.W2SBORDX
       work.W2SBORFA
       work.W2SBORGO
       work.W2SBORI1
       work.W2SBORJF
       work.W2SBORKS
       work.W2SBORM6
       work.W2SBORNJ
       work.W2SBORP1
       work.W2SBORQI
       work.W2SBORRW
       work.W2SBORTE
       work.W2SBORUV
       work.W2SBORWC
       work.W2SBORXS
       work.W2SBORZ8
       work.W2SBOS0P
       work.W2SBOS26
       work.W2SBOS3N
       work.W2SBOS54
       work.W2SBOS6L
       work.W2SBOS82
       work.W2SBOS9J
       work.W2SBOSB0
       work.W2SBOSCH
       work.W2SBOSE1
       work.W2SBOSFL
       work.W2SBOSH3
       work.W2SBOSIL
       work.W2SBOSJY
       work.W2SBOSLC;
   keep CDEPDC CRZ_CTBIL CCTA_CTBIL DCTBIL VPERDA CTIPO_PERDA DOCORR CCORRL 
    CJUNC_DSTNO CSGMTO CLIN_NEGOC CEVNTO_PERDA CGRP_ATGDO_PERDA CSGRP_ATGDO_PERDA 
    CCAUSA_ATGDO_PERDA CIDTFD_CNTRL Origem ID_BASE ITAB RHIST CGCPJ IPAIS_TRANS 
    DDESCB NOME_BASE CTIPO_ACAO CSBTPO_ACAO CCORRT CJUN_DSTNO VPERDA_VDDOR 
    CTIPO_PERDA_VDDOR VPERDA_BDSCO CTIPO_PERDA_BDSCO CEMPR REMPR RDEPDC IENVDO 
    CCPF_CNPJ CCLASF_ENVDO DFATOR_GERDR DAJUIZ DCAD NPROCS ICOMAR IUF RTIPO_ACAO 
    RSBTPO_ACAO IDESP DBAIXA RMOTVO_BAIXA VBAIXA VDESP_BDSCO VDESP_VDDOR CCARGA 
    DREFERENCIA_LEGADO IARQUIVO_LEGADO VPERDA_RCUPC CRECLA RRECLA CSEGUN_RECLA 
    RSEGUN_RECLA IRECLA CCLASF_RECLA DDEMIS NCATAO COSIF RCTA CMOTVO_CANC RLOCAL 
    VDESP_ACESS CEMPR_CIVEL RHIST_OCORR CFUNCI CTIPO_FRAUD CPRODU CCANAL_ATEND 
    CREGIS_CORRT DCONTR NRO_DOCUMENTO TIPO_ENVOLVIMENTO CBAIXA TPDESP DARQUI 
    CBIN_CATAO RPRODU RTIPO_FRAUD CCTA_CLIE VREEMB_BDN VREEMB VENC_BDN VENC_TRANS 
    VCPMF_TRANS CPEDIDO CTP_CTA_BDN CTP_OCORR_BDN CAG_CLIE CMAQUINA CLOC_EQUIP 
    CELAB_BO CAUX_TERC CFORM_REEB_BDN CCPMF_BDN CREINCIDENTE CTP_EQUIP 
    RTIPO_PERDA CHIST_PERDA CPROD NOper CPROM IMUN IRECMT COD_LACTO CFUNC CSECAO 
    CCORRL2 CLANC CBOLSA SEG_CTVM ASSESSOR MESA_OPER CBANDE CSTUS ICIDAD_CLINT 
    IESTAD_CLINT CTRANS RTIPO_TRANS CESTAB_TRANS ICIDAD_ESTAB IESTAD_ESTAB 
    CFLAG_SEG CSEQ_REGIS RMOTVO_CANC IBANDE TP_CARTAO NCOTACAO NOBJETO IPLANO_SEG 
    NBDN REVENTO COBJETO CPROJ RSTATUS RSGMTO_DBDN ISBTPO_ACAO NDOC CAREA CRAIZ 
    DTRANS VTRANS; 
run;

%rcSet(&syserr); 



/**  Step end Append **/

/*==========================================================================* 
 * Step:            Table Loader                          A5J3RISO.AC0001C8 * 
 * Transform:       Table Loader (Version 2.1)                              * 
 * Description:                                                             * 
 *                                                                          * 
 * Source Table:    Append - work.WXVVVBI                 A5J3RISO.AI0001HC * 
 * Target Table:    TREP_PERDAS_OP -                      A5J3RISO.AQ00007W * 
 *                   RO_REP.TREP_PERDAS_OP                                  * 
 *                                                                          * 
 * Warnings:                                                                * 
 * Mapping of the target column CEVNTO_PERDA is too short for the specified * 
 *  source column CEVNTO_PERDA.  Values will be truncated.                  * 
 * Mapping of the target column CSGRP_ATGDO_PERDA is too short for the      * 
 *  specified source column CSGRP_ATGDO_PERDA.  Values will be truncated.   * 
 * Mapping of the target column CCAUSA_ATGDO_PERDA is too short for the     * 
 *  specified source column CCAUSA_ATGDO_PERDA.  Values will be truncated.  * 
 *==========================================================================*/ 

%let transformID = %quote(A5J3RISO.AC0001C8);
%let trans_rc = 0;
%let etls_stepStartTime = %sysfunc(datetime(), datetime20.); 

/* Access the data for EGRC_RO_REP  */ 
LIBNAME RO_REP BASE "/RODATAPRD/ROPRODUTIVO/EGRC_RO/DADOS/REPOSITORIO/TABELA" filelockwait=600 ;
%rcSet(&syslibrc); 

%let SYSLAST = %nrquote(work.WXVVVBI); 

%let SYS_SQL_IP_SPEEDO = Y;
%let SYS_SQL_MAPPUTTO = sas_put;
%let SYS_SQLREDUCEPUT = DBMS;
%global etls_sql_pushDown;
%let etls_sql_pushDown = -1;
option DBIDIRECTEXEC;

%global etls_tableExist;
%global etls_numIndex;
%global etls_lastTable;
%let etls_tableExist = -1; 
%let etls_numIndex = -1; 
%let etls_lastTable = &SYSLAST; 

/*---- Define load data macro  ----*/ 

/* --------------------------------------------------------------
   Load Technique Selection: Replace - EntireTable
   Constraint and index action selections: 'ASIS','ASIS','ASIS','ASIS'
   Additional options selections... 
      Set unmapped to missing on updates: false 
   -------------------------------------------------------------- */
%macro etls_loader;

   %let etls_tableOptions = ;
   
   /*---- Map the columns  ----*/ 
   proc datasets lib = work nolist nowarn memtype = (data view);
      delete W2SBOSQJ;
   quit;
   
   data _null_;
      put "WARNING%QUOTE(:) Mapping of the target column CCAUSA_ATGDO_PERDA is"
           " too short for the specified source column CCAUSA_ATGDO_PERDA. "
           " Values will be truncated.";
   run;
   
   data _null_;
      put "WARNING%QUOTE(:) Mapping of the target column CEVNTO_PERDA is too"
           " short for the specified source column CEVNTO_PERDA.  Values will be"
           " truncated.";
   run;
   
   data _null_;
      put "WARNING%QUOTE(:) Mapping of the target column CSGRP_ATGDO_PERDA is"
           " too short for the specified source column CSGRP_ATGDO_PERDA. "
           " Values will be truncated.";
   run;
   
   data _null_;
      put "NOTE: The following column(s) do not have a column mapping, so the"
           " value(s) will be set to missing: CAJUST, CCATEG_ESTAB, CCULPA,"
           " CMOVIM, CTIPO_CARTAO, CTIPO_MOVIM,    CTIPO_REGIS, NBANDE, NREF,"
           " VBANCO_COMPR, VORI, VRECUP_ESTORNO";
   run;
   
   %put %str(NOTE: Mapping columns ...);
   proc sql;
      create view work.W2SBOSQJ as
         select
            "" as CAJUST length = 20
               format = $20.,
            CAREA   
               format = $8.,
            CBANDE length = 5   
               format = $5.,
            CBIN_CATAO length = 8   
               format = $8.,
            . as CCATEG_ESTAB length = 4
               format = 4.,
            CCAUSA_ATGDO_PERDA length = 8   
               format = $8.,
            CCORRL   
               format = 8.,
            CCORRL2   
               format = 8.,
            CCPF_CNPJ length = 20   
               format = $20.,
            CCPMF_BDN   
               format = 8.,
            CCTA_CLIE   
               format = 8.,
            CCTA_CTBIL   
               format = $13.,
            . as CCULPA length = 3
               format = 3.,
            CDEPDC   
               format = 8.,
            CEMPR length = 8   
               format = 8.,
            CEMPR_CIVEL as CEMPR_RAZAO   
               format = 8.,
            CESTAB_TRANS,
            CEVNTO_PERDA length = 10   
               format = $10.,
            CGCPJ,
            CIDTFD_CNTRL   
               format = $50.
               informat = $50.,
            CGRP_ATGDO_PERDA   
               format = 8.,
            CJUNC_DSTNO   
               format = 8.,
            CLANC   
               format = 8.,
            CLIN_NEGOC,
            CLOC_EQUIP   
               format = 8.,
            CMAQUINA   
               format = 8.,
            CMOTVO_CANC   
               format = $3.,
            . as CMOVIM length = 4
               format = 4.,
            COD_LACTO,
            (INPUT(COSIF,BEST32.)) as COSIF length = 8
               format = 8.,
            CPEDIDO,
            (TRIM(LEFT(PUT(CPRODU,BEST32.)))) as CPRODU length = 8
               format = $8.,
            CPROM   
               format = 8.,
            CRAIZ   
               format = $8.,
            CRECLA   
               format = 8.,
            CREGIS_CORRT   
               format = $21.,
            CRZ_CTBIL length = 13   
               format = $13.,
            CSBTPO_ACAO,
            CSECAO   
               format = 8.,
            CSEGUN_RECLA   
               format = 8.,
            CSEQ_REGIS,
            CSGRP_ATGDO_PERDA length = 8   
               format = $8.,
            CSTUS,
            CTIPO_ACAO,
            "" as CTIPO_CARTAO length = 5
               format = $5.,
            CTP_CTA_BDN as CTIPO_CTA_BDN   
               format = 8.,
            CTP_EQUIP as CTIPO_EQUIP   
               format = 5.,
            CTIPO_FRAUD,
            "" as CTIPO_MOVIM length = 1
               format = $1.,
            CTP_OCORR_BDN as CTIPO_OCORR_BDN   
               format = 8.,
            CTIPO_PERDA,
            "" as CTIPO_REGIS length = 1
               format = $1.,
            CTRANS   
               format = 8.,
            DBAIXA,
            DCAD,
            DCONTR,
            DCTBIL,
            DDESCB,
            DOCORR,
            DREFERENCIA_LEGADO   
               format = 8.,
            DTRANS,
            IARQUIVO_LEGADO   
               format = $255.,
            IBANDE   
               format = $50.,
            ICIDAD_CLINT,
            ICIDAD_ESTAB,
            ICOMAR,
            IDESP,
            IENVDO,
            IESTAD_CLINT,
            IESTAD_ESTAB,
            IMUN,
            IPAIS_TRANS,
            IPLANO_SEG   
               format = $42.,
            ISBTPO_ACAO,
            IUF,
            . as NBANDE length = 5
               format = 5.,
            NBDN length = 18   
               format = $18.,
            NCATAO,
            NCOTACAO   
               format = 8.,
            NOPER,
            NPROCS length = 30   
               format = $30.,
            "" as NREF length = 23
               format = $23.,
            RDEPDC,
            REMPR,
            REVENTO length = 20   
               format = $20.,
            RHIST,
            RMOTVO_BAIXA length = 50   
               format = $50.
               informat = $50.,
            RMOTVO_CANC   
               format = $8.,
            RPRODU length = 40   
               format = $40.,
            RRECLA,
            RSBTPO_ACAO length = 256   
               format = $256.,
            RSEGUN_RECLA,
            RSGMTO_DBDN,
            RSTATUS,
            RTIPO_ACAO length = 256   
               format = $256.,
            RTIPO_FRAUD,
            RTIPO_TRANS   
               format = $1.,
            VBAIXA   
               format = COMMAX12.2,
            . as VBANCO_COMPR length = 8
               format = COMMAX12.2,
            VCPMF_TRANS   
               format = COMMAX12.2,
            VDESP_ACESS   
               format = COMMAX12.2,
            VDESP_BDSCO   
               format = COMMAX12.2,
            VDESP_VDDOR   
               format = COMMAX12.2,
            . as VORI length = 8
               format = COMMAX12.2,
            VPERDA   
               format = COMMAX12.2,
            VPERDA_RCUPC   
               format = COMMAX12.2,
            . as VRECUP_ESTORNO length = 8
               format = COMMAX12.2,
            VREEMB   
               format = COMMAX12.2,
            VREEMB_BDN   
               format = COMMAX12.2,
            VTRANS   
               format = COMMAX12.2,
            CCLASF_ENVDO length = 8,
            CAG_CLIE
      from &etls_lastTable
      ;
   quit;
   
   %let SYSLAST = work.W2SBOSQJ;
   
   %let etls_lastTable = &SYSLAST; 
   %let etls_tableOptions = ; 
   
   /* Determine if the target table exists  */ 
   %let etls_tableExist = %eval(%sysfunc(exist(RO_REP.TREP_PERDAS_OP, DATA)) or 
         %sysfunc(exist(RO_REP.TREP_PERDAS_OP, VIEW))); 
   
   %if &etls_tableExist %then 
   %do;/* table exists  */ 
      %let etls_hasPreExistingConstraint=0; 
      
      proc datasets lib = work nolist nowarn memtype = (data view);
         delete etls_commands etls_commands_F;
      quit;
      
      %let etls_otherTablesReferToThisTable=0;
      
      %macro etls_CIContents(table=,workTableOut=,inDSOptions=);
         %put NOTE: Building table listing Constraints and Indexes for: &table;
         proc datasets lib=work nolist; delete &workTableOut; quit;
         proc contents data=&table&inDSOptions out2=&workTableOut noprint; run;
         
         data &workTableOut;
            length name $60 type $20 icown idxUnique idxNoMiss $3 recreate $600;
            set &workTableOut;
            type=upcase(type);
            if type eq 'REFERENTIAL' then
            do;
               put "WARNING%QUOTE(:) Target table is referenced by constraints in"
                    " another table: " ref;
               call symput('etls_otherTablesReferToThisTable','1');
               delete;
            end;
            if type='INDEX' and ICOwn eq 'YES' then delete;
         run;
         %rcSet(&syserr); 
         
      %mend etls_CIContents;
      
      %etls_CIContents(table=RO_REP.TREP_PERDAS_OP, workTableOut=etls_commands, inDSOptions=);
      
      %if &etls_otherTablesReferToThisTable %then 
         %put WARNING%QUOTE(:) Replacing entire table will fail. Consider an alternate load technique or revising constraints.; 
      %else 
      %do; /* okay - remove foreign keys  */ 
      
         data etls_commands_F; 
            set etls_commands; 
            if upcase(type)="FOREIGN KEY" then 
            do; 
               command='ic delete '||trim(name)||';';
               output etls_commands_F; 
            end; 
         run; 
         
         %put %str(NOTE: Removing foreign keys before dropping table...);
         data _null_;
            set etls_commands_F;
            %rcSet(&syserr); 
            
      %end; /* okay - remove foreign keys  */ 
      
      proc datasets lib = work nolist nowarn memtype = (data view);
         delete etls_commands etls_commands_F;
      quit;
      
      /*---- Drop a table  ----*/ 
      %put %str(NOTE: Dropping table ...);
      proc datasets lib = RO_REP nolist nowarn memtype = (data view);
         delete TREP_PERDAS_OP;
      quit;
      
      %rcSet(&syserr); 
      
      %let etls_tableExist = 0;
      
   %end; /* table exists  */ 
   
   /*---- Create a new table  ----*/ 
   %if (&etls_tableExist eq 0) %then 
   %do;  /* if table does not exist  */ 
   
      %put %str(NOTE: Creating table ...);
      
      data RO_REP.TREP_PERDAS_OP
              (label = 'Repositorio de perdas operacionais');
         attrib CAJUST length = $20
            format = $20.
            label = 'Codigo Ajuste'; 
         attrib CAREA length = $8
            format = $8.
            label = 'Codigo Area'; 
         attrib CBANDE length = $5
            format = $5.
            label = 'Codigo Bandeira'; 
         attrib CBIN_CATAO length = $8
            format = $8.
            label = 'Codigo Bin Cartao'; 
         attrib CCATEG_ESTAB length = 4
            format = 4.
            label = 'Codigo Categoria Estabelecimento'; 
         attrib CCAUSA_ATGDO_PERDA length = $8
            format = $8.
            label = 'Codigo Causa Atingidos Perda'; 
         attrib CCORRL length = 8
            format = 8.
            label = 'Codigo Correlata'; 
         attrib CCORRL2 length = 8
            format = 8.
            label = 'Codigo Correlata 2'; 
         attrib CCPF_CNPJ length = $20
            format = $20.
            label = 'Codigo CPF/CNPJ'; 
         attrib CCPMF_BDN length = 8
            format = 8.
            label = 'Codigo CPMF_BDN'; 
         attrib CCTA_CLIE length = 8
            format = 8.
            label = 'Codigo Conta Cliente'; 
         attrib CCTA_CTBIL length = $13
            format = $13.
            label = 'Codigo Conta Contabil'; 
         attrib CCULPA length = 3
            format = 3.
            label = 'Codigo Culpa'; 
         attrib CDEPDC length = 8
            format = 8.
            label = 'Codigo Dependencia'; 
         attrib CEMPR length = 8
            format = 8.
            label = 'Codigo Empresa'; 
         attrib CEMPR_RAZAO length = 8
            format = 8.
            label = 'Codigo Empresa Razao'; 
         attrib CESTAB_TRANS length = $30
            format = $30.
            label = 'Codigo Estabelecimento Transacao'; 
         attrib CEVNTO_PERDA length = $10
            format = $10.
            label = 'Codigo Evento Perda'; 
         attrib CGCPJ length = 8
            label = 'Codigo GCPJ'; 
         attrib CIDTFD_CNTRL length = $50
            format = $50.
            informat = $50.
            label = 'Codigo Identificador ID Central'; 
         attrib CGRP_ATGDO_PERDA length = 8
            format = 8.
            label = 'Codigo Grupo Atingidos Perda'; 
         attrib CJUNC_DSTNO length = 8
            format = 8.
            label = 'Codigo Juncao Destino'; 
         attrib CLANC length = 8
            format = 8.
            label = 'Codigo Lancamento'; 
         attrib CLIN_NEGOC length = $3
            format = $3.
            informat = $3.
            label = 'cdLinhaNegocio'; 
         attrib CLOC_EQUIP length = 8
            format = 8.
            label = 'Codigo Local Equipamento'; 
         attrib CMAQUINA length = 8
            format = 8.
            label = 'Codigo Maquina'; 
         attrib CMOTVO_CANC length = $3
            format = $3.
            label = 'Codigo Motivo Cancelamento'; 
         attrib CMOVIM length = 4
            format = 4.
            label = 'Codigo Movimento'; 
         attrib COD_LACTO length = 5
            format = 5.
            label = 'Codigo Lançamento'; 
         attrib COSIF length = 8
            format = 8.
            label = 'COSIF'; 
         attrib CPEDIDO length = $26
            format = $26.
            label = 'Codigo Numero Pedido'; 
         attrib CPRODU length = $8
            format = $8.
            label = 'Codigo Produto'; 
         attrib CPROM length = 8
            format = 8.
            label = 'Codigo Promotora'; 
         attrib CRAIZ length = $8
            format = $8.
            label = 'Codigo Raiz'; 
         attrib CRECLA length = 8
            format = 8.
            label = 'Codigo Primeira Reclamada'; 
         attrib CREGIS_CORRT length = $21
            format = $21.
            label = 'Codigo Numero Contrato'; 
         attrib CRZ_CTBIL length = $13
            format = $13.
            label = 'Codigo Razao Contabil'; 
         attrib CSBTPO_ACAO length = 3
            format = 3.
            label = 'Codigo Subtipo Acao'; 
         attrib CSECAO length = 8
            format = 8.
            label = 'Codigo Secao'; 
         attrib CSEGUN_RECLA length = 8
            format = 8.
            label = 'Codigo Segunda Reclamada'; 
         attrib CSEQ_REGIS length = $8
            format = $8.
            label = 'Codigo Sequencia Registro'; 
         attrib CSGRP_ATGDO_PERDA length = $8
            format = $8.
            label = 'Codigo Subgrupo Atingidos Perda'; 
         attrib CSTUS length = $2
            format = $2.
            label = 'Codigo Status'; 
         attrib CTIPO_ACAO length = 4
            format = 4.
            label = 'Codigo Tipo Acao'; 
         attrib CTIPO_CARTAO length = $5
            format = $5.
            label = 'Codigo Tipo Cartao'; 
         attrib CTIPO_CTA_BDN length = 8
            format = 8.
            label = 'Codigo Tipo Cta BDN'; 
         attrib CTIPO_EQUIP length = 5
            format = 5.
            label = 'Codigo Tipo Equipamento'; 
         attrib CTIPO_FRAUD length = 3
            format = 3.
            label = 'Codigo Tipo Fraude'; 
         attrib CTIPO_MOVIM length = $1
            format = $1.
            label = 'Codigo Tipo Movimento'; 
         attrib CTIPO_OCORR_BDN length = 8
            format = 8.
            label = 'Codigo Tipo Ocorrencia BDN'; 
         attrib CTIPO_PERDA length = $2
            format = $2.
            label = 'Codigo Tipo Perda'; 
         attrib CTIPO_REGIS length = $1
            format = $1.
            label = 'Codigo Tipo Registro'; 
         attrib CTRANS length = 8
            format = 8.
            label = 'Codigo Transacao'; 
         attrib DBAIXA length = 8
            format = DDMMYY10.
            label = 'Data Baixa'; 
         attrib DCAD length = 8
            format = DDMMYY10.
            label = 'Data Cadastro'; 
         attrib DCONTR length = 8
            format = DDMMYY10.
            label = 'Data Contrato'; 
         attrib DCTBIL length = 8
            format = DDMMYY10.
            label = 'Data Contabil'; 
         attrib DDESCB length = 8
            format = DDMMYY10.
            label = 'Data Descoberta'; 
         attrib DOCORR length = 8
            format = DDMMYY10.
            label = 'Data Ocorrencia'; 
         attrib DREFERENCIA_LEGADO length = 8
            format = 8.
            label = 'Data Referencia Arquivo Legado (AAAAMM)'; 
         attrib DTRANS length = 8
            format = DDMMYY10.
            label = 'Data Transacao'; 
         attrib IARQUIVO_LEGADO length = $255
            format = $255.
            label = 'Nome Arquivo Legado'; 
         attrib IBANDE length = $50
            format = $50.
            label = 'Nome Bandeira'; 
         attrib ICIDAD_CLINT length = $30
            format = $30.
            label = 'Nome Cidade Cliente'; 
         attrib ICIDAD_ESTAB length = $12
            format = $12.
            label = 'Nome Cidade Estabelecimento'; 
         attrib ICOMAR length = $40
            format = $40.
            label = 'Nome Comarca'; 
         attrib IDESP length = $25
            format = $25.
            label = 'Nome Despesa'; 
         attrib IENVDO length = $50
            format = $50.
            label = 'Nome Envolvido'; 
         attrib IESTAD_CLINT length = $2
            format = $2.
            label = 'Nome Estado Cliente'; 
         attrib IESTAD_ESTAB length = $2
            format = $2.
            label = 'Nome Estado Estabelecimento'; 
         attrib IMUN length = $20
            format = $20.
            label = 'Nome Municipio'; 
         attrib IPAIS_TRANS length = $2
            format = $2.
            label = 'Nome Pais Transacao'; 
         attrib IPLANO_SEG length = $42
            format = $42.
            label = 'Nome Motivo Plano Segurança'; 
         attrib ISBTPO_ACAO length = $256
            format = $256.
            label = 'Nome Subtipo Acao'; 
         attrib IUF length = $2
            format = $2.
            label = 'Nome UF'; 
         attrib NBANDE length = 5
            format = 5.
            label = 'Numero Bandeira'; 
         attrib NBDN length = $18
            format = $18.
            label = 'Numero DBDN/BDN'; 
         attrib NCATAO length = $16
            format = $16.
            label = 'Numero Cartao'; 
         attrib NCOTACAO length = 8
            format = 8.
            label = 'Numero Cotacao'; 
         attrib NOPER length = $20
            format = $20.
            label = 'Numero Operacao'; 
         attrib NPROCS length = $30
            format = $30.
            label = 'Numero Processo'; 
         attrib NREF length = $23
            format = $23.
            label = 'Numero Referencia'; 
         attrib RDEPDC length = $50
            format = $50.
            label = 'Descricao Dependencia'; 
         attrib REMPR length = $50
            format = $50.
            label = 'Descricao Empresa'; 
         attrib REVENTO length = $20
            format = $20.
            label = 'Descricao Evento'; 
         attrib RHIST length = $3410
            format = $3410.
            label = 'Descricao Historico'; 
         attrib RMOTVO_BAIXA length = $50
            format = $50.
            informat = $50.
            label = 'Descricao Motivo Baixa'; 
         attrib RMOTVO_CANC length = $8
            format = $8.
            label = 'Descricao Motivo Cancelamento'; 
         attrib RPRODU length = $40
            format = $40.
            label = 'Descricao Produto'; 
         attrib RRECLA length = $50
            format = $50.
            label = 'Descricao Reclamada'; 
         attrib RSBTPO_ACAO length = $256
            format = $256.
            label = 'Descricao Subtipo Acao'; 
         attrib RSEGUN_RECLA length = $50
            format = $50.
            label = 'Descricao Segunda Reclamada'; 
         attrib RSGMTO_DBDN length = $18
            format = $18.
            label = 'Descricao Segmento DBDN'; 
         attrib RSTATUS length = $20
            format = $20.
            label = 'Descricao Status'; 
         attrib RTIPO_ACAO length = $256
            format = $256.
            label = 'Descricao Tipo Acao'; 
         attrib RTIPO_FRAUD length = $20
            format = $20.
            label = 'Descricao Tipo Fraude'; 
         attrib RTIPO_TRANS length = $1
            format = $1.
            label = 'Descricao Tipo Transacao'; 
         attrib VBAIXA length = 8
            format = COMMAX12.2
            label = 'Valor Baixa'; 
         attrib VBANCO_COMPR length = 8
            format = COMMAX12.2
            label = 'Valor Banco Comprados'; 
         attrib VCPMF_TRANS length = 8
            format = COMMAX12.2
            label = 'Valor CPMF Transacao'; 
         attrib VDESP_ACESS length = 8
            format = COMMAX12.2
            label = 'Valor  Despesa Acessoria Perda'; 
         attrib VDESP_BDSCO length = 8
            format = COMMAX12.2
            label = 'Valor Despesa Bradesco Perda'; 
         attrib VDESP_VDDOR length = 8
            format = COMMAX12.2
            label = 'Valor Despesa Vendedor Perda'; 
         attrib VORI length = 8
            format = COMMAX12.2
            label = 'Valor Original'; 
         attrib VPERDA length = 8
            format = COMMAX12.2
            label = 'Valor Perda'; 
         attrib VPERDA_RCUPC length = 8
            format = COMMAX12.2
            label = 'Valor Perda/Recuperacao'; 
         attrib VRECUP_ESTORNO length = 8
            format = COMMAX12.2
            label = 'Valor Recuperacao Estorno Perda'; 
         attrib VREEMB length = 8
            format = COMMAX12.2
            label = 'Valor Reembolso'; 
         attrib VREEMB_BDN length = 8
            format = COMMAX12.2
            label = 'Valor Reembolso BDN'; 
         attrib VTRANS length = 8
            format = COMMAX12.2
            label = 'Valor Transacao'; 
         attrib CCLASF_ENVDO length = 8
            label = 'cdClassificacaoEnvolvido'; 
         attrib CAG_CLIE length = 8
            label = 'cdAgenciaCliente'; 
         call missing(of _all_);
         stop;
      run;
      
      %rcSet(&syserr); 
      
   %end;  /* if table does not exist  */ 
   
   /*---- Append  ----*/ 
   %put %str(NOTE: Appending data ...);
   
   proc append base = RO_REP.TREP_PERDAS_OP 
      data = &etls_lastTable (&etls_tableOptions)  force ; 
    run; 
   
   %rcSet(&syserr); 
   
   proc datasets lib = work nolist nowarn memtype = (data view);
      delete W2SBOSQJ;
   quit;
   
%mend etls_loader;
%etls_loader;



/**  Step end Table Loader **/

%let etls_endTime = %sysfunc(datetime(),datetime.);

