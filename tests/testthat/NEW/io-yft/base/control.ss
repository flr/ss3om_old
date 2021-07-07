# base
#C fishing mortality uses the hybrid method
#_data_and_control_files: simple.dat // simple.ctl
#_SS-V3.24Z-safe;_05/18/2016;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.2x64
1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
## recruitment limited to two equatorial regions only and arabian sea = areas of higher water temperature; low SST in areas 3 and 4
2 #  number of recruitment assignments (overrides GP*area*seas parameter values)
0 # recruitment interaction requested
#GP seas area for each recruitment assignment
 1 1 1  ## arabian sea AND western equatoriaL
# 1 1 2 
# 1 1 3 
 1 1 4 ## eastern equatoria
10 #_N_movement_definitions
2 # first age that moves (real age at begin of season, not integer)
# seas,GP,source_area,dest_area,minage,maxage
# transition movement at about length 75cm (approx age 9 years). corressponds to L50% sexual maturity also
 1 1 1 1 8 9
 1 1 1 2 8 9
 1 1 1 4 8 9
 1 1 2 1 8 9
 1 1 2 2 8 9
 1 1 3 3 8 9
 1 1 3 4 8 9
 1 1 4 1 8 9
 1 1 4 3 8 9
 1 1 4 4 8 9
2 #_Nblock_Designs
2 1
#2000 2011 2012 2017
#2003 2007
213 260 261 284
225 244
0.5 #_fracfemale 
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
## first age class is age 0
## need to multiple by 4 as M gets muliplied by season duration = 3/12
## OPtion 1 is the low initial base level used in 2012 previously
# 0.8	0.8	0.704	0.608	0.512	0.416	0.32	0.32	0.32	0.32	0.32	0.336	0.3828	0.424	0.456	0.4752	0.4788	0.4672	0.4444	0.4152	0.3868	0.3628	0.3452	0.3336	0.3272	0.3232	0.3216	0.3208	0.3204
## OPtion two - scale of M estimated in 2012 MFCL assessment from base model "D:\\mfcl\\yft\\iotc2012\\mfcl\\2012assess\\model\\meeting\\5region\\plot-steep80.par.rep"
## base level of M estimated in that model multiple by 4 to convert to SS values
# 0.3358  0.2955  0.2552  0.2149  0.1746  0.1343  0.1343  0.1343  0.1343  0.1343  0.1410  0.1606  0.1780  0.1915  0.1994  0.2009  0.1962  0.1865  0.1743  0.1623  0.1522  0.1449  0.1401  0.1373  0.1357  0.1349  0.1346  0.1344
 1.3432 1.3432	1.182	1.0208	0.8596	0.6984	0.5372	0.5372	0.5372	0.5372	0.5372	0.564	0.6424	0.712	0.766	0.7976	0.8036	0.7848	0.746	0.6972	0.6492	0.6088	0.5796	0.5604	0.5492	0.5428	0.5396	0.5384	0.5376
# xxx Mlow 0.8	0.8	0.704	0.608	0.512	0.416	0.32	0.32	0.32	0.32	0.32	0.336	0.3828	0.424	0.456	0.4752	0.4788	0.4672	0.4444	0.4152	0.3868	0.3628	0.3452	0.3336	0.3272	0.3232	0.3216	0.3208	0.3204
3 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age-specific K; 4=not implemented
1 #_Growth_Age_for_L1
28
#999 #_Growth_Age_for_L2 (999 to use as Linf)
#2 # number of K multipliers to read
# 2 6 # ages for K multiplier
# 2 13
12
2 3 4 5 6 7 8 9 10 11 12 13
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity
## 50% mature at age 9 quarters
## reference Zudaire 2013 AZTI L50 at 75 cm 
## lenagth at age 
# 10	22.0024	35	43	46	50		53	58	67	77	87	97	106	113	119	124	128	131	134
# 0 	1		2	3	4	5		6	7	8	9	10	11	12	13	14	15	16	17	18
  0		0	0	0	0	0.1	0.15	0.2	0.3	0.5	0.7	0.9	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1
## look at alternative maturity see Zudaire 2013 Figure 2
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
 1 45 22 22 0 10 -2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1_  
 120 170 145 145 0 10 -4 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1_
 0.05 0.5 0.455 0.455 0 0.8 -4 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1_ ## need to multiply by 4 to replicate mfcl growth
 ## K deviates , one per age class 2 to 8  # replicates Fonteaneu growth from 2012 MFCL assessmetn
-5	5	0.5		1	-1	1	-1	0	0	0	0	0	0	0	#	2
-15	5	0.75	1	-1	1	-1	0	0	0	0	0	0	0	#	3
-15	5	1		1	-1	1	-1	0	0	0	0	0	0	0	#	4
-15	5	1		1	-1	1	-1	0	0	0	0	0	0	0	#	5
-15	5	1		1	-1	1	-1	0	0	0	0	0	0	0	#	6
-15	5	1.8		1	-1	1	-1	0	0	0	0	0	0	0	#	7
-15	5	1.8		1	-1	1	-1	0	0	0	0	0	0	0	#	8
-15	5	1.2		1	-1	1	-1	0	0	0	0	0	0	0	#	9
-15	5	1.2		1	-1	1	-1	0	0	0	0	0	0	0	#	10
-15	5	1		1	-1	1	-1	0	0	0	0	0	0	0	#	11
-15	5	1		1	-1	1	-1	0	0	0	0	0	0	0	#	12
-15	5	1		1	-1	1	-1	0	0	0	0	0	0	0	#	13
 0.05 0.25 0.1 0.1 0 0.1 -3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1_    
 0.05 0.25 0.1 0.1 0 0.1 -3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1_
 -3 3 0.00002459 0.00002459  0 0.8 -3 0 0 0 0 0.5 0 0 # Wtlen1_Fem  # new values from  IOTC-2017-WPTT19-DATA13 - Equations.pdf file
 -3 4  2.96670 2.96670 0 0.8 -3 0 0 0 0 0.5 0 0 # Wtlen2_Fem # new values from  IOTC-2017-WPTT19-DATA13 - Equations.pdf file
 -3 3 1 1 -1 0.8 -3 0 0 0 0 0 0 0 # Mat50-Fem
 -3 3 -0.25 -0.25 0 0.8 -3 0 0 0 0 0 0 0 # Matslp-Fem
 -3 3 1 1 0 0.8 -3 0 0 0 0 0.5 0 0 # Eggs1_Fem
 -3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0 # Eggs2_Fem
 -3 3 0 0 1 0.05 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 ## recruitment distribution priors
 -5 5 1.5 1.5 0 0.25 3 0 2 121 280 1 0 0 # RecrDist_Area_1  ##include area recruit distrib deviates
 -5 5 -4.9 -4.9 1 0.05 -3 0 0 0 0 0 0 0 # RecrDist_Area_2  ##
 -5 5 -4.9 -4.9 1 0.5 -3 0 0 0 0 0 0 0 # RecrDist_Area_3  ##
 -5 5 0.5 0.5 0 0.25 3 0 2 121 280 1 0 0 # RecrDist_Area_4  ##include area recruit distrib deviates
 0 0 0 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_1_
 0 0 0 0 -1 0 -4 0 0 0 0 0 0 0 # CohortGrowDev
## ESTIMATION TURNED ON - sensitivie to assumed prior
## initial prior has low movement from region1 and region 4
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
# -10 12 2.5 2.5 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_1
# -10 12 2.5 2.5 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_1
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_2
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_2
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_4
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_4
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_2to_1
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_2to_1
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_2to_2
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_2to_2
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_3to_3
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_3to_3
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_3to_4
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_3to_4
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_1
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_1
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_3
# -10 12 0 0 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_3
# -10 12 2.5 2.5 0 1 3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_4
# -10 12 2.5 2.5 0 1 3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_4
## include when run with environmental parameters for movement
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_1
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_1
 -12 12 0 0 0 4 3 -7 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_2 , movement of younger fish linked to current R2R3
 -12 12 0 0 0 4 3 -1 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_2
 -12 12 0 0 0 4 3 -5 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_4 , movement of younger fish linked to current R2R5
 -12 12 0 0 0 4 3 -4 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_4
 -12 12 0 0 0 4 3 -7 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_2to_1 , movement of younger fish linked to current R2R3
 -12 12 0 0 0 4 3 -1 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_2to_1
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_2to_2
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_2to_2
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_3to_3
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_3to_3
 -12 12 0 0 0 4 3 -3 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_3to_4
 -12 12 0 0 0 4 3 -3 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_3to_4
 -12 12 0 0 0 4 3 -5 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_1 , movement of younger fish linked to current R2R5
 -12 12 0 0 0 4 3 -4 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_1
 -12 12 0 0 0 4 3 -3 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_3
 -12 12 0 0 0 4 3 -3 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_3
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_4
 -12 12 0 0 0 4 3 0  0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_4
#Cond 0  #custom_MG-env_setup (0/1)
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
## include when run with environmental parameters for movement
1
 -5 5 0 0 0 1 3  ## parameter set up for first movement environment covariate
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
 -5 5 0 0 0 1 3  
#Cond 0  #custom_MG-block_setup (0/1)
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
## include when run with environmental parameters for movement
#Cond -4 #_MGparm_Dev_Phase
7
#_Spawner-Recruitment
3 #_SR_function
#_LO HI INIT PRIOR PR_type SD PHASE
 -2 25 10 10 0 5 1 # SR_R0
 ## range of steepness values assumed
# xxx h70 0.2 1 0.7 0.7 0 0.2 -1 # SR_steep   
 0.2 1 0.8 0.8 0 0.2 -1 # SR_steep 
# xxx h90 0.2 1 0.9 0.9 0 0.2 -1 # SR_steep  
 0 2 0.6 0.6 0 0.8 -4 # SR_sigmaR
 -5 5 0 0 0 1 -3 # SR_envlink
 -5 5 0 0 0 1 -4 # SR_R1_offset
 0 0 0 0 -1 0 -99 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
#1 #_SR_env_link
## RECRUITMENT LINKED TO SOI
#1 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
101
280  ## limited data for last 4 deviates
3 #_recdev phase 
0
#1 # (0/1) to read 11 advanced options
#0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
#-4 #_recdev_early_phase
#0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#10 _lambda for prior_fore_recr occurring before endyr+1; 5 is a moderate constraint on the devs
#1 #_last_early_yr_nobias_adj_in_MPD
#1 #_first_yr_fullbias_adj_in_MPD
#151 #_last_yr_fullbias_adj_in_MPD
#152
#1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#0 #_period of cycles in recruitment (N parms read below)
#-5 #min rec_dev
#5 #max rec_dev
#0 #_read_recdevs
##_end of advanced SR options
#Fishing Mortality info 
0.1 # F ballpark for tuning early phases - results insensitive to value
220 # F ballpark year
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method  - results insensitive to value (alternative 1.2)
4 # N iterations for tuning F in hybrid method (recommend 3 to 7)
# no additional F input needed for Fmethod 1
# read overall start F value; overall phase; N detailed inputs to read for Fmethod 2
# read N iterations for tuning for Fmethod 3 (recommend 3 to 7)
#Fleet Year Seas F_value se phase (for detailed setup of F_Method=2)
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY1_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY2_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY3_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY4_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY5_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY6_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY7_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY8_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY9_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY10_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY11_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY12_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY13_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY14_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY15_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY16_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY17_
#0 1 0.05 0.05 0 99 1 # InitF_1_FISHERY18_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY19_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY20_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY21_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY22_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY23_
#0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY24_
0 1 0 0 0 99 -1 # InitF_1_FISHERY1_
0 1 0 0 0 99 -1 # InitF_1_FISHERY2_
0 1 0 0 0 99 -1 # InitF_1_FISHERY3_
0 1 0 0 0 99 -1 # InitF_1_FISHERY4_
0 1 0 0 0 99 -1 # InitF_1_FISHERY5_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY6_
0 1 0 0 0 99 -1 # InitF_1_FISHERY7_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY8_
0 1 0 0 0 99 -1 # InitF_1_FISHERY9_
0 1 0 0 0 99 -1 # InitF_1_FISHERY10_
0 1 0 0 0 99 -1 # InitF_1_FISHERY11_
0 1 0 0 0 99 -1 # InitF_1_FISHERY12_
0 1 0 0 0 99 -1 # InitF_1_FISHERY13_
0 1 0 0 0 99 -1 # InitF_1_FISHERY14_
0 1 0 0 0 99 -1 # InitF_1_FISHERY15_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY16_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY17_
0 1 0 0 0 99 -1 # InitF_1_FISHERY18_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY19_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY20_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY21_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY22_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY23_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY24_
0 1 0.00 0.00 0 99 -1 # InitF_1_FISHERY25_
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
 0 0 0 0  ## LL CPUEs have common Q - for 2 quarter
 0 0 0 -26
 0 0 0 -26
 0 0 0 -26
## relax assumption
# 0 0 0 0
# 0 0 0 0
# 0 0 0 0
# 0 0 0 0
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
 
#_age_selex_types
#_Pattern Discard Male Special
 20 0 0 0 # double normal GI 1
 20 0 0 0 # double normal HD 2
 12 0 0 0 # logistic LL 3, common for 7, 10, 11,13
 20 0 0 0 # double normal OT 4
 20 0 0 0 # double normal BB 5
 27 0 0 5 # cubic spline PS FS 6, common for 16,19,21 23, 5 nodes
 15 0 0 3 # logistic LL 7 - share with 3
 27 0 0 5 # cubic spline PS LS 8, common for 17,20,22,24,5 nodes
 20 0 0 0 # double normal TR 9, common for 15,18
 15 0 0 3 # logistic LL 10 - share with 3
 15 0 0 3 # logistic LL 11 - share with 3
 20 0 0 0 # double normal GI 12
 15 0 0 3 # logistic LL 13 - share with 3
 20 0 0 0 # double normal OT 14
 15 0 0 9 # double normal TR 15 Troll common select
 15 0 0 6 # cubic spline PS FS 16 - share with 6
 15 0 0 8 # cubic spline PS LS 17 - share with 8
 15 0 0 9 # double normal 18 Troll common select
 15 0 0 6 # cubic spline PS FS 19 - share with 6
 15 0 0 8 # cubic spline PS LS 20 - share with 8
 15 0 0 6 # cubic spline PS FS 21 - share with 6
 15 0 0 8 # cubic spline PS LS 22 - share with 8 
 15 0 0 6 # cubic spline PS FS 23 - share with 6
 15 0 0 8 # cubic spline PS LS 24 - share with 8
 12 0 0 0 # logistic LF 25
 15 0 0 3 # CPUE equivalent to LL fishery
 15 0 0 3 # CPUE equivalent to LL fishery
 15 0 0 3 # CPUE equivalent to LL fishery
 15 0 0 3 # CPUE equivalent to LL fishery
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
# double normal FISHERY 1
 1 12 7 7 0 3 3 0 0 0 0 0 1 2 						# AgeSel_1_P_1_ 1
 -20 -3 -9.70313440488 -3 0 1000 -5 0 0 0 0 0 0 0 	# AgeSel_1_P_2_ 2
 -10 9 -1 -1 0 3 4 0 0 0 0 0 1 2 					# AgeSel_1_P_3_ 3
 -5 9 3 3 0 1 4 0 0 0 0 0 0 0 						# AgeSel_1_P_4_ 4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 				# AgeSel_1_P_5_ 5
 -9 5 -2 -2 0 1 5 0 0 0 0 0 0 0 					# AgeSel_1_P_6_ 6
# double normal FISHERY 2
 1 40 10 10 0 5 3 0 0 0 0 0 2 2 					# AgeSel_2_P_1_ 1
 -20 -3 -9.70313440488 -3 0 1000 -5 0 0 0 0 0 0 0 	# AgeSel_2_P_2_ 2
 -10 9 -1 -1 0 3 4 0 0 0 0 0 2 2 					# AgeSel_2_P_3_ 3
 -5 9 3 3 0 1 4 0 0 0 0 0 0 0 						# AgeSel_2_P_4_ 4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 				# AgeSel_2_P_5_ 5
 -9 5 -2 -2 0 1 5 0 0 0 0 0 0 0 					# AgeSel_2_P_6_ 6
## logistic LL FISHERY 3,7,10,11,13
 8 18 14 14 0 2 3 0 0 0 0 0 0 0 					# AgeSel_3_P_1_ 1
 2 6 4 4 0 1 3 0 0 0 0 0 0 0 						# AgeSel_3_P_2_ 2
# double normal FISHERY 4
  1 40 5 5 0 3 3 0 0 0 0 0 0 0						# AgeSel_4_P_1_ 1
 -20 -3 -9.70313440488 -3 0 1000 -5 0 0 0 0 0 0 0 	# AgeSel_4_P_2_ 2
 -10 9 -3 -3 0 1 4 0 0 0 0 0 0 0 					# AgeSel_4_P_3_ 3
 -5 9 5 5 0 1 4 0 0 0 0 0 0 0 						# AgeSel_4_P_4_ 4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0				# AgeSel_4_P_5_ 5
 -9 9 -1 -3 0 1 5 0 0 0 0 0 0 0 					# AgeSel_4_P_6_ 6
# double normal FISHERY 5
 1 10 3 3 0 1 3 0 0 0 0 0 0 0 						# AgeSel_5_P_1_ 1
 -20 -3 -9.70313440488 -3 0 1000 -5 0 0 0 0 0 0 0 	# AgeSel_5_P_2_ 2
 -7 5 -2 -2 0 1 4 0 0 0 0 0 0 0 					# AgeSel_5_P_3_ 3
 -5 9 3 3 0 1 4 0 0 0 0 0 0 0 						# AgeSel_5_P_4_ 4
 -10 9 -6 -6 0 1 -5 0 0 0 0 0 0 0					# AgeSel_5_P_5_ 5
 -9 9 -3 -3 0 1 5 0 0 0 0 0 0 0 					# AgeSel_5_P_6_ 6
# cubic spline PS SCH FISHERY 6
  0 2 0 0 -1 0 -99 0 0 0 0 0 0 0					# 
 -1 2 1.5 1.5 0 0.5 -3 0 0 0 0 0 0 0 				# AgeSel_6_P_1_ 1
 -1 1 -0.1 -0.1 0 0.1 3 0 0 0 0 0 0 0 				# AgeSel_6_P_1_ 1
 1 14  2  2 -1 0 -99 0 0 0 0 0 0 0     				# five nodes
 1 24  4  4 -1 0 -99 0 0 0 0 0 0 0
 4 24  7  7 -1 0 -99 0 0 0 0 0 0 0
 4 24 16 16 -1 0 -99 0 0 0 0 0 0 0
 4 27 20 20 -1 0 -99 0 0 0 0 0 0 0
 -10 10 -5 -5 0 2 2 0 0 0 0 0 0 0   				## selectivity, one held constant
 -10 10 -2.5 -2.5 0 0.5 2 0 0 0 0 0 0 0
 -10 10 -3 -3 0 0.5 2 0 0 0 0 0 0 0
 -10 10  0 0  -1 0 -99 0 0 0 0 0 0 0  				## peak select - hold constant
 -10 10 -0.5 -0.5 0 1 3 0 0 0 0 0 0 0
# double normal PS SCH FISHERY 6
# 6 20 12 12 0 1 3 0 0 0 0 0 0 0 					# AgeSel_6_P_1_ 1
# -10 2 -1 -1 0 1 5 0 0 0 0 0 0 0 					# AgeSel_6_P_2_ 2
# -10 9 1 1 0 1 -4 0 0 0 0 0 0 0 					# AgeSel_6_P_3_ 3
# -5 9 3 3 0 1 4 0 0 0 0 0 0 0					    # AgeSel_6_P_4_ 4
# -10 9 -6 -6 0 1 -5 0 0 0 0 0 0 0 					# AgeSel_6_P_5_ 5
# -9 9 -1 -1 0 1 5 0 0 0 0 0 0 0 					# AgeSel_6_P_6_ 6
# cubic spline PS LS FISHERY 8
  0 2 0 0 -1 0 -99 0 0 0 0 0 0 0 					# 
 -1 3 2 2 -1 0 -3 0 0 0 0 0 0 0 					# AgeSel_8_P_1_ 1
 -1 1 -0.5 -0.5 0 0.2 3 0 0 0 0 0 0 0 				# AgeSel_8_P_1_ 1
 1 14  2  2 -1 0 -99 0 0 0 0 0 0 0    				# five nodes
 1 24  4  4 -1 0 -99 0 0 0 0 0 0 0
 4 24  9  9 -1 0 -99 0 0 0 0 0 0 0
 4 24 11 11 -1 0 -99 0 0 0 0 0 0 0
 4 27 13 13 -1 0 -99 0 0 0 0 0 0 0
 -10 10 -3 -3 0 0.5 2 0 0 0 0 0 0 0   				## selectivity, one held constant
 -10 10 0 0 0 2 -2 0 0 0 0 0 0 0    				## peak select - hold constant
 -10 10 -1 -1 0 2 2 0 0 0 0 0 0 0
 -10 10 0 0 0 1 3 0 0 0 0 0 0 0  					##
 -10 10 -0.5 -0.5 0 2 4 0 0 0 0 0 0 0
# double normal PS LS FISHERY 8
# 1 4 2 2 0 1 3 0 0 0 0 0 0 0 						# AgeSel_8_P_1_ 1
# -10 -1 -3 -3 0 1000 -5 0 0 0 0 0 0 0				# AgeSel_8_P_2_ 2
# -10 9 -3 -3 0 1 -4 0 0 0 0 0 0 0 					# AgeSel_8_P_3_ 3
# -5 9 2 2 0 1 4 0 0 0 0 0 0 0 						# AgeSel_8_P_4_ 4
# -10 9 -6 -6 0 1 -5 0 0 0 0 0 0 0 					# AgeSel_8_P_5_ 5
# -9 9 -7 -7 0 1 5 0 0 0 0 0 0 0 					# AgeSel_8_P_6_ 6
# double normal FISHERY 9,15,18
 1 10 2.5 2.5 0 1 3 0 0 0 0 0 0 0 					# AgeSel_9_P_1_ 1
 -20 -3 -9.70313440488 -3 0 1000 -5 0 0 0 0 0 0 0 	# AgeSel_9_P_2_ 2
 -7 3 -2 -2 0 1 4 0 0 0 0 0 0 0 					# AgeSel_9_P_3_ 3
 -5 9 4 4 0 1 4 0 0 0 0 0 0 0 						# AgeSel_9_P_4_ 4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 				# AgeSel_9_P_5_ 5
 -9 7 1 1 0 2 5 0 0 0 0 0 0 0 						# AgeSel_9_P_6_ 6
# double normal FISHERY 12
 1 10 5.5 5.5 0 2 3 0 0 0 0 0 0 0 					# AgeSel_12_P_1_ 1
 -20 -3 -9.70313440488 -3 0 1000 -5 0 0 0 0 0 0 0 	# AgeSel_12_P_2_ 2
 -10 5 2 2 0 2 4 0 0 0 0 0 0 0 						# AgeSel_12_P_3_ 3
 -5 9 1 1 0 2 4 0 0 0 0 0 0 0 						# AgeSel_12_P_4_ 4
 -10 9 -6 -6 0 1 -5 0 0 0 0 0 0 0 					# AgeSel_12_P_5_ 5
 -9 9 -2 -2 0 1 5 0 0 0 0 0 0 0 					# AgeSel_12_P_6_ 6
# double normal FISHERY 14
 1 10 2 2 0 1 3 0 0 0 0 0 0 0 						# AgeSel_14_P_1_ 1
 -20 -3 -9.70313440488 -3 0 1000 -5 0 0 0 0 0 0 0 	# AgeSel_14_P_2_ 2
 -15 2 -6 -6 0 2 4 0 0 0 0 0 0 0 					# AgeSel_14_P_3_ 3
 0 12 7 7 0 1 4 0 0 0 0 0 0 0 						# AgeSel_14_P_4_ 4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 				# AgeSel_14_P_5_ 5
 -9 9 0 0 0 1 5 0 0 0 0 0 0 0 						# AgeSel_14_P_6_ 6
# cubic spline PS SCH FISHERY 16 
#  0 2 0 0 -1 0 -99 0 0 0 0 0 0 0 					# 
# -1 2 1 1 0 0.5 3 0 0 0 0 0 0 0 					# AgeSel_16_P_1_ 1
# -1 1 0 0 0 0.2 3 0 0 0 0 0 0 0 					# AgeSel_16_P_1_ 1
# 1 14  2  2 -1 0 -99 0 0 0 0 0 0 0    				# five nodes
# 1 24  4  4 -1 0 -99 0 0 0 0 0 0 0
# 4 24  7  7 -1 0 -99 0 0 0 0 0 0 0
# 4 24 16 16 -1 0 -99 0 0 0 0 0 0 0
# 4 27 20 20 -1 0 -99 0 0 0 0 0 0 0
# -10 10 -3 -3 0 0.5 2 0 0 0 0 0 0 0   				## selectivity, one held constant
# -10 10 -1.5 -1.5 0 2 2 0 0 0 0 0 0 0
# -10 10 -3 -3 0 2 2 0 0 0 0 0 0 0
# -10 10  0 0  -1 0 -99 0 0 0 0 0 0 0  				## peak select - hold constant
# -10 10 -1 -1 0 0.5 3 0 0 0 0 0 0 0
# double normal PS SCH FISHERY 16
# 6 20 12 12 0 1 3 0 0 0 0 0 0 0 					# AgeSel_16_P_1_ 1
# -10 2 -1 -1 0 1 5 0 0 0 0 0 0 0 					# AgeSel_16_P_2_ 2
# -10 9 1 1 0 1 -4 0 0 0 0 0 0 0 					# AgeSel_16_P_3_ 3
# -5 9 3 3 0 1 4 0 0 0 0 0 0 0 						# AgeSel_16_P_4_ 4
# -10 9 -6 -6 0 1 -5 0 0 0 0 0 0 0 					# AgeSel_16_P_5_ 5
# -9 9 -1 -1 0 1 5 0 0 0 0 0 0 0 					# AgeSel_16_P_6_ 6
# logistic FISHERY 25
 5 20 14 14 0 1 3 0 0 0 0 0 0 0 					# AgeSel_25_P_1_ 1
 2 10 4 4 0 1 3 0 0 0 0 0 0 0 						# AgeSel_25_P_2_ 2
 
#Cond 0 #_custom_sel-env_setup (0/1) 
#Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
1
1 12 7 7 0 3 3   									## AgeSel_1_P_1_213
1 12 7 7 0 3 3   									## AgeSel_1_P_1_261
-10 9 -1 -1 0 3 4  								 	## AgeSel_1_P_3_213
-10 9 -1 -1 0 3 4   								## AgeSel_1_P_3_261
 1 40 10 10 0 5 3  									## AgeSel_3_P_1_225
-10 9 -1 -1 0 3 4 									## AgeSel_3_P_3_225
# -2 2 0 0 -1 99 -2 #_placeholder when no block usage
# -2 2 0 0 -1 99 -2 #_placeholder when no selex devs
# -4 # placeholder for selparm_Dev_Phase
1 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds)
# Tag loss and Tag reporting parameters go next
#0  # TG_custom:  0=no read; 1=read if tags exist
1
#Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#tag loss parameter - for each tag grp; 148 groups
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
## account for tag shedding equates to 20% over 2000 days as per Gaertner & Hallier 
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
-15	10	-3.5	-3.5	1	0.001	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1_
# Overdispersion  for the negative binomial for each tag group
# OD parameter determined following Francis&McKenzie
# see E:\iotc\WPTT17\yellowfin\SSmodel\R Francis reweighting tag data.txt
## OD parameter 7.0
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
# starting values equivalent to MFCL output
##PS fisheries fixed at RR of 0.81
-10	10	-2.819113784	-2.819113784	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_1_
-10	10	-6.050987185	-6.050987185	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_2_
-10	10	-1.550597412	-1.550597412	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_3_
-10	10	4.59511985		4.59511985	0	2	6	0	0	0	0	0	0	0		#	TG_report_fleet:_4_
-10	10	-2.811610155	-2.811610155	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_5_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_6_
-10	10	-2.349569462	-2.349569462	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_7_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_8_
-10	10	0.064021859	0.064021859	0	2	6	0	0	0	0	0	0	0			#	TG_report_fleet:_9_
-10	10	-1.892145802	-1.892145802	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_10_
-10	10	-0.605878238	-0.605878238	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_11_
-10	10	-5.433219945	-5.433219945	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_12_
-10	10	-1.277359678	-1.277359678	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_13_
-10	10	1.536806468	1.536806468	0	2	6	0	0	0	0	0	0	0			#	TG_report_fleet:_14_
-10	10	-1.927748469	-1.927748469	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_15_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_16_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_17_
-10	10	-2.318528743	-2.318528743	0	2	6	0	0	0	0	0	0	0	#	TG_report_fleet:_18_
-10	10	1.430633479	1.430633479	0	2	6	0	0	0	0	0	0	0			#	TG_report_fleet:_19_
-10	10	1.430633479	1.430633479	0	2	6	0	0	0	0	0	0	0			#	TG_report_fleet:20_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_21_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_22_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_23_
-20	20	10	10	0	2	-6	0	0	0	0	0	0	0							#	TG_report_fleet:_24_
-10	10	1.430633479	1.430633479	0	2	6	0	0	0	0	0	0	0			#	TG_report_fleet:_25_
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
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1_
 
1 #_Variance_adjustments_to_input_values
#_1 2 3 - one column per fishery/survey
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_survey_CV
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_lencomp_N
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_agecomp_N
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_size-at-age_N
1 #_maxlambdaphase
1 #_sd_offset
0 #3 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=WtFreq; 7=sizeage; 8=catch; 
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin
#like_comp fleet/survey  phase  value  wtfreq_method
# 1 2 2 1 1
# 4 2 2 1 1
# 4 2 3 1 1
0
#1 # (0/1) read specs for more stddev reporting
# 1 1 -1 5 1 5 1 -1 5 # selex type, len/age, year, N selex bins, Growth pattern, N growth ages, area For N-at-age, Year, N bins
# -5 16 27 38 46 # vector with selex std bin picks (-1 in first bin to self-generate)
# -1 2 14 26 40 # vector with growth std bin picks (-1 in first bin to self-generate)
# -1 2 14 26 40 # vector with N-at-age std bin picks (-1 in first bin to self-generate)
999
