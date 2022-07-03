

/* Uses the batch files from RMB to perform various tasks */

/*Define paths*/
%let rmbinit_dir=/sasbin/SASFoundation/9.4/sasautos/; /* Change to your installlation path for SASFoundation */

*%let mkt_src_root=C:\Program Files\SASHome\SASFoundation\9.4\rmbmktmva; /* Change to your installation path for SASFoundation */
*%let alm_batch_code_dir=&mkt_src_root.\sasmisc\batch; /* Should not have to change */


/* Run the init file. This needs to be done before any of the other steps can be performed */;
options metauser="sasdemo"  metapass="sasdemo"  metaserver="localhost"    metaport=8561;
%inc "&rmbinit_dir./rmbinit.sas";
%rmbinit;

/*If you have made changes in the scripts that contain the sample data and the Risk Dimensions environment, you may have*/
/*to recreate the solution data mart and the EDM. Note that as part of this macro, the create_rd_environments macro is run */


%include "/sasdata/sasrmb/codigos/rmb/source/common/solution_data_mart/create_solution_data_mart.sas" ; 

%create_solution_data_mart(soln_data_mart_dir=/sasdata/sasrmb/dados/indata, /* Change to your local install indata location */
   fca_c_lib_nm=FINCAD_Suite_32_2011, 
   fea_c_lib_nm=intrlib,
   run_tps_fincad_flag=N, 
   run_tps_fea_flag=N,
   create_stg_data_flg=Y);

/* If you like, you can use these commands to create new playpens. It is not necessary, however */
/* This is a shared playpen */
%rsk_use_entity(entity=Main, username=sasdemo, interactive=N);
/*create shared playpen alm_NE*/
%let component=common;
%rsk_create_playpen(name=mkt_new, application=MKT, description=shared market playpen, dm_type=S);
%symdel component;

/*This is a private playpen*/
%rsk_use_entity(entity=Main, username=sasdemo, interactive=N);
%rsk_create_playpen(name=mkt-pp, application=MKT, description=private market playpen, dm_type=P, cfg_set_id= RMB_SAMPLE, config_datetime='12mar2012:00:00:00'dt, result=);

/* Recreate the solution data mart level RD environment */
%let mysasroot=D:\SAS\SASBI\Lev1\Applications\SASRiskManagementForBanking\3.2\source\common\solution_data_mart; /*Change to match you locations */
%create_rd_environments(out_dir=D:\SAS\SASBI\Lev1\AppData\SASRiskManagementForBanking\3.2\indata\rd_env, /* Change to match your locations */
                        rsk_env_src_dir=&mysasroot.\env_rsk, 
                        rmb_env_src_dir=&mysasroot.\env_rmb, 
                        alm_env_src_dir=&mysasroot.\env_alm, 
                        cra_env_src_dir=&mysasroot.\env_cra, 
                        fra_env_src_dir=&mysasroot.\env_fra, 
                        mra_env_src_dir=&mysasroot.\env_mra, 
                        fca_c_lib_nm=FINCAD_Suite_32_2011,
                        fea_c_lib_nm=intrlib,
                        run_tps_fea_flag=N,
                        run_tps_fincad_flag=N,
                        env_name=all,
	 remove_resulting_env_flag=Y);


/*Run an analysis. There is a separate batch for each analysis type. */
%rsk_use_entity(entity=Main, username=sasdemo, interactive=N);
%rsk_create_playpen(name=mkt-pp, application=MKT, description=private market playpen, dm_type=P, cfg_set_id= RMB_SAMPLE, config_datetime='12mar2012:00:00:00'dt, result=);
%rmb_batch_run_analysis_stp(stp_filename=rmbm_run_market_risk_project.sas,
                               entity=main,
                               PLAYPEN=mkt-pp,
                               USERNAME=sasdemo,
                               PASSWD=Orion123,
                               language=en,
                               CLEAR_WORKSPACE_FLG=Y);

/*If you have changed the method programs, added a new one, or added a new function. Run this*/
/* Set up locations */
%let product=D:\SAS\Config\Lev1\AppData\SASRiskManagementForBanking; /* Change for your locations */
%let playpen=&product.\3.3\data\userdata\sasdemo\entities\main\playpens\mkt-pp; /* Change to match your playpen */
%let dm=&playpen.\datamart; 
libname rd_env0 "&dm.\cfg\rd_env\base"; libname env_mkt0 "&dm.\cfg\rd_env\mkt"; 

/* Re-establish inheritance (may be needed) */ 
proc risk; 
env open = env_mkt0.rmb_mkt_environment 
include = (rd_env0.rmb_base_environment ); 
env save;
run;

/*- This data set and libname need to be created here to avoid a parsing error -*/
/*- in Risk Dimensions, related to the scenario cashflows -*/ 
libname aggprj (work) ; 
data aggprj.finalcfscen ; 
format valdate date9.; 
length analysisname $ 6; 
instid = ’CashFlow_Zero_001’ ; 
valdate = ’1JAN2010’d ; 
valtype = ’maturity’ ; 
AnalysisName = ’’ ; 
valamount=30 ; 
call missing(SimulationReplication) ;
run;

%rsk_build_functions(env_lib=rd_env0, env_name=rmb_base_environment, func_path=<The location of the functions you are adding.C:\rmb_code\rmb33\source\common\solution_data_mart\env_rsk\functions for example );

/* Rebuild the pricing methods. */
library = rd_env0.rmb_base_environment
                env = rd_env0.rmb_base_environment
                outlib = rd_env0.rmb_base_environment;
run ; 

/*alterar path abaixo para o path do playpen executado */

libname envbase "/sasdata/sasrmb/dados/data/userdata/sasdemo/entities/main/playpens/teste016/cfg/rd_env/base";

proc compile env=envbase.rmb_base_environment outlib=envbase.rmb_base_environment package=allfuncs; 
%inc "/sasdata/sasrmb/codigos/rmb/custom/Interpola_GRID.sas";
%inc "/sasdata/sasrmb/codigos/rmb/custom/Funcoes_Calendario.sas";
%inc "/sasdata/sasrmb/codigos/rmb/custom/funcoes_gregas.sas";
%inc "/sasdata/sasrmb/codigos/rmb/custom/Arvore_Binomial_Bradesco.sas";


run; 

%let ENVNAME = /sasdata/sasrmb/dados/data/userdata/sasdemo/entities/main/playpens/teste016/cfg/rd_env/market/rmb_market_environment;

proc risk;
environment open = "&ENVNAME";


declare outvars=(OUTV_IMPVOL	num computed postprice comptype=value(UNBOUNDED) label="Implied Volatility");
declare outvars=(OUTV_FOWARD	num computed postprice comptype=value(UNBOUNDED) label="Foward");
declare outvars=(OUTV_TIMETOEXP	num computed postprice comptype=value(UNBOUNDED) label="Time to Expiration");
declare outvars=(OUTV_RISKFREERATE num computed postprice comptype=value(UNBOUNDED) label="Risk Free Rate");
declare outvars=(OUTV_COUPOM num computed postprice comptype=value(UNBOUNDED) label="Coupom Rate");
declare outvars=(OUTV_DELTA 	num computed postprice comptype=value(UNBOUNDED) label="Delta Result");
declare outvars=(OUTV_DELTAJ 	num computed postprice comptype=value(UNBOUNDED) label="Delta Result2");
declare outvars=(OUTV_GAMA 	num computed postprice comptype=value(UNBOUNDED) label="Gama Result");
declare outvars=(OUTV_VEGA 	num computed postprice comptype=value(UNBOUNDED) label="Vega Result");
declare outvars=(OUTV_Teta 	num computed postprice comptype=value(UNBOUNDED) label="Teta Result");


environment save;
run;


libname envbase "/sasdata/sasrmb/dados/data/userdata/sasdemo/entities/main/playpens/teste016/cfg/rd_env/base";

proc compile env=envbase.rmb_base_environment outlib=envbase.rmb_base_environment ; 
%inc "/sasdata/sasrmb/codigos/rmb/custom/rsk_pm_option.sas";
/*%inc "D:\SAS\SASBI\Lev1\Applications\SASRiskManagementForBanking\3.2\custom\rsk_pm_barrier_option.sas";*/

run; 


