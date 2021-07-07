# cRep_sD_TagLambda1_h70
#C fishing mortality uses the hybrid method
#_data_and_control_files: simple.dat // simple.ctl
#_SS-V3.01-g-opt;_09/01/08;_Stock_Synthesis_by_Richard_Methot_(NOAA);_using_Otter_Research_ADMB_7.0.1
1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
4 #  number of recruitment assignments (overrides GP*area*seas parameter values)
0 # recruitment interaction requested
#GP seas area for each recruitment assignment
 1 1 1
 1 1 2
 1 1 3 
 1 1 4 
#
12 #_N_movement_definitions
3 # first age that moves (real age at begin of season, not integer)
# seas,GP,source_area,dest_area,minage,maxage
# ramp from age 5 to 12 coinciding with onset of maturity
# 1 1 1 1 5 12
# 1 1 1 2 5 12
# 1 1 1 3 5 12
# 1 1 1 4 5 12
# 1 1 2 1 5 12
# 1 1 2 2 5 12
# 1 1 2 3 5 12
# 1 1 2 4 5 12
# 1 1 3 1 5 12
# 1 1 3 2 5 12
# 1 1 3 3 5 12
# 1 1 4 1 5 12
# 1 1 4 2 5 12
# 1 1 4 4 5 12
 1 1 1 1 8 15
 1 1 1 2 8 15
 1 1 1 3 8 15
 1 1 1 4 8 15
 1 1 2 1 8 15
 1 1 2 2 8 15
# 1 1 2 3 8 15
 1 1 2 4 8 15
 1 1 3 1 8 15
# 1 1 3 2 8 15
 1 1 3 3 8 15
 1 1 4 1 8 15
 1 1 4 2 8 15
 1 1 4 4 8 15
1 #_Nblock_Designs
2
#1975 2006 2006 2015
193 318 319  356
0.5 #_fracfemale 
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
2
0 12
3 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age-specific K; 4=not implemented
1 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
#2 # number of K multipliers to read
# 2 6 # ages for K multiplier
4
1 8 9 10 
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern
#_placeholder for empirical age-maturity by growth pattern
#3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity
## 50% mature at age 2 years - same as Kolody 2010
#0	0	0	0	0	0	0	0.25	0.5	0.75	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1
#_placeholder for empirical age-maturity by growth pattern
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b
0 #Hermaphroditism option
# -1 #Hermaphroditism season
# 0 #Include males in spawning biomass
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=with logistic trans to keep within base parm bounds)
#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 0.075 2 0.8 0.8 0 100 -5 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP:1_  ## comparable to Kolody, 3mth period of "year"; need to keep eqivalent to annual values as M multiplied by season 3/12
 -3 3 0.25 0.25 0 100 -5 0 0 0 0 0.5 0 0 # NatM_p_2_Fem_GP:1_
# xxx Mhigh -3 3 0.4 0.4 0 100 -5 0 0 0 0 0.5 0 0 # NatM_p_2_Fem_GP:1_ 
 1 45 30.374 30.374 0 10 -2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1_  ## growth pars from Paige see "BET_growth_for_MFCL.xls"
 120 170 150.913 150.913 0 10 -4 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1_
 0.05 0.5 0.332 0.332 0 0.8 -4 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1_ ## 
 ## K deviates , one per age class 1 8 9 10 # this replicates Paige's growth function
-5	5	0.452	0.452	-1	1	-1	0	0	0	0	0	0	0
-5	5	2	2	-1	1	-1	0	0	0	0	0	0	0
-5	5	1.25	1.25	-1	1	-1	0	0	0	0	0	0	0
-5	5	1.112	1.112	-1	1	-1	0	0	0	0	0	0	0
 0.05 0.25 0.1 0.1 0 0.1 -3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1_    ## base on Paige see "BET_growth_for_MFCL.xls"
 0.05 0.25 0.1 0.1 0 0.1 -3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1_
 -3 3 2.217e-005 2.217e-005 0 100 -1 0 0 0 0 0.5 0 0 # Wtlen1_Fem from Chassot 2016
 2 4 3.01211 3.01211 0 100 -1 0 0 0 0 0.5 0 0 # Wtlen2_Fem
 1 150 110.888 110.888 0 100 -1 0 0 0 0 0.5 0 0 # Mat50_Fem
 -8 1 -0.25 -0.25 0 100 -1 0 0 0 0 0.5 0 0 # Mat_slope_Fem
# -3 40 10 10 -1 0.8 -3 0 0 0 0 0 0 0 # Mat50-Fem
# -3 3 -0.25 -0.25 0 0.8 -3 0 0 0 0 0 0 0 # Matslp-Fem
 -3 3 1 1 0 0.8 -3 0 0 0 0 0.5 0 0 # Eggs1_Fem
 -3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0 # Eggs2_Fem
 -3 3 0 0 1 0.05 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 -3 3 0 0 0 1 -3 0 0 0 0 0 0 0 # RecrDist_Area_1
 -5 5 0 0 0 1 3 0 2 313 360 2 0 0 # RecrDist_Area_2  
 -5 5 0 0 0 1 3 0 2 313 360 2 0 0 # RecrDist_Area_3  ## no recruitment in south
 -5 5 0 0 0 1 3 0 2 313 360 2 0 0 # RecrDist_Area_4  
# xxx Qhyper -5 5 0 0 0 1 3 0 0 0 0 0 0 0 # RecrDist_Area_2  
# xxx Qhyper -5 5 0 0 0 1 3 0 0 0 0 0 0 0 # RecrDist_Area_3  ## no recruitment in south
# xxx Qhyper -5 5 0 0 0 1 3 0 0 0 0 0 0 0 # RecrDist_Area_4  
 0 0 0 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_1_
 0 2 1 1 -1 0 -4 0 0 0 0 0 0 0 # CohortGrowDev
## ESTIMATION TURNED ON - sensitivie to assumed prior
## no movement for the young age class
 -10 12 10 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_1to_1
 -10 12 0 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_1to_1
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_1to_2
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_1to_2
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_1to_3  
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_1to_3
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_1to_4  
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_1to_4
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_2to_1
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_2to_1
 -10 12 10 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_2to_2
 -10 12 0 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_2to_2
# -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_2to_3
# -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_2to_3 
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_2to_4
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_2to_4 
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_3to_1
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_3to_1
# -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_3to_2
# -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_3to_2
 -10 12 10 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_3to_3
 -10 12 0 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_3to_3
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_4to_1
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_4to_1
 -10 12 -10 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_4to_2
 -10 12 0 0 0 4 6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_4to_2
 -10 12 10 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_4to_4
 -10 12 0 0 0 4 -6 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_4to_4
#Cond 0  #custom_MG-env_setup (0/1)
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
#0
#4
#-4 4 0 0 -1 99 7 #_placeholder when no MG-environ parameters
#-4 4 0 0 -1 99 7 #_placeholder when no MG-environ parameters
#-4 4 0 0 -1 99 7 #_placeholder when no MG-environ parameters
#-4 4 0 0 -1 99 7 #_placeholder when no MG-environ parameters
#Cond 0  #custom_MG-block_setup (0/1)
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#Cond -4 #_MGparm_Dev_Phase
 7
#_Spawner-Recruitment
3 #_SR_function
#_LO HI INIT PRIOR PR_type SD PHASE
 -2 25 10 10 0 10 1 # SR_R0
 0.2 1 0.7 0.7 2 0.2 -1 # SR_steep
# xxx h80 0.2 1 0.8 0.8 2 0.2 -1 # SR_steep
# xxx h90 0.2 1 0.9 0.9 2 0.2 -1 # SR_steep
 0 2 0.6 0.6 0 0.8 -4 # SR_sigmaR
 -5 5 0 0 0 1 -3 # SR_envlink
 -5 5 0 0 0 1 -4 # SR_R1_offset
 0 0 0 0 -1 0 -99 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
#193
232
364  ## limited data for last 4 deviates
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
3 #_lambda for Fcast_recr_like occurring before endyr+1
232 #_last_early_yr_nobias_adj_in_MPD
232 #_first_yr_fullbias_adj_in_MPD
364 #_last_yr_fullbias_adj_in_MPD
364
1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 # max_bias_adj_in_MPD = 0.9 used based on analysis of SE of estimated recruitment as per Apeendix A of the SS manual
0 #_period of cycles in recruitment (N parms read below)
-5 #min rec_dev
5 #max rec_dev
0 #_read_recdevs
##_end of advanced SR options
#Fishing Mortality info 
0.1 # F ballpark for tuning early phases - results insensitive to value
300 # F ballpark year
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method  - results insensitive to value (alternative 1.2)
4 # N iterations for tuning F in hybrid method (recommend 3 to 7)
# no additional F input needed for Fmethod 1
# read overall start F value; overall phase; N detailed inputs to read for Fmethod 2
# read N iterations for tuning for Fmethod 3 (recommend 3 to 7)
#Fleet Year Seas F_value se phase (for detailed setup of F_Method=2)
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
0 1 0 0 0 99 -1 # InitF_1_FISHERY1_
0 1 0.1 0.1 0 99 2 # InitF_1_FISHERY2_
0 1 0.1 0.1 0 99 2 # InitF_1_FISHERY3_
0 1 0.1 0.1 0 99 2 # InitF_1_FISHERY4_
0 1 0 0 0 99 -1 # InitF_1_FISHERY5_
0 1 0 0 0 99 -1 # InitF_1_FISHERY6_
0 1 0 0 0 99 -1 # InitF_1_FISHERY7_
0 1 0 0 0 99 -1 # InitF_1_FISHERY8_
0 1 0 0 0 99 -1 # InitF_1_FISHERY9_
0 1 0 0 0 99 -1 # InitF_1_FISHERY10_
0 1 0 0 0 99 -1 # InitF_1_FISHERY11_
0 1 0 0 0 99 -1 # InitF_1_FISHERY12_
0 1 0.1 0.1 0 99 2 # InitF_1_FISHERY13_
0 1 0 0 0 99 -1 # InitF_1_FISHERY14_
0 1 0 0 0 99 -1 # InitF_1_FISHERY15_
# no additional F input needed for Fmethod 1 and 3
# F_method 2 requires: 
#Cond 0.05 1 0 #overall start F value; overall phase; N detailed inputs to read
#Fleet Year Seas F_value se phase
#_Q_setup
 # A=do power, B=env-var, C=extra SD, D=devtype(<0=mirror, 0/1=none, 2=cons, 3=rand, 4=randwalk); E=0=num/1=bio, F=err_type
 #_A  B  C  D  E  F
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0     ## LL CPUE 1 region
 0 0 0 -16   ## equivalent q 
 0 0 0 -16
 0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 -16   ## equivalent q 
# xxx Qhyper 1 0 0 0
# xxx Qhyper 1 0 0 0
# xxx Qhyper -20 10 0 0 0 2 3 # Q_base_2__SURVEY8_ # 
# xxx Qhyper -20 10 0 0 0 2 3 # Q_base_2__SURVEY9_ # 
  
#_size_selex_types
#_Pattern Discard Male Special
 0 0 0 0 # 1
 0 0 0 0 # 2
 0 0 0 0 # 3
 0 0 0 0 # 4
 0 0 0 0 # 5
 0 0 0 0 # 1
 0 0 0 0 # 2
 0 0 0 0 # 3
 0 0 0 0 # 4
 0 0 0 0 # 5
 0 0 0 0 # 1
 0 0 0 0 # 2
 0 0 0 0 # 3
 0 0 0 0 # 4
 0 0 0 0 # 5
 0 0 0 0 # 1
 0 0 0 0 # 2
 0 0 0 0 # 3
 0 0 0 0 # 1
 0 0 0 0 # 2
 0 0 0 0 # 3
 0 0 0 0 # 3
# xxx Qhyper 0 0 0 0 # 3
# xxx Qhyper 0 0 0 0 # 3
 
#_age_selex_types
#_Pattern Discard Male Special
 12 0 0 0 # logistic for Fleet 1 - FL2
# xxx sL 12 0 0 0 # logistic for Fleet 2 - LL1S
# xxx sL 15 0 0 2 # logistic for Fleet 3 - LL2, Equivalent for LL1S fishery 
# xxx sL 15 0 0 2 # logistic for Fleet 4 - LL3, Equivalent for LL1S fishery   
 20 0 0 0 # logistic for Fleet 2 - LL1S
 20 0 0 0 # logistic for Fleet 3 - LL2, Equivalent for LL1S fishery 
 20 0 0 0 # logistic for Fleet 4 - LL3, Equivalent for LL1S fishery   
 27 0 0 5 # cubic spline for Fleet 5 - PSFS1S
 15 0 0 5 # cubic spline for Fleet 6 - PSFS2, equivalent PSFS1S
 15 0 0 5 # cubic spline for Fleet 7 - OT1N, equivalent PSFS1S
 15 0 0 5 # cubic spline for Fleet 8 - OT2, equivalent PSFS1S
 20 0 0 0 # double normal for Fleet 9 - PSLS1S
 15 0 0 9 # double normal for Fleet 10 - PSLS2, equivalent PS LS 1
 20 0 0 0 # double normal for Fleet 11 - BB1N
# xxx sL 15 0 0 2 # logistic for Fleet 12 - LINE2, equivalent to LL1S
 12 0 0 0 # logistic for Fleet 12 - LINE2, equivalent to FL2
# xxx sL 15 0 0 2 # logistic for Fleet 13 - LL1N, Equivalent for LL1S fishery 
 12 0 0 0 # logistic for Fleet 13 - LL1N
 15 0 0 5 # cubic spline for Fleet 14 - PSFS1N, equivalent PSFS1S
 20 0 0 0 # double normal for Fleet 15 - PSLS1N
 15 0 0 2 # CPUE equivalent to LL fishery CPUE LL1S
 15 0 0 3 # CPUE equivalent to LL fishery CPUE LL2
 15 0 0 4 # CPUE equivalent to LL fishery CPUE LL3 - season 1
 15 0 0 4 # CPUE equivalent to LL fishery CPUE LL3 - season 2
 15 0 0 4 # CPUE equivalent to LL fishery CPUE LL3 - season 3
 15 0 0 4 # CPUE equivalent to LL fishery CPUE LL3 - season 4
 15 0 0 13 # CPUE equivalent to LL fishery CPUE LL1N
# xxx Qhyper 15 0 0 2 # CPUE equivalent to LL fishery CPUE LL1S 
# xxx Qhyper 15 0 0 13 # CPUE equivalent to LL fishery CPUE LL1N
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
## logistic FL2
 10 30 20 20 0 1000 3 0 0 0 0 0 0 0 # AgeSel_1_P_1_ 7
 0 10 1 1 0 1000 2 0 0 0 0 0 0 0 # AgeSel_1_P_2_ 8
## logistic LL1S,2,3,LL1N, LINE2
# xxx sL 10 30 20 20 0 1000 3 0 0 0 0 0 0 0 # AgeSel_2_P_1_ 7
# xxx sL 3 20 7 7 0 1000 2 0 0 0 0 0 0 0 # AgeSel_2_P_2_ 8
## logistic LL1S
 1 40 18 18 0 1000 3 0 0 0 0 0 0 0 # AgeSel_2_P_1_ 1
 -20 -3 -5 -5 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_2_P_2_ 2
 -10 9 3 3 0 1000 4 0 0 0 0 0 0 0 # AgeSel_2_P_3_ 3
 -5 9 5 5 0 1000 4 0 0 0 0 0 0 0 # AgeSel_2_P_4_ 4
 -12 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_2_P_5_ 5
 -9 9 -1 -1 0 1000 5 0 0 0 0 0 0 0 # AgeSel_2_P_6_ 6
## double normal LL2
 1 40 18 18 0 1000 3 0 0 0 0 0 0 0 # AgeSel_3_P_1_ 1
 -20 -3 -5 -5 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_3_P_2_ 2
 -10 9 3 3 0 1000 4 0 0 0 0 0 0 0 # AgeSel_3_P_3_ 3
 -5 9 5 5 0 1000 4 0 0 0 0 0 0 0 # AgeSel_3_P_4_ 4
 -12 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_3_P_5_ 5
 -9 9 -1 -1 0 1000 5 0 0 0 0 0 0 0 # AgeSel_3_P_6_ 6
## double normal LL3
 1 40 18 18 0 1000 3 0 0 0 0 0 0 0 # AgeSel_4_P_1_ 1
 -20 -3 -5 -5 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_4_P_2_ 2
 -10 9 3 3 0 1000 4 0 0 0 0 0 0 0 # AgeSel_4_P_3_ 3
 -5 9 5 5 0 1000 4 0 0 0 0 0 0 0 # AgeSel_4_P_4_ 4
 -12 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_4_P_5_ 5
 -9 9 -1 -1 0 1000 5 0 0 0 0 0 0 0 # AgeSel_4_P_6_ 6
# cubic spline PSFS1S, PSFS2, PSFS1N, OT1N, OT2
 0 2 0 0 -1 0 -99 0 0 0 0 0 0 0 # AgeSel_5_P_1_ 1
 -0.001 4 1 1 1 0.01 3 0 0 0 0 0 0 0 # AgeSel_5_P_1_ 1
 -1 0.001 -0.01 0 1 0.01 3 0 0 0 0 0 0 0 # AgeSel_5_P_1_ 1
 1 7 2 2 0 0.5 -4 0 0 0 0 0 0 0
 2 10 3 3 0 0.5 -4 0 0 0 0 0 0 0
 5 14 6 6 0 0.5 -4 0 0 0 0 0 0 0
 10 24 12 12 0 0.5 -4 0 0 0 0 0 0 0
 12 24 20 20 0 0.5 -4 0 0 0 0 0 0 0
 -10 10 -2.78 -2.78 0 2 2 0 0 0 0 0 0 0
 -10 10 -4.9 -4.9 0 2 2 0 0 0 0 0 0 0
 -10 10 0 0 0 2 -2 0 0 0 0 0 0 0
 -10 10 -0.77 -0.77 0 2 2 0 0 0 0 0 0 0
 -10 10 0 0 0 2 2 0 0 0 0 0 0 0
# double normal PSLS1S, PSLS2, PSLS1N
# 1 20 6 6 0 1000 3 0 0 0 0 0 1 2 # AgeSel_9_P_1_ 1
 1 20 6 6 0 1000 3 0 0 0 0 0 0 0 # AgeSel_9_P_1_ 1
 -20 -1 -5 -5 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_9_P_2_ 2
# -10 9 2 2 0 1000 4 0 0 0 0 0 1 2 # AgeSel_9_P_3_ 3
 -10 9 2 2 0 1000 4 0 0 0 0 0 0 0 # AgeSel_9_P_3_ 3
 -5 9 2 2 0 1000 4 0 0 0 0 0 0 0 # AgeSel_9_P_4_ 4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_9_P_5_ 5
 -9 9 -5 -5 0 1000 5 0 0 0 0 0 0 0 # AgeSel_9_P_6_ 6
# double normal BB1N
 0.2 20 6 6 0 1000 3 0 0 0 0 0 0 0 # AgeSel_11_P_1_ 1
 -20 -1 -5 -5 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_11_P_2_ 2
 -10 9 2 2 0 1000 4 0 0 0 0 0 0 0 # AgeSel_11_P_3_ 3
 -6 9 2 2 0 1000 4 0 0 0 0 0 0 0 # AgeSel_11_P_4_ 4
 -20 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_11_P_5_ 5
 -9 9 -5 -5 0 1000 5 0 0 0 0 0 0 0 # AgeSel_11_P_6_ 6
# Logistic Line2 
 10 30 20 20 0 1000 3 0 0 0 0 0 0 0 # AgeSel_12_P_1_ 7
 3 20 7 7 0 1000 2 0 0 0 0 0 0 0 # AgeSel_12_P_2_ 8
# Logistic LL1N
 10 30 20 20 0 1000 3 0 0 0 0 0 0 0 # AgeSel_13_P_1_ 7
 3 20 7 7 0 1000 2 0 0 0 0 0 0 0 # AgeSel_13_P_2_ 8
# double normal PSLS1N
 1 20 6 6 0 1000 3 0 0 0 0 0 0 0 # AgeSel_15_P_1_ 1
 -20 -1 -5 -5 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_15_P_2_ 2
 -10 9 2 2 0 1000 4 0 0 0 0 0 0 0 # AgeSel_15_P_3_ 3
 -5 9 2 2 0 1000 4 0 0 0 0 0 0 0 # AgeSel_15_P_4_ 4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_15_P_5_ 5
 -9 9 -5 -5 0 1000 5 0 0 0 0 0 0 0 # AgeSel_15_P_6_ 6
 
#Cond 0 #_custom_sel-env_setup (0/1) 
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
#1 #_custom_sel-blk_setup (0/1) 
# 1 20 6 6 0 1000 3   ## AgeSel_9P_1_PSLS1_BLK1repl_193
# 1 20 6 6 0 1000 3   ## AgeSel_9P_1_PSLS1_BLK1repl_321
# -20 9 2 2 0 1000 4  ## AgeSel_9P_3_PSLS1_BLK1repl_193
# -20 9 2 2 0 1000 4  ## AgeSel_9P_3_PSLS1_BLK1repl_321
 
# -2 2 0 0 -1 99 -2 #_placeholder when no block usage
# -2 2 0 0 -1 99 -2 #_placeholder when no selex devs
#5 # placeholder for selparm_Dev_Phase
#1 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds)
# Tag loss and Tag reporting parameters go next
#0  # TG_custom:  0=no read; 1=read if tags exist
1
#Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#tag loss parameter - for each tag grp; 86 groups
# set to negligible value as already accounted for in recoveries
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_
# chronic tag loss - for each tag group
# set to negligible value as already accounted for in recoveries
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
# Overdispersion  for the negative binomial for each tag group
# estimate with uninformative beta prior mean 10 sd 3
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 50 10 10 2 3 7 0 0 0 0 0 0 0 # TG_overdispersion_1_
# starting values for tag reporting rate.
# PS reporting rate set to 1.0 as already corrected tag recoveries for RR, initial loss and proportion of catch not examined fr tags
## other fisheries have an initial RR = ??
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_1_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_2_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_3_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_4_
## PS FS
-10	10	 5.0		5.0		0	5	-4	0	0	0	0	0	0	0	#	TG_report_fleet:_5_
-10	10	 5.0		5.0		0	5	-4	0	0	0	0	0	0	0	#	TG_report_fleet:_6_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_7_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_8_
## PS LS
-10	10	 5.0		5.0		0	5	-4	0	0	0	0	0	0	0	#	TG_report_fleet:_9_
-10	10	 5.0		5.0		0	5	-4	0	0	0	0	0	0	0	#	TG_report_fleet:_10_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_11_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_12_
-10	10	 -0.6931472	-0.6931472	0	5	4	0	0	0	0	0	0	0	#	TG_report_fleet:_13_
## PS R4
-10	10	 5.0		5.0		0	5	-4	0	0	0	0	0	0	0	#	TG_report_fleet:_14_
-10	10	 5.0		5.0		0	5	-4	0	0	0	0	0	0	0	#	TG_report_fleet:_15_
# Exponential decay rate in reporting rate for each fleet (default=0, negative value to get decay)
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
# -4 4 0 0 0 2 7 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
# -4 4 0 0 0 2 7 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
# -4 4 0 0 0 2 7 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
# -4 4 0 0 0 2 7 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
1 #_Variance_adjustments_to_input_values
#_1 2 3 - one column per fishery/survey
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.05 0 0 0 0 0 0.05 #_add_to_survey_CV
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 0.1 1 0.1 0.1 0.1 1 1 1 1 1 1 1 1 #_mult_by_lencomp_N
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_agecomp_N
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_size-at-age_N
# xxx Qhyper 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_survey_CV
# xxx Qhyper 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
# xxx Qhyper 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
# xxx Qhyper 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 0.1 1 0.1 0.1 0.1 1 1 1 1 1 1 1 1 1 1 #_mult_by_lencomp_N
# xxx Qhyper 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_agecomp_N
# xxx Qhyper 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_size-at-age_N
1 #_maxlambdaphase
1 #_sd_offset
 0 #3 # number of changes to make to default Lambdas (default value is 1.0)
# xxx TagLambda01 136 #3 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=WtFreq; 7=sizeage; 8=catch; 
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin
#like_comp fleet/survey  phase  value  wtfreq_method
# 1 2 2 1 1
# 4 2 2 1 1
# 4 2 3 1 1
## multinomial for tags 0.1
# xxx TagLambda01 15	1	1	0.1	1
# xxx TagLambda01 15	2	1	0.1	1
# xxx TagLambda01 15	3	1	0.1	1
# xxx TagLambda01 15	4	1	0.1	1
# xxx TagLambda01 15	5	1	0.1	1
# xxx TagLambda01 15	6	1	0.1	1
# xxx TagLambda01 15	7	1	0.1	1
# xxx TagLambda01 15	8	1	0.1	1
# xxx TagLambda01 15	9	1	0.1	1
# xxx TagLambda01 15	10	1	0.1	1
# xxx TagLambda01 15	11	1	0.1	1
# xxx TagLambda01 15	12	1	0.1	1
# xxx TagLambda01 15	13	1	0.1	1
# xxx TagLambda01 15	14	1	0.1	1
# xxx TagLambda01 15	15	1	0.1	1
# xxx TagLambda01 15	16	1	0.1	1
# xxx TagLambda01 15	17	1	0.1	1
# xxx TagLambda01 15	18	1	0.1	1
# xxx TagLambda01 15	19	1	0.1	1
# xxx TagLambda01 15	20	1	0.1	1
# xxx TagLambda01 15	21	1	0.1	1
# xxx TagLambda01 15	22	1	0.1	1
# xxx TagLambda01 15	23	1	0.1	1
# xxx TagLambda01 15	24	1	0.1	1
# xxx TagLambda01 15	25	1	0.1	1
# xxx TagLambda01 15	26	1	0.1	1
# xxx TagLambda01 15	27	1	0.1	1
# xxx TagLambda01 15	28	1	0.1	1
# xxx TagLambda01 15	29	1	0.1	1
# xxx TagLambda01 15	30	1	0.1	1
# xxx TagLambda01 15	31	1	0.1	1
# xxx TagLambda01 15	32	1	0.1	1
# xxx TagLambda01 15	33	1	0.1	1
# xxx TagLambda01 15	34	1	0.1	1
# xxx TagLambda01 15	35	1	0.1	1
# xxx TagLambda01 15	36	1	0.1	1
# xxx TagLambda01 15	37	1	0.1	1
# xxx TagLambda01 15	38	1	0.1	1
# xxx TagLambda01 15	39	1	0.1	1
# xxx TagLambda01 15	40	1	0.1	1
# xxx TagLambda01 15	41	1	0.1	1
# xxx TagLambda01 15	42	1	0.1	1
# xxx TagLambda01 15	43	1	0.1	1
# xxx TagLambda01 15	44	1	0.1	1
# xxx TagLambda01 15	45	1	0.1	1
# xxx TagLambda01 15	46	1	0.1	1
# xxx TagLambda01 15	47	1	0.1	1
# xxx TagLambda01 15	48	1	0.1	1
# xxx TagLambda01 15	49	1	0.1	1
# xxx TagLambda01 15	50	1	0.1	1
# xxx TagLambda01 15	51	1	0.1	1
# xxx TagLambda01 15	52	1	0.1	1
# xxx TagLambda01 15	53	1	0.1	1
# xxx TagLambda01 15	54	1	0.1	1
# xxx TagLambda01 15	55	1	0.1	1
# xxx TagLambda01 15	56	1	0.1	1
# xxx TagLambda01 15	57	1	0.1	1
# xxx TagLambda01 15	58	1	0.1	1
# xxx TagLambda01 15	59	1	0.1	1
# xxx TagLambda01 15	60	1	0.1	1
# xxx TagLambda01 15	61	1	0.1	1
# xxx TagLambda01 15	62	1	0.1	1
# xxx TagLambda01 15	63	1	0.1	1
# xxx TagLambda01 15	64	1	0.1	1
# xxx TagLambda01 15	65	1	0.1	1
# xxx TagLambda01 15	66	1	0.1	1
# xxx TagLambda01 15	67	1	0.1	1
# xxx TagLambda01 15	68	1	0.1	1
## down weight negbin tag LL lambda 0.1
# xxx TagLambda01 16	1	1	0.1	1
# xxx TagLambda01 16	2	1	0.1	1
# xxx TagLambda01 16	3	1	0.1	1
# xxx TagLambda01 16	4	1	0.1	1
# xxx TagLambda01 16	5	1	0.1	1
# xxx TagLambda01 16	6	1	0.1	1
# xxx TagLambda01 16	7	1	0.1	1
# xxx TagLambda01 16	8	1	0.1	1
# xxx TagLambda01 16	9	1	0.1	1
# xxx TagLambda01 16	10	1	0.1	1
# xxx TagLambda01 16	11	1	0.1	1
# xxx TagLambda01 16	12	1	0.1	1
# xxx TagLambda01 16	13	1	0.1	1
# xxx TagLambda01 16	14	1	0.1	1
# xxx TagLambda01 16	15	1	0.1	1
# xxx TagLambda01 16	16	1	0.1	1
# xxx TagLambda01 16	17	1	0.1	1
# xxx TagLambda01 16	18	1	0.1	1
# xxx TagLambda01 16	19	1	0.1	1
# xxx TagLambda01 16	20	1	0.1	1
# xxx TagLambda01 16	21	1	0.1	1
# xxx TagLambda01 16	22	1	0.1	1
# xxx TagLambda01 16	23	1	0.1	1
# xxx TagLambda01 16	24	1	0.1	1
# xxx TagLambda01 16	25	1	0.1	1
# xxx TagLambda01 16	26	1	0.1	1
# xxx TagLambda01 16	27	1	0.1	1
# xxx TagLambda01 16	28	1	0.1	1
# xxx TagLambda01 16	29	1	0.1	1
# xxx TagLambda01 16	30	1	0.1	1
# xxx TagLambda01 16	31	1	0.1	1
# xxx TagLambda01 16	32	1	0.1	1
# xxx TagLambda01 16	33	1	0.1	1
# xxx TagLambda01 16	34	1	0.1	1
# xxx TagLambda01 16	35	1	0.1	1
# xxx TagLambda01 16	36	1	0.1	1
# xxx TagLambda01 16	37	1	0.1	1
# xxx TagLambda01 16	38	1	0.1	1
# xxx TagLambda01 16	39	1	0.1	1
# xxx TagLambda01 16	40	1	0.1	1
# xxx TagLambda01 16	41	1	0.1	1
# xxx TagLambda01 16	42	1	0.1	1
# xxx TagLambda01 16	43	1	0.1	1
# xxx TagLambda01 16	44	1	0.1	1
# xxx TagLambda01 16	45	1	0.1	1
# xxx TagLambda01 16	46	1	0.1	1
# xxx TagLambda01 16	47	1	0.1	1
# xxx TagLambda01 16	48	1	0.1	1
# xxx TagLambda01 16	49	1	0.1	1
# xxx TagLambda01 16	50	1	0.1	1
# xxx TagLambda01 16	51	1	0.1	1
# xxx TagLambda01 16	52	1	0.1	1
# xxx TagLambda01 16	53	1	0.1	1
# xxx TagLambda01 16	54	1	0.1	1
# xxx TagLambda01 16	55	1	0.1	1
# xxx TagLambda01 16	56	1	0.1	1
# xxx TagLambda01 16	57	1	0.1	1
# xxx TagLambda01 16	58	1	0.1	1
# xxx TagLambda01 16	59	1	0.1	1
# xxx TagLambda01 16	60	1	0.1	1
# xxx TagLambda01 16	61	1	0.1	1
# xxx TagLambda01 16	62	1	0.1	1
# xxx TagLambda01 16	63	1	0.1	1
# xxx TagLambda01 16	64	1	0.1	1
# xxx TagLambda01 16	65	1	0.1	1
# xxx TagLambda01 16	66	1	0.1	1
# xxx TagLambda01 16	67	1	0.1	1
# xxx TagLambda01 16	68	1	0.1	1
0
#1 # (0/1) read specs for more stddev reporting
# 1 1 -1 5 1 5 1 -1 5 # selex type, len/age, year, N selex bins, Growth pattern, N growth ages, area For N-at-age, Year, N bins
# -5 16 27 38 46 # vector with selex std bin picks (-1 in first bin to self-generate)
# -1 2 14 26 40 # vector with growth std bin picks (-1 in first bin to self-generate)
# -1 2 14 26 40 # vector with N-at-age std bin picks (-1 in first bin to self-generate)
999
