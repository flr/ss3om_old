#C control file created using the SS_writectl function in the R package r4ss
#C should work with SS version: 
#C file write time: 2018-11-28 11:38:23
#
1 # N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern
4 #_number of recruitment assignments (overrides GP*area*seas parameter values)
0 #_recruitment interaction requested
#_GP	seas	area
1	1	1	#_recr_dist_pattern1
1	1	2	#_recr_dist_pattern2
1	1	3	#_recr_dist_pattern3
1	1	4	#_recr_dist_pattern4
8 #_N_movement_definitions goes here if N_areas > 1
0.6 #_first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_move definition for seas, morph, source, dest, age1, age2
1	1	1	2	9	30	#_moveDef1
1	1	1	3	9	30	#_moveDef2
1	1	2	1	9	30	#_moveDef3
1	1	2	4	9	30	#_moveDef4
1	1	3	1	9	30	#_moveDef5
1	1	3	4	9	30	#_moveDef6
1	1	4	2	9	30	#_moveDef7
1	1	4	3	9	30	#_moveDef8
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern
# begin and end years of blocks
#
0.5 #_fracfemale
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_Age_natmort_by gender x growthpattern
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28	Age_29	Age_30
0.547804	0.424110	0.35658	0.314360	0.285727	0.265234	0.25	0.238354	0.229261	0.222044	0.216241	0.211526	0.207663	0.204477	0.201833	0.199629	0.197785	0.196236	0.194933	0.193833	0.192903	0.192116	0.191449	0.190882	0.190400	0.189990	0.189642	0.189345	0.189092	0.188876	0.188692	#_natM1
0.482672	0.381995	0.32870	0.296375	0.275151	0.260488	0.25	0.242312	0.236575	0.232236	0.228921	0.226370	0.224395	0.222858	0.221659	0.220721	0.219985	0.219406	0.218952	0.218593	0.218311	0.218088	0.217912	0.217774	0.217664	0.217578	0.217509	0.217455	0.217413	0.217379	0.217352	#_natM2
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
0.01 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28	Age_29	Age_30
0.001	0.006	0.027	0.109	0.354	0.711	0.917	0.98	0.996	0.999	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	#_Age_Maturity1
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
 70.00	 90.00	 7.87000e+01	 7.87000e+01	 0	 0.10	-2	0	0	   0	   0	0.0	0	0	#_L_at_Amin__Fem_GP_1               
310.00	340.00	 2.75812e+02	 2.75812e+02	 0	 0.10	-2	0	0	   0	   0	0.0	0	0	#_L_at_Amax__Fem_GP_1               
  0.05	  0.20	 1.57000e-01	 1.57000e-01	 0	 0.10	-3	0	0	   0	   0	0.0	0	0	#_VonBert_K__Fem_GP_1               
  0.05	  0.25	 1.50000e-01	 1.50000e-01	 0	 0.15	-3	0	0	   0	   0	0.5	0	0	#_CV_young__Fem_GP_1                
  0.05	  0.25	 1.00000e-01	 1.50000e-01	 0	 0.15	-3	0	0	   0	   0	0.5	0	0	#_CV_old__Fem_GP_1                  
 70.00	 90.00	 8.35700e+01	 8.35700e+01	 0	 0.10	-2	0	0	   0	   0	0.0	0	0	#_L_at_Amin__Mal_GP_1               
200.00	280.00	 2.13768e+02	 2.13768e+02	 0	 0.10	-2	0	0	   0	   0	0.0	0	0	#_L_at_Amax__Mal_GP_1               
  0.07	  0.30	 2.35000e-01	 2.35000e-01	 0	 0.10	-3	0	0	   0	   0	0.0	0	0	#_VonBert_K__Mal_GP_1               
  0.05	  0.25	 1.50000e-01	 1.50000e-01	 0	 0.15	-3	0	0	   0	   0	0.5	0	0	#_CV_young__Mal_GP_1                
  0.05	  0.25	 1.00000e-01	 1.50000e-01	 0	 0.15	-3	0	0	   0	   0	0.5	0	0	#_CV_old__Mal_GP_1                  
 -3.00	  3.00	 3.81500e-06	 3.81500e-06	-1	99.00	-3	0	0	   0	   0	0.5	0	0	#_Wtlen_1_Fem                       
 -3.00	  4.00	 3.18800e+00	 3.18800e+00	-1	99.00	-3	0	0	   0	   0	0.5	0	0	#_Wtlen_2_Fem                       
 35.00	 73.00	 5.50000e+01	 5.50000e+01	-1	99.00	-3	0	0	   0	   0	0.0	0	0	#_Mat50%_Fem                        
 -3.00	  3.00	-2.50000e-01	-2.50000e-01	-1	99.00	-3	0	0	   0	   0	0.0	0	0	#_Mat_slope_Fem                     
 -3.00	  3.00	 1.00000e+00	 1.00000e+00	-1	99.00	-3	0	0	   0	   0	0.0	0	0	#_Eggs_scalar_Fem                   
 -3.00	  3.00	 0.00000e+00	 0.00000e+00	-1	99.00	-3	0	0	   0	   0	0.0	0	0	#_Eggs_exp_wt_Fem                   
 -3.00	  3.00	 3.81500e-06	 3.81500e-06	-1	99.00	-3	0	0	   0	   0	0.5	0	0	#_Wtlen_1_Mal                       
 -3.00	  4.00	 3.18800e+00	 3.18800e+00	-1	99.00	-3	0	0	   0	   0	0.5	0	0	#_Wtlen_2_Mal                       
 -8.00	  8.00	 0.00000e+00	 1.00000e+00	-1	99.00	-3	0	0	   0	   0	0.5	0	0	#_RecrDist_GP_1                     
 -8.00	  8.00	 0.00000e+00	 1.00000e+00	-1	99.00	-4	0	0	   0	   0	0.5	0	0	#_RecrDist_Area_1                   
 -8.00	  8.00	-5.09876e-01	 1.00000e+00	-1	99.00	 4	0	1	1965	2014	0.9	0	0	#_RecrDist_Area_2                   
 -8.00	  8.00	-2.95335e-01	 1.00000e+00	-1	99.00	 4	0	1	1965	2014	0.9	0	0	#_RecrDist_Area_3                   
 -8.00	  8.00	-1.87103e-01	 1.00000e+00	-1	99.00	 4	0	1	1965	2014	0.9	0	0	#_RecrDist_Area_4                   
 -8.00	  8.00	 0.00000e+00	 1.00000e+00	-1	99.00	-7	0	0	   0	   0	0.5	0	0	#_RecrDist_Seas_1                   
  1.00	  1.00	 1.00000e+00	 1.00000e+00	-1	99.00	-3	0	0	   0	   0	0.0	0	0	#_CohortGrowDev                     
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_1_to_2
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_1_to_2
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_1_to_3
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_1_to_3
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_2_to_1
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_2_to_1
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_2_to_4
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_2_to_4
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_3_to_1
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_3_to_1
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_3_to_4
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_3_to_4
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_4_to_2
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_4_to_2
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_4_to_3
 -8.00	  9.00	-7.00000e+00	-5.00000e+00	 0	 5.00	-9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_4_to_3
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
4 #_MGparm_Dev_Phase
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
 7.0	18	8.42702	11.0	-1	100.0	  3	#_SR_LN(R0)   
 0.2	 1	0.60000	 0.6	 1	  0.1	-10	#_SR_BH_steep 
 0.0	 2	0.20000	 0.2	-1	  0.8	 -3	#_SR_sigmaR   
-5.0	 5	0.10000	 0.0	 0	  1.0	 -3	#_SR_envlink  
-5.0	 5	0.00000	 0.0	 0	  1.0	 -4	#_SR_R1_offset
 0.0	 0	0.00000	 0.0	-1	  0.0	-99	#_SR_autocorr 
0 #_SR_env_link
0 #_SR_env_target
1 #_do_recdev
1950 #_first year of main recr_devs; early devs can preceed this era
2013 #_last year of main recr_devs; forecast devs start in following year
6 #_recdev phase
1 #_(0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-5 #_recdev_early_phase
5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1970 #_last_early_yr_nobias_adj_in_MPD
1971 #_first_yr_fullbias_adj_in_MPD
2001 #_last_yr_fullbias_adj_in_MPD
2002 #_first_recent_yr_nobias_adj_in_MPD
1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-6 #min rec_dev
6 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#Fishing Mortality info
0.2 #_F ballpark for annual F (=Z-M) for specified year
2003 #_F ballpark year (neg value to disable)
3 #_F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 #_max F or harvest rate, depends on F_Method
2 #_N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
0	1	0	0.01	0	99	-1	#_InitF_1_GI_NE   
0	1	0	0.01	0	99	-1	#_InitF_2_LL_NE   
0	1	0	0.01	0	99	-1	#_InitF_3_GI_NW   
0	1	0	0.01	0	99	-1	#_InitF_4_LL_NW   
0	1	0	0.01	0	99	-1	#_InitF_5_GI_SE   
0	1	0	0.01	0	99	-1	#_InitF_6_LL_SE   
0	1	0	0.01	0	99	-1	#_InitF_7_ALGI_SW 
0	1	0	0.01	0	99	-1	#_InitF_8_EUEL_SW 
0	1	0	0.01	0	99	-1	#_InitF_9_ISEL_SW 
0	1	0	0.01	0	99	-1	#_InitF_10_JPLL_SW
0	1	0	0.01	0	99	-1	#_InitF_11_TWFL_SW
0	1	0	0.01	0	99	-1	#_InitF_12_TWLL_SW
#_Q_setup
# Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den_dep	env_var	extra_se	Q_type
0	0	0	  2	#_1 GI_NE        
0	0	0	  2	#_2 LL_NE        
0	0	0	  2	#_3 GI_NW        
0	0	0	  2	#_4 LL_NW        
0	0	0	  2	#_5 GI_SE        
0	0	0	  2	#_6 LL_SE        
0	0	0	  2	#_7 ALGI_SW      
0	0	0	  2	#_8 EUEL_SW      
0	0	0	  2	#_9 ISEL_SW      
0	0	0	  2	#_10 JPLL_SW     
0	0	0	  2	#_11 TWFL_SW     
0	0	0	  2	#_12 TWLL_SW     
0	0	0	  2	#_13 UJPLL_NW    
0	0	0	-13	#_14 UJPLL_NE    
0	0	0	-13	#_15 UJPLL_SW    
0	0	0	-13	#_16 UJPLL_SE    
0	0	0	  2	#_17 UTWLL_NW    
0	0	0	  2	#_18 UTWLL_NE    
0	0	0	  2	#_19 UTWLL_SW    
0	0	0	  2	#_20 UTWLL_SE    
0	0	0	  2	#_21 UPOR_SW     
0	0	0	  2	#_22 UESP_SW     
0	0	0	  2	#_23 URELL_SW    
0	0	0	  2	#_24 UIND_NE     
0	0	0	  2	#_25 UJPLL_NW_pre
0	0	0	  2	#_26 UJPLL_NE_pre
0	0	0	  2	#_27 UJPLL_SW_pre
0	0	0	  2	#_28 UJPLL_SE_pre
0	0	0	  2	#_29 UTWLL_NW_pre
0	0	0	  2	#_30 UTWLL_NE_pre
0	0	0	  2	#_31 UTWLL_SW_pre
0	0	0	  2	#_32 UTWLL_SE_pre
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_1_GI_NE        
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_2_LL_NE        
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_3_GI_NW        
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_4_LL_NW        
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_5_GI_SE        
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_6_LL_SE        
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_7_ALGI_SW      
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_8_EUEL_SW      
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_9_ISEL_SW      
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_10_JPLL_SW     
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_11_TWFL_SW     
-10	10	 -0.494066	0	0	99	-1	#_LnQ_base_12_TWLL_SW     
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_13_UJPLL_NW    
-20	10	 -9.535950	0	0	99	 1	#_LnQ_base_17_UTWLL_NW    
-20	10	 -9.021500	0	0	99	 1	#_LnQ_base_18_UTWLL_NE    
-20	10	 -7.261040	0	0	99	 1	#_LnQ_base_19_UTWLL_SW    
-20	10	-10.432100	0	0	99	 1	#_LnQ_base_20_UTWLL_SE    
-20	10	-11.630800	0	0	99	 1	#_LnQ_base_21_UPOR_SW     
-20	10	 -7.816460	0	0	99	 1	#_LnQ_base_22_UESP_SW     
-20	10	-11.630800	0	0	99	 1	#_LnQ_base_23_URELL_SW    
-20	10	-11.630800	0	0	99	 1	#_LnQ_base_24_UIND_NE     
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_25_UJPLL_NW_pre
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_26_UJPLL_NE_pre
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_27_UJPLL_SW_pre
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_28_UJPLL_SE_pre
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_29_UTWLL_NW_pre
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_30_UTWLL_NE_pre
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_31_UTWLL_SW_pre
-20	10	 -7.412130	0	0	99	 1	#_LnQ_base_32_UTWLL_SE_pre
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern	Discard	Male	Special
24	0	0	0	#_GI_NE       
24	0	0	0	#_LL_NE       
 5	0	0	1	#_GI_NW       
 5	0	0	2	#_LL_NW       
 5	0	0	1	#_GI_SE       
 5	0	0	2	#_LL_SE       
 5	0	0	1	#_ALGI_SW     
 5	0	0	2	#_EUEL_SW     
 5	0	0	2	#_ISEL_SW     
 5	0	0	2	#_JPLL_SW     
 5	0	0	2	#_TWFL_SW     
 5	0	0	2	#_TWLL_SW     
 5	0	0	2	#_UJPLL_NW    
 5	0	0	2	#_UJPLL_NE    
 5	0	0	2	#_UJPLL_SW    
 5	0	0	2	#_UJPLL_SE    
 5	0	0	2	#_UTWLL_NW    
 5	0	0	2	#_UTWLL_NE    
 5	0	0	2	#_UTWLL_SW    
 5	0	0	2	#_UTWLL_SE    
 5	0	0	2	#_UPOR_SW     
 5	0	0	2	#_UESP_SW     
 5	0	0	2	#_URELL_SW    
 5	0	0	2	#_UIND_NE     
 5	0	0	2	#_UJPLL_NW_pre
 5	0	0	2	#_UJPLL_NE_pre
 5	0	0	2	#_UJPLL_SW_pre
 5	0	0	2	#_UJPLL_SE_pre
 5	0	0	2	#_UTWLL_NW_pre
 5	0	0	2	#_UTWLL_NE_pre
 5	0	0	2	#_UTWLL_SW_pre
 5	0	0	2	#_UTWLL_SE_pre
#
#_age_selex_types
#_Pattern	Discard	Male	Special
11	0	0	0	#_GI_NE       
11	0	0	0	#_LL_NE       
11	0	0	0	#_GI_NW       
11	0	0	0	#_LL_NW       
11	0	0	0	#_GI_SE       
11	0	0	0	#_LL_SE       
11	0	0	0	#_ALGI_SW     
11	0	0	0	#_EUEL_SW     
11	0	0	0	#_ISEL_SW     
11	0	0	0	#_JPLL_SW     
11	0	0	0	#_TWFL_SW     
11	0	0	0	#_TWLL_SW     
11	0	0	0	#_UJPLL_NW    
11	0	0	0	#_UJPLL_NE    
11	0	0	0	#_UJPLL_SW    
11	0	0	0	#_UJPLL_SE    
11	0	0	0	#_UTWLL_NW    
11	0	0	0	#_UTWLL_NE    
11	0	0	0	#_UTWLL_SW    
11	0	0	0	#_UTWLL_SE    
11	0	0	2	#_UPOR_SW     
11	0	0	2	#_UESP_SW     
11	0	0	2	#_URELL_SW    
11	0	0	2	#_UIND_NE     
11	0	0	2	#_UJPLL_NW_pre
11	0	0	2	#_UJPLL_NE_pre
11	0	0	2	#_UJPLL_SW_pre
11	0	0	2	#_UJPLL_SE_pre
11	0	0	2	#_UTWLL_NW_pre
11	0	0	2	#_UTWLL_NE_pre
11	0	0	2	#_UTWLL_SW_pre
11	0	0	2	#_UTWLL_SE_pre
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
 50	200	 91.860000	150.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_1P_1_GI_NE        
 -6	  4	 -1.061000	 -3.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_1P_2_GI_NE        
 -1	  9	  4.714000	  8.3	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_1P_3_GI_NE        
 -1	  9	  4.000000	  4.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_1P_4_GI_NE        
-15	 -5	-10.000000	 -1.0	1	99.00	-3	0	0	0	0	0.5	0	0	#_SizeSel_1P_5_GI_NE        
 -5	  9	 -0.730581	 -1.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_1P_6_GI_NE        
 50	200	142.278000	150.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_2P_1_LL_NE        
 -6	  4	 -0.316252	 -3.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_2P_2_LL_NE        
 -1	  9	  6.979360	  8.3	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_2P_3_LL_NE        
 -1	  9	  5.261490	  4.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_2P_4_LL_NE        
-15	 -5	-10.000000	 -1.0	1	99.00	-3	0	0	0	0	0.5	0	0	#_SizeSel_2P_5_LL_NE        
 -5	  9	 -1.576590	 -1.0	1	99.00	 3	0	0	0	0	0.5	0	0	#_SizeSel_2P_6_LL_NE        
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_3P_1_GI_NW        
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_3P_2_GI_NW        
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_4P_1_LL_NW        
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_4P_2_LL_NW        
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_5P_1_GI_SE        
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_5P_2_GI_SE        
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_6P_1_LL_SE        
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_6P_2_LL_SE        
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_7P_1_ALGI_SW      
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_7P_2_ALGI_SW      
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_8P_1_EUEL_SW      
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_8P_2_EUEL_SW      
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_9P_1_ISEL_SW      
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_9P_2_ISEL_SW      
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_10P_1_JPLL_SW     
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_10P_2_JPLL_SW     
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_11P_1_TWFL_SW     
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_11P_2_TWFL_SW     
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_12P_1_TWLL_SW     
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_12P_2_TWLL_SW     
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_13P_1_UJPLL_NW    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_13P_2_UJPLL_NW    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_14P_1_UJPLL_NE    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_14P_2_UJPLL_NE    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_15P_1_UJPLL_SW    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_15P_2_UJPLL_SW    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_16P_1_UJPLL_SE    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_16P_2_UJPLL_SE    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_17P_1_UTWLL_NW    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_17P_2_UTWLL_NW    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_18P_1_UTWLL_NE    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_18P_2_UTWLL_NE    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_19P_1_UTWLL_SW    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_19P_2_UTWLL_SW    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_20P_1_UTWLL_SE    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_20P_2_UTWLL_SE    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_21P_1_UPOR_SW     
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_21P_2_UPOR_SW     
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_22P_1_UESP_SW     
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_22P_2_UESP_SW     
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_23P_1_URELL_SW    
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_23P_2_URELL_SW    
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_24P_1_UIND_NE     
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_24P_2_UIND_NE     
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_25P_1_UJPLL_NW_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_25P_2_UJPLL_NW_pre
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_26P_1_UJPLL_NE_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_26P_2_UJPLL_NE_pre
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_27P_1_UJPLL_SW_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_27P_2_UJPLL_SW_pre
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_28P_1_UJPLL_SE_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_28P_2_UJPLL_SE_pre
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_29P_1_UTWLL_NW_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_29P_2_UTWLL_NW_pre
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_30P_1_UTWLL_NE_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_30P_2_UTWLL_NE_pre
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_31P_1_UTWLL_SW_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_31P_2_UTWLL_SW_pre
 -5	  3	  1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_32P_1_UTWLL_SE_pre
 -5	  3	 -1.000000	 -4.0	1	 0.05	-3	0	0	0	0	0.5	0	0	#_SizeSel_32P_2_UTWLL_SE_pre
#_AgeSelex
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_1P_1_GI_NE        
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_1P_2_GI_NE        
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_2P_1_LL_NE        
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_2P_2_LL_NE        
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_3P_1_GI_NW        
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_3P_2_GI_NW        
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_4P_1_LL_NW        
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_4P_2_LL_NW        
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_5P_1_GI_SE        
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_5P_2_GI_SE        
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_6P_1_LL_SE        
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_6P_2_LL_SE        
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_7P_1_ALGI_SW      
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_7P_2_ALGI_SW      
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_8P_1_EUEL_SW      
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_8P_2_EUEL_SW      
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_9P_1_ISEL_SW      
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_9P_2_ISEL_SW      
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_10P_1_JPLL_SW     
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_10P_2_JPLL_SW     
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_11P_1_TWFL_SW     
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_11P_2_TWFL_SW     
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_12P_1_TWLL_SW     
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_12P_2_TWLL_SW     
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_13P_1_UJPLL_NW    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_13P_2_UJPLL_NW    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_14P_1_UJPLL_NE    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_14P_2_UJPLL_NE    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_15P_1_UJPLL_SW    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_15P_2_UJPLL_SW    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_16P_1_UJPLL_SE    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_16P_2_UJPLL_SE    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_17P_1_UTWLL_NW    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_17P_2_UTWLL_NW    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_18P_1_UTWLL_NE    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_18P_2_UTWLL_NE    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_19P_1_UTWLL_SW    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_19P_2_UTWLL_SW    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_20P_1_UTWLL_SE    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_20P_2_UTWLL_SE    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_21P_1_UPOR_SW     
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_21P_2_UPOR_SW     
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_22P_1_UESP_SW     
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_22P_2_UESP_SW     
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_23P_1_URELL_SW    
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_23P_2_URELL_SW    
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_24P_1_UIND_NE     
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_24P_2_UIND_NE     
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_25P_1_UJPLL_NW_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_25P_2_UJPLL_NW_pre
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_26P_1_UJPLL_NE_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_26P_2_UJPLL_NE_pre
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_27P_1_UJPLL_SW_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_27P_2_UJPLL_SW_pre
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_28P_1_UJPLL_SE_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_28P_2_UJPLL_SE_pre
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_29P_1_UTWLL_NW_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_29P_2_UTWLL_NW_pre
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_30P_1_UTWLL_NE_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_30P_2_UTWLL_NE_pre
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_31P_1_UTWLL_SW_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_31P_2_UTWLL_SW_pre
0	30	 0	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_32P_1_UTWLL_SE_pre
0	30	30	5	-1	99	-1	0	0	0	0	0	0	0	#_AgeSel_32P_2_UTWLL_SE_pre
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
#_Fleet1	Fleet2	Fleet3	Fleet4	Fleet5	Fleet6	Fleet7	Fleet8	Fleet9	Fleet10	Fleet11	Fleet12	Fleet13	Fleet14	Fleet15	Fleet16	Fleet17	Fleet18	Fleet19	Fleet20	Fleet21	Fleet22	Fleet23	Fleet24	Fleet25	Fleet26	Fleet27	Fleet28	Fleet29	Fleet30	Fleet31	Fleet32
0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	#_add_to_survey_CV     
0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	#_add_to_discard_stddev
0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	#_add_to_bodywt_CV     
0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	0.01	#_mult_by_lencomp_N    
1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	#_mult_by_agecomp_N    
1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	#_mult_by_size-at-age_N
4 #_maxlambdaphase
1 #_sd_offset
32 #_number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch;
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#_like_comp	fleet/survey	phase	value	sizefreq_method
1	13	1	1.000	1	#_Surv_UJPLL_NW_Phz1                   
1	14	1	1.000	1	#_Surv_UJPLL_NE_Phz1                   
1	15	1	1.000	1	#_Surv_UJPLL_SW_Phz1                   
1	16	1	1.000	1	#_Surv_UJPLL_SE_Phz1                   
1	17	1	0.001	1	#_Surv_UTWLL_NW_Phz1                   
1	18	1	0.001	1	#_Surv_UTWLL_NE_Phz1                   
1	19	1	0.001	1	#_Surv_UTWLL_SW_Phz1                   
1	20	1	0.001	1	#_Surv_UTWLL_SE_Phz1                   
1	21	1	1.000	1	#_Surv_UPOR_SW_Phz1                    
1	22	1	0.001	1	#_Surv_UESP_SW_Phz1                    
1	23	1	0.001	1	#_Surv_URELL_SW_Phz1                   
1	24	1	0.001	1	#_Surv_UIND_NE_Phz1                    
1	25	1	0.001	1	#_Surv_UJPLL_NW_pre_Phz1               
1	26	1	0.001	1	#_Surv_UJPLL_NE_pre_Phz1               
1	27	1	0.001	1	#_Surv_UJPLL_SW_pre_Phz1               
1	28	1	0.001	1	#_Surv_UJPLL_SE_pre_Phz1               
1	29	1	0.001	1	#_Surv_UTWLL_NW_pre_Phz1               
1	30	1	0.001	1	#_Surv_UTWLL_NE_pre_Phz1               
1	31	1	0.001	1	#_Surv_UTWLL_SW_pre_Phz1               
1	32	1	0.001	1	#_Surv_UTWLL_SE_pre_Phz1               
4	 1	1	1.000	1	#_length_GI_NE_sizefreq_method_1_Phz1  
4	 2	1	1.000	1	#_length_LL_NE_sizefreq_method_1_Phz1  
4	 3	1	1.000	1	#_length_GI_NW_sizefreq_method_1_Phz1  
4	 4	1	1.000	1	#_length_LL_NW_sizefreq_method_1_Phz1  
4	 5	1	1.000	1	#_length_GI_SE_sizefreq_method_1_Phz1  
4	 6	1	1.000	1	#_length_LL_SE_sizefreq_method_1_Phz1  
4	 7	1	1.000	1	#_length_ALGI_SW_sizefreq_method_1_Phz1
4	 8	1	1.000	1	#_length_EUEL_SW_sizefreq_method_1_Phz1
4	 9	1	1.000	1	#_length_ISEL_SW_sizefreq_method_1_Phz1
4	10	1	1.000	1	#_length_JPLL_SW_sizefreq_method_1_Phz1
4	11	1	1.000	1	#_length_TWFL_SW_sizefreq_method_1_Phz1
4	12	1	1.000	1	#_length_TWLL_SW_sizefreq_method_1_Phz1
0 #_more_stddev_reporting
# 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
# placeholder for vector of selex bins to be reported
# placeholder for vector of growth ages to be reported
# placeholder for vector of NatAges ages to be reported
#
999
