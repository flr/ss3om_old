#V3.30
#C file created using the SS_writectl function in the R package r4ss
#C file write time: 2021-02-09 14:57:02
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
2 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
4 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	1	1	0	#_recr_dist_pattern1
1	1	2	0	#_recr_dist_pattern2
1	1	3	0	#_recr_dist_pattern3
1	1	4	0	#_recr_dist_pattern4
#
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
1 #_Nblock_Patterns
1 #_blocks_per_pattern
#_begin and end years of blocks
1949 1949
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_ #_Age_natmort_by sex x growthpattern
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28	Age_29	Age_30
0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	#_natM1
0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	#_natM2
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0.01 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
# Age Maturity or Age fecundity:
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28	Age_29	Age_30
0.001	0.006	0.027	0.109	0.354	0.711	0.917	0.98	0.996	0.999	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	#_Age_Maturity1
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
 7.0e+01	 90.000000	 7.87000e+01	 7.87000e+01	 0.10	6	 -2	0	0	   0	   0	0.0	0	0	#_L_at_Amin_Fem_GP_1                
 2.5e+02	340.000000	 2.75812e+02	 2.75812e+02	 0.10	6	 -2	0	0	   0	   0	0.0	0	0	#_L_at_Amax_Fem_GP_1                
 5.0e-02	  0.200000	 1.57000e-01	 1.57000e-01	 0.10	6	 -3	0	0	   0	   0	0.0	0	0	#_VonBert_K_Fem_GP_1                
 5.0e-02	  0.250000	 1.50000e-01	 1.50000e-01	 0.15	6	 -3	0	0	   0	   0	0.5	0	0	#_CV_young_Fem_GP_1                 
 5.0e-02	  0.250000	 1.00000e-01	 1.50000e-01	 0.15	6	 -3	0	0	   0	   0	0.5	0	0	#_CV_old_Fem_GP_1                   
-3.0e+00	  3.000000	 3.81500e-06	 3.81500e-06	99.00	0	 -3	0	0	   0	   0	0.5	0	0	#_Wtlen_1_Fem_GP_1                  
-3.0e+00	  4.000000	 3.18800e+00	 3.18800e+00	99.00	0	 -3	0	0	   0	   0	0.5	0	0	#_Wtlen_2_Fem_GP_1                  
 3.5e+01	 73.000000	 5.50000e+01	 5.50000e+01	99.00	0	 -3	0	0	   0	   0	0.0	0	0	#_Mat50%_Fem_GP_1                   
-3.0e+00	  3.000000	-2.50000e-01	-2.50000e-01	99.00	0	 -3	0	0	   0	   0	0.0	0	0	#_Mat_slope_Fem_GP_1                
-3.0e+00	  3.000000	 1.00000e+00	 1.00000e+00	99.00	0	 -3	0	0	   0	   0	0.0	0	0	#_Eggs_scalar_Fem_GP_1              
-3.0e+00	  3.000000	 0.00000e+00	 0.00000e+00	99.00	0	 -3	0	0	   0	   0	0.0	0	0	#_Eggs_exp_wt_Fem_GP_1              
 7.0e+01	 90.000000	 8.35700e+01	 8.35700e+01	 0.10	6	 -2	0	0	   0	   0	0.0	0	0	#_L_at_Amin_Mal_GP_1                
 2.0e+02	280.000000	 2.13768e+02	 2.13768e+02	 0.10	6	 -2	0	0	   0	   0	0.0	0	0	#_L_at_Amax_Mal_GP_1                
 7.0e-02	  0.300000	 2.35000e-01	 2.35000e-01	 0.10	6	 -3	0	0	   0	   0	0.0	0	0	#_VonBert_K_Mal_GP_1                
 5.0e-02	  0.250000	 1.50000e-01	 1.50000e-01	 0.15	6	 -3	0	0	   0	   0	0.5	0	0	#_CV_young_Mal_GP_1                 
 5.0e-02	  0.250000	 1.00000e-01	 1.50000e-01	 0.15	6	 -3	0	0	   0	   0	0.5	0	0	#_CV_old_Mal_GP_1                   
-3.0e+00	  3.000000	 3.81500e-06	 3.81500e-06	99.00	0	 -3	0	0	   0	   0	0.5	0	0	#_Wtlen_1_Mal_GP_1                  
-3.0e+00	  4.000000	 3.18800e+00	 3.18800e+00	99.00	0	 -3	0	0	   0	   0	0.5	0	0	#_Wtlen_2_Mal_GP_1                  
-8.0e+00	  8.000000	 0.00000e+00	 1.00000e+00	99.00	0	 -3	0	0	   0	   0	0.5	0	0	#_RecrDist_GP_1                     
-8.0e+00	  8.000000	 0.00000e+00	 1.00000e+00	99.00	0	 -4	0	0	   0	   0	0.5	0	0	#_RecrDist_Area_1                   
-8.0e+00	  8.000000	-5.09876e-01	 1.00000e+00	99.00	0	  4	0	1	1965	2017	4.0	0	0	#_RecrDist_Area_2                   
-8.0e+00	  8.000000	-2.95335e-01	 1.00000e+00	99.00	0	  4	0	1	1965	2017	4.0	0	0	#_RecrDist_Area_3                   
-8.0e+00	  8.000000	-1.87103e-01	 1.00000e+00	99.00	0	  4	0	1	1965	2017	4.0	0	0	#_RecrDist_Area_4                   
-8.0e+00	  8.000000	 0.00000e+00	 1.00000e+00	99.00	0	 -7	0	0	   0	   0	0.5	0	0	#_RecrDist_month_1                  
 1.0e-01	 10.000000	 1.00000e+00	 1.00000e+00	 1.00	6	 -1	0	0	   0	   0	0.0	0	0	#_CohortGrowDev                     
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_1_to_2
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_1_to_2
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_1_to_3
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_1_to_3
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_2_to_1
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_2_to_1
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_2_to_4
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_2_to_4
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_3_to_1
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_3_to_1
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_3_to_4
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_3_to_4
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_4_to_2
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_4_to_2
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_4_to_3
-8.0e+00	  9.000000	-7.00000e+00	-5.00000e+00	 5.00	6	 -9	0	0	   0	   0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_4_to_3
 1.0e-06	  0.999999	 5.00000e-01	 5.00000e-01	 0.50	0	-99	0	0	   0	   0	0.0	0	0	#_FracFemale_GP_1                   
#_timevary MG parameters
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
 0.0001	2.00	0.9	0.9	0.5	6	-5	# RecrDist_Area_2_dev_se      
-0.9900	0.99	0.0	0.0	0.5	6	-6	# RecrDist_Area_2_dev_autocorr
 0.0001	2.00	0.9	0.9	0.5	6	-5	# RecrDist_Area_3_dev_se      
-0.9900	0.99	0.0	0.0	0.5	6	-6	# RecrDist_Area_3_dev_autocorr
 0.0001	2.00	0.9	0.9	0.5	6	-5	# RecrDist_Area_4_dev_se      
-0.9900	0.99	0.0	0.0	0.5	6	-6	# RecrDist_Area_4_dev_autocorr
# info on dev vectors created for MGparms are reported with other devs after tag parameter section
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker; 3=std_B-H; 4=SCAA;5=Hockey; 6=B-H_flattop; 7=survival_3Parm;8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
 7.0	18	8.42702	11.0	100.0	0	  3	0	0	0	0	0	0	0	#_SR_LN(R0)  
 0.2	 1	0.80000	 0.8	  0.1	1	-10	0	0	0	0	0	0	0	#_SR_BH_steep
 0.0	 2	0.20000	 0.2	  0.8	0	 -3	0	0	0	0	0	0	0	#_SR_sigmaR  
-5.0	 5	0.00000	 0.0	  1.0	6	 -4	0	0	0	0	0	0	0	#_SR_regime  
 0.0	 0	0.00000	 0.0	  0.0	0	-99	0	0	0	0	0	0	0	#_SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1970 # first year of main recr_devs; early devs can preceed this era
2017 # last year of main recr_devs; forecast devs start in following year
6 #_recdev phase
1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-5 #_recdev_early_phase
5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1970 #_last_yr_nobias_adj_in_MPD; begin of ramp
1971 #_first_yr_fullbias_adj_in_MPD; begin of plateau
2016 #_last_yr_fullbias_adj_in_MPD
2017 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-6 #min rec_dev
6 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
#Fishing Mortality info
0.2 # F ballpark
2003 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
2 # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
   16	1	 0	0	0	0	#_UJPLL_NW    
   17	2	16	0	1	0	#_UJPLL_NE    
   18	2	16	0	1	0	#_UJPLL_SW    
   19	2	16	0	1	0	#_UJPLL_SE    
   20	1	 0	0	0	1	#_UTWLL_NW    
   21	1	 0	0	0	1	#_UTWLL_NE    
   22	1	 0	0	0	1	#_UTWLL_SW    
   23	1	 0	0	0	1	#_UTWLL_SE    
   24	1	 0	0	0	1	#_UPOR_SW     
   25	1	 0	0	0	1	#_UESP_SW     
   26	1	 0	0	0	1	#_UZAF_SW     
   27	1	 0	0	0	1	#_UIND_NE     
   28	1	 0	0	0	1	#_UJPLL_NW_pre
   29	1	 0	0	0	1	#_UJPLL_NE_pre
   30	1	 0	0	0	1	#_UJPLL_SW_pre
   31	1	 0	0	0	1	#_UJPLL_SE_pre
   32	1	 0	0	0	1	#_UTWLL_NW_pre
   33	1	 0	0	0	1	#_UTWLL_NE_pre
   34	1	 0	0	0	1	#_UTWLL_SW_pre
   35	1	 0	0	0	1	#_UTWLL_SE_pre
-9999	0	 0	0	0	0	#_terminator  
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
-25	25	-11.3081	0	1	0	 1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_NW(16)    
-25	25	  0.0000	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_NE(17)    
-25	25	  0.0000	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_SW(18)    
-25	25	  0.0000	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_SE(19)    
-25	25	-11.3733	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_NW(20)    
-25	25	-11.3086	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_NE(21)    
-25	25	-12.5867	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_SW(22)    
-25	25	-12.0548	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_SE(23)    
-25	25	-14.6954	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UPOR_SW(24)     
-25	25	-12.9393	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UESP_SW(25)     
-25	25	-14.5541	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UZAF_SW(26)     
-25	25	-15.9842	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UIND_NE(27)     
-25	25	-11.9049	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_NW_pre(28)
-25	25	-11.9102	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_NE_pre(29)
-25	25	-12.0918	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_SW_pre(30)
-25	25	-12.7464	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UJPLL_SE_pre(31)
-25	25	-10.9923	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_NW_pre(32)
-25	25	-10.3937	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_NE_pre(33)
-25	25	-10.3049	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_SW_pre(34)
-25	25	-10.7787	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_UTWLL_SE_pre(35)
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
27	0	0	5	#_1 ALGI_NW      
 1	0	0	0	#_2 JPLL_NW      
24	0	0	0	#_3 TWLL_NW      
 5	0	0	1	#_4 ALGI_NE      
 5	0	0	2	#_5 JPLL_NE      
 5	0	0	3	#_6 TWLL_NE      
24	0	0	0	#_7 TWFL_NE      
24	0	0	0	#_8 EUEL_SW      
 5	0	0	8	#_9 ISEL_SW      
 5	0	0	2	#_10 JPLL_SW     
 5	0	0	3	#_11 TWLL_SW     
 5	0	0	8	#_12 AUEL_SE     
 5	0	0	8	#_13 EUEL_SE     
 5	0	0	2	#_14 JPLL_SE     
 5	0	0	3	#_15 TWLL_SE     
 5	0	0	2	#_16 UJPLL_NW    
 5	0	0	2	#_17 UJPLL_NE    
 5	0	0	2	#_18 UJPLL_SW    
 5	0	0	2	#_19 UJPLL_SE    
 5	0	0	3	#_20 UTWLL_NW    
 5	0	0	3	#_21 UTWLL_NE    
 5	0	0	3	#_22 UTWLL_SW    
 5	0	0	3	#_23 UTWLL_SE    
 5	0	0	8	#_24 UPOR_SW     
 5	0	0	8	#_25 UESP_SW     
 5	0	0	8	#_26 UZAF_SW     
 5	0	0	7	#_27 UIND_NE     
 5	0	0	2	#_28 UJPLL_NW_pre
 5	0	0	2	#_29 UJPLL_NE_pre
 5	0	0	2	#_30 UJPLL_SW_pre
 5	0	0	2	#_31 UJPLL_SE_pre
 5	0	0	3	#_32 UTWLL_NW_pre
 5	0	0	2	#_33 UTWLL_NE_pre
 5	0	0	2	#_34 UTWLL_SW_pre
 5	0	0	2	#_35 UTWLL_SE_pre
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
0	0	0	0	#_1 ALGI_NW      
0	0	0	0	#_2 JPLL_NW      
0	0	0	0	#_3 TWLL_NW      
0	0	0	0	#_4 ALGI_NE      
0	0	0	0	#_5 JPLL_NE      
0	0	0	0	#_6 TWLL_NE      
0	0	0	0	#_7 TWFL_NE      
0	0	0	0	#_8 EUEL_SW      
0	0	0	0	#_9 ISEL_SW      
0	0	0	0	#_10 JPLL_SW     
0	0	0	0	#_11 TWLL_SW     
0	0	0	0	#_12 AUEL_SE     
0	0	0	0	#_13 EUEL_SE     
0	0	0	0	#_14 JPLL_SE     
0	0	0	0	#_15 TWLL_SE     
0	0	0	0	#_16 UJPLL_NW    
0	0	0	0	#_17 UJPLL_NE    
0	0	0	0	#_18 UJPLL_SW    
0	0	0	0	#_19 UJPLL_SE    
0	0	0	0	#_20 UTWLL_NW    
0	0	0	0	#_21 UTWLL_NE    
0	0	0	0	#_22 UTWLL_SW    
0	0	0	0	#_23 UTWLL_SE    
0	0	0	2	#_24 UPOR_SW     
0	0	0	2	#_25 UESP_SW     
0	0	0	2	#_26 UZAF_SW     
0	0	0	2	#_27 UIND_NE     
0	0	0	2	#_28 UJPLL_NW_pre
0	0	0	2	#_29 UJPLL_NE_pre
0	0	0	2	#_30 UJPLL_SW_pre
0	0	0	2	#_31 UJPLL_SE_pre
0	0	0	2	#_32 UTWLL_NW_pre
0	0	0	2	#_33 UTWLL_NE_pre
0	0	0	2	#_34 UTWLL_SW_pre
0	0	0	2	#_35 UTWLL_SE_pre
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
  0.000	 0e+00	 0.00000e+00	  0.0	 0.000	0	-99	0	0	0	0	0.50	0	0	#_SizeSel_Spline_Code_ALGI_NW(1)  
 -0.001	 1e+00	 6.16361e-01	  0.0	 0.001	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_Spline_GradLo_ALGI_NW(1)
 -1.000	 1e-03	 6.63187e-04	  0.0	 0.001	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_Spline_GradHi_ALGI_NW(1)
 20.000	 3e+02	 1.50000e+01	  0.0	 0.000	0	-99	0	0	0	0	0.05	0	0	#_SizeSel_Spline_Knot_1_ALGI_NW(1)
 20.000	 3e+02	 8.60625e+01	  0.0	 0.000	0	-99	0	0	0	0	0.05	0	0	#_SizeSel_Spline_Knot_2_ALGI_NW(1)
 20.000	 3e+02	 1.39500e+02	  0.0	 0.000	0	-99	0	0	0	0	0.05	0	0	#_SizeSel_Spline_Knot_3_ALGI_NW(1)
 20.000	 3e+02	 1.92938e+02	  0.0	 0.000	0	-99	0	0	0	0	0.05	0	0	#_SizeSel_Spline_Knot_4_ALGI_NW(1)
 20.000	 3e+02	 2.46375e+02	  0.0	 0.000	0	-99	0	0	0	0	0.05	0	0	#_SizeSel_Spline_Knot_5_ALGI_NW(1)
 -9.000	 7e+00	-8.99740e+00	  0.0	 0.001	1	 -2	0	0	0	0	0.05	0	0	#_SizeSel_Spine_Val_1_ALGI_NW(1)  
 -9.000	 7e+00	 9.58733e-01	  0.0	 0.001	1	  2	0	0	0	0	0.05	0	0	#_SizeSel_Spine_Val_2_ALGI_NW(1)  
 -9.000	 7e+00	-1.00000e+00	  0.0	 0.000	0	-99	0	0	0	0	0.05	0	0	#_SizeSel_Spine_Val_3_ALGI_NW(1)  
 -9.000	 7e+00	-2.71927e+00	  0.0	 0.001	1	  2	0	0	0	0	0.05	0	0	#_SizeSel_Spine_Val_4_ALGI_NW(1)  
 -9.000	 7e+00	-2.97974e+00	  0.0	 0.001	1	  2	0	0	0	0	0.05	0	0	#_SizeSel_Spine_Val_5_ALGI_NW(1)  
 50.000	 2e+02	 1.50000e+02	150.0	20.000	1	  1	0	0	0	0	0.00	0	0	#_SizeSel_P_1_JPLL_NW(2)          
 10.010	 1e+02	 2.00000e+01	 20.0	20.000	1	  3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_JPLL_NW(2)          
 50.000	 2e+02	 1.42278e+02	150.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_1_TWLL_NW(3)          
 -6.000	 4e+00	-3.16252e-01	 -3.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_2_TWLL_NW(3)          
 -1.000	 9e+00	 6.97936e+00	  8.3	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_3_TWLL_NW(3)          
 -1.000	 9e+00	 5.26149e+00	  4.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_4_TWLL_NW(3)          
-15.000	-5e+00	-1.00000e+01	 -1.0	99.000	1	 -3	0	0	0	0	0.50	0	0	#_SizeSel_P_5_TWLL_NW(3)          
 -5.000	 9e+00	-1.57659e+00	 -1.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_6_TWLL_NW(3)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_ALGI_NE(4)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_ALGI_NE(4)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_JPLL_NE(5)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_JPLL_NE(5)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_TWLL_NE(6)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_TWLL_NE(6)          
 50.000	 2e+02	 1.42278e+02	150.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_1_TWFL_NE(7)          
 -6.000	 4e+00	-3.16252e-01	 -3.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_2_TWFL_NE(7)          
 -1.000	 9e+00	 6.97936e+00	  8.3	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_3_TWFL_NE(7)          
 -1.000	 9e+00	 5.26149e+00	  4.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_4_TWFL_NE(7)          
-15.000	-5e+00	-1.00000e+01	 -1.0	99.000	1	 -3	0	0	0	0	0.50	0	0	#_SizeSel_P_5_TWFL_NE(7)          
 -5.000	 9e+00	-1.57659e+00	 -1.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_6_TWFL_NE(7)          
 50.000	 2e+02	 1.42278e+02	150.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_1_EUEL_SW(8)          
 -6.000	 4e+00	-3.16252e-01	 -3.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_2_EUEL_SW(8)          
 -1.000	 9e+00	 6.97936e+00	  8.3	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_3_EUEL_SW(8)          
 -1.000	 9e+00	 5.26149e+00	  4.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_4_EUEL_SW(8)          
-15.000	-5e+00	-1.00000e+01	 -1.0	99.000	1	 -3	0	0	0	0	0.50	0	0	#_SizeSel_P_5_EUEL_SW(8)          
 -5.000	 9e+00	-1.57659e+00	 -1.0	99.000	1	  3	0	0	0	0	0.50	0	0	#_SizeSel_P_6_EUEL_SW(8)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_ISEL_SW(9)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_ISEL_SW(9)          
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_JPLL_SW(10)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_JPLL_SW(10)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_TWLL_SW(11)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_TWLL_SW(11)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_AUEL_SE(12)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_AUEL_SE(12)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_EUEL_SE(13)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_EUEL_SE(13)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_JPLL_SE(14)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_JPLL_SE(14)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_TWLL_SE(15)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_TWLL_SE(15)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_NW(16)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_NW(16)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_NE(17)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_NE(17)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_SW(18)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_SW(18)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_SE(19)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_SE(19)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_NW(20)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_NW(20)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_NE(21)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_NE(21)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_SW(22)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_SW(22)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_SE(23)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_SE(23)        
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UPOR_SW(24)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UPOR_SW(24)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UESP_SW(25)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UESP_SW(25)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UZAF_SW(26)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UZAF_SW(26)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UIND_NE(27)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UIND_NE(27)         
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_NW_pre(28)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_NW_pre(28)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_NE_pre(29)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_NE_pre(29)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_SW_pre(30)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_SW_pre(30)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UJPLL_SE_pre(31)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UJPLL_SE_pre(31)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_NW_pre(32)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_NW_pre(32)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_NE_pre(33)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_NE_pre(33)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_SW_pre(34)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_SW_pre(34)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -2	0	0	0	0	0.00	0	0	#_SizeSel_P_1_UTWLL_SE_pre(35)    
 -1.000	 2e+02	-1.00000e+00	 -1.0	 0.010	1	 -3	0	0	0	0	0.00	0	0	#_SizeSel_P_2_UTWLL_SE_pre(35)    
#_AgeSelex
#_No age_selex_parm
#_no timevary selex parameters
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_Factor	Fleet	Value
    4	 1	0.025	#_Variance_adjustment_list1 
    4	 2	0.025	#_Variance_adjustment_list2 
    4	 3	0.025	#_Variance_adjustment_list3 
    4	 4	0.025	#_Variance_adjustment_list4 
    4	 5	0.025	#_Variance_adjustment_list5 
    4	 6	0.025	#_Variance_adjustment_list6 
    4	 7	0.025	#_Variance_adjustment_list7 
    4	 8	0.025	#_Variance_adjustment_list8 
    4	 9	0.025	#_Variance_adjustment_list9 
    4	10	0.025	#_Variance_adjustment_list10
    4	11	0.025	#_Variance_adjustment_list11
    4	12	0.025	#_Variance_adjustment_list12
    4	13	0.025	#_Variance_adjustment_list13
    4	14	0.025	#_Variance_adjustment_list14
    4	15	0.025	#_Variance_adjustment_list15
-9999	 0	0.000	#_terminator                
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 35 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
    1	16	1	1.000	1	#_Surv_UJPLL_NW_Phz1                   
    1	17	1	1.000	1	#_Surv_UJPLL_NE_Phz1                   
    1	18	1	1.000	1	#_Surv_UJPLL_SW_Phz1                   
    1	19	1	1.000	1	#_Surv_UJPLL_SE_Phz1                   
    1	20	1	0.001	1	#_Surv_UTWLL_NW_Phz1                   
    1	21	1	0.001	1	#_Surv_UTWLL_NE_Phz1                   
    1	22	1	0.001	1	#_Surv_UTWLL_SW_Phz1                   
    1	23	1	0.001	1	#_Surv_UTWLL_SE_Phz1                   
    1	24	1	1.000	1	#_Surv_UPOR_SW_Phz1                    
    1	25	1	0.001	1	#_Surv_UESP_SW_Phz1                    
    1	26	1	1.000	1	#_Surv_UZAF_SW_Phz1                    
    1	27	1	0.001	1	#_Surv_UIND_NE_Phz1                    
    1	28	1	0.001	1	#_Surv_UJPLL_NW_pre_Phz1               
    1	29	1	0.001	1	#_Surv_UJPLL_NE_pre_Phz1               
    1	30	1	0.001	1	#_Surv_UJPLL_SW_pre_Phz1               
    1	31	1	0.001	1	#_Surv_UJPLL_SE_pre_Phz1               
    1	32	1	0.001	1	#_Surv_UTWLL_NW_pre_Phz1               
    1	33	1	0.001	1	#_Surv_UTWLL_NE_pre_Phz1               
    1	34	1	0.001	1	#_Surv_UTWLL_SW_pre_Phz1               
    1	35	1	0.001	1	#_Surv_UTWLL_SE_pre_Phz1               
    4	 1	1	1.000	1	#_length_ALGI_NW_sizefreq_method_1_Phz1
    4	 2	1	1.000	1	#_length_JPLL_NW_sizefreq_method_1_Phz1
    4	 3	1	1.000	1	#_length_TWLL_NW_sizefreq_method_1_Phz1
    4	 4	1	1.000	1	#_length_ALGI_NE_sizefreq_method_1_Phz1
    4	 5	1	1.000	1	#_length_JPLL_NE_sizefreq_method_1_Phz1
    4	 6	1	1.000	1	#_length_TWLL_NE_sizefreq_method_1_Phz1
    4	 7	1	1.000	1	#_length_TWFL_NE_sizefreq_method_1_Phz1
    4	 8	1	1.000	1	#_length_EUEL_SW_sizefreq_method_1_Phz1
    4	 9	1	1.000	1	#_length_ISEL_SW_sizefreq_method_1_Phz1
    4	10	1	1.000	1	#_length_JPLL_SW_sizefreq_method_1_Phz1
    4	11	1	1.000	1	#_length_TWLL_SW_sizefreq_method_1_Phz1
    4	12	1	1.000	1	#_length_AUEL_SE_sizefreq_method_1_Phz1
    4	13	1	1.000	1	#_length_EUEL_SE_sizefreq_method_1_Phz1
    4	14	1	1.000	1	#_length_JPLL_SE_sizefreq_method_1_Phz1
    4	15	1	1.000	1	#_length_TWLL_SE_sizefreq_method_1_Phz1
-9999	 0	0	0.000	0	#_terminator                           
#
0 # 0/1 read specs for more stddev reporting
#
999
