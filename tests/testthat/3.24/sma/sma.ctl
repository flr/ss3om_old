#C control file created using the SS_writectl function in the R package r4ss
#C should work with SS version: SSv3.24
#C file write time: 2018-06-27 08:47:40
#
1 # N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern
# begin and end years of blocks
#
0.5 #_fracfemale
4 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_Age_natmort_by gender x growthpattern
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28	Age_29	Age_30
0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0795	0.0785	0.0777	0.0769	0.0762	0.0749	#_natM1
0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0801	0.0795	0.0785	0.0777	0.0769	0.0762	0.0749	#_natM2
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
0 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
4 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28	Age_29	Age_30
0	0	0	0	0	0	0	0	0	0	0	0	0.01	0.01	0.03	0.08	0.16	0.3	0.54	0.88	1.32	1.81	2.29	2.74	3.13	3.45	3.71	3.93	4.12	4.28	4.42	#_Age_Maturity1
17 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
 5e+00	100.00	 62.90930000	 62.90930000	 0	1000.0	-3	0	0	0	0	0.5	0	0	#_L_at_Amin__Fem_GP_1
 5e+01	600.00	350.60000000	350.60000000	 0	1000.0	-4	0	0	0	0	0.5	0	0	#_L_at_Amax__Fem_GP_1
 1e-02	  0.65	  0.06400000	  0.06400000	 0	   0.2	-5	0	0	0	0	0.5	0	0	#_VonBert_K__Fem_GP_1
 1e-02	  0.30	  0.09326770	  0.09326770	 0	 999.0	-2	0	0	0	0	0.5	0	0	#_CV_young__Fem_GP_1 
 1e-02	  0.30	  0.08980020	  0.08980020	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_CV_old__Fem_GP_1   
 5e+00	100.00	 63.01380000	 63.01380000	 0	1000.0	-3	0	0	0	0	0.5	0	0	#_L_at_Amin__Mal_GP_1
 5e+01	600.00	241.80000000	241.80000000	 0	1000.0	-4	0	0	0	0	0.5	0	0	#_L_at_Amax__Mal_GP_1
 1e-02	  0.65	  0.13600000	  0.13600000	 0	   0.2	-5	0	0	0	0	0.5	0	0	#_VonBert_K__Mal_GP_1
 1e-02	  0.30	  0.09734180	  0.09734180	 0	 999.0	-2	0	0	0	0	0.5	0	0	#_CV_young__Mal_GP_1 
 1e-02	  0.30	  0.08242470	  0.08242470	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_CV_old__Mal_GP_1   
-3e+00	  3.00	  0.00000524	  0.00000524	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Wtlen_1_Fem        
-3e+00	  5.00	  3.14000000	  3.14000000	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Wtlen_2_Fem        
 1e+00	300.00	275.01300000	275.01300000	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Mat50%_Fem         
-2e+02	  3.00	 -0.10755000	 -0.10755000	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Mat_slope_Fem      
-3e+00	 50.00	  0.00000668	  0.00001000	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Eggs_intercept_Fem 
-3e+00	  3.00	  2.34000000	  2.34442000	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Eggs_slope_len_Fem 
-3e+00	  3.00	  0.00000524	  0.00000524	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Wtlen_1_Mal        
-3e+00	  5.00	  3.14000000	  3.14000000	 0	   0.8	-3	0	0	0	0	0.5	0	0	#_Wtlen_2_Mal        
-4e+00	  4.00	  0.00000000	  1.00000000	-1	  99.0	-3	0	0	0	0	0.5	0	0	#_RecrDist_GP_1      
-4e+00	  4.00	  0.00000000	  1.00000000	-1	  99.0	-3	0	0	0	0	0.5	0	0	#_RecrDist_Area_1    
-4e+00	  4.00	  0.00000000	  1.00000000	-1	  99.0	-3	0	0	0	0	0.5	0	0	#_RecrDist_Seas_1    
-4e+00	  4.00	  0.00000000	  1.00000000	-1	  99.0	-3	0	0	0	0	0.5	0	0	#_CohortGrowDev      
#
#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
#
#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_Cond No MG parm trends
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
7 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
 2.30	13.82	5.400100	7.04	0	1000.0	 1	#_SR_LN(R0)    
 0.01	 1.00	0.347900	0.50	0	   0.2	-4	#_SR_surv_Sfrac
 0.01	10.00	2.000000	1.00	0	   0.2	-4	#_SR_surv_Beta 
 0.20	 1.90	0.283103	0.28	0	1000.0	-4	#_SR_sigmaR    
-5.00	 5.00	0.000000	0.00	0	   2.0	-3	#_SR_envlink   
-5.00	 5.00	0.000000	0.00	0	   1.0	-4	#_SR_R1_offset 
-5.00	 5.00	0.000000	0.00	0	  -1.0	-4	#_SR_autocorr  
0 #_SR_env_link
0 #_SR_env_target
1 #_do_recdev
1990 #_first year of main recr_devs; early devs can preceed this era
2012 #_last year of main recr_devs; forecast devs start in following year
3 #_recdev phase
1 #_(0/1) to read 13 advanced options
-5 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
4 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1981.59 #_last_early_yr_nobias_adj_in_MPD
1990.48 #_first_yr_fullbias_adj_in_MPD
2012 #_last_yr_fullbias_adj_in_MPD
2019.72 #_first_recent_yr_nobias_adj_in_MPD
0.3769 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-10 #min rec_dev
10 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#Fishing Mortality info
0.2 #_F ballpark for annual F (=Z-M) for specified year
-2010 #_F ballpark year (neg value to disable)
3 #_F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 #_max F or harvest rate, depends on F_Method
5 #_N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
0	1.9	0	0.384903	0	1000	-1	#_InitF_1_F1_EU_LL   
0	1.9	0	0.384903	0	1000	-1	#_InitF_2_F2_JPN_LL  
0	1.9	0	0.384903	0	1000	-1	#_InitF_3_F3_CTP_LL  
0	1.9	0	0.384903	0	1000	-1	#_InitF_4_F4_USA_LL  
0	1.9	0	0.384903	0	1000	-1	#_InitF_5_F5_VEN_LL  
0	1.9	0	0.384903	0	1000	-1	#_InitF_6_F6_CAN_LL  
0	1.9	0	0.384903	0	1000	-1	#_InitF_7_F7_MOR_LL  
0	1.9	0	0.384903	0	1000	-1	#_InitF_8_F8_USA_RR  
0	1.9	0	0.384903	0	1000	-1	#_InitF_9_F9_BEL_LL  
0	1.9	0	0.384903	0	1000	-1	#_InitF_10_F10_MOR_PS
0	1.9	0	0.384903	0	1000	-1	#_InitF_11_F11_CPR_LL
0	1.9	0	0.384903	0	1000	-1	#_InitF_12_F12_OTH   
#_Q_setup
# Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den_dep	env_var	extra_se	Q_type
0	0	0	0	#_1 F1_EU_LL      
0	0	0	0	#_2 F2_JPN_LL     
0	0	0	0	#_3 F3_CTP_LL     
0	0	0	0	#_4 F4_USA_LL     
0	0	0	0	#_5 F5_VEN_LL     
0	0	0	0	#_6 F6_CAN_LL     
0	0	0	0	#_7 F7_MOR_LL     
0	0	0	0	#_8 F8_USA_RR     
0	0	0	0	#_9 F9_BEL_LL     
0	0	0	0	#_10 F10_MOR_PS   
0	0	0	0	#_11 F11_CPR_LL   
0	0	0	0	#_12 F12_OTH      
0	0	0	0	#_13 S1_USA_LL_Log
0	0	0	0	#_14 S2_USA_LL_Obs
0	0	0	0	#_15 S3_JPN_LL    
0	0	0	0	#_16 S4_EU_POR_LL 
0	0	0	0	#_17 S5_EU_ESP_LL 
0	0	0	0	#_18 S6_CTP_LL    
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern	Discard	Male	Special
24	0	0	0	#_1 F1_EU_LL      
24	0	0	0	#_2 F2_JPN_LL     
24	0	0	0	#_3 F3_CTP_LL     
24	0	0	0	#_4 F4_USA_LL     
24	0	0	0	#_5 F5_VEN_LL     
 5	0	0	4	#_6 F6_CAN_LL     
 5	0	0	1	#_7 F7_MOR_LL     
 5	0	0	4	#_8 F8_USA_RR     
 5	0	0	5	#_9 F9_BEL_LL     
 5	0	0	1	#_10 F10_MOR_PS   
 5	0	0	3	#_11 F11_CPR_LL   
 5	0	0	3	#_12 F12_OTH      
 5	0	0	4	#_13 S1_USA_LL_Log
 5	0	0	4	#_14 S2_USA_LL_Obs
 5	0	0	2	#_15 S3_JPN_LL    
 5	0	0	1	#_16 S4_EU_POR_LL 
 5	0	0	1	#_17 S5_EU_ESP_LL 
 5	0	0	3	#_18 S6_CTP_LL    
#
#_age_selex_types
#_Pattern	___	Male	Special
11	0	0	0	#_1 F1_EU_LL      
11	0	0	0	#_2 F2_JPN_LL     
11	0	0	0	#_3 F3_CTP_LL     
11	0	0	0	#_4 F4_USA_LL     
11	0	0	0	#_5 F5_VEN_LL     
11	0	0	0	#_6 F6_CAN_LL     
11	0	0	0	#_7 F7_MOR_LL     
11	0	0	0	#_8 F8_USA_RR     
11	0	0	0	#_9 F9_BEL_LL     
11	0	0	0	#_10 F10_MOR_PS   
11	0	0	0	#_11 F11_CPR_LL   
11	0	0	0	#_12 F12_OTH      
11	0	0	0	#_13 S1_USA_LL_Log
11	0	0	0	#_14 S2_USA_LL_Obs
11	0	0	0	#_15 S3_JPN_LL    
11	0	0	0	#_16 S4_EU_POR_LL 
11	0	0	0	#_17 S5_EU_ESP_LL 
11	0	0	0	#_18 S6_CTP_LL    
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
62.5	297.5	138.84600	135.54	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_1P_1_F1_EU_LL      
-6.0	  4.0	 -5.51894	 -6.00	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_F1_EU_LL      
-1.0	  9.0	  6.79363	  6.70	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_1P_3_F1_EU_LL      
-1.0	  9.0	  7.19363	  7.25	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_1P_4_F1_EU_LL      
-5.0	  9.0	 -5.00000	 -5.00	1	 0.05	 -2	0	0	0	0	0.5	0	0	#_SizeSel_1P_5_F1_EU_LL      
-5.0	  9.0	 -4.96000	 -5.00	1	 0.05	 -2	0	0	0	0	0.5	0	0	#_SizeSel_1P_6_F1_EU_LL      
62.5	297.5	161.10200	148.87	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_2P_1_F2_JPN_LL     
-6.0	  4.0	 -4.66738	 -4.56	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_2P_2_F2_JPN_LL     
-1.0	  9.0	  7.38351	  7.25	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_2P_3_F2_JPN_LL     
-1.0	  9.0	  7.18148	  7.61	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_2P_4_F2_JPN_LL     
-5.0	  9.0	 -5.00000	 -5.00	1	 0.05	 -2	0	0	0	0	0.5	0	0	#_SizeSel_2P_5_F2_JPN_LL     
-5.0	  9.0	 -3.89078	 -5.00	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_2P_6_F2_JPN_LL     
62.5	297.5	165.38300	159.98	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_3P_1_F3_CTP_LL     
-6.0	  4.0	 -3.79895	 -6.00	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_3P_2_F3_CTP_LL     
-1.0	  9.0	  6.94638	  6.81	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_3P_3_F3_CTP_LL     
-1.0	  9.0	  7.06037	  7.08	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_3P_4_F3_CTP_LL     
-5.0	  9.0	 -5.00000	 -5.00	1	 0.05	 -2	0	0	0	0	0.5	0	0	#_SizeSel_3P_5_F3_CTP_LL     
-5.0	  9.0	 -3.54891	 -5.00	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_3P_6_F3_CTP_LL     
62.5	297.5	163.83600	127.99	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_4P_1_F4_USA_LL     
-6.0	  4.0	 -4.95791	 -5.84	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_4P_2_F4_USA_LL     
-1.0	  9.0	  7.51368	  7.33	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_4P_3_F4_USA_LL     
-1.0	  9.0	  7.37717	  8.08	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_4P_4_F4_USA_LL     
-5.0	  9.0	 -1.45839	 -2.50	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_4P_5_F4_USA_LL     
-5.0	  9.0	 -3.78438	 -5.00	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_4P_6_F4_USA_LL     
62.5	297.5	182.49600	167.54	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_5P_1_F5_VEN_LL     
-6.0	  4.0	 -5.06249	 -6.00	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_5P_2_F5_VEN_LL     
-1.0	  9.0	  7.63637	  6.81	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_5P_3_F5_VEN_LL     
-1.0	  9.0	  7.23072	  7.08	1	 0.05	  3	0	0	0	0	0.5	0	0	#_SizeSel_5P_4_F5_VEN_LL     
-5.0	  9.0	 -5.00000	 -5.00	1	 0.05	 -2	0	0	0	0	0.5	0	0	#_SizeSel_5P_5_F5_VEN_LL     
-5.0	  9.0	 -3.54404	 -5.00	1	 0.05	  2	0	0	0	0	0.5	0	0	#_SizeSel_5P_6_F5_VEN_LL     
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_6P_1_F6_CAN_LL     
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_6P_2_F6_CAN_LL     
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_7P_1_F7_MOR_LL     
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_7P_2_F7_MOR_LL     
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_8P_1_F8_USA_RR     
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_8P_2_F8_USA_RR     
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_9P_1_F9_BEL_LL     
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_9P_2_F9_BEL_LL     
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_10P_1_F10_MOR_PS   
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_10P_2_F10_MOR_PS   
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_11P_1_F11_CPR_LL   
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_11P_2_F11_CPR_LL   
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_12P_1_F12_OTH      
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_12P_2_F12_OTH      
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_13P_1_S1_USA_LL_Log
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_13P_2_S1_USA_LL_Log
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_14P_1_S2_USA_LL_Obs
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_14P_2_S2_USA_LL_Obs
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_15P_1_S3_JPN_LL    
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_15P_2_S3_JPN_LL    
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_16P_1_S4_EU_POR_LL 
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_16P_2_S4_EU_POR_LL 
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_17P_1_S5_EU_ESP_LL 
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_17P_2_S5_EU_ESP_LL 
 0.0	 10.0	  1.00000	  1.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_18P_1_S6_CTP_LL    
10.0	100.0	 66.00000	 66.00	0	25.00	-99	0	0	0	0	0.5	0	0	#_SizeSel_18P_2_S6_CTP_LL    
#_AgeSelex
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_F1_EU_LL      
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_F1_EU_LL      
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_2P_1_F2_JPN_LL     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_2P_2_F2_JPN_LL     
 0	 10	 0.10	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_3P_1_F3_CTP_LL     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_3P_2_F3_CTP_LL     
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_4P_1_F4_USA_LL     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_4P_2_F4_USA_LL     
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_5P_1_F5_VEN_LL     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_5P_2_F5_VEN_LL     
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_6P_1_F6_CAN_LL     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_6P_2_F6_CAN_LL     
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_7P_1_F7_MOR_LL     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_7P_2_F7_MOR_LL     
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_8P_1_F8_USA_RR     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_8P_2_F8_USA_RR     
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_9P_1_F9_BEL_LL     
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_9P_2_F9_BEL_LL     
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_10P_1_F10_MOR_PS   
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_10P_2_F10_MOR_PS   
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_11P_1_F11_CPR_LL   
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_11P_2_F11_CPR_LL   
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_12P_1_F12_OTH      
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_12P_2_F12_OTH      
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_13P_1_S1_USA_LL_Log
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_13P_2_S1_USA_LL_Log
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_14P_1_S2_USA_LL_Obs
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_14P_2_S2_USA_LL_Obs
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_15P_1_S3_JPN_LL    
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_15P_2_S3_JPN_LL    
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_16P_1_S4_EU_POR_LL 
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_16P_2_S4_EU_POR_LL 
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_17P_1_S5_EU_ESP_LL 
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_17P_2_S5_EU_ESP_LL 
 0	 10	 0.01	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_18P_1_S6_CTP_LL    
10	100	30.00	0	0	25	-99	0	0	0	0	0.5	0	0	#_AgeSel_18P_2_S6_CTP_LL    
#_Cond 0 #_custom_sel-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
#_Cond 0 #_custom_sel-blk_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no block usage
#_Cond No selex parm trends 
#_Cond -4 # placeholder for selparm_Dev_Phase
#_Cond 0 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
#
# Tag loss and Tag reporting parameters go next
0 #_TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_Fleet1	Fleet2	Fleet3	Fleet4	Fleet5	Fleet6	Fleet7	Fleet8	Fleet9	Fleet10	Fleet11	Fleet12	Fleet13	Fleet14	Fleet15	Fleet16	Fleet17	Fleet18
0.0000	0.0000	0.0000	0.0000	0.0000	0	0	0	0	0	0	0	0	0	0.1459	0.0578	0.0886	0.251	#_add_to_survey_CV     
0.0000	0.0000	0.0000	0.0000	0.0000	0	0	0	0	0	0	0	0	0	0.0000	0.0000	0.0000	0.000	#_add_to_discard_stddev
0.0000	0.0000	0.0000	0.0000	0.0000	0	0	0	0	0	0	0	0	0	0.0000	0.0000	0.0000	0.000	#_add_to_bodywt_CV     
0.0483	0.0569	0.0396	0.0997	0.2537	1	1	1	1	1	1	1	1	1	1.0000	1.0000	1.0000	1.000	#_mult_by_lencomp_N    
0.0000	0.0000	0.0000	0.0000	0.0000	0	0	0	0	0	0	0	0	0	0.0000	0.0000	0.0000	0.000	#_mult_by_agecomp_N    
0.0000	0.0000	0.0000	0.0000	0.0000	0	0	0	0	0	0	0	0	0	0.0000	0.0000	0.0000	0.000	#_mult_by_size-at-age_N
1 #_maxlambdaphase
1 #_sd_offset
18 #_number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch;
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#_like_comp	fleet/survey	phase	value	sizefreq_method
 1	13	1	1	1	#_Surv_S1_USA_LL_Log_Phz1                                                                       
 1	14	1	0	1	#_Surv_S2_USA_LL_Obs_Phz1                                                                       
 1	15	1	1	1	#_Surv_S3_JPN_LL_Phz1                                                                           
 1	16	1	1	1	#_Surv_S4_EU_POR_LL_Phz1                                                                        
 1	17	1	1	1	#_Surv_S5_EU_ESP_LL_Phz1                                                                        
 1	18	1	1	1	#_Surv_S6_CTP_LL_Phz1                                                                           
 4	 1	1	1	1	#_length_F1_EU_LL_Phz1                                                                          
 4	 2	1	1	1	#_length_F2_JPN_LL_Phz1                                                                         
 4	 3	1	1	1	#_length_F3_CTP_LL_Phz1                                                                         
 4	 4	1	1	1	#_length_F4_USA_LL_Phz1                                                                         
 4	 5	1	1	1	#_length_F5_VEN_LL_Phz1                                                                         
 9	 1	1	1	1	#_init_equ_catch_F1_EU_LL_lambda_for_init_equ_catch_can_only_enable/disable for_all_fleets_Phz1 
 9	 2	1	1	1	#_init_equ_catch_F2_JPN_LL_lambda_for_init_equ_catch_can_only_enable/disable for_all_fleets_Phz1
 9	 7	1	1	1	#_init_equ_catch_F7_MOR_LL_lambda_for_init_equ_catch_can_only_enable/disable for_all_fleets_Phz1
10	 1	1	1	1	#_recrdev_Phz1                                                                                  
11	 1	1	1	1	#_parm_prior_Phz1                                                                               
12	 1	1	1	1	#_parm_dev_Phz1                                                                                 
13	 1	1	1	1	#_CrashPen_Phz1                                                                                 
0 #_more_stddev_reporting
# 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
# placeholder for vector of selex bins to be reported
# placeholder for vector of growth ages to be reported
# placeholder for vector of NatAges ages to be reported
#
999
