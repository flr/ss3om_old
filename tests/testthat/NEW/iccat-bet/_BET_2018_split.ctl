# Bigeye Tuna Assessment 2018
# This file matches the MFCL set-up from the 2007 assessment and the 2015 assessment (Michael Schirripa), mostly
#john walter, sefsc 2018
#Stock Synthesis Version SS-V3.24P-safe
#
#V3.24P
#_data_and_control_files: _BET_2018_ref.dat // _BET_2018_split.ctl
#_SS-V3.24P-safe;_05/08/2013;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_10.1
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
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
7 #_Nblock_Patterns
 52 2 2 1 1 1 2 #_blocks_per_pattern
# begin and end years of blocks
 1963 1963 1964 1964 1965 1965 1966 1966 1967 1967 1968 1968 1969 1969 1970 1970 1971 1971 1972 1972 1973 1973 1974 1974 1975 1975 1976 1976 1977 1977 1978 1978 1979 1979 1980 1980 1981 1981 1982 1982 1983 1983 1984 1984 1985 1985 1986 1986 1987 1987 1988 1988 1989 1989 1990 1990 1991 1991 1992 1992 1993 1993 1994 1994 1995 1995 1996 1996 1997 1997 1998 1998 1999 1999 2000 2000 2001 2001 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2014
 1950 2006 2007 2018
 1950 2003 2004 2018
 2008 2018
 2005 2018
 1979 2018
 1979 1991 1992 2018
#
0.5 #_fracfemale
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
11 #_N_breakpoints
 0 1 2 3 4 5 6 7 8 9 10 # age(real) at M breakpoints
2 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
1 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_Age_Maturity by growth pattern
 0 0 0 0.5 1 1 1 1 1 1 1
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 0.01 3 0.727 0.727 -1 0.091 -2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 0.01 3 0.456 0.456 -1 0.044 -2 0 0 0 0 0.5 0 0 # NatM_p_2_Fem_GP_1
 0.01 1 0.358 0.358 -1 0.051 -2 0 0 0 0 0.5 0 0 # NatM_p_3_Fem_GP_1
 0.01 1 0.308 0.308 -1 0.054 -2 0 0 0 0 0.5 0 0 # NatM_p_4_Fem_GP_1
 0.01 1 0.279 0.279 -1 0.044 -2 0 0 0 0 0.5 0 0 # NatM_p_5_Fem_GP_1
 0.01 1 0.26 0.26 -1 0.035 -2 0 0 0 0 0.5 0 0 # NatM_p_6_Fem_GP_1
 0.01 1 0.248 0.248 -1 0.029 -2 0 0 0 0 0.5 0 0 # NatM_p_7_Fem_GP_1
 0.01 1 0.239 0.239 -1 0.026 -2 0 0 0 0 0.5 0 0 # NatM_p_8_Fem_GP_1
 0.01 1 0.233 0.233 -1 0.023 -2 0 0 0 0 0.5 0 0 # NatM_p_9_Fem_GP_1
 0.01 1 0.228 0.228 -1 0.026 -2 0 0 0 0 0.5 0 0 # NatM_p_10_Fem_GP_1
 0.01 1 0.221 0.221 -1 0.023 -2 0 0 0 0 0.5 0 0 # NatM_p_11_Fem_GP_1
 20 70 57.62 57.542 -1 2.8771 -3 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 150 300 178.63 217.28 -1 8.5992 -3 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.1 0.45 0.423986 0.18 -1 0.009 -3 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 -0.1 0.35 -0.0003406 0.18 -1 0.009 -3 0 0 0 0 0.5 0 0 # Richards_Fem_GP_1
 0.01 20 0.1 0.4 -1 99 -6 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.01 30 0.0672021 0.4 -1 99 -6 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 0 1 2.396e-005 2.4e-005 -1 0.8 -2 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 0 4 2.9774 2.976 -1 0.8 -2 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 35 119 105 105 -1 0.8 -2 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -10 3 -10 -10 -1 0.8 -2 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 3 1 1 -1 0.8 -2 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 3 0 0 -1 0.8 -2 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 -4 4 0 0 -1 99 -2 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -4 4 0 0 -1 0.01 -2 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 1.82 -1 0.01 -2 0 0 0 0 0.5 0 0 # RecrDist_Seas_1
 -6 6 0.615494 4 -1 0.01 2 0 0 0 0 0.5 0 0 # RecrDist_Seas_2
 -6 6 0.219029 -4 -1 0.01 2 0 0 0 0 0.5 0 0 # RecrDist_Seas_3
 -4 4 -0.266483 3.11 -1 0.01 2 0 0 0 0 0.5 0 0 # RecrDist_Seas_4
 -5 4 0 0 -1 99 -2 0 0 0 0 0.5 0 0 # CohortGrowDev
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
#_Cond -4 #_MGparm_Dev_Phase
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm
#_LO HI INIT PRIOR PR_type SD PHASE
 9 18 9.82711 9 -1 99 1 # SR_LN(R0)
 0.2 1 0.8 0.8  -1 0.1  -3 # SR_BH_steep,
 0.1 1.5 0.4  0.4 -1 0.5   -5 # SR_sigmaR
 -5 5 0 0 -1 99  -5 # SR_envlink
 -5 5 0 0 -1 99 -6 # SR_R1_offset
 0 2 0 -1 -1 1 -3 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1974 # first year of main recr_devs; early devs can preceed this era
2017 # last year of main recr_devs; forecast devs start in following year
6 #_recdev phase
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 -1 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
1954.0   #_last_early_yr_nobias_adj_in_MPD
1982.4   #_first_yr_fullbias_adj_in_MPD
2014.7   #_last_yr_fullbias_adj_in_MPD
2018.2   #_first_recent_yr_nobias_adj_in_MPD
.2  #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
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
#DisplayOnly -0.314708 # Main_RecrDev_1974
#DisplayOnly -0.196978 # Main_RecrDev_1975
#DisplayOnly -0.0951581 # Main_RecrDev_1976
#DisplayOnly -0.0534351 # Main_RecrDev_1977
#DisplayOnly -0.290897 # Main_RecrDev_1978
#DisplayOnly 0.0205284 # Main_RecrDev_1979
#DisplayOnly -0.0472189 # Main_RecrDev_1980
#DisplayOnly -0.0233253 # Main_RecrDev_1981
#DisplayOnly 0.0123194 # Main_RecrDev_1982
#DisplayOnly 0.162226 # Main_RecrDev_1983
#DisplayOnly -0.409125 # Main_RecrDev_1984
#DisplayOnly 0.158558 # Main_RecrDev_1985
#DisplayOnly -0.137179 # Main_RecrDev_1986
#DisplayOnly -0.0100088 # Main_RecrDev_1987
#DisplayOnly 0.0478049 # Main_RecrDev_1988
#DisplayOnly 0.0208125 # Main_RecrDev_1989
#DisplayOnly 0.108969 # Main_RecrDev_1990
#DisplayOnly 0.171053 # Main_RecrDev_1991
#DisplayOnly 0.13258 # Main_RecrDev_1992
#DisplayOnly 0.221331 # Main_RecrDev_1993
#DisplayOnly 0.0922484 # Main_RecrDev_1994
#DisplayOnly 0.17918 # Main_RecrDev_1995
#DisplayOnly 0.217523 # Main_RecrDev_1996
#DisplayOnly 0.348627 # Main_RecrDev_1997
#DisplayOnly 0.435829 # Main_RecrDev_1998
#DisplayOnly 0.219112 # Main_RecrDev_1999
#DisplayOnly 0.0253023 # Main_RecrDev_2000
#DisplayOnly -0.124375 # Main_RecrDev_2001
#DisplayOnly -0.121916 # Main_RecrDev_2002
#DisplayOnly 0.145865 # Main_RecrDev_2003
#DisplayOnly 0.0574284 # Main_RecrDev_2004
#DisplayOnly -0.149883 # Main_RecrDev_2005
#DisplayOnly -0.535568 # Main_RecrDev_2006
#DisplayOnly -0.266566 # Main_RecrDev_2007
#DisplayOnly -0.198492 # Main_RecrDev_2008
#DisplayOnly -0.0106096 # Main_RecrDev_2009
#DisplayOnly 0.157863 # Main_RecrDev_2010
#DisplayOnly 0.0986233 # Main_RecrDev_2011
#DisplayOnly -0.0483417 # Main_RecrDev_2012
#DisplayOnly 0 # Late_RecrDev_2013
#DisplayOnly 0 # Late_RecrDev_2014
#DisplayOnly 0 # Late_RecrDev_2015
#DisplayOnly 0 # Late_RecrDev_2016
#DisplayOnly 0 # Late_RecrDev_2017
#DisplayOnly 0 # ForeRecr_2018
#DisplayOnly 0 # ForeRecr_2019
#DisplayOnly 0 # ForeRecr_2020
#DisplayOnly 0 # ForeRecr_2021
#DisplayOnly 0 # ForeRecr_2022
#DisplayOnly 0 # ForeRecr_2023
#DisplayOnly 0 # ForeRecr_2024
#DisplayOnly 0 # ForeRecr_2025
#DisplayOnly 0 # ForeRecr_2026
#DisplayOnly 0 # ForeRecr_2027
#DisplayOnly 0 # Impl_err_2018
#DisplayOnly 0 # Impl_err_2019
#DisplayOnly 0 # Impl_err_2020
#DisplayOnly 0 # Impl_err_2021
#DisplayOnly 0 # Impl_err_2022
#DisplayOnly 0 # Impl_err_2023
#DisplayOnly 0 # Impl_err_2024
#DisplayOnly 0 # Impl_err_2025
#DisplayOnly 0 # Impl_err_2026
#DisplayOnly 0 # Impl_err_2027
#
#Fishing Mortality info
0.25 # F ballpark for annual F (=Z-M) for specified year
2000 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
3  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
 0 1 0 0 0 99 -1 # InitF_11_PS_ESFR2_6585
 0 1 0 0 0 99 -1 # InitF_22_PS_ESFR2_8690
 0 1 0 0 0 99 -1 # InitF_33_PS_ESFR2_9114
 0 1 0 0 0 99 -1 # InitF_44_ESFR_FADS2_PS_9114
 0 1 0 0 0 99 -1 # InitF_55_BB+PS_Ghana2_6514
 0 1 0 0 0 99 -1 # InitF_66_BB_FisTropS2_6214
 0 1 0 0 0 99 -1 # InitF_77_BB_FisTropN2_6579
 0 1 0 0 0 99 -1 # InitF_88_BB_FisTropN2_8014
 0 1 0 0 0 99 -1 # InitF_99_BB_North1_6514
 0 1 0 0 0 99 -1 # InitF_1010_Japan_LL1_6114
 0 1 0 0 0 99 -1 # InitF_1111_Japan_LL2_6114
 0 1 0 0 0 99 -1 # InitF_1212_Japan_LL3_6114
 0 1 0 0 0 99 -1 # InitF_1313_Others1_LL_6514
 0 1 0 0 0 99 -1 # InitF_1414_Others2_LL_6514
 0 1 0 0 0 99 -1 # InitF_1515_Others3_LL_6114
#
#_Q_setup
 # Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den-dep  env-var  extra_se  Q_type
 0 0 0 0 # 1 1_PS_ESFR2_6585
 0 0 0 0 # 2 2_PS_ESFR2_8690
 0 0 0 0 # 3 3_PS_ESFR2_9114
 0 0 0 0 # 4 4_ESFR_FADS2_PS_9114
 0 0 0 0 # 5 5_BB+PS_Ghana2_6514
 0 0 0 0 # 6 6_BB_FisTropS2_6214
 0 0 0 0 # 7 7_BB_FisTropN2_6579
 0 0 0 0 # 8 8_BB_FisTropN2_8014
 0 0 0 0 # 9 9_BB_North1_6514
 0 0 0 0 # 10 10_Japan_LL1_6114
 0 1 0 2 # 11 11_Japan_LL2_6114
 0 0 0 0 # 12 12_Japan_LL3_6114
 0 0 0 0 # 13 13_Others1_LL_6514
 0 0 0 0 # 14 14_Others2_LL_6514
 0 0 0 0 # 15 15_Others3_LL_6114
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
# LO HI INIT PRIOR PR_type SD PHASE
 -5 5 0.654479 0 -1 99 2 # Q_envlink_11_11_Japan_LL2_6114
 -15 0 -9.46802 0 -1 99 1 # LnQ_base_11_11_Japan_LL2_6114
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 27 0 0 5 # 1 1_PS_ESFR2_6585
 27 0 0 5 # 2 2_PS_ESFR2_8690
 27 0 0 5 # 3 3_PS_ESFR2_9114
 27 0 0 5 # 4 4_ESFR_FADS2_PS_9114
 27 0 0 5 # 5 5_BB+PS_Ghana2_6514
 24 0 0 0 # 6 6_BB_FisTropS2_6214
 24 0 0 0 # 7 7_BB_FisTropN2_6579
 24 0 0 0 # 8 8_BB_FisTropN2_8014
 27 0 0 5 # 9 9_BB_North1_6514
 27 0 0 5 # 10 10_Japan_LL1_6114
 24 0 0 5 # 11 11_Japan_LL2_6114
 27 0 0 5 # 12 12_Japan_LL3_6114
 27 0 0 5 # 13 13_Others1_LL_6514
 24 0 0 0 # 14 14_Others2_LL_6514
 27 0 0 5 # 15 15_Others3_LL_6114
#
#_age_selex_types
#_Pattern ___ Male Special
 14 0 0 0 # 1 1_PS_ESFR2_6585
 15 0 0 1 # 2 2_PS_ESFR2_8690
 15 0 0 1 # 3 3_PS_ESFR2_9114
 15 0 0 1 # 4 4_ESFR_FADS2_PS_9114
 15 0 0 1 # 5 5_BB+PS_Ghana2_6514
 15 0 0 1 # 6 6_BB_FisTropS2_6214
 15 0 0 1 # 7 7_BB_FisTropN2_6579
 15 0 0 1 # 8 8_BB_FisTropN2_8014
 15 0 0 1 # 9 9_BB_North1_6514
 15 0 0 1 # 10 10_Japan_LL1_6114
 15 0 0 1 # 11 11_Japan_LL2_6114
 15 0 0 1 # 12 12_Japan_LL3_6114
 15 0 0 1 # 13 13_Others1_LL_6514
 15 0 0 1 # 14 14_Others2_LL_6514
 15 0 0 1 # 15 15_Others3_LL_6114
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 0 2 1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_1_PS_ESFR2_6585_1
 0.1 2 0.346013 1 -1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_1_PS_ESFR2_6585_1
 -5 5 -0.0402601 0 -1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_1_PS_ESFR2_6585_1
 35 100 34.4209 2 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_1_PS_ESFR2_6585_1
 35 150 46.7914 3 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_1_PS_ESFR2_6585_1
 40 150 54.9846 6 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_1_PS_ESFR2_6585_1
 40 150 70.2463 12 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_1_PS_ESFR2_6585_1
 60 200 139.134 20 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_1_PS_ESFR2_6585_1
 -5 1 -3.77638 -2.78 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_1_PS_ESFR2_6585_1
 -5 1 -1.05445 -4.9 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_1_PS_ESFR2_6585_1
 -5 1 -1 0 -1 2 -2 0 0 0 0 0 0 0 # SizeSpline_Val_3_1_PS_ESFR2_6585_1
 -5 1 -1.84276 -0.77 -1 2 3 0 0 0 0 0 0 0 # SizeSpline_Val_4_1_PS_ESFR2_6585_1
 -7 1 -3.86068 0 -1 2 3 0 0 0 0 0 0 0 # SizeSpline_Val_5_1_PS_ESFR2_6585_1

 0 2 1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_2_PS_ESFR2_8690_2
 0.1 2 0.499874 0.499874   1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_2_PS_ESFR2_8690_2 symmetric beta
 -1 0 -0.102775 -0.102775  1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_2_PS_ESFR2_8690_2 symmetric beta
 35 100 36.5357 2 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_2_PS_ESFR2_8690_2
 35 150 45.8528 3 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_2_PS_ESFR2_8690_2
 40 150 53.0059 6 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_2_PS_ESFR2_8690_2
 40 150 63.6931 12 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_2_PS_ESFR2_8690_2
 60 200 112.499 20 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_2_PS_ESFR2_8690_2
 -5 1 -4.12585 -2.78 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_2_PS_ESFR2_8690_2
 -5 1 -1.06727 -4.9 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_2_PS_ESFR2_8690_2
 -5 1 -1 0 -1 2 -2 0 0 0 0 0 0 0 # SizeSpline_Val_3_2_PS_ESFR2_8690_2
 -5 1 -1.75438 -0.77 -1 2 3 0 0 0 0 0 0 0 # SizeSpline_Val_4_2_PS_ESFR2_8690_2
 -6 1 -4.25296 0 -1 2 3 0 0 0 0 0 0 0 # SizeSpline_Val_5_2_PS_ESFR2_8690_2

 0 2 1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_3_PS_ESFR2_9114_3
 0.1 1 0.448153 1 -1 0.01 -3 0 0 0 0 0 4 2 # SizeSpline_GradLo_3_PS_ESFR2_9114_3
 -1 1 -0.108555 0 -1 0.01 -3 0 0 0 0 0 4 2 # SizeSpline_GradHi_3_PS_ESFR2_9114_3
 35 100 30.6741 2 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_3_PS_ESFR2_9114_3
 35 150 40.5366 3 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_3_PS_ESFR2_9114_3
 40 150 47.2615 6 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_3_PS_ESFR2_9114_3
 40 150 63.2948 12 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_3_PS_ESFR2_9114_3
 130 200 152.058 20 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_3_PS_ESFR2_9114_3
 -5 1 -3.51057 -2.78 -1 2 -2 0 0 0 0 0 4 2 # SizeSpline_Val_1_3_PS_ESFR2_9114_3
 -5 1 -1.01897 -4.9 -1 2 -2 0 0 0 0 0 4 2 # SizeSpline_Val_2_3_PS_ESFR2_9114_3
 -5 1 -1 0 -1 2 -2 0 0 0 0 0 0 0 # SizeSpline_Val_3_3_PS_ESFR2_9114_3
 -5 1 -2.75021 -0.77 -1 2 -3 0 0 0 0 0 4 2 # SizeSpline_Val_4_3_PS_ESFR2_9114_3
 -5 1 -4.074 0 -1 2 -3 0 0 0 0 0 4 2 # SizeSpline_Val_5_3_PS_ESFR2_9114_3
 0 2 1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_4_ESFR_FADS2_PS_9114_4
 0.1 2 0.345114 1 -1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_4_ESFR_FADS2_PS_9114_4
 -1 0.01 -0.121593 0 -1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_4_ESFR_FADS2_PS_9114_4
 35 100 33.1407 2 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_4_ESFR_FADS2_PS_9114_4
 35 150 42.4219 3 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_4_ESFR_FADS2_PS_9114_4
 40 150 48.4867 6 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_4_ESFR_FADS2_PS_9114_4
 40 150 58.4748 12 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_4_ESFR_FADS2_PS_9114_4
 60 200 112.601 20 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_4_ESFR_FADS2_PS_9114_4
 -5 1 -4.34551 -2.78 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_4_ESFR_FADS2_PS_9114_4
 -5 1 -1.63442 -4.9 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_4_ESFR_FADS2_PS_9114_4
 -5 1 -1 0 -1 2 -2 0 0 0 0 0 0 0 # SizeSpline_Val_3_4_ESFR_FADS2_PS_9114_4
 -5 1 -1.8376 -0.77 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_4_4_ESFR_FADS2_PS_9114_4
 -6 1 -4.37375 0 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_5_4_ESFR_FADS2_PS_9114_4


 0 2 1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_5_BB+PS_Ghana2_6517_5
 0.1 2 0.495923 1 -1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_5_BB+PS_Ghana2_6517_5
 -1 0.01 -0.0153276 0 -1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_5_BB+PS_Ghana2_6517_5
 35 100 34.6607 2 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_5_BB+PS_Ghana2_6517_5
 35 150 42.4162 3 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_5_BB+PS_Ghana2_6517_5
 40 150 46.3285 6 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_5_BB+PS_Ghana2_6517_5
 40 150 51.7898 12 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_5_BB+PS_Ghana2_6517_5
 60 200 119.574 20 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_5_BB+PS_Ghana2_6517_5
 -5 1 -4.43572 -2.78 -1 2 2 0 0 0 0 0 4 2 # SizeSpline_Val_1_5_BB+PS_Ghana2_6517_5
 -5 1 -2.5011 -4.9 -1 2 2 0 0 0 0 0 4 2 # SizeSpline_Val_2_5_BB+PS_Ghana2_6517_5
 -5 1 -1 0 -1 2 -2 0 0 0 0 0 0 0 # SizeSpline_Val_3_5_BB+PS_Ghana2_6517_5
 -5 1 -1.5409 -0.77 -1 2 3 0 0 0 0 0 4 2 # SizeSpline_Val_4_5_BB+PS_Ghana2_6517_5
 -7 1 -5.4629 0 -1 2 3 0 0 0 0 0 4 2 # SizeSpline_Val_5_5_BB+PS_Ghana2_6517_5


 35 200 43.6347 50 -1 99 2 0 0 0 0 0 0 0 # SizeSel_6P_1_6_BB_FisTropS2_6214
 -35 0 -15.1871 -18.57 -1 99 3 0 0 0 0 0 0 0 # SizeSel_6P_2_6_BB_FisTropS2_6214
 -35 10 3.35929 -0.98 -1 99 2 0 0 0 0 0 0 0 # SizeSel_6P_3_6_BB_FisTropS2_6214
 0 10 6.16879 -2.48 -1 99 4 0 0 0 0 0 0 0 # SizeSel_6P_4_6_BB_FisTropS2_6214
 -15 10 -999 -15 -1 99 -1 0 0 0 0 0 0 0 # SizeSel_8P_5_8_BB_FisTropN2_8014
 -25 5 -999 -0.91 -1 2 -6 0 0 0 0 0 0 0 # SizeSel_8P_6_8_BB_FisTropN2_8014

 35 80 55.3848 50 1 2 2 0 0 0 0 0 0 0 # SizeSel_7P_1_7_BB_FisTropN2_6579
 -25 0 -12.505 -18.57 1 2 3 0 0 0 0 0 0 0 # SizeSel_7P_2_7_BB_FisTropN2_6579
 0 10 3.50442 -0.98 1 2 2 0 0 0 0 0 0 0 # SizeSel_7P_3_7_BB_FisTropN2_6579
 0 10 7.62033 -2.48 1 2 4 0 0 0 0 0 0 0 # SizeSel_7P_4_7_BB_FisTropN2_6579
 -15 10 -999 -15 -1 99 -1 0 0 0 0 0 0 0 # SizeSel_8P_5_8_BB_FisTropN2_8014
 -25 5 -999 -0.91 -1 2 -6 0 0 0 0 0 0 0 # SizeSel_8P_6_8_BB_FisTropN2_8014

 35 150 51.8303 50 1 2 2 0 0 0 0 0 0 0 # SizeSel_8P_1_8_BB_FisTropN2_8014
 -10 0 -4.45337 -18.57 1 2 3 0 0 0 0 0 0 0 # SizeSel_8P_2_8_BB_FisTropN2_8014
 0 10 4.25287 -0.98 1 2 2 0 0 0 0 0 0 0 # SizeSel_8P_3_8_BB_FisTropN2_8014
 0 10 8.13184 -2.48 1 2 4 0 0 0 0 0 0 0 # SizeSel_8P_4_8_BB_FisTropN2_8014
 -15 10 -999 -15 -1 99 -1 0 0 0 0 0 0 0 # SizeSel_8P_5_8_BB_FisTropN2_8014
 -25 5 -999 -0.91 -1 2 -6 0 0 0 0 0 0 0 # SizeSel_8P_6_8_BB_FisTropN2_8014

 0 2 1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_9_BB_North1_6514_9
 0.01 1 0.187409 0.187409 -1 0.05 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_9_BB_North1_6514_9
 -1 2 -0.0453453 -0.0453453 -1 0.05 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_9_BB_North1_6514_9
 35 100 52.0737 2 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_9_BB_North1_6514_9
 35 150 75.868 3 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_9_BB_North1_6514_9
 40 150 91.5467 6 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_9_BB_North1_6514_9
 40 150 111.737 12 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_9_BB_North1_6514_9
 60 200 163.526 20 -1 0.5 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_9_BB_North1_6514_9
 -5 1 -3.3134 -2.78 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_9_BB_North1_6514_9
 -5 1 -1.37215 -4.9 -1 2 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_9_BB_North1_6514_9
 -5 1 -1 0 -1 2 -2 0 0 0 0 0 0 0 # SizeSpline_Val_3_9_BB_North1_6514_9
 -5 1 -1.09731 -0.77 -1 2 3 0 0 0 0 0 0 0 # SizeSpline_Val_4_9_BB_North1_6514_9
 -5 3 -2.42727 0 -1 2 3 0 0 0 0 0 0 0 # SizeSpline_Val_5_9_BB_North1_6514_9

 0 2 2 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_10_Japan_LL1_6114_10
 -0.001 1 0.158976 0 1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_10_Japan_LL1_6114_10
 -1 0.001 -0.209663 0 1 0.01 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_10_Japan_LL1_6114_10
 1 10 72.9754 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_10_Japan_LL1_6114_10
 1 10 95.3351 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_10_Japan_LL1_6114_10
 1 10 108.818 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_10_Japan_LL1_6114_10
 1 10 122.828 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_10_Japan_LL1_6114_10
 1 10 154.473 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_10_Japan_LL1_6114_10
 -9 7 -3.28159 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_10_Japan_LL1_6114_10
 -9 7 -1.61254 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_10_Japan_LL1_6114_10
 -9 7 -1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Val_3_10_Japan_LL1_6114_10
 -9 7 -1.00332 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_4_10_Japan_LL1_6114_10
 -9 7 -3.19485 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_5_10_Japan_LL1_6114_10

 35 200 119.497 100 -1 99 2 0 0 0 0 0 7 2 # SizeSel_11P_1_11_Japan_LL2_6114
 -25 0 -2.9572 -18.57 -1 99 3 0 0 0 0 0 0 0 # SizeSel_11P_2_11_Japan_LL2_6114
 -20 10 6.85237 -0.98 -1 99 2 0 0 0 0 0 0 0 # SizeSel_11P_3_11_Japan_LL2_6114
 0 10 6.9912 -2.48 -1 99 5 0 0 0 0 0 7 2 # SizeSel_11P_4_11_Japan_LL2_6114
 -15 10 -999 -15 -1 99 -1 0 0 0 0 0 0 0 # SizeSel_11P_5_11_Japan_LL2_6114    just decay small fish
 -20 5 -12.2664 2 -1 99 5 0 0 0 0 0 7 2 # SizeSel_11P_6_11_Japan_LL2_6114

 0 2 2 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_12_Japan_LL3_6114_12
 -0.001 1 0.117511 0 1 0.001 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_12_Japan_LL3_6114_12
 -1 0.001 -0.100997 0 1 0.001 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_12_Japan_LL3_6114_12
 1 10 68.7654 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_12_Japan_LL3_6114_12
 1 10 100.315 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_12_Japan_LL3_6114_12
 1 10 117.323 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_12_Japan_LL3_6114_12
 1 10 131.825 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_12_Japan_LL3_6114_12
 1 10 163.315 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_12_Japan_LL3_6114_12
 -9 7 -3.60999 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_12_Japan_LL3_6114_12
 -9 7 -1.65234 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_12_Japan_LL3_6114_12
 -9 7 -1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Val_3_12_Japan_LL3_6114_12
 -9 7 -0.778985 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_4_12_Japan_LL3_6114_12
 -9 7 -2.47827 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_5_12_Japan_LL3_6114_12

 0 2 2 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_13_Others1_LL_6514_13
 -0.001 1 0.132139 0 1 0.001 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_13_Others1_LL_6514_13
 -1 0.001 -0.208656 0 1 0.001 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_13_Others1_LL_6514_13
 1 10 70.9433 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_13_Others1_LL_6514_13
 1 10 94.7014 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_13_Others1_LL_6514_13
 1 10 108.856 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_13_Others1_LL_6514_13
 1 10 123.175 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_13_Others1_LL_6514_13
 1 10 153.053 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_13_Others1_LL_6514_13
 -9 7 -3.40089 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_13_Others1_LL_6514_13
 -9 7 -1.49272 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_13_Others1_LL_6514_13
 -9 7 -1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Val_3_13_Others1_LL_6514_13
 -9 7 -0.841203 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_4_13_Others1_LL_6514_13
 -9 7 -2.81387 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_5_13_Others1_LL_6514_13

 35 200 132.366 100 -1 99 2 0 0 0 0 0 5 2 # SizeSel_14P_1_14_Others2_LL_6514
 -25 0 -14.4714 -18.57 -1 99 3 0 0 0 0 0 0 0 # SizeSel_14P_2_14_Others2_LL_6514
 -20 10 6.91991 -0.98 -1 99 2 0 0 0 0 0 0 0 # SizeSel_14P_3_14_Others2_LL_6514
 0 10 5.81482 -2.48 -1 99 5 0 0 0 0 0 5 2 # SizeSel_14P_4_14_Others2_LL_6514
 -15 0 -999 -15 -1 99 -1 0 0 0 0 0 0 0 # SizeSel_14P_5_14_Others2_LL_6514
 -20 5 -2.46199 2 -1 99 5 0 0 0 0 0 5 2 # SizeSel_14P_6_14_Others2_LL_6514

 0 2 2 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Code_15_Others3_LL_6114_15
 -0.001 1 0.100865 0 1 0.001 3 0 0 0 0 0 0 0 # SizeSpline_GradLo_15_Others3_LL_6114_15
 -1 0.001 -0.0852427 0 1 0.001 3 0 0 0 0 0 0 0 # SizeSpline_GradHi_15_Others3_LL_6114_15
 1 10 67.4643 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_1_15_Others3_LL_6114_15
 1 10 101.601 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_2_15_Others3_LL_6114_15
 1 10 120.607 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_3_15_Others3_LL_6114_15
 1 10 135.426 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_4_15_Others3_LL_6114_15
 1 10 166.584 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Knot_5_15_Others3_LL_6114_15
 -9 7 -3.69804 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_1_15_Others3_LL_6114_15
 -9 7 -1.6167 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_2_15_Others3_LL_6114_15
 -9 7 -1 0 -1 0 -99 0 0 0 0 0 0 0 # SizeSpline_Val_3_15_Others3_LL_6114_15
 -9 7 -0.683593 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_4_15_Others3_LL_6114_15
 -9 7 -2.35326 0 1 0.001 2 0 0 0 0 0 0 0 # SizeSpline_Val_5_15_Others3_LL_6114_15

 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_1_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_2_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_3_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_4_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_5_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_6_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_7_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_8_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_9_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_10_1_PS_ESFR2_6585
 -5 9 9 9 -1 99 -3 0 0 0 0 0.5 0 0 # AgeSel_1P_11_1_PS_ESFR2_6585
#_Cond 0 #_custom_sel-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
1 #_custom_sel-blk_setup (0/1)
 0.01 1 0.675541 0.51892 1 2 5 # SizeSpline_GradLo_3_PS_ESFR2_9114_3_BLK4repl_2008
 0.05 1 0.109363 0.50803 1 2 5 # SizeSpline_GradHi_3_PS_ESFR2_9114_3_BLK4repl_2008
 -5 1 -2.32385 -0.68458 1 2 5 # SizeSpline_Val_1_3_PS_ESFR2_9114_3_BLK4repl_2008
 -5 1 -0.306186 -2.7376 1 2 5 # SizeSpline_Val_2_3_PS_ESFR2_9114_3_BLK4repl_2008
 -5 1 -1.75473 -4.57259 1 2 5 # SizeSpline_Val_4_3_PS_ESFR2_9114_3_BLK4repl_2008
 -5 1 -1.04439 -2.77911 1 2 5 # SizeSpline_Val_5_3_PS_ESFR2_9114_3_BLK4repl_2008

 -5 1 -3.37637 -0.68458 1 2 5 # SizeSpline_Val_1_5_BB+PS_Ghana2_6517_5_BLK4repl_2008
 -5 1 -1.87181 -2.7376 1 2 5 # SizeSpline_Val_2_5_BB+PS_Ghana2_6517_5_BLK4repl_2008
 -5 1 -0.988284 -4.57259 1 2 5 # SizeSpline_Val_4_5_BB+PS_Ghana2_6517_5_BLK4repl_2008
 -5 1 -2.8235 -2.77911 1 2 5 # SizeSpline_Val_5_5_BB+PS_Ghana2_6517_5_BLK4repl_2008

 35 200 131.703 100 -1 99 6 # SizeSel_11P_1_11_Japan_LL2_6114_BLK6repl_1979
  35 200 131.703 100 -1 99 6 # SizeSel_11P_1_11_Japan_LL2_6114_BLK6repl_1979

 0 10 6.5326 -2.48 -1 99 6 # SizeSel_11P_4_11_Japan_LL2_6114_BLK6repl_1979
 0 10 6.5326 -2.48 -1 99 6 # SizeSel_11P_4_11_Japan_LL2_6114_BLK6repl_1979

 -20 5 -1.93322 2 -1 99 6 # SizeSel_11P_6_11_Japan_LL2_6114_BLK6repl_1979
 -20 5 -1.93322 2 -1 99 6 # SizeSel_11P_6_11_Japan_LL2_6114_BLK6repl_1979

 35 200 145.27 145.27  1 0.5 6 # SizeSel_14P_1_14_Others2_LL_6514_BLK5repl_2005  N prior
 0 10 1.826  1.826   1 .5 6 # SizeSel_14P_4_14_Others2_LL_6514_BLK5repl_2005     N prior
 -20 5 5 2 -1 99 -6 # SizeSel_14P_6_14_Others2_LL_6514_BLK5repl_2005
#_Cond No selex parm trends
#_Cond -4 # placeholder for selparm_Dev_Phase
2 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_survey_CV
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
2.426895 14.44283 0.9693894 5.681382 0.5283447 0.5672596      1 1.250765 0.9799648 1.089352 1.791741 1.455788 1.875669 2.484382 1.086019     #_mult_by_lencomp_N
 # 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_lencomp_N
  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_agecomp_N
  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_size-at-age_N
#
2 #_maxlambdaphase
1 #_sd_offset
#
23 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch;
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet/survey  phase  value  sizefreq_method

 1 8 1 0 1    #turn off SP DKR BB
 1 11 1 1 1
 4 1  1 0.1  1
 4 2  1 0.1  1
 4 3  1 0.1  1
 4 4  1 0.1  1
 4 5  1 0.1  1
 4 6  1 0.1  1
 4 7  1 0.1  1
 4 8  1 0.1  1
 4 9  1 0.1  1
 4 10 1 0.1  1
 4 11 1 0.1  1
 4 12 1 0.1  1
 4 13 1 0.1  1
 4 14 1 0.1  1
 4 15 1 0.1  1
 7 1 1 0 1
 7 5 1 0 1
 7 6 1 0 1
 7 8 1 0 1
 7 9 1 0 1
 7 11 1 0 1
#
# lambdas (for info only; columns are phases)
#  0 0 #_CPUE/survey:_1
#  0 0 #_CPUE/survey:_2
#  0 0 #_CPUE/survey:_3
#  0 0 #_CPUE/survey:_4
#  0 0 #_CPUE/survey:_5
#  0 0 #_CPUE/survey:_6
#  0 0 #_CPUE/survey:_7
#  0 0 #_CPUE/survey:_8
#  0 0 #_CPUE/survey:_9
#  0 0 #_CPUE/survey:_10
#  1 1 #_CPUE/survey:_11
#  0 0 #_CPUE/survey:_12
#  0 0 #_CPUE/survey:_13
#  0 0 #_CPUE/survey:_14
#  0 0 #_CPUE/survey:_15
#  0.5 0.5 #_lencomp:_1
#  0.5 0.5 #_lencomp:_2
#  0.5 0.5 #_lencomp:_3
#  0.5 0.5 #_lencomp:_4
#  0.5 0.5 #_lencomp:_5
#  0.5 0.5 #_lencomp:_6
#  0.5 0.5 #_lencomp:_7
#  0.5 0.5 #_lencomp:_8
#  0.5 0.5 #_lencomp:_9
#  0.5 0.5 #_lencomp:_10
#  0.5 0.5 #_lencomp:_11
#  0.5 0.5 #_lencomp:_12
#  0.5 0.5 #_lencomp:_13
#  0.5 0.5 #_lencomp:_14
#  0.5 0.5 #_lencomp:_15
#  1 1 #_init_equ_catch
#  1 1 #_recruitments
#  1 1 #_parameter-priors
#  1 1 #_parameter-dev-vectors
#  1 1 #_crashPenLambda
#  1 1 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

