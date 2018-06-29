#V3.24f
#_data_and_control_files: abt.dat // abt.ctl
#_SS-V3.24f-opt-Win64;_08/03/2012;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11
1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
4 #  number of recruitment assignments (overrides GP*area*seas parameter values) 
0 # recruitment interaction requested
#GP seas area for each recruitment assignment
 1 1 1
 1 2 1
 1 3 1
 1 4 1
#0 #  number of recruitment assignments (overrides GP*area*seas parameter values) 
#0 # recruitment interaction requested
#GP seas area for each recruitment assignment
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10

#_N_movement_definitions
# first age that moves (real age at begin of season, not integer)
# seas,GP,source_area,dest_area,minage,maxage
# transition movement at about length 75cm (approx age 8 years). corressponds to L50% sexual maturity also
## movement at the end of season 1 before start of main southern fishery

#
0 #_Nblock_Patterns

#3 #_Nblock_Patterns
# 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
# 1978 2012  ## block 1
# 2003 2012  ## block 2
# 2003 2012  ## block 3
#
0.5 #_fracfemale 
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 
0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 
#0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
1 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_Age_Maturity by growth pattern
 0 0 2.44477e-015 0.00012693 0.0885235 0.466234 0.745856 0.881045 0.94374 0.973162 0.987136 0.993821 0.99703 0.998574 0.999318
4 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
#0.1 0.8 0.3 0.3 -1 99 -1 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
10 60 45.4428 32 -1 99 -5 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
100 150 114 125 -1 99 -5 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
0.01 0.4 0.253 0.149 -1 99 -5 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
0.01 0.3 0.1 0.1 -1 99 -5 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
0.01 0.3 0.1 0.08 -1 99 -5 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
#-20 20 0 0 -1 99 -1 0 0 0 0 0 0 0 # NatM_p_1_Mal_GP_1
-20 20 0.0792747 0 -1 99 -1 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
-20 20 0.0966268 0 -1 99 -1 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
-20 20 -0.295556 0 -1 99 -1 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
-20 20 0 0 -1 99 -1 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
-20 20 0 0 -1 99 -1 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
-2 2 1.3718e-05 8.7e-005 -1 99 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
-2 4 3.0973 2.67 -1 99 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
1 10 5 5 -1 99 -3 0 0 0 0 0 0 0 # Mat50%_Fem
-5 5 -3.746 -3.746 -1 99 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
0 3 1 1 -1 99 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
0 3 0 0 -1 99 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
-20 20 1.3718e-05 0 -1 99 -1 0 0 0 0 0 0 0 # Wtlen_1_Mal
-20 20 3.0973 0 -1 99 -1 0 0 0 0 0 0 0 # Wtlen_2_Mal
-4 4 0 1 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_GP_1
 ## recruitment distribution priors
-5 5 0 0 0 0 -3 0 0 0 0 0 0 0 # RecrDist_Area_1 

## recruitment in the fourth quarter
-10 10 -9 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_1_
-10 10 -9 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_2_
-10 10 -9 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_3_
-10 10  7 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_4_
-4 4 1 1 -1 99 -3 0 0 0 0 0 0 0 # CohortGrowDev

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
#_Cond -4 #_MGparm_Dev_Phase


#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm
#_LO HI INIT PRIOR PR_type SD PHASE
5 15 10.0589 11.4 -1 99 1 # SR_LN(R0)
0.2 1 0.8 0.75 -1 99 -4 # SR_BH_steep
0 2 0.6 0.4 -1 99 -1 # SR_sigmaR
-5 5 0 0 -1 99 -1 # SR_envlink
-10 10 0 0 -1 99 -1 # SR_R1_offset
##-10 10 0 0 -1 99 5 # SR_R1_offset
0 0 0 0 -1 99 -1 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
#1970 # first year of main recr_devs; early devs can preceed this era
1975
## LOOK AT RECRUITMENT ESTIMATION PERIOD
2012 # last year of main recr_devs; forecast devs start in following year
5 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -5 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1980 #_last_early_yr_nobias_adj_in_MPD
 1980 #_first_yr_fullbias_adj_in_MPD
 2011 #_last_yr_fullbias_adj_in_MPD
 2012 #_first_recent_yr_nobias_adj_in_MPD
 # max_bias_adj_in_MPD = 0.9 used based on analysis of SE of estimated recruitment as per Apeendix A of the SS manual
 0.9 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#DisplayOnly -0.00155442 # Main_RecrDev_1950
#DisplayOnly -0.00287973 # Main_RecrDev_1951
#DisplayOnly -0.00402058 # Main_RecrDev_1952
#DisplayOnly -0.00759174 # Main_RecrDev_1953
#DisplayOnly -0.0106869 # Main_RecrDev_1954
#DisplayOnly -0.0107836 # Main_RecrDev_1955
#DisplayOnly -0.000762786 # Main_RecrDev_1956
#DisplayOnly 0.0438142 # Main_RecrDev_1957
#DisplayOnly 0.151572 # Main_RecrDev_1958
#DisplayOnly 0.380461 # Main_RecrDev_1959
#DisplayOnly 0.520572 # Main_RecrDev_1960
#DisplayOnly 0.0192603 # Main_RecrDev_1961
#DisplayOnly -0.362369 # Main_RecrDev_1962
#DisplayOnly -0.461442 # Main_RecrDev_1963
#DisplayOnly -0.378613 # Main_RecrDev_1964
#DisplayOnly -0.14551 # Main_RecrDev_1965
#DisplayOnly 0.704809 # Main_RecrDev_1966
#DisplayOnly 0.208662 # Main_RecrDev_1967
#DisplayOnly -0.0397711 # Main_RecrDev_1968
#DisplayOnly 0.127957 # Main_RecrDev_1969
#DisplayOnly 0.0850093 # Main_RecrDev_1970
#DisplayOnly -0.121904 # Main_RecrDev_1971
#DisplayOnly -0.145048 # Main_RecrDev_1972
#DisplayOnly 0.0499678 # Main_RecrDev_1973
#DisplayOnly 0.155212 # Main_RecrDev_1974
#DisplayOnly 0.243288 # Main_RecrDev_1975
#DisplayOnly 0.730944 # Main_RecrDev_1976
#DisplayOnly 0.398381 # Main_RecrDev_1977
#DisplayOnly 0.137458 # Main_RecrDev_1978
#DisplayOnly 0.00550777 # Main_RecrDev_1979
#DisplayOnly 0.223423 # Main_RecrDev_1980
#DisplayOnly 0.364375 # Main_RecrDev_1981
#DisplayOnly 0.410677 # Main_RecrDev_1982
#DisplayOnly 0.0218498 # Main_RecrDev_1983
#DisplayOnly -0.359278 # Main_RecrDev_1984
#DisplayOnly -0.396293 # Main_RecrDev_1985
#DisplayOnly -0.206743 # Main_RecrDev_1986
#DisplayOnly -0.46156 # Main_RecrDev_1987
#DisplayOnly -0.576023 # Main_RecrDev_1988
#DisplayOnly -0.0498159 # Main_RecrDev_1989
#DisplayOnly -0.188292 # Main_RecrDev_1990
#DisplayOnly -0.224353 # Main_RecrDev_1991
#DisplayOnly -0.219337 # Main_RecrDev_1992
#DisplayOnly -0.269435 # Main_RecrDev_1993
#DisplayOnly -0.111769 # Main_RecrDev_1994
#DisplayOnly -0.0421864 # Main_RecrDev_1995
#DisplayOnly -0.3085 # Main_RecrDev_1996
#DisplayOnly -0.110474 # Main_RecrDev_1997
#DisplayOnly 0.115031 # Main_RecrDev_1998
#DisplayOnly 0.119472 # Main_RecrDev_1999
#DisplayOnly 0.222919 # Main_RecrDev_2000
#DisplayOnly -0.387388 # Main_RecrDev_2001
#DisplayOnly -0.139591 # Main_RecrDev_2002
#DisplayOnly 0.0458866 # Main_RecrDev_2003
#DisplayOnly 0.222009 # Main_RecrDev_2004
#DisplayOnly 0.0728204 # Main_RecrDev_2005
#DisplayOnly -0.0397729 # Main_RecrDev_2006
#DisplayOnly -0.160585 # Main_RecrDev_2007
#DisplayOnly 0.289902 # Main_RecrDev_2008
#DisplayOnly -0.06834 # Main_RecrDev_2009
#DisplayOnly -0.0565075 # Main_RecrDev_2010
#DisplayOnly -0.00279396 # Main_RecrDev_2011
#DisplayOnly 0.000733431 # Main_RecrDev_2012
#
#Fishing Mortality info 
0.5 # F ballpark for tuning early phases
-2008 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
0 3 0 0 -1 99 -1 # InitF_1F1_LL1
0 1 0 0 -1 99 -1 # InitF_2F2_LL2
0 1 0 0 -1 99 -1 # InitF_3F3_LL3
0 1 0 0 -1 99 -1 # InitF_4F4_LL4
0 1 0 0 -1 99 -1 # InitF_5F5_DN3
0 1 0 0 -1 99 -1 # InitF_6F6_DN4
0 1 0 0 -1 99 -1 # InitF_7F7_PS1
0 1 0 0 -1 99 -1 # InitF_6F8_Other1
0 1 0 0 -1 99 -1 # InitF_6F9_Other2
0 1 0 0 -1 99 -1 # InitF_6F10_Other3
0 1 0 0 -1 99 -1 # InitF_6F11_Other4
#
#_Q_setup
 # Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den-dep  env-var  extra_se  Q_type
0 0 0 0 #  1 F1_LL1
0 0 0 0 #  2 F2_LL2
0 0 0 0 #  3 F3_LL3
0 0 0 0 #  4 F4_LL4
0 0 0 0 #  5 F5_DN3
0 0 0 0 #  6 F6_DN4
0 0 0 0 #  7 F7_PS1
0 0 0 0 #  8 F8_Other1
0 0 0 0 #  9 F9_Other2
0 0 0 0 # 10 F10_Other3
0 0 0 0 # 11 F11_Other4
## LL CPUE only from 1979 onwards
0 0 0 3 # 12 CPUE_LL1 - estimate deviates for period prior to 1979
0 0 0 3 # 13 CPUE_LL2 - estimate deviates for period prior to 1979
0 0 0 3 # 14 CPUE_LL3 - estimate deviates for period prior to 1979
0 0 0 3 # 15 CPUE_LL4 - estimate deviates for period prior to 1979 and from 2005 onwards
0 0 0 0 # 16 CPUE_DN4

1
#_LO HI INIT PRIOR PR_type SD PHASE
## CPUE_LL1 - with deviates prior to 1970
-20	3	-10	-10	-1	99	2	#Baseq CPUE_LL1		
-6	6	0	0	0	1	-4	#don't estimate deviate		1979
-6	6	0	0	0	1	-4	#don't estimate deviate		1979
-6	6	0	0	0	1	-4	#don't estimate deviate		1979
-6	6	0	0	0	1	-4	#don't estimate deviate		1980
-6	6	0	0	0	1	-4	#don't estimate deviate		1980
-6	6	0	0	0	1	-4	#don't estimate deviate		1980
-6	6	0	0	0	1	-4	#don't estimate deviate		1980
-6	6	0	0	0	1	-4	#don't estimate deviate		1981
-6	6	0	0	0	1	-4	#don't estimate deviate		1981
-6	6	0	0	0	1	-4	#don't estimate deviate		1981
-6	6	0	0	0	1	-4	#don't estimate deviate		1982
-6	6	0	0	0	1	-4	#don't estimate deviate		1982
-6	6	0	0	0	1	-4	#don't estimate deviate		1983
-6	6	0	0	0	1	-4	#don't estimate deviate		1983
-6	6	0	0	0	1	-4	#don't estimate deviate		1983
-6	6	0	0	0	1	-4	#don't estimate deviate		1984
-6	6	0	0	0	1	-4	#don't estimate deviate		1984
-6	6	0	0	0	1	-4	#don't estimate deviate		1985
-6	6	0	0	0	1	-4	#don't estimate deviate		1985
-6	6	0	0	0	1	-4	#don't estimate deviate		1986
-6	6	0	0	0	1	-4	#don't estimate deviate		1986
-6	6	0	0	0	1	-4	#don't estimate deviate		1987
-6	6	0	0	0	1	-4	#don't estimate deviate		1987
-6	6	0	0	0	1	-4	#don't estimate deviate		1988
-6	6	0	0	0	1	-4	#don't estimate deviate		1988
-6	6	0	0	0	1	-4	#don't estimate deviate		1991
-6	6	0	0	0	1	-4	#don't estimate deviate		1992
-6	6	0	0	0	1	-4	#don't estimate deviate		1992
-6	6	0	0	0	1	-4	#don't estimate deviate		1993
-6	6	0	0	0	1	-4	#don't estimate deviate		1994
-6	6	0	0	0	1	-4	#don't estimate deviate		1994
-6	6	0	0	0	1	-4	#don't estimate deviate		1994
-6	6	0	0	0	1	-4	#don't estimate deviate		1995
-6	6	0	0	0	1	-4	#don't estimate deviate		1995
-6	6	0	0	0	1	-4	#don't estimate deviate		1995
-6	6	0	0	0	1	-4	#don't estimate deviate		1995
-6	6	0	0	0	1	-4	#don't estimate deviate		1996
-6	6	0	0	0	1	-4	#don't estimate deviate		1996
-6	6	0	0	0	1	-4	#don't estimate deviate		1996
-6	6	0	0	0	1	-4	#don't estimate deviate		1997
-6	6	0	0	0	1	-4	#don't estimate deviate		1997
-6	6	0	0	0	1	-4	#don't estimate deviate		1997
-6	6	0	0	0	1	-4	#don't estimate deviate		1998
-6	6	0	0	0	1	-4	#don't estimate deviate		1998
-6	6	0	0	0	1	-4	#don't estimate deviate		1999
-6	6	0	0	0	1	-4	#don't estimate deviate		1999
-6	6	0	0	0	1	-4	#don't estimate deviate		1999
-6	6	0	0	0	1	-4	#don't estimate deviate		2000
-6	6	0	0	0	1	-4	#don't estimate deviate		2000
-6	6	0	0	0	1	-4	#don't estimate deviate		2000
-6	6	0	0	0	1	-4	#don't estimate deviate		2001
-6	6	0	0	0	1	-4	#don't estimate deviate		2001
-6	6	0	0	0	1	-4	#don't estimate deviate		2001
-6	6	0	0	0	1	-4	#don't estimate deviate		2002
-6	6	0	0	0	1	-4	#don't estimate deviate		2002
-6	6	0	0	0	1	-4	#don't estimate deviate		2002
-6	6	0	0	0	1	-4	#don't estimate deviate		2002
-6	6	0	0	0	1	-4	#don't estimate deviate		2003
-6	6	0	0	0	1	-4	#don't estimate deviate		2003
-6	6	0	0	0	1	-4	#don't estimate deviate		2003
-6	6	0	0	0	1	-4	#don't estimate deviate		2003
-6	6	0	0	0	1	-4	#don't estimate deviate		2004
-6	6	0	0	0	1	-4	#don't estimate deviate		2004
-6	6	0	0	0	1	-4	#don't estimate deviate		2004
-6	6	0	0	0	1	-4	#don't estimate deviate		2005
-6	6	0	0	0	1	-4	#don't estimate deviate		2005
-6	6	0	0	0	1	-4	#don't estimate deviate		2005
-6	6	0	0	0	1	-4	#don't estimate deviate		2005
-6	6	0	0	0	1	-4	#don't estimate deviate		2006
-6	6	0	0	0	1	-4	#don't estimate deviate		2006
-6	6	0	0	0	1	-4	#don't estimate deviate		2006
-6	6	0	0	0	1	-4	#don't estimate deviate		2006
-6	6	0	0	0	1	-4	#don't estimate deviate		2007
-6	6	0	0	0	1	-4	#don't estimate deviate		2007
-6	6	0	0	0	1	-4	#don't estimate deviate		2007
-6	6	0	0	0	1	-4	#don't estimate deviate		2007
-6	6	0	0	0	1	-4	#don't estimate deviate		2008
-6	6	0	0	0	1	-4	#don't estimate deviate		2008
-6	6	0	0	0	1	-4	#don't estimate deviate		2008
-6	6	0	0	0	1	-4	#don't estimate deviate		2008
-6	6	0	0	0	1	-4	#don't estimate deviate		2009
-6	6	0	0	0	1	-4	#don't estimate deviate		2009
-6	6	0	0	0	1	-4	#don't estimate deviate		2009
-6	6	0	0	0	1	-4	#don't estimate deviate		2009
-6	6	0	0	0	1	-4	#don't estimate deviate		2010
-6	6	0	0	0	1	-4	#don't estimate deviate		2010
-6	6	0	0	0	1	-4	#don't estimate deviate		2010
-6	6	0	0	0	1	-4	#don't estimate deviate		2011
-6	6	0	0	0	1	-4	#don't estimate deviate		2011
-6	6	0	0	0	1	-4	#don't estimate deviate		2012
-6	6	0	0	0	1	-4	#don't estimate deviate		2012
-6	6	0	0	0	1	-4	#don't estimate deviate		2012
-6	6	0	0	0	1	-4	#don't estimate deviate		2012
-6	6	0	0	0	1	-4	#don't estimate deviate		2013
-6	6	0	0	0	1	-4	#don't estimate deviate		2013
-6	6	0	0	0	1	-4	#don't estimate deviate		2014
-6	6	0	0	0	1	-4	#don't estimate deviate		2014
-6	6	0	0	0	1	-4	#don't estimate deviate		2014

## CPUE_LL2 - with deviates prior to 1970
-20	6	-10	-10	-1	99	2	#Baseq	CPUE_LL2		
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1979
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1986
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1986
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1989
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1993
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2005
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2008

## CPUE_LL6 - with deviates prior to 1970
-20	6	-10	-10	-1	99	2	#Baseq	CPUE_LL3		
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1979
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1979
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1979
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1986
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1986
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1986
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1989
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1989
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1990
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1990
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1991
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1991
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1991
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1992
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1992
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1992
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1993
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1993
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1993
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2005
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2005
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2005
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2005
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2006
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2006
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2006
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2006
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2007
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2007
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2007
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2008
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2008
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2008
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2008
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2009
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2009
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2009
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2009
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2010
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2010
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2010
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2010
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2011
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2011
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2011
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2012
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2012
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2012
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2012
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2013
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2013
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2013
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2013
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2014
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2014
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2014
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2014
## CPUE_LL4 - with deviates prior to 1970
-20	6	-10	-10	-1	99	2	#Baseq	CPUE_LL4		
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1979
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1980
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1981
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1982
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1983
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1984
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1985
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1986
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1987
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1988
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1989
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1989
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1991
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1991
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1992
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1992
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1993
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1993
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1994
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1995
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1996
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1997
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1998
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	1999
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2000
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2001
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2002
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2003
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	1	-4	#don't	estimate	deviate	2004
-6	6	0	0	0	3	4	#estimate	deviate	2005
-6	6	0	0	0	3	4	#estimate	deviate	2005
-6	6	0	0	0	3	4	#estimate	deviate	2005
-6	6	0	0	0	3	4	#estimate	deviate	2005
-6	6	0	0	0	3	4	#estimate	deviate	2006
-6	6	0	0	0	3	4	#estimate	deviate	2006
-6	6	0	0	0	3	4	#estimate	deviate	2006
-6	6	0	0	0	3	4	#estimate	deviate	2007
-6	6	0	0	0	3	4	#estimate	deviate	2007
-6	6	0	0	0	3	4	#estimate	deviate	2007
-6	6	0	0	0	3	4	#estimate	deviate	2008
-6	6	0	0	0	3	4	#estimate	deviate	2008
-6	6	0	0	0	3	4	#estimate	deviate	2009
-6	6	0	0	0	3	4	#estimate	deviate	2009
-6	6	0	0	0	3	4	#estimate	deviate	2009
-6	6	0	0	0	3	4	#estimate	deviate	2010
-6	6	0	0	0	3	4	#estimate	deviate	2010
-6	6	0	0	0	3	4	#estimate	deviate	2010
-6	6	0	0	0	3	4	#estimate	deviate	2011
-6	6	0	0	0	3	4	#estimate	deviate	2011
-6	6	0	0	0	3	4	#estimate	deviate	2011
-6	6	0	0	0	3	4	#estimate	deviate	2012
-6	6	0	0	0	3	4	#estimate	deviate	2012
-6	6	0	0	0	3	4	#estimate	deviate	2013
-6	6	0	0	0	3	4	#estimate	deviate	2013
-6	6	0	0	0	3	4	#estimate	deviate	2014
-6	6	0	0	0	3	4	#estimate	deviate	2014


#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any)
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
24 0 0 0 #  1 F1_LL1   , double normal EQUIVALENT SELECTIVITY FOR Northern ll FISHERIES 
15 0 0 1 #  2 F2_LL2
24 0 0 0 #  3 F3_LL3    Double normal EQUIVALENT SELECTIVITY FOR Southern ll FISHERIES 
15 0 0 3 #  4 F4_LL4
24 0 0 0 #  5 F5_DN3
15 0 0 5 #  6 F6_DN4
24 0 0 0 #  7 F7_PS1
15 0 0 5 #  8 F8_Other1
15 0 0 5 #  9 F9_Other2
15 0 0 5 # 10 F10_Other3
15 0 0 5 # 11 F11_Other4
15 0 0 1 # 12 CPUE_LL1
15 0 0 1 # 13 CPUE_LL2
15 0 0 3 # 14 CPUE_LL3
15 0 0 3 # 15 CPUE_LL4
15 0 0 5 # 16 CPUE_DN4

#
#_age_selex_types
#_Pattern ___ Male Special
10 0 0 0 #  1 F1_LL1
10 0 0 0 #  2 F2_LL2
10 0 0 0 #  3 F3_LL3
10 0 0 0 #  4 F4_LL4
10 0 0 0 #  5 F5_DN3
10 0 0 0 #  6 F6_DN4
10 0 0 0 #  7 F7_PS1
10 0 0 0 #  8 F8_Other1
10 0 0 0 #  9 F9_Other2
10 0 0 0 # 10 F10_Other3
10 0 0 0 # 11 F11_Other4
10 0 0 0 # 12 CPUE_LL1
10 0 0 0 # 13 CPUE_LL2
10 0 0 0 # 14 CPUE_LL3
10 0 0 0 # 15 CPUE_LL4
10 0 0 0 # 16 CPUE_DN4

#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
## Northern Longline, double normal
30  139   90    90	 -1 99  2 0 2 1980 2014 10 0 0 # SizeSel_7P_1_F2_LL
-12    4  -2.2  -2.2	 -1 99  4 0 0 0 0 0 0 0 # SizeSel_7P_2_F2_LL
-1    9  5.0	5.0	 -1 99	3 0 0 0 0 0 0 0 # SizeSel_7P_3_F2_LL
-1    9  4.3	4.3	 -1 99	4 0 0 0 0 0 0 0 # SizeSel_7P_4_F2_LL
-999 -600 -999.000000  -5 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_7P_5_F2_LL
-15 9 5 5 -1 99 -5 0 0 0 0 0 0 0 # SizeSel_7P_6_F2_LL  ## assume full selectivity of largest length classes

## Southern Longline, double normal
30  139   80    80	 -1 99  2 0 0 0 0 0 0 0 # SizeSel_7P_1_F2_LL
-12    4  -2.2  -2.2	 -1 99  4 0 0 0 0 0 0 0 # SizeSel_7P_2_F2_LL
-1    9  3.0	3.0	 -1 99	3 0 0 0 0 0 0 0 # SizeSel_7P_3_F2_LL
-1    9  4.3	4.3	 -1 99	4 0 0 0 0 0 0 0 # SizeSel_7P_4_F2_LL
-999 -600 -999.000000  -5 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_7P_5_F2_LL
-15 6 -5  -5 -1 99 5 0 0 0 0 0 0 0 # SizeSel_7P_6_F2_LL

## look at fixing selectivity as per Bartoo & Holts 1993 - selectivity from SP fishery
  30  139   58    58	 -1 99  -2 0 0 0 0 0 0 0 # SizeSel_7P_1_F7_Drift
  -9    4  -2.2  -2.2	 -1 99  -4 0 0 0 0 0 0 0 # SizeSel_7P_2_F7_Drift
  -1    9  3.0	3.0	 -1 99	-3 0 0 0 0 0 0 0 # SizeSel_7P_3_F7_Drift
  -1    9  4.3	4.3	 -1 99	-4 0 0 0 0 0 0 0 # SizeSel_7P_4_F7_Drift
-999 -600 -999.000000  -5 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_7P_5_F7_Drift
-999 -600 -999.000000  -5 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_7P_6_F7_Drift

## purse seine, double normal
  30  139  100  100 -1 99  2 0 0 0 0 0 0 0 # SizeSel_3P_1_F3_PS_N
  -9    4   -8  -8 -1 99  4 0 0 0 0 0 0 0 # SizeSel_3P_2_F3_PS_N
  -1    9    4   4 -1 99  3 0 0 0 0 0 0 0 # SizeSel_3P_3_F3_PS_N
  -1    9    4   4 -1 99  -4 0 0 0 0 0 0 0 # SizeSel_3P_4_F3_PS_N
-999 -600 -999.000000  -5 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_3P_5_F3_PS_N
-15 10 5  5 -1 99 2 0 0 0 0 0 0 0 # SizeSel_3P_6_F3_PS_N

6 #selparm_dev_PH
1 #selparm_adjust_method

#_Cond 0 #_custom_sel-env_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns

# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
## add extra uncertainty to the north LL CPUE
## down weight northern CPUE
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_survey_CV
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_mult_by_lencomp_N
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_agecomp_N
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_size-at-age_N
#
4 #_maxlambdaphase
1 #_sd_offset
#
2  # number of changes to make to default Lambdas (default value is 1.0)
#15 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin
#like_comp fleet/survey  phase  value  sizefreq_method
1 12 1 0 1 
1 13 1 0 1
#1 14 1 0 1
#1 9  1 1 1
#1 10 1 1 1
#1 11 1 1 1
#1 12 1 1 1
#4 1 1 1 1
#4 2 1 1 1
#4 3 1 1 1
#4 4 1 1 1
#4 5 1 1 1
#4 6 1 1 1
#4 7 1 1 1
##
#9 1 1 1 1
#11 1 1 0 1
#12 1 1 0 1
#13 1 1 100 1
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 #_CPUE/survey:_4
#  0 0 0 0 #_CPUE/survey:_5
#  0 0 0 0 #_CPUE/survey:_6
#  0 0 0 0 #_CPUE/survey:_7
#  0 0 0 0 #_CPUE/survey:_8
#  0 0 0 0 #_CPUE/survey:_9
#  0 0 0 0 #_CPUE/survey:_10
#  1 1 1 1 #_CPUE/survey:_11
#  1 1 1 1 #_meanbodywt:1
#  1 1 1 1 #_meanbodywt:2
#  1 1 1 1 #_meanbodywt:3
#  1 1 1 1 #_meanbodywt:4
#  1 1 1 1 #_meanbodywt:5
#  1 1 1 1 #_meanbodywt:6
#  1 1 1 1 #_meanbodywt:7
#  1 1 1 1 #_meanbodywt:8
#  1 1 1 1 #_meanbodywt:9
#  1 1 1 1 #_meanbodywt:10
#  1 1 1 1 #_meanbodywt:11
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  1 1 1 1 #_lencomp:_5
#  1 1 1 1 #_lencomp:_6
#  1 1 1 1 #_lencomp:_7
#  0 0 0 0 #_lencomp:_8
#  0 0 0 0 #_lencomp:_9
#  0 0 0 0 #_lencomp:_10
#  0 0 0 0 #_lencomp:_11
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  0 0 0 0 #_parameter-priors
#  0 0 0 0 #_parameter-dev-vectors
#  100 100 100 100 #_crashPenLambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

