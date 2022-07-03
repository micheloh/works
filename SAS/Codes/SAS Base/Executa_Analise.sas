/*******************************************************************/
/*   Mark-to-Market Analysis                                        */
/*******************************************************************/

/* Libnames das Análises - colocar path correto para jogar o output, se quiser gravar em arquivo ao inves de so exibir na tela do guide*/
libname MTM "D:\Output";

/* colocar path correto do playpen criado */

%let ENVNAME = D:\SAS\SASBI\Lev1\AppData\SASRiskManagementForBanking\3.2\data\userdata\sasdemo\entities\main\playpens\Michel002\cfg\rd_env\market\rmb_market_environment;

/* Monta variáveis para análise */
%let EvalDate = '14AUG2015'd;        /* Data de avaliação*/

options mprint;
PROC RISK;
     ENVIRONMENT open = "&ENVNAME";

     PROJECT MtM     
          portfolio            = RMB_PORT
          data                 = (current full_hist) 
          options              = (OUTALL)
          rundate              = &EvalDate
          currency             = BRL
          crossclass           = CC_INST
          filter               = ZE;  /*criar filtro BRADESCO via interface do RD colocando instID like 'FX_OPT_ZE%'*/
		  RUNPROJECT MtM outlib     = MtM;
     ENVIRONMENT save;
run;

