#V3.30.07.01-trans;_2017_08_07;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#C control file for a HKE (1 Fishery 1 Survey)
#_data_and_control_files: hke17_18_length_agecomp.dat // hke17_18_length_agecomp.ctl
#V3.30.07.01-trans;_2017_08_07;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis

0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters

1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#

4 ##CF 2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
1 1 1 0 # recruitment assignment to GP, month, area, age. Original setting
##CF 1 5.5 1 0

#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#

0 #_Nblock_Patterns
#1 #_blocks_per_pattern 
# begin and end years of blocks
#1997 1997
#

# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 ##CF 0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#

1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
4 ##_N_breakpoints
#_Age_natmort_by sex x growthpattern
##CF 0.2 0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2
##CF 0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2
#0.898	0.651	0.440	0.345	0.290	0.254	0.229	0.211	0.197	0.186	0.177	0.169	0.163	0.158	0.154	0.150	0.147	0.144	0.142	0.140	0.138	# Then_females 	
#1.247	0.899	0.609	0.480	0.408	0.362	0.330	0.307	0.290	0.277	0.267	0.258	0.252	0.246	0.242	0.238	0.235	0.232	0.230	0.228	0.226	# Then_males 	
#0.873	0.503	0.363	0.291	0.246	0.216	0.150	0.146	0.142	0.138	0.135	0.132	0.129	0.126	0.124	0.122	0.120	0.118	0.116	0.115	2       #0.113 # Chen&Watanabe
#0.883	0.525	0.390	0.319	0.276	0.247	0.214	0.205	0.196	0.189	0.183	0.178	0.174	0.170	0.167	0.164	0.162	0.161	0.160	0.159	2       #0.158 # Chen&Watanabe
#0.873	0.503	0.363	0.291	0.246	0.216	0.150	0.146	0.142	0.138	0.135	0.132	0.129	0.126	0.124	0.122	0.120	0.118	0.116	0.115	1.      # Chen&Watanabe
#0.883	0.525	0.390	0.319	0.276	0.247	0.214	0.205	0.196	0.189	0.183	0.178	0.174	0.170	0.167	0.164	0.162	0.161	0.160	0.159	1.      # Chen&Watanabe

0 1 5 20

1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0.5 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)

1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W

0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 # 2 ##CF 1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#

#_growth_parms

#########################

#### FEMALE PARAMETERS:
#_LO      HI        INIT    PRIOR    PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn

0.15     1.40      1.31       0.2      10    0      -3  0 0 0 0 0 0 0 # F
0.15     1.40      0.61       0.2      10    0      -3  0 0 0 0 0 0 0 # F
#0.15     0.40      0.34       0.2      10    0      -3  0 0 0 0 0 0 0 # F
0.15     0.40      0.26       0.2      10    0      -3  0 0 0 0 0 0 0 # F
0.15     0.40      0.17       0.2      10    0      -3  0 0 0 0 0 0 0 # F
2         20        8.0       10.55    0.5    -2       3  0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
#2        20        7.7       7.7      10    0      3  0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
50        140       111       111      10    2      4  0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
0.03      0.5       0.0999    0.0999   0.8   0      4  0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1

0.05      0.55      0.25       0.1     0.8   0       3  0 0 0 0 0 0 0 # CV_young_Fem_GP_1
0.05      0.45      0.05       0.1     0.8   0       -3  0 0 0 0 0 0 0 # CV_old_Fem_GP_1

0.0003    0.02      9.42e-06   0.007   0.8   0      -99 0 0 0 0 0 0 0 # Wtlen_1_Fem
2         4         3.0635    3.0368  0.8   0      -99 0 0 0 0 0 0 0 # Wtlen_2_Fem

12        40        32        14      0.8   0      -99 0 0 0 0 0 0 0 # Mat50%_Fem
1         3         -0.7      -0.25   0.8   0      -99 0 0 0 0 0 0 0 # Mat_slope_Fem

0.002     2         1         1       0.8   0      -99 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
0.1       3         0         1       0.8   0      -99 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem


#########################

#### MALE PARAMETERS:
#_LO      HI        INIT    PRIOR    PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn

0      1.5       1.37         0.2      10    0      -3  0 0 0 0 0 0 0 # M
0      1.5       0.70         0.2      10    0      -3  0 0 0 0 0 0 0 # M
#0      0.5       0.39         0.2      10    0      -3  0 0 0 0 0 0 0 # M
0      0.5       0.30         0.2      10    0      -3  0 0 0 0 0 0 0 # M
0      0.5       0.22         0.2      10    0      -3  0 0 0 0 0 0 0 # M
#SA -0.5      0.5       0         0.2      10    0     -3  0 0 0 0 0 0 0 # L_at_Amin_M_GP_1
#SA -1.5      0         -0.4      7        10    0      3  0 0 0 0 0 0 0 # L_at_Amax_M_GP_1
#SA -0.5      1.5       0         0.2      10    0      3  0 0 0 0 0 0 0 # VonBert_K_M_GP_1
2         20        7.7       10.17      0.5    -2       3  0 0 0 0 0 0 0 # L_at_Amin_M_GP_1
30        100       73        73       10    2      4  0 0 0 0 0 0 0 # LL_at_Amax_M_GP_1
0.03      0.5       0.1501    0.1501   0.8   0      4  0 0 0 0 0 0 0 # VonBert_K_M_GP_1

0.05      0.5       0.25         0.2      10    0     3  0 0 0 0 0 0 0 # CV_young_M_GP_1
0.05      0.5       0.05         0.2      10    0     -3  0 0 0 0 0 0 0 # CV_old_M_GP_1

0.0003    0.02      4.4e-06   0.007   0.8   0      -99 0 0 0 0 0 0 0 # Wtlen_1_M
2         4         3.1397     3.0368  0.8   0      -99 0 0 0 0 0 0 0 # Wtlen_2_M

#########################

##CF 0          0       0        0      0     0     -99     0         0         0         0        0     0       0    # RecrDist_GP_1
##CF 0          0       0        0      0     0     -99     0         0         0         0        0     0       0    # RecrDist_Area_1
##CF 0          0       0        0      0     0     -99     0         0         0         0        0     0       0    # RecrDist_timing_1

1         1         1         1        1    0      -1  0 0 0 0 0 0 0 # CohortGrowDev
0.000001  0.999999 0.5        0.5     0.5   0      -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#

#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#


#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0 ##CF 1 # 0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature

#_LO    HI   INIT     PRIOR   PR_SD   PR_type   PHASE  env-var  use_dev  dev_mnyr  dev_mxyr   dev_PH   Block    Blk_Fxn #  parm_name
3       30   13       12       4        0         1        0        0        0         0         0        0       0     # SR_LN(R0)
0.2     1    0.99      0.7      0.05     0       -2        0        0        0         0         0        0       0     # SR_BH_steep
#0      5    2        2        0.05     0        -2        0        0        0         0         0        0       0     # SR_sigmaR
0       5    0.6       2        0.05     0        -2        0        0        0         0         0        0       0     # SR_sigmaR

-5      5     0       0        1        0        -2       0        0        0         0         0        0       0     # SR_regime
0       0     0       0        0        0        -99       0        0        0         0         0        0       0     # SR_autocorr

#-5      5    -.2      0        1        0         4  # SR regime
##CF from SS3.30 manual: The SR_regime parameter replaces the R1 offset parameter. Setting a block for just the initial equilibrium year is equivalent to R1_offset. The SR regime parameter is intended to have a base value of 0.0 and not be estimated. Similar to cohort-growth deviation, it serves simply as a based for adding time-varying adjustments. This concept is similar to the old environment effect on deviates feature in v.3.24 and earlier
##CF from SS3.30 manual: Since R0 can be time-varying, what is regime shift for? Regime shift is for multi-year or environmentally driven deviations from R0 without changing R0 itself. Then the ***recruitment deviations are annual deviations from the current regime***. And these recruitment deviations can have autocorrelation


1 # 1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1980 # first year of main recr_devs; early devs can preceed this era
2019 # last year of main recr_devs; forecast devs start in following year
2 # 1 #_recdev phase 

1 #1 # (0/1) to read 13 advanced options
-10 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
6 # 1 #_recdev_early_phase

-2 # 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+

##CF from SS3.30 manual: The early era for Rec Dev is defined as a vector without sum to zero constraint, so it can have zeros during the earliest years not informed by data and then a few years with non-zero values without imposing a zero-centering on this collection of deviations. The main era for Rec Dev can be a vector of simple deviations, or a deviation vector but it is normally implemented as a deviation vector so that the spawner-recruitment function is its central tendency. The last era does not force a zero-centered deviation vector so it can have zeros during the actual forecast and non-zero values in last few years of the time series. 
#The early and last eras are optional, but their use can help prevent SS from balancing a preponderance of negative deviations in early years against a preponderance of positive deviations in later years. 
#When the 3 eras are used, it would be typically to turn on the main era during an early model phase, turn on the early era during a later phase, then have the last era turn on in the final phase.

1989.1   #_last_early_yr_nobias_adj_in_MPD 
1996.2   #_first_yr_fullbias_adj_in_MPD 
2019.0   #_last_yr_fullbias_adj_in_MPD 
2019.7   #_first_recent_yr_nobias_adj_in_MPD 
0.9764   #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models) 

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
#  1999E 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014F 2015F 2016F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
1.3 # F ballpark
-2008 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
0.10 1 0
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#10  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#


#_initial_F_parms; count = 7
#LO HI INIT PRIOR PR_SD  PR_type  PHASE
0   1.5   0.5  0.1   99     0         1 # InitF_seas_1_flt_1GSA17_OTB_ITA
0   1.5   0.5  0.1   99     0         1 # InitF_seas_1_flt_2GSA17_OTB_HRV
0   1.5   0.2  0.1   99     0         1 # InitF_seas_1_flt_3GSA17_LLS_HRV
0   1.5   0.5  0.1   99     0         1 # InitF_seas_1_flt_4GSA18_OTB_ITA
0   1.5   0.2  0.1   99     0         1 # InitF_seas_1_flt_5GSA18_LLS_ITA
0   1.5   0.1  0.05  99     0         1 # InitF_seas_1_flt_6GSA18_OTB_MNE
0   1.5   0.1  0.05  99     0         1 # InitF_seas_1_flt_7GSA18_OTB_ALB
#2016 2016
# F rates by fleet
# Yr:  1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# GSA17_OTB_ITA 0.2416 0.24197 0.20701 0.205624 0.236347 0.314413 0.30392 0.414126 0.467998 0.42934 0.39944 0.355781 0.272247 0.220188 0.2783 0.363542 0.313436 0.361161 1.43252e-005
# GSA17_OTB_HRV 0.102645 0.0706594 0.0617189 0.0575214 0.0628358 0.0456949 0.0675975 0.0881835 0.0976566 0.11046 0.0902167 0.108014 0.0898537 0.120274 0.182136 0.217274 0.205236 0.17072 5.4706e-006
# GSA17_LLS_HRV 0.00327883 0.00223607 0.00195706 0.0018256 0.00219821 0.00175943 0.00276891 0.0039966 0.00480812 0.0059468 0.00452395 0.0053874 0.00594872 0.00539557 0.00478419 0.00898729 0.00849182 0.00580056 2.36825e-007
# GSA18_OTB_ITA 0.158476 0.0872366 0.0886273 0.0866096 0.0757957 0.098912 0.100601 0.114712 0.169498 0.136543 0.15188 0.161038 0.162503 0.169312 0.142293 0.134809 0.0966259 0.10418 5.70484e-006
# GSA18_LLS_ITA 0.0233285 0.0127406 0.0126788 0.0123441 0.0110145 0.00743591 0.00787086 0.0166326 0.0350187 0.0301358 0.0300521 0.0319512 0.03848 0.034257 0.0374228 0.0123555 0.0182001 0.02775 1.15419e-006
# GSA18_OTB_MNE 0.0118835 0.012619 0.013565 0.0166514 0.00895734 0.0175101 0.0225825 0.0131917 0.0148621 0.0152894 0.0182343 0.0166184 0.0147154 0.0119723 0.0128643 0.013945 0.0148732 0.012907 5.89459e-007
# GSA18_OTB_ALB 0.0870177 0.0904929 0.088886 0.10099 0.0520172 0.0992761 0.122935 0.0707613 0.0775851 0.0802727 0.0862755 0.107846 0.0941463 0.106474 0.0785805 0.0726679 0.0644027 0.0658264 3.34455e-006
#
#_Q_setup
#fleet    ink l  ink_info  extra_se   biasadj   float  #  fleetname
8             1         0         1         0         1    #  Medits 1718
#SA 9         1         0         1         0         1    #  GSA17_MeditsHRV
#SA 10        1         0         1         0         1    #  GSA18_Medits
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#LO   HI    INIT     PRIOR   PR_SD  PR_type  PHASE  env-var  use_dev  dev_mnyr  dev_mxyr  dev_PH  Block  Blk_Fxn  #  parm_name
-15   15   -3.46414    0       1       0      -1       0       0       0          0       0        0       0   #LnQ_base_MEDITS 1718(8)
0     1     0.01        0       0       0      -2      0       0       0          0       0        0       0   #Q_extraSD_MEDITS 1718(8)
#SA -15   15   -3.30647    0       1       0      -1       0       0       0          0       0        0       0   #LnQ_base_GSA17_MeditsHRV(9)
#SA 0     1     0.1        0       0       0      -99      0       0       0          0       0        0       0   #Q_extraSD_GSA17_MeditsHRV(9)
#SA -15   15   -4.23642    0       1       0      -1       0       0       0          0       0        0       0   #LnQ_base_GSA18_Medits(10)
#SA 0     1     0.1        0       0       0      -99      0       0       0          0       0        0       0   #Q_extraSD_GSA18_Medits(10)
#_no timevary Q parameters
#

#_size_selex_types
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
24 0 0 0 # 1 GSA17_OTB_ITA
24 0 0 0 # 2 GSA17_OTB_HRV
24 0 0 0 # 3 GSA17_LLS_HRV
24 0 0 0 # 4 GSA18_OTB_ITA
1 0 0 0 # 5 GSA18_LLS_ITA
24 0 0 0 # 6 GSA18_OTB_MNE
15 0 0 1 # 7 GSA18_OTB_ALB
24 0 0 0 # 8 GSA17_MeditsITA (selectivity 1: logistic)
#SA 24 0 0 0 ##CF 15 0 0 8 # 9 GSA17_MeditsHRV
#SA 24 0 0 0 # 10 GSA18_Medits
#
#_age_selex_types
#_Pattern Discard Male Special
11 0 0 0 # 1 GSA17_OTB_ITA
15 0 0 1 # 2 GSA17_OTB_HRV
15 0 0 1 # 3 GSA17_LLS_HRV
15 0 0 1 # 4 GSA18_OTB_ITA
15 0 0 1 # 5 GSA18_LLS_ITA
15 0 0 1 # 6 GSA18_OTB_MNE
15 0 0 1 # 7 GSA18_OTB_ALB
15 0 0 1 # 8 GSA17_MeditsITA
#SA 15 0 0 1 # 9 GSA17_MeditsHRV
#SA 15 0 0 1 # 10 GSA18_Medits
#

# 17 OTB ITA    ***FLEET 1***
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
6	   40 	   18.0	   18.0         -1    0.05	 2    	0	0	0	0	0	0	0	#	M - PEAK	value
-1000	 3.0	   -999	   -999	    -1    0.05	 -4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-5.0	 3.0	   -1	   -12	    -1    0.05	 -4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
-5.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-2.0	 10.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
-1000	 5.0	   -999	  -999	    -1    0.05	-2  	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17


#17 OTB CRO     ***FLEET 2***
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
 6	 40 	   18.0	   18.0         -1    0.05	 2    	0	23	2010	2018	3	0	0	#	M - PEAK	value
-1000	 3.0	   -999	   -999	    -1    0.05	 -4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-5.0	 3.0	   -1	   -12	    -1    0.05	 -4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
-5.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-2.0	 10.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
-1000	 5.0	   -999	  -999	    -1    0.05	-2  	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17


##17 LLS CRO     ***FLEET 3***
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
30	   60 	   40	     40     -1    0.05	 2    	0	0	0	0	0	0	0	#	M - PEAK	value
-1000.0	 3.0	   -999	   -999	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-6.0	 3.0	   -1	   -12	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
-5.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-2.0	 10.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
-1000	 5.0	   -999	  -999	    -1    0.05	-2  	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17

## Now Male Selectivity as an Offset from Female Selectivity:
## From SS3.30 Manual:
## P1 – size (age) at which a dogleg occurs (set to an integer at a bin boundary and do not estimate)
## P2 – log(relative selectivity) at minL or age=0. Typically this will be set to a value of 0.0 (for no offset) and not estimated. It would be a rare circumstance in which the youngest/smallest fish had sex-specific selectivity.
## P3 – log(relative selectivity) at the dogleg
## P4 – log(relative selectivity) at maxL or max age.
#6.0	   92.1	   60	     36.0	    -1	0.05	 -2	    0	0	0	0	0	0	0	#	P1
#-5.0	 3.0	   0        -15.0	    -1	0.05	 -3	    0	0	0	0	0	0	0	#	P2
#-5	   3	   0	     4.5	    -1	0.05	  3	    0	0	0	0	0	0	0	#	P3
#-15	   10	   4.8	     4.8	    -1	0.05	  3	    0	0	0	0	0	0	0	#	P4


### 18 OTB ITA     ***FLEET 4***
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
 6	   40 	   18.0	   18.0         -1    0.05	 2    	0	23	2002	2007	3	0	0	#	M - PEAK	value
-1000	 3.0	   -999	   -999	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-5.0	 3.0	   -1	   -12	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
-5.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-2.0	 15.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
-1000	 5.0	   -999	  -999	    -1    0.05	-2  	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17


##18 LLS ITA      ***FLEET 5***
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
30	   60 	   40	     40         -1    0.05	 2    	0	0	0	0	0	0	0	#	M - PEAK	value
#-1000	  3	   -999	    -999    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-15	   15	   -1	    -12	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
-5.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
#-2.0	 15.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
#-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
#-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
##To set asymptotic selectivity, set the last para at 9 and do not estimate
#0.05 	 1.0	   0.05	   0.9	    -1    0.05	-3  	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17

## Now Male Selectivity as an Offset from Female Selectivity:
## From SS3.30 Manual:
## P1 – size (age) at which a dogleg occurs (set to an integer at a bin boundary and do not estimate)
## P2 – log(relative selectivity) at minL or age=0. Typically this will be set to a value of 0.0 (for no offset) and not estimated. It would be a rare circumstance in which the youngest/smallest fish had sex-specific selectivity.
## P3 – log(relative selectivity) at the dogleg
## P4 – log(relative selectivity) at maxL or max age.
#6.0	   92.1	   60	     36.0	    -1	0.05	 -2	    0	0	0	0	0	0	0	#	P1
#-5.0	   3.0	   0        -15.0	    -1	0.05	 -3	    0	0	0	0	0	0	0	#	P2
#-5	   5	   0	     4.8   	    -1	0.05	  3	    0	0	0	0	0	0	0	#	P3
#-8	   10	   4.8	     4.8	    -1	0.05	  3 	    0	0	0	0	0	0	0	#	P4

#18 MON            ***FLEET 6***
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
 6	 30 	   18.0	   18.0     -1    0.05	 2    	0	0	0	0	0	0	0	#	M - PEAK	value
-1000	 3.0	   -999	   -999	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-5.0	 3.0	   -1	   -12	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
-8.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-2.0	 10.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
-1000	 5.0	   -999	  -999	    -1    0.05	-2  	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17

#18 ALB     ***FLEET 7***   
#LO	      HI	INIT	PRIOR	PR_type	   SD	PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
# 6	 30 	   18.0	   18.0     -1  0.05	 2    	0	0	0	0	0	0	0	#	M - PEAK	value
#-1000	 3.0	   -999	   -999	    -1  0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-8.0	 3.0	   -1	   -12	    -1  0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-8.0	 12.0	   4.4	   4.4	    -1	0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
#-2.0	 10.0	   4.4	   4.4	    -1	0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
#-1000	 5.0	   -999	  -999	    -1	0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
#-1000	 5.0	   -999	  -999	    -1  0.05	-2  	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17

# 17 MEDITS ITA          ***FLEET 8***
#LO	      HI	INIT	PRIOR	PR_type	   SD	PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
 6	 25 	   18.0	   18.0     -1  0.05	 2    	0	0	0	0	0	0	0	#	M - PEAK	value
-1000	 3.0	   -999	   -999	    -1    0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-8.0	 3.0	   -1	   -12	    -1  0.05	-4    	0	0	0	0	0	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
-8.0	 12.0	   4.4	   4.4	    -1	0.05	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-2.0	 10.0	   5.00753  4.4	    -1	0.05 	 3    	0	0	0	0	0	0	0	#	M - WIDTH	exp
-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
-1000	 5.0	   -999	  -999	    -1    0.05	-2   	0	0	0	0	0	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17
#

# 17 MEDITS CRO          ***FLEET 9***
#LO	      HI	INIT	PRIOR	PR_type	   SD	PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
# 5	 30 	    18.0   18.0     -1    0.05	 2    	0	0	0	0	0.5	0	0	#	M - PEAK	value
# -5.0	 3.0	   -12	   -12	    -1    0.05	-3    	0	0	0	0	0.5	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-8.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0.5	0	0	#	M - WIDTH	exp
#-2.0	 10.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0.5	0	0	#	M - WIDTH	exp
#-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0.5	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
#-1000	 5.0	   -999	  -999	    -1    0.05	-2  	0	0	0	0	0.5	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17
#

# 18 MEDITS ITA        ***FLEET 10***
#LO	      HI	INIT	PRIOR	PR_type	   SD	PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
#LO	    HI	  INIT	 PRIOR  PR_type SD   PHASE	env-variable	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block_Pattern	Block_Type			
# 5	 30 	   18.0	   18.0     -1    0.05	 2    	0	0	0	0	0.5	0	0	#	M - PEAK	value
# -5.0	 3.0	   -12	   -12	    -1    0.05	-3    	0	0	0	0	0.5	0	0	#	M - TOP	logistic - FISHERY1 OTB ITA GSA 17
#-8.0	 12.0	   4.4	   4.4	    -1	  0.05	 3    	0	0	0	0	0.5	0	0	#	M - WIDTH	exp
#-2.0	 10.0	   4.4	   4.4	    -1	  0.05 	 3    	0	0	0	0	0.5	0	0	#	M - WIDTH	exp
#-1000	 5.0	   -999	  -999	    -1	  0.05	-2    	0	0	0	0	0.5	0	0	#	M - INIT	logistic - FISHERY1 OTB ITA GSA 17
#-1000	 5.0	   -999	  -999	    -1    0.05	-2  	0	0	0	0	0.5	0	0	#	M - FINAL	logistic  - FISHERY1 OTB ITA GSA 17

### AGE SELECTIVITIES:
-1      6       0        -1    -1    0    -2  0	0	0	0	 0	0	0   #  AgeSel_P1_GSA17_OTB_ITA(1)
 8     30      20        -1    -1    0    -2  0	0	0	0	 0	0	0   #  AgeSel_P2_GSA17_OTB_ITA(1)

# Dirichlet-Multinomial parameters controlling age-comp weights
#            -5            5            5             0            99             0          2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
#            -5            5            5             0            99             0          -2          0          0          0          0          0          0          0  #  ln(EffN_mult)_2
#	    -5            5            5             0            99             0          -2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
# 	    -5            5            5             0            99             0          -2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
# 	    -5            5            5             0            99             0          -2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
#	    -5            5            5             0            99             0          -2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
#	    -5            5            5             0            99             0          2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
#	    -5            5            5             0            99             0          -2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
#	    -5            5            5             0            99             0          2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
#	    -5            5            5             0            99             0          2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1

# timevary selex parameters 
#         LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        0.0001            50         2          2.25           0.5             0      -5  # SizeSel_P1_Active(1)_dev_se
         -0.99          0.99         0             0           0.5             0      -6  # SizeSel_P1_Active(1)_dev_autocorr
        0.0001             50        2          0.05           0.5             0      -5  # SizeSel_P2_Active(1)_dev_se
         -0.99          0.99         0             0           0.5             0      -6  # SizeSel_P2_Active(1)_dev_autocorr
#        0.0001             50        2          2.25           0.5             0      -5  # SizeSel_P1_Passive(2)_dev_se
#         -0.99          0.99         0             0           0.5             0      -6  # SizeSel_P1_Passive(2)_dev_autocorr

#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
#

# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
#
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value_Francis_4iterations_mean
4	1	0.0571
4	2	1.2988 
4	3	1.8943 
4	4	0.3688
4	5	0.4153
4	6	0.7531
4	7	0.4962 
4	8	0.0541
5	5	0.09866
-9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
9 1 1 1 0
9 2 1 1 0
9 3 1 1 0
9 4 1 1 0
9 5 1 1 0
9 6 1 1 0
9 7 1 1 0
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 #_CPUE/survey:_4
#  0 0 0 0 #_CPUE/survey:_5
#  0 0 0 0 #_CPUE/survey:_6
#  0 0 0 0 #_CPUE/survey:_7
#  1 1 1 1 #_CPUE/survey:_8
#  1 1 1 1 #_CPUE/survey:_9
#  1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  1 1 1 1 #_lencomp:_5
#  1 1 1 1 #_lencomp:_6
#  0 0 0 0 #_lencomp:_7
#  1 1 1 1 #_lencomp:_8
#  1 1 1 1 #_lencomp:_9
#  1 1 1 1 #_lencomp:_10
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  1 1 1 1 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

