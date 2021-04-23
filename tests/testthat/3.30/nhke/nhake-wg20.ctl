#C growth parameters are estimated
#_SS-V3.04-safe;_09/09/09;_Stock_Synthesis_by_Richard_Methot_(NOAA);_using_ADMB_7.0.1
1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
3  #  N recruitment designs goes here if N_GP*nseas*area>1
0  #  placeholder for recruitment interaction request
1 1 1  # example recruitment design element for GP=1, seas=1, area=1
1 2 1
1 3 1

2 #_Nblock_Patterns
2 1 #_blocks_per_pattern
1978 1997 1998 2009 # begin and end years of blocks in first pattern
1978 1997

0.5 #_fracfemale
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=not implemented; 4=not implemented
0.75 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_placeholder for empirical age-maturity by growth pattern
0 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)

#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn

0.01 0.5 0.4 0.4 0 0.1 -3 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1

2 25 15.8392 15.8392 -1 3 -5 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
90 180 130 130 -1 10 -6 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
0.06 0.3 0.177319 0.177319 -1 0.05 -5 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1

0.005 0.5 0.2 0.2 -1 0.8 -6 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
0.005 0.5 0.1 0.1 -1 0.8 -6 0 0 0 0 0 0 0 # CV_old_Fem_GP_1

-1 1 5.13e-006 5.13e-006 -1 0.05 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
2 4 3.074 3.074 -1 0.05 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem

30 55 42.85 42.85 -1 5 -3 0 0 0 0 0 0 0 # Mat50%_Fem
-1 1 -0.20 -0.20 -1 0.5 -3 0 0 0 0 0 0 0 # Mat_slope_Fem

-3 3 1 1 -1 0.8 -3 0 0 0 0 0 0 0 # Eg/gm_inter_Fem
-3 3 0 0 -1 0.8 -3 0 0 0 0 0 0 0 # Eg/gm_slope_wt_Fem

0 0 0 0 -1 0 -3 0 0 0 0 0 0 0 # RecrDist_GP_1
0 0 0 0 -1 0 -3 0 0 0 0 0 0 0 # RecrDist_Area_1

-8 8 0 0 -1 0 -2 0 0 0 0 0 0 0 # RecrDist_Seas_1
-12 12 0 0 -1 0 2 0 2 1978 2018 0.5 0 0 # RecrDist_Seas_2 # 201X one year less than the data year
-12 12 -0.56 -0.56 -1 0 2 0 0 0 0 0 0 0 # RecrDist_Seas_3
-12 12 -10 -10 -1 0 -2 0 0 0 0 0 0 0 # RecrDist_Seas_4

0 2 1 1 -1 0 -3 0 0 0 0 0 0 0 # CohortGrowDev

#
#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
#
#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_Cond No MG parm trends
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
6 #_MGparm_Dev_Phase

#_Spawner-Recruitment
3 #_SR_function
#_LO HI INIT PRIOR PR_type SD PHASE
11.5 16.2 13.9 12.9 -1 1 1 # SR_R0
0.2 0.999 0.999 0.999 -1 0.2 -1 # SR_steep
0.1 2 0.4 0.4 -1 0.2 -1 # SR_sigmaR

-5 5 0 0 -1 1 -3 # SR_envlink
-5 5 -0.7 -0.7 -1 2 2 # SR_R1_offset
0 0 0 0 -1 0 -99 # SR_autocorr

0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness

1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1970 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year 2019; data year
2 #_recdev phase

1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for prior_fore_recr occurring before endyr+1
990 #_last_early_yr_nobias_adj_in_MPD
1975 #_first_yr_fullbias_adj_in_MPD
2022 #_last_yr_fullbias_adj_in_MPD  3 years more than data year
2023 #_first_recent_yr_nobias_adj_in_MPD 4 years more that data year
1 #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
0 #_period of cycles in recruitment (N parms read below)
-5 #min rec_dev
5 #max rec_dev
0 # 3 #_read_recdevs
# 2009 -0.04979586
# 2010 -0.04979586
# 2011 -0.04979586
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#DisplayOnly -0.0250216 # Main_RecrDev_1971

#
#Fishing Mortality info
0.3 # F ballpark for tuning early phases
-2001 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
0.3 4 0
# if Fmethod=3; read N iterations for tuning for Fmethod 3
# 5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
0.0001 2 0.1 0.3 -1 0.5 1 # InitF_TRAWL1
0.0001 2 0.1 0.3 -1 0.5 1 # InitF_TRAWL2
0.0001 2 0.1 0.3 -1 0.5 1 # InitF_TRAWL3
0.0001 2 0.1 0.3 -1 0.5 1 # InitF_TRAWL4
0.0001 2 0.1 0.3 -1 0.5 1 # InitF_GILLNET
0.0001 2 0.1 0.3 -1 0.5 1 # InitF_LONGLINE
0.0001 2 0.1 0.3 -1 0.5 1 # InitF_OTHERS
#
#_Q_setup
 # A=do power, B=env-var, C=extra SD, D=devtype(<0=mirror, 0/1=none, 2=cons, 3=rand, 4=randwalk); 
 #_A  B  C  D  
0 0 0 0 # FISHERY1
0 0 0 0 # FISHERY2
0 0 0 0 # FISHERY3
0 0 0 0 # FISHERY4
0 0 0 0 # FISHERY5
0 0 0 0 # FISHERY6
0 0 0 0 # FISHERY7
0 0 0 1 # SURVEY EVHOE				### Set to 1 following Rick's suggestion
0 0 0 1 # SURVEY RESSGASCQ1
0 0 0 1 # SURVEY RESSGASCQ2
0 0 0 1 # SURVEY RESSGASCQ3
0 0 0 1 # SURVEY RESSGASCQ4
0 0 0 1 # SURVEY PORCUPINE
0 0 0 1 # SURVEY IGFS

#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any)
# LO HI INIT PRIOR PR_type SD PHASE
# 0 0.5 0.01 0.05 1 0 -4 # Q_extraSD_2_SURVEY1
#-15 -5 -10 -10 -1 1 1 # Q_base_2_SURVEY EVHOE
#-10 0 -5 -5 -1 1 1 # Q_base_2_SURVEY RESSAGASCQ1
#-10 0 -5 -5 -1 1 1 # Q_base_2_SURVEY RESSAGASCQ2
#-10 0 -5 -5 -1 1 1 # Q_base_2_SURVEY RESSAGASCQ3
#-10 0 -5 -5 -1 1 1 # Q_base_2_SURVEY RESSAGASCQ4
#-15 -5 -10 -10 -1 1 1 # Q_base_2_SURVEY PORCUPINE
#-15 -5 -10 -10 -1 1 1 # Q_base_2_SURVEY IGFS
#
#_size_selex_types
24 1 0 0 # FISHERY1
1 1 0 0 # FISHERY2
24 1 0 0 # FISHERY3
24 1 0 0 # FISHERY4
24 1 0 0 # FISHERY5
24 0 0 0 # FISHERY6
1 1 0 0 # FISHERY7
24 0 0 0 # FLEET 8: SURVEY EVHOE
24 0 0 0 # FLEET 9: SURVEY RESSGASCQ1
5  0 0 9 # FLEET 10: SURVEY RESSGASCQ2 (mirror selectivity of RESSGASCQ1)
5  0 0 9 # FLEET 11: SURVEY RESSGASCQ3 (mirror selectivity of RESSGASCQ1)
5  0 0 9 # FLEET 12: SURVEY RESSGASCQ4 (mirror selectivity of RESSGASCQ1)
24 0 0 0 # FLEET 13: SURVEY PORCUPINE
24 0 0 0 # FLEET 14: SURVEY IGFS
#
#_age_selex_types
11 0 0 0 # FISHERY1
15 0 0 1 # FISHERY2 (mirror selectivity of Fishery 1)
15 0 0 1 # FISHERY3 (mirror selectivity of Fishery 1)
15 0 0 1 # FISHERY4 (mirror selectivity of Fishery 1)
15 0 0 1 # FISHERY5 (mirror selectivity of Fishery 1)
15 0 0 1 # FISHERY6 (mirror selectivity of Fishery 1)
15 0 0 1 # FISHERY7 (mirror selectivity of Fishery 1)
15 0 0 1 # FLEET 8: SURVEY EVHOE (mirror selectivity of Fishery 1)
15 0 0 1 # FLEET 9: SURVEY RESSGASCQ1 (mirror selectivity of Fishery 1)
15 0 0 1 # FLEET 10: SURVEY RESSGASCQ2 (mirror selectivity of Fishery 1)
15 0 0 1 # FLEET 11: SURVEY RESSGASCQ3 (mirror selectivity of Fishery 1)
15 0 0 1 # FLEET 12: SURVEY RESSGASCQ4 (mirror selectivity of Fishery 1)
15 0 0 1 # FLEET 13: SURVEY PORCUPINE (mirror selectivity of Fishery 1)
15 0 0 1 # FLEET 14: SURVEY IGFS (mirror selectivity of Fishery 1)

#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
5 60 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_FISHERY1 SPTRAWL7  # Max set to 60 (before 30) as was hitting the upper bound
-6 2 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_FISHERY1
-6 14 4 4 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_FISHERY1
1 40 10 10 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_FISHERY1
-15 15 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_5_FISHERY1
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_FISHERY1

10 60 27 27 -1 0.01 4 0 0 0 0 0 1 2 # Retention_1998onwards_L50_FISHERY1  # Min set to 10 (before 20) 
0.61 10.01 0.81 0.81 -1 0.01 4 0 0 0 0 0 1 2 # Retention_1998onwards_Slope_FISHERY1
1 1 1 1 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Asymptote_FISHERY1
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Male_Offset_FISHERY1

5 60 35 35 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_L50_FISHERY2  TRAWLOTH
1 30 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_width_FISHERY2

1 40 27 27 -1 0.01 4 0 0 0 0 0 0 0 # Retention_L50_FISHERY2   # Min set to 10 (before 20)
0.61 30.01 0.81 0.81 -1 0.01 4 0 0 0 0 0 0 0 # Retention_Slope_FISHERY2
1 1 1 1 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Asymptote_FISHERY2
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Male_Offset_FISHERY2

5 30 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_FISHERY3  FRNEP8
-16 2 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_FISHERY3
-15 14 4 4 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_FISHERY3
1 40 10 10 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_FISHERY3
-1000 -5 -999 -4 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_5_FISHERY3
-15 5 -5 -5 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_FISHERY3

10 40 27 27 -1 0.01 4 0 0 0 0 0 0 0 # Retention_L50_FISHERY3   # Min set to 10 (before 20)
0.61 10.01 0.81 0.81 -1 0.01 4 0 0 0 0 0 0 0 # Retention_Slope_FISHERY3
1 1 1 1 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Asymptote_FISHERY3
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Male_Offset_FISHERY3

5 30 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_FISHERY4  SPTRAWL8
-6 2 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_FISHERY4
-6 14 4 4 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_FISHERY4
1 40 10 10 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_FISHERY4
-15 15 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_5_FISHERY4
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_FISHERY4

10 40 27 27 -1 0.01 4 0 0 0 0 0 2 2 # Retention_1998onwards_L50_FISHERY4 # Min set to 10 (before 20)
0.61 10.01 0.81 0.81 -1 0.01 4 0 0 0 0 0 2 2 # Retention_1998onwards_Slope_FISHERY4
1 1 1 1 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Asymptote_FISHERY4
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Male_Offset_FISHERY4

25 95 45 45 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_FISHERY5 GILLNET
-15 0 -3 -3 -1 0.01 -2 0 0 0 0 0 0 0 # SizeSel_1P_2_FISHERY5
0 10 5.5 5.5 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_FISHERY5
0 20 7 7 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_FISHERY5
-1000 -5 -999 -4 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_5_FISHERY5
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_FISHERY5

10 40 27 27 -1 0.01 4 0 0 0 0 0 0 0 # Retention_L50_FISHERY5   # Min set to 10 (before 20)
0.61 10.01 0.81 0.81 -1 0.01 4 0 0 0 0 0 0 0 # Retention_Slope_FISHERY5
0.90 1 0.98 0.98 -1 0.01 3 0 0 0 0 0 0 0 # Retention_Asymptote_FISHERY5
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Male_Offset_FISHERY5

25 75 45 45 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_FISHERY6  LONGLINE
-15 0 -5 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_FISHERY6
0 10 5.5 5.5 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_FISHERY6
0 20 7 7 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_FISHERY6
-1000 -5 -999 -4 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_5_FISHERY6
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_FISHERY6

5 60 35 35 -1 0.01 2 0 3 2003 2019 5 0 0  # SizeSel_L50_FISHERY7   OTHERS
1 30 15 15 -1 0.01 2 0 3 2003 2019 1 0 0  # SizeSel_width_FISHERY7

10 60 27 27 -1 0.01 4 0 3 2003 2019 5 0 0 # Retention_2009onwards_L50_FISHERY7 # Min set to 10 (before 20)
0.61 10.01 0.81 0.81 -1 0.01 4 0 3 2003 2019 5 0 0 # Retention_2009onwards_Slope_FISHERY7
1 1 1 1 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Asymptote_FISHERY7
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # Retention_Male_Offset_FISHERY7

4 30 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_SURVEY EVHOE
-16 2 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_SURVEY EVHOE
0 10 4 4 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_SURVEY EVHOE
1 40 10 10 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_SURVEY EVHOE
-1000 -5 -999 -4 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_5_SURVEY EVHOE
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_SURVEY EVHOE

4 30 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_SURVEY RESSGASCQ1
-16 2 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_SURVEY RESSGASCQ1
0 10 4 4 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_SURVEY RESSGASCQ1
1 40 10 10 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_SURVEY RESSGASCQ1
-1000 -5 -999 -4 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_5_SURVEY RESSGASCQ1
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_SURVEY RESSGASCQ1


0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_1_SURVEY RESSGASCQ2
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_2_SURVEY RESSGASCQ2

0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_1_SURVEY RESSGASCQ3
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_2_SURVEY RESSGASCQ3

0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_1_SURVEY RESSGASCQ4
0 0 0 0 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_2_SURVEY RESSGASCQ4

4 80 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_SURVEY PORCUPINE
-16 2 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_SURVEY PORCUPINE
0 10 4 4 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_SURVEY PORCUPINE
0 40 10 10 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_SURVEY PORCUPINE
-1000 -5 -999 -4 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_5_SURVEY PORCUPINE
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_PORCUPINE

4 30 15 15 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_1_SURVEY IGFS
-16 2 -2 -2 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_2_SURVEY IGFS
0 10 4 4 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_3_SURVEY IGFS
5 40 10 10 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_4_SURVEY IGFS
-1000 -5 -999 -4 -1 0.01 -3 0 0 0 0 0 0 0 # SizeSel_1P_5_SURVEY IGFS
-9 9 0 0 -1 0.01 2 0 0 0 0 0 0 0 # SizeSel_1P_6_SURVEY IGFS

0.1 0.1 0.1 0.1 -1 99 -3 0 0 0 0 0 0 0 # AgeSel_1P_1_FISHERY1
20 20 20 20 -1 99 -3 0 0 0 0 0 0 0 # AgeSel_1P_2_FISHERY1

#_Cond 0 #_custom_sel-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
1 #_custom_sel-blk_setup (0/1)


0 20 5 5 -1 0.01 4 # Retention_before1998_L50_FISHERY1	#Set to 2 as was hitting bound and ret is 1 on all  length classes
10 40 27 27 -1 0.01 4 # Retention_1998-2009_L50_FISHERY1	# Min set to 10 (before 20)

0.00001 10.01 1.2 1.2 -1 0.01 4 # Retention_before1998_Slope_FISHERY1	
0.61 10.01 0.81 0.81 -1 0.01 4 # Retention_1998-2009_Slope_FISHERY1	

1.5 20 5 5 -1 0.01 4 # Retention_before1998_L50_FISHERY4	#Set to 2 as was hitting bound and ret is 1 on all  length classes
0.00001 10.01 1.2 1.2 -1 0.01 4 # Retention_before1998_Slope_FISHERY4	#Set close to 0 as was hitting bound and ret is 1 on all  length classes



#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no block usage
#_Cond No selex parm trends
3 # selparm_Dev_Phase

1 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)

# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 3
0	0	0	0	0	0	0	0.1	0.2	0.2	0.2	0.2	0.3	0.2	#_add_to_survey_CV	
0	0	0	0	0	0	0	0	0	0	0	0	0	0	#_add_to_discard_stddev	
0	0	0	0	0	0	0	0	0	0	0	0	0	0	#_add_to_bodywt_CV	
0.5	0.5	0.5	0.5	0.5	1	0.5	1	0.525	0.525	0.525	0.525	0.35	0.525	#_mult_by_lencomp_N	
1	1	1	1	1	1	1	1	1	1	1	1	1	1	#_mult_by_agecomp_N	
1	1	1	1	1	1	1	1	1	1	1	1	1	1	#_mult_by_size-at-age_N	

#
1 #_maxlambdaphase
1 #_sd_offset
#
0 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch;
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin
#like_comp fleet/survey  phase  value  sizefreq_method
#9 1 1 .01 1
# 1 2 2 1 1
# 4 2 2 1 1
# 4 2 3 1 1
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  1 1 1 1 #_CPUE/survey:_2
#  1 1 1 1 #_CPUE/survey:_3
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  0 0 0 0 #_lencomp:_3
#  1 1 1 1 #_agecomp:_1
#  1 1 1 1 #_agecomp:_2
#  0 0 0 0 #_agecomp:_3
#  1 1 1 1 #_size-age:_1
#  1 1 1 1 #_size-age:_2
#  0 0 0 0 #_size-age:_3
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
0 # (0/1) read specs for more stddev reporting
# 1 1 -1 5 1 5 1 -1 5 # selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
# 5 15 25 35 43 # vector with selex std bin picks (-1 in first bin to self-generate)
# 1 2 14 26 40 # vector with growth std bin picks (-1 in first bin to self-generate)
# 1 2 14 26 40 # vector with NatAge std bin picks (-1 in first bin to self-generate)
999

