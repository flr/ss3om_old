# BET-EPO model. Developed by A. Aires-da-Silva, Carolina Minte-Vera and M. Maunder, SAC8-2017, developed April 2017
#_data_and_control_files: BET-EPO.dat, BET-EPO.ctl
# SS-V3.23b-safe;_12/06/2011;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB
# includes new surveys for LLt training vessels 07 March 2016 C.V. Minte-Vera
# SAC9: change Bias Correction years and last year of main recr_devs
# FisheryNum	FisheryAlpha	Gear	SetType	Years
# 1-F1	F1-OBJ_early	PS	OBJ	1975-1992
# 2-F2	F2-OBJ_S	PS	OBJ	1993-present
# 3-F3	F3-OBJ_C	PS	OBJ	1993-present
# 4-F4	F4-OBJ_I	PS	OBJ	1993-present
# 5-F5	F5-OBJ_N	PS	OBJ	1993-present
# 6-F6	F6-NOA-DEL_early	PS-LP	NOA-DEL	1975-1989
# 7-F7	F7-NOA-DEL_late	PS-LP	NOA-DEL	1990-present
# 8-F8	F8-OBJ_S_disc	PS	OBJ	1993-present
# 9-F9	F9-OBJ_C_disc	PS	OBJ	1993-present
# 10-F10	F10-OBJ_I_disc	PS	OBJ	1993-present
# 11-F11	F11-OBJ_N_disc	PS	OBJ	1993-present
# 12-F12	F12-LL_N_num	LL	LL	1975-present
# 13-F13	F13-LL_C_num	LL	LL	1975-present
# 14-F14	F14-LL_S_num	LL	LL	1975-present
# 15-F15	F15-LL_I_num	LL	LL	1975-present
# 16-F16	F16-LL_N_w	LL	LL	1990-present
# 17-F17	F17-LL_C_w	LL	LL	1990-present
# 18-F18	F18-LL_S_w	LL	LL	1990-present
# 19-F19	F19-LL_I_w	LL	LL	1990-present
# 20-F20	S1-LLt_N_len	LL	LL	1975-present
# 21-F21	S2-LLt_C_len	LL	LL	1975-present
# 22-F22	S3-LLt_S_len	LL	LL	1975-present
# 23-F23	S4-LLt_I_len	LL	LL	1975-present
# 24-F24	S5-LLc_N_w	LL	LL	1975-1994
# 25-F25	S6-LLc_C_w	LL	LL	1975-1994
# 26-F26	S7-LLc_S_w	LL	LL	1975-1994
# 27-F27	S8-LLc_I_w	LL	LL	1975-1994

1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)

#_Cond 0  #  N recruitment designs goes here if N_GP*nseas*area>1
#_Cond 0  #  placeholder for recruitment interaction request - year*area
#_Cond 1 1 1  # example recruitment design element for GP=1, seas=1, area=1

#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10

0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern
# begin and end years of blocks
# 1975 1985 1986 1990 1995 2001
# 1987 1990 1995 2001

0.5 #_fracfemale 
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#2 #_N_breakpoints
# 4 15 # age(real) at M breakpoints
# M vector
0.25	0.20005	0.1663375	0.1337125	0.1010875	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.10331	0.106621	0.109931	0.113242	0.116552	0.119863	0.123173	0.126484	0.129794	0.133104	0.136415	0.139725	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036	0.143036
0.25	0.20005	0.1663375	0.1337125	0.1010875	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1
2 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=not implemented; 4=not implemented
1 #_Growth_Age_for_L1
40 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
2 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_Age_Maturity by growth pattern (placeholder for empirical age-maturity by growth pattern)
#0.000162046	0.000167686	0.000393094	0.00087152	0.001834111	0.003676396	0.007041268	0.012924172	0.022797005	0.038741565	0.063573052	0.100909033	0.155070124	0.230527147	0.33030366	0.452659815	0.587013363	0.714341294	0.816777669	0.888065413	0.93293724	0.959719236	0.97542078	0.984659892	0.990179913	0.993547376	0.995649719	0.996993607	0.997872841	0.998461077	0.998863088	0.999143409	0.999342612	0.999486709	0.999592697	0.99967188	0.999731909	0.999778044	0.999813956	0.999842247	0.999864784
0 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)		# CHANGE FROM 3 TO 2

#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
##_Gpattern:_1_Gender:_1
# -3 3 0.2 0.2 0 0.8 -3 0 0 0 0 0 0 0 		# NatM_p_1_Fem_GP:1_
# -3 3 -2 -2 0 0.8 -3 0 0 0 0 0 0 0 		# NatM_p_2_Fem_GP:1_
# L-A-A
10 45 29.22706258 26.7812 0 10 -4 0 0 0 0 0.5 0 0				# L_at_Amin_Fem_GP_1
40 250 196.340534 192.446 0 10 -2 0 0 0 0 0.5 0 0						# L_at_Amax_Fem_GP_1 
0.05 0.25 0.108752996 0.0676951 0 0.8 -4 0 0 0 0 0.5 0 0			# VonBert_K_Fem_GP_1_
-10 10 0.234367131 0.234367131 0 0.8 -4 0 0 0 0 0.5 0 0						# RICHARDS_SHAPE_PARAM_GP_1_
.1 4 1.834113637 0.0834877 0 0.8 -3 0 0 0 0 0.5 0 0				# CV_young_Fem_GP_1_					
.1 50 8.877997739 1.815753115 0 0.8 -3 0 0 0 0 0.5 0 0			# CV_old_Fem_GP_1_										# NOW IN ABS VALUE
##_Gpattern:_1_Gender:_2
# M
#-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0			# NatM_p_1_Male_GP:1_
#-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0			# NatM_p_2_Male_GP:1_
# L-A-A 
-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0								# L_at_Amin_Male_GP_1
-3 3 0 0 0 0.8 -2 0 0 0 0 0.5 0 0 								# L_at_Amax_Male_GP_1 
-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0								# VonBert_K_Male_GP_1_
-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0								# RICHARDS_SHAPE_PARAM_GP_2_
-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0								# CV_young_Male_GP_1_
-3 3 0 1.815753115 0 0.8 -3 0 0 0 0 0.5 0 0			# CV_old_Male_GP_1_

## FEMALE BIOLOGY
# W-L
-3 3 3.661e-005 3.661e-005 0 0.8 -3 0 0 0 0 0.5 0 0 # W-L (a)
-3 3 2.90182 2.90182 0 0.8 -3 0 0 0 0 0.5 0 0 # W-L (b)
# Maturity
-10000 10000 133.7604814 55 0 0.8 -3 0 0 0 0 0.5 0 0				# Maturity (logistic - inflection: age) 
-3 3 -0.111862053 -0.25 0 0.8 -3 0 0 0 0 0.5 0 0					# Maturity (logistic - slope: age)
-3 3 1 1 0 0.8 -3 0 0 0 0 0.5 0 0							# Eggs/gm (intercept)
-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0							# Eggs/gm (slope)
## MALE BIOLOGY
# W-L
-3 3 3.661e-005 3.661e-005 0 0.8 -3 0 0 0 0 0.5 0 0 # W-L (a)
-3 3 2.90182 2.90182 0 0.8 -3 0 0 0 0 0.5 0 0 # W-L (a)

# Recruitment distribution (Growth pattern x Area x Season 'parameter lines')
-4 4 0 0 -1 99 -3 0 0 0 0 0.5 0 0 							# Recruitment distribution by Growth pattern 
-4 4 0 0 -1 99 -3 0 0 0 0 0.5 0 0 							# Recruitment distribution by Area
-4 4 4 0 -1 99 -3 0 0 0 0 0.5 0 0 							# Recruitment distribution by Season
1 1 1 1 -1 99 -3 0 0 0 0 0.5 0 0 							# Cohort growth deviation

# Movement parameters
# LO HI INIT PRIOR Pr_type SD PHASE
# switch on estimation at phase 5
# area 1 to 2 - start, end ramp
#-8 1 -6 -6 0 5 5 0 0 0 0 0 0 0
#-8 1 -4 -4 0 5 5 0 0 0 0 0 0 0

#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters

#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_Cond No MG parm trends

#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters

#_Cond -4 #_MGparm_Dev_Phase (include when estimating temporal deviates)

#_Spawner-Recruitment
3 #_SR_function: 1=B-H_flattop; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=Shepard_3Parm
#_LO HI INIT PRIOR PR_type SD PHASE
3 20 9 9.3 -1 10 1				# ln(R0)
0.2 1 1 1 -1 0.2 -4				# Steepness of S-R 
0 2 0.6 0.6 -1 0.8 -3			# Sigma-R (SD) of ln(R_devs)
-5 5 0 0 -1 1 -3					# Env_link coefficient
-5 5 0 0 -1 1 1					# Offset for initial equilibrium R1 relative to virgin recruitment
0 0 0 0 -1 99 -99        		# Auto-correlation factor
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness

1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1 # first year of main recr_devs; early devs can preceed this era
172 # <><  last year of main recr_devs; forecast devs start in following year
2 #_recdev phase

## introduced to do temporal variation in rec devs for region
1 # (0/1) to read 13 advanced options
-16 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
2 #_recdev_early_PH
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for prior_fore_recr occurring before endyr+1
-17 #_last_yr_nobias_adj_in_MPD
10 #_first_yr_fullbias_adj_in_MPD				# CHANGED from 7 to 10
161 # <>< _last_yr_fullbias_adj_in_MPD			# Do not apply BCF to last qrt
172 #_<>< first_recent_yr_nobias_adj_in_MPD
1 #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
0 #_period of cycles in recruitment (N parms read below)
-15 # min rec_dev
15 # max rec_dev
0 #_read_recdevs						
#_end of advanced SR options

#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
# all recruitment deviations
#DisplayOnly -0.275616 # RecrDev_1971_
#DisplayOnly 0.36331 # RecrDev_1972
#DisplayOnly 0 # ForeRecr_2002

#Fishing Mortality info 
0.1 # F ballpark for tuning early phases
160 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
5 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3 (recommend 3 to 7)
7  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#Fleet Year Seas F_value se phase (for detailed setup of F_Method=2)

#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
0	1	0.05	0.01	0	99	1	# F1-OBJ_early
0	1	0	0.01	0	99	-1	# F2-OBJ_S
0	1	0	0.01	0	99	-1	# F3-OBJ_C
0	1	0	0.01	0	99	-1	# F4-OBJ_I
0	1	0	0.01	0	99	-1	# F5-OBJ_N
0	1	0	0.01	0	99	-1	# F6-NOA-DEL_early
0	1	0	0.01	0	99	-1	# F7-NOA-DEL_late
0	1	0	0.01	0	99	-1	# F8-OBJ_S_disc
0	1	0	0.01	0	99	-1	# F9-OBJ_C_disc
0	1	0	0.01	0	99	-1	# F10-OBJ_I_disc
0	1	0	0.01	0	99	-1	# F11-OBJ_N_disc
0	1	0	0.01	0	99	-1	# F12-LL_N_num
0	1	0	0.01	0	99	-1	# F13-LL_C_num
0	1	0.4	0.01	0	99	1	# F14-LL_S_num
0	1	0	0.01	0	99	-1	# F15-LL_I_num
0	1	0	0.01	0	99	-1	# F16-LL_N_w
0	1	0	0.01	0	99	-1	# F17-LL_C_w
0	1	0	0.01	0	99	-1	# F18-LL_S_w
0	1	0	0.01	0	99	-1	# F19-LL_I_w

#_Q_setup
 # A=do power, B=env-var, C=extra SD, D=devtype(<0=mirror, 0/1=none, 2=cons, 3=rand, 4=randwalk)
 #_A  B  C  D
0	0	0	0	# F1-OBJ_early
0	0	0	0	# F2-OBJ_S
0	0	0	0	# F3-OBJ_C
0	0	0	0	# F4-OBJ_I
0	0	0	0	# F5-OBJ_N
0	0	0	0	# F6-NOA-DEL_early
0	0	0	0	# F7-NOA-DEL_late
0	0	0	0	# F8-OBJ_S_disc
0	0	0	0	# F9-OBJ_C_disc
0	0	0	0	# F10-OBJ_I_disc
0	0	0	0	# F11-OBJ_N_disc
0	0	0	0	# F12-LL_N_num
0	0	0	0	# F13-LL_C_num
0	0	0	0	# F14-LL_S_num
0	0	0	0	# F15-LL_I_num
0	0	0	0	# F16-LL_N_w
0	0	0	0	# F17-LL_C_w
0	0	0	0	# F18-LL_S_w
0	0	0	0	# F19-LL_I_w
0	0	0	0	# S1-LLt_N_len
0	0	0	0	# S2-LLt_C_len
0	0	0	0	# S3-LLt_S_len
0	0	0	0	# S4-LLt_I_len
0	0	0	0	# S5-LLc_N_w
0	0	0	0	# S6-LLc_C_w
0	0	0	0	# S7-LLc_S_w
0	0	0	0	# S8-LLc_I_w

#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any)
# LO HI INIT PRIOR PR_type SD PHASE

#_size_selex_types
#_Pattern Discard Male Special
# OBJ					
24	0	0	0	#	# F1-OBJ_early
24	0	0	0	#	# F2-OBJ_S
24	0	0	0	#	# F3-OBJ_C
24	0	0	0	#	# F4-OBJ_I
24	0	0	0	#	# F5-OBJ_N
24	0	0	0	#	# F6-NOA-DEL_early
24	0	0	0	#	# F7-NOA-DEL_late
0	0	0	0	#	# F8-OBJ_S_disc
0	0	0	0	#	# F9-OBJ_C_disc
0	0	0	0	#	# F10-OBJ_I_disc
0	0	0	0	#	# F11-OBJ_N_disc
# LL					
24	0	0	0	#	# F12-LL_N_num
1	0	0	0	#	# F13-LL_C_num
1	0	0	0	#	# F14-LL_S_num
24	0	0	0	#	# F15-LL_I_num
5	0	0	12	#	# F16-LL_N_w
5	0	0	13	#	# F17-LL_C_w
5	0	0	14	#	# F18-LL_S_w
5	0	0	15	#	# F19-LL_I_w
# SURVEYS					
# estimate					
24	0	0	0	#	# S1-LLt_N_len
24	0	0	0	#	# S2-LLt_C_len
24	0	0	0	#	# S3-LLt_S_len
24	0	0	0	#	# S4-LLt_I_len

# mimic					
5	0	0	12	#	# S5-LLc_N_w
5	0	0	13	#	# S6-LLc_C_w
5	0	0	14	#	# S7-LLc_S_w
5	0	0	15	#	# S8-LLc_I_w


#_age_selex_types
#_Pattern Discard Male Special
10	0	0	0	# F1-OBJ_early
10	0	0	0	# F2-OBJ_S
10	0	0	0	# F3-OBJ_C
10	0	0	0	# F4-OBJ_I
10	0	0	0	# F5-OBJ_N
10	0	0	0	# F6-NOA-DEL_early
10	0	0	0	# F7-NOA-DEL_late
11	0	0	0	# F8-OBJ_S_disc
11	0	0	0	# F9-OBJ_C_disc
11	0	0	0	# F10-OBJ_I_disc
11	0	0	0	# F11-OBJ_N_disc
10	0	0	0	# F12-LL_N_num
10	0	0	0	# F13-LL_C_num
10	0	0	0	# F14-LL_S_num
10	0	0	0	# F15-LL_I_num
10	0	0	0	# F16-LL_N_w
10	0	0	0	# F17-LL_C_w
10	0	0	0	# F18-LL_S_w
10	0	0	0	# F19-LL_I_w
10	0	0	0	# S1-LLt_N_len
10	0	0	0	# S2-LLt_C_len
10	0	0	0	# S3-LLt_S_len
10	0	0	0	# S4-LLt_I_len
10	0	0	0	# S5-LLc_N_w
10	0	0	0	# S6-LLc_C_w
10	0	0	0	# S7-LLc_S_w
10	0	0	0	# S8-LLc_I_w

# Length selectivity parameterization
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
#_size_sel: F1-OBJ_early
20 199 35         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -0.5         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 4.8           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 7.7         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -15         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin
 
#_size_sel: F2-OBJ_S
20 199 35         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -0.5         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 4.8           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 7.7         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15          0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -15         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: F3-OBJ_C
20 199 35         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -0.5         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 4.8           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 7.7         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -15         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: F4-OBJ_I		
20 199 28         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -4.5         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 3.0           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 7         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -15         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: F5-OBJ_N
20 199 35         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -0.5         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 4.8           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -15        0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: F6-NOA-DEL_early
20 199 100         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -3.1         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.3           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6.7         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: F7-NOA-DEL_late									
20 199 55         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -2.5         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.1          0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 9.0         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: F8-OBJ_S_disc
#_size_sel: F9-OBJ_C_disc
#_size_sel: F10-OBJ_I_disc
#_size_sel: F11-OBJ_N_disc

#_size_sel: F12-LL_N_num
20 199 82.8         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -3.3         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.1           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6.8         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: F13-LL_C_num
20 200 113 50 0 99 2 0 0 0 0 0.5 0 0 #
-200 200 34 50 0 99 3 0 0 0 0 0.5 0 0 #

#_size_sel: F14-LL_S_num
20 200 113 50 0 99 2 0 0 0 0 0.5 0 0 #
-200 200 34 50 0 99 3 0 0 0 0 0.5 0 0 #

#_size_sel: F15-LL_I_num
20 199 82.8         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -3.3         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.1           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6.8         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel:  F16-LL_N_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #

#_size_sel: F17-LL_C_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #

#_size_sel: F18-LL_S_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #

#_size_sel:  F19-LL_I_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #

#_size_sel: S1-LLt_N_len
20 199 82.8         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -3.3         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.1           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6.8         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: S2-LLt_C_len
20 199 82.8         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -3.3         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.1           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6.8         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel:  S3-LLt_S_len
20 199 82.8         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -3.3         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.1           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6.8         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel:  S4-LLt_I_len
20 199 82.8         50 -1 0 2 0 0 0 0 0.5 0 0 # p1 - Peak value              
-15 15 -3.3         0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic
-15 15 6.1           0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width
-15 15 6.8         0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width
-15 15 -15           0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin
-15 15 -999         0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin

#_size_sel: S5-LLc_N_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #

#_size_sel: S6-LLc_C_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #

#_size_sel: S7-LLc_S_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #

#_size_sel: S8-LLc_I_w
1 200 -1 50 0 99 -2 0 0 0 0 0.5 0 0 #
-200 200 -1 50 0 99 -3 0 0 0 0 0.5 0 0 #


# Age selectivity parameterization
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
#_age_sel: 1
#_age_sel: 2
#_age_sel: 3
#_age_sel: 4
#_age_sel: 5
#_age_sel: 6
#_age_sel: 7
#_age_sel: F8-OBJ_S_disc
1 40 1 1 0 99 -1 0 0 0 0 0.5 0 0 #	min 
1 40 3 3 0 99 -1 0 0 0 0 0.5 0 0 #	max
#_age_sel: F9-OBJ_C_disc
1 40 1 1 0 99 -1 0 0 0 0 0.5 0 0 #	min 
1 40 3 3 0 99 -1 0 0 0 0 0.5 0 0 #	max
#_age_sel: F10-OBJ_I_disc
1 40 1 1 0 99 -1 0 0 0 0 0.5 0 0 #	min 
1 40 3 3 0 99 -1 0 0 0 0 0.5 0 0 #	max
#_age_sel: F11-OBJ_N_disc
1 40 1 1 0 99 -1 0 0 0 0 0.5 0 0 #
1 40 3 3 0 99 -1 0 0 0 0 0.5 0 0 #
#_age_sel: 12
#_age_sel: 13
#_age_sel: 14
#_age_sel: 15
#_age_sel: 16
#_age_sel: 17
#_age_sel: 18
#_age_sel: 19

#_Cond 0 #_custom_sel-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
#_Cond 0 #_custom_sel-blk_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no block usage
#_Cond No selex parm trends
#_Cond -4 # placeholder for selparm_Dev_Phase
#_Cond 0 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)

# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
# Initial tag loss parameter - for each tag grp 
# set to negligible value
# -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1_

# Chronic tag loss - for each tag group
# -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1_
 
# Overdispersion  for the negative binomial for each tag group
# high value as estimated from MFCL
# 1 50 20 20 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1_
 
# Initial tag reporting rate for each fleet, tansformed as above
#-10	10	-0.2	-0.2	1	0.2	6	0	0	0	0	0	0	0	# F1	WCP1

# Exponential decay rate in reporting rate for each fleet (default=0, negative value to get decay)
#-4	0	0	0	0	2	-4	0	0	0	0	0	0	0	# F1	WCP1

1 #_Variance_adjustments_to_input_values
#_1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	#Row	1	value	added	to	survey	CV	(set	to	zero	for	no	effect)
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	#Row	2	value	added	to	discard	stddev	(set	to	zero	for	no	effect)
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	#	Row	3	value	added	to	mean	body	wt	stddev	(set	to	zero	for	no	effect)
0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05	0.05 #	Row	4	multiplier	for	lencomp	effective	N	(set	to	1	for	no	effect)		
1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	#Row	5	multiplier	for	agecomp	effective	N	(set	to	1	for	no	effect)
1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	#Row	6	multiplier	for	size-at-age	effective	N	(set	to	1	for	no	effect)

1 #_maxlambdaphase
1 #_sd_offset

44 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=WtFreq; 7=sizeage; 8=catch; 
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin
#like_comp fleet/survey  phase  value  wtfreq_method
# cpue - EPO
1 1 1 0 1
1 2 1 0 1
1 3 1 0 1
1 4 1 0 1
1 5 1 0 1
1 6 1 0 1
1 7 1 0 1
1 8 1 0 1
1 9 1 0 1
1 10 1 0 1
1 11 1 0 1
1 12 1 0 1
1 13 1 1 1
1 14 1 1 1
1 15 1 0 1
1 16 1 0 1
1 17 1 0 1
1 18 1 0 1
1 19 1 0 1

# Len comps
#4 4 1 0 1
#4 7 1 0 1

#use the LLt length data in this run
#4 24 1 0 1 #turn off LLt data N                              
#4 25 1 0 1 #turn off LLt data C                              
#4 26 1 0 1 #turn off LLt data S                              
#4 27 1 0 1 #turn off LLt data I                              

# Age comps
5 3 1 0 1

#Turn Off Weight data
6 24 1 0 1 # N
6 25 1 0 1 # C
6 26 1 0 1 # S
6 27 1 0 1 # I

# Eq catch
9	1	1	0	1
9	2	1	0	1
9	3	1	0	1
9	4	1	0	1
9	5	1	0	1
9	6	1	0	1
9	7	1	0	1
9	8	1	0	1
9	9	1	0	1
9	10	1	0	1
9	11	1	0	1
9	12	1	0	1
9	13	1	0	1
9	14	1	0	1
9	15	1	0	1
9	16	1	0	1
9	17	1	0	1
9	18	1	0	1
9	19	1	0	1

# Param_prior
11 1 1 0 1
0 # (0/1) read specs for more stddev reporting
# 1 1 -1 5 1 5 1 -1 5 # selex type, len/age, year, N selex bins, Growth pattern, N growth ages, area For N-at-age, Year, N bins
# -5 16 27 38 46 # vector with selex std bin picks (-1 in first bin to self-generate)
# -1 2 14 26 40 # vector with growth std bin picks (-1 in first bin to self-generate)
# -1 2 14 26 40 # vector with N-at-age std bin picks (-1 in first bin to self-generate)
999