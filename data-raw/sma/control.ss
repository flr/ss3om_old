#V3.30.08.04-safe;_2017_11_08;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#C SS3_Control_NA_SMA_2017_15_ICCAT_run_2_SSv324U.xlsx																																																																																																																																																																																								
#_data_and_control_files: DATA.SS // CONTROL.SS
#V3.30.08.04-safe;_2017_11_08;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1949 1949
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
4 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
 #_Age_natmort_by sex x growthpattern
 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0795 0.0785 0.0777 0.0769 0.0762 0.0749
 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0801 0.0795 0.0785 0.0777 0.0769 0.0762 0.0749
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
4 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Fecundity by growth pattern
 0 0 0 0 0 0 0 0 0 0 0 0 0.01 0.01 0.03 0.08 0.16 0.3 0.54 0.88 1.32 1.81 2.29 2.74 3.13 3.45 3.71 3.93 4.12 4.28 4.42
17 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 5 100 62.9093 62.9093 1000 6 -3 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 50 600 350.6 350.6 1000 6 -4 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.65 0.064 0.064 0.2 6 -5 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.01 0.3 0.0932677 0.0932677 999 6 -2 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.01 0.3 0.0898002 0.0898002 0.8 6 -3 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 -3 3 5.24e-06 5.24e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 -3 5 3.14 3.14 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
 1 300 275.013 275.013 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -200 3 -0.10755 -0.10755 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 50 6.68e-06 1e-05 0.8 6 -3 0 0 0 0 0.5 0 0 # Eggs_scalar_Fem_GP_1
 -3 3 2.34 2.34442 0.8 6 -3 0 0 0 0 0.5 0 0 # Eggs_exp_len_Fem_GP_1
 5 100 63.0138 63.0138 1000 6 -3 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 50 600 241.8 241.8 1000 6 -4 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 0.01 0.65 0.136 0.136 0.2 6 -5 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 0.01 0.3 0.0973418 0.0973418 999 6 -2 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 0.01 0.3 0.0824247 0.0824247 0.8 6 -3 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
 -3 3 5.24e-06 5.24e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal_GP_1
 -3 5 3.14 3.14 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal_GP_1
 -4 4 0 1 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -4 4 0 1 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 1 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_month_1
 1 1 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
7 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
           2.3         13.82       5.39732          7.04          1000             6          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.01             1         0.171          0.05          1000             6         -2          0          0          0          0          0          0          0 # SR_surv_Sfrac
          0.01            10             3             1          1000             6         -2          0          0          0          0          0          0          0 # SR_surv_Beta
           0.2           1.9      0.283103          0.28          1000             6         -4          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             6         -4          0          0          0          0          0          0          0 # SR_regime
            -5             5             0             0             1             6         -4          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1990 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
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
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1985E 1986E 1987E 1988E 1989E 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013F 2014F 2015F 2016F
#  -0.180787 -0.247456 -0.260663 -0.24219 -0.14895 -0.181161 -0.196874 -0.247453 -0.251579 -0.288723 -0.392818 -0.394327 -0.17273 0.0871654 0.0676062 0.25326 0.256242 -0.0539048 0.349114 0.460719 0.483315 0.213841 -0.0344907 0.0652898 0.193528 -0.0300509 -0.101216 -0.0847518 -0.0406292 -0.033692 -0.0443132 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.2 # F ballpark
-2010 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2016 2036
# F rates by fleet
# Yr:  1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# F1_EU_LL 0.00358138 0.00239827 0.00240111 0.00299349 0.000759267 0.00154051 0.000930527 0.00248793 0.0020707 0.0027389 0.00179834 0.00423731 0.00574351 0.00250033 0.00450332 0.00358799 0.00751946 0.00675942 0.00894356 0.00884333 0.00799524 0.00858033 0.00815899 0.00976073 0.00738543 0.00960083 0.00722703 0.00849332 0.00927688 0.00663602 0.00981239 0.0104087 0.0119409 0.0217868 0.0142891 0.0204608 0.0827221 0.100506 0.0823669 0.0506706 0.0851622 0.0874366 0.126404 0.156103 0.169511 0.186818 0.289808 0.22263 0.217577 0.209754 0.158473 0.159584 0.174515 0.220699 0.159625 0.176983 0.167856 0.185095 0.155744 0.182518 0.204139 0.169636 0.224938 0.171683 0.133587 0.13246 0.13246
# F2_JPN_LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00250921 0.00258434 0.00137436 0.00693896 0.0078097 0.00191231 0.00537935 0.00349343 0.00102842 0.00563368 0.00892295 0.00636411 0.0037507 0.00336968 0.00348412 0.00307248 0.00585651 0.00319147 0.0061248 0.00683234 0.00507877 0.0108012 0.015371 0.00828722 0.0248489 0.03685 0.0132981 0.049851 0.00712205 0.00833987 0.0062278 0.0250531 0.0147137 0.0305178 0 0 0.00387295 0.00588334 0.00433263 0.00525494 0.00251428 0.00279317 0.00174351 0.00391426 0.00282005 0.00282005
# F3_CTP_LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000703624 0.00115504 0.00132548 0.00159293 0.00165603 0.00189264 0.000558369 0.000106425 5.56273e-05 0.000261196 0.0011843 0.00051092 0.000306572 0.0010611 0.00127197 0.00198638 0.00205294 0.00250625 0.00429693 0.00333309 0.00281578 0.00313512 0.00214068 0.00395061 0.0037108 0.00208473 0.000297467 0.00127485 0.00406901 0.000643777 0.00253865 0.00170416 0.00066757 0.000861964 0.00064499 0.00064499
# F4_USA_LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000776917 0.000787794 0.000802806 0.00100679 0.00129326 0.00182296 0.00235174 0.00285028 0.00224805 0.00284191 0.00424707 0.00846912 0.00994835 0.0100437 0.00839951 0.00954701 0.00829342 0.00402599 0.00751101 0.00818131 0.00739037 0.00611605 0.007926 0.00765336 0.00509474 0.00842445 0.00718872 0.00796424 0.00834015 0.00817396 0.00798938 0.00813371 0.009324 0.0161902 0.0161902
# F5_VEN_LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.81685e-05 3.13759e-05 4.82345e-05 0.000158482 2.96625e-05 4.49293e-05 1.47495e-05 1.36745e-05 8.75e-05 0.000114445 0.000348967 0.000110593 2.69815e-05 7.48921e-05 8.82332e-05 0.000843933 0.000675282 0.000927316 0.00244247 0.000815102 0.000254135 0.000433714 6.7861e-05 0.00128416 0.000799019 0.000664489 0.000919805 0.000229818 0.000305948 0.000317946 0.000317946
# F6_CAN_LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00302842 0.00201193 0.0039047 0.00232367 0.00242244 0.00269067 0.00270314 0.00270855 0.00274005 0.00292894 0.00302447 0.00253986 0.0024121 0.00142418 0.00181424 0.00142777 0.00142759 0.00111143 0.00148322 0.00239394 0.00399631 0.00399631
# F7_MOR_LL 0 0 0 0 0 0 0 0 0 0 0 0.00013523 0.000270929 0.000135652 0.000407171 0.000316932 0.00027203 0.000249902 0.000296028 0.000365308 0.000320262 0.000481439 0.000344714 0.000230263 0.000276971 0.000347499 0.000278442 0.000139255 0.000255499 0.00483351 0.00316691 0.00290803 0.00215739 0.00299758 0.00191718 0.00341069 0.00464004 0.0053043 0.00573424 0.00680037 0.000780788 0.00312002 0.00144811 0.00100933 0.000278866 0.00120616 0.00168244 0.0126982 0 0.00204023 0.00211922 0.0135037 0.00721704 0.00980912 0.0108206 0.01329 0.0128791 0.00834986 0.0150455 0.0256558 0.0368849 0.0243968 0.0256645 0.045462 0.0458591 0.0678715 0.0678715
# F8_USA_RR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00703361 0.0113188 0.00687336 0.0175655 0.0571768 0.0261996 0.00977545 0.0176452 0.0155542 0.00648885 0.00529484 0.00661122 0.0187051 0.00952742 0.0460954 0.00832811 0.00646497 0.00631343 0.00311478 0.0133194 0.00972239 0.01099 7.78399e-06 0.0140369 0.0115521 0.0101141 0.00599538 0.00570726 0.00586444 0.00620029 0.00684218 0.0092383 0.00938996 0.00907878 0.00901956 0.00901956
# F9_BEL_LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000844327 0.00102637 0.00255868 0.00431218 0.00388659 5.09913e-05 2.61471e-05 2.61471e-05
# F10_MOR_PS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00187667 0.00175599 0.00374176 0.00347897 0.0117745 0.0117745
# F11_CPR_LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.19039e-05 0 0 0 0 0 0 0.00399101 0.000731861 0.000868666 0.00131524 0.000830984 0.00116954 0.00058854 0.000269202 8.62407e-05 8.62407e-05
# F12_OTH 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8.88489e-07 0 0 3.12547e-05 1.9169e-05 1.1675e-05 1.43673e-05 0.00029844 0.000263517 0.000205977 0.000242847 0.000138162 0.000634793 0.00154707 0.000932673 0.000907547 0.00146759 0.00175486 0.00239655 0.0019602 0.00143825 0.00167789 0.00565174 0.00199761 0.00116416 0.00419061 0.00349915 0.00499405 0.00108899 0.00188095 0.00256636 0.00268779 0.00227952 0.00122626 0.00122626
#
#_Q_setup for fleets with cpue or survey data
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
        13         1         0         0         0         1  #  S1_USA_LL_Log
        14         1         0         0         0         1  #  S2_USA_LL_Obs
        15         1         0         0         0         1  #  S3_JPN_LL
        16         1         0         0         0         1  #  S4_EU_POR_LL
        17         1         0         0         0         1  #  S5_EU_ESP_LL
        18         1         0         0         0         1  #  S6_CTP_LL
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -25            25      -6.77498             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_S1_USA_LL_Log(13)
           -25            25      -6.52171             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_S2_USA_LL_Obs(14)
           -25            25      -8.08142             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_S3_JPN_LL(15)
           -25            25      -6.21674             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_S4_EU_POR_LL(16)
           -25            25      -5.90003             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_S5_EU_ESP_LL(17)
           -25            25      -8.46643             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_S6_CTP_LL(18)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0 0 # 1 F1_EU_LL
 24 0 4 0 # 2 F2_JPN_LL
 24 0 3 0 # 3 F3_CTP_LL
 24 0 4 0 # 4 F4_USA_LL
 24 0 4 0 # 5 F5_VEN_LL
 5 0 0 4 # 6 F6_CAN_LL
 5 0 0 1 # 7 F7_MOR_LL
 5 0 0 4 # 8 F8_USA_RR
 5 0 0 5 # 9 F9_BEL_LL
 5 0 0 1 # 10 F10_MOR_PS
 5 0 0 3 # 11 F11_CPR_LL
 5 0 0 3 # 12 F12_OTH
 5 0 0 4 # 13 S1_USA_LL_Log
 5 0 0 4 # 14 S2_USA_LL_Obs
 5 0 0 2 # 15 S3_JPN_LL
 5 0 0 1 # 16 S4_EU_POR_LL
 5 0 0 1 # 17 S5_EU_ESP_LL
 5 0 0 3 # 18 S6_CTP_LL
#
#_age_selex_types
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 11 0 0 0 # 1 F1_EU_LL
 11 0 0 0 # 2 F2_JPN_LL
 11 0 0 0 # 3 F3_CTP_LL
 11 0 0 0 # 4 F4_USA_LL
 11 0 0 0 # 5 F5_VEN_LL
 11 0 0 0 # 6 F6_CAN_LL
 11 0 0 0 # 7 F7_MOR_LL
 11 0 0 0 # 8 F8_USA_RR
 11 0 0 0 # 9 F9_BEL_LL
 11 0 0 0 # 10 F10_MOR_PS
 11 0 0 0 # 11 F11_CPR_LL
 11 0 0 0 # 12 F12_OTH
 11 0 0 0 # 13 S1_USA_LL_Log
 11 0 0 0 # 14 S2_USA_LL_Obs
 11 0 0 0 # 15 S3_JPN_LL
 11 0 0 0 # 16 S4_EU_POR_LL
 11 0 0 0 # 17 S5_EU_ESP_LL
 11 0 0 0 # 18 S6_CTP_LL
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
          62.5         297.5       138.717        135.54          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_F1_EU_LL(1)
            -6             4      -5.51922            -6          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_F1_EU_LL(1)
            -1             9        6.7879           6.7          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_F1_EU_LL(1)
            -1             9       7.20089          7.25          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_F1_EU_LL(1)
            -5             9            -5            -5          0.05             1         -2          0          0          0          0        0.5          0          0  #  SizeSel_P5_F1_EU_LL(1)
            -5             9         -4.96            -5          0.05             1         -2          0          0          0          0        0.5          0          0  #  SizeSel_P6_F1_EU_LL(1)
          62.5         297.5       169.949        148.87          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_F2_JPN_LL(2)
            -6             4      -4.49743         -4.56          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_F2_JPN_LL(2)
            -1             9       7.55224          7.25          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_F2_JPN_LL(2)
            -1             9        6.3919          7.61          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_F2_JPN_LL(2)
            -5             9            -5            -5          0.05             1         -2          0          0          0          0        0.5          0          0  #  SizeSel_P5_F2_JPN_LL(2)
            -5             9      -2.75519            -5          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P6_F2_JPN_LL(2)
           -60           200      -21.8394         -2.81            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_F2_JPN_LL(2)
           -15            15       -0.7835         -0.93            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_F2_JPN_LL(2)
           -15            15        1.2666         -1.15            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_F2_JPN_LL(2)
           -15            15      -2.40075             0            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_F2_JPN_LL(2)
           -15            15      0.780928          0.62            50             0          5          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_F2_JPN_LL(2)
          62.5         297.5       166.356        159.98          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_F3_CTP_LL(3)
            -6             4      -2.13477            -6          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_F3_CTP_LL(3)
            -1             9       6.73048          6.81          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_F3_CTP_LL(3)
            -1             9       6.80602          7.08          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_F3_CTP_LL(3)
            -5             9            -5            -5          0.05             1         -2          0          0          0          0        0.5          0          0  #  SizeSel_P5_F3_CTP_LL(3)
            -5             9      -4.03113            -5          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P6_F3_CTP_LL(3)
          -200           200      -25.6778         -2.81            50             0          4          0          0          0          0          0          0          0  #  SzSel_Male_Peak_F3_CTP_LL(3)
           -15            15     -0.876732         -0.93            50             0          4          0          0          0          0          0          0          0  #  SzSel_Male_Ascend_F3_CTP_LL(3)
           -15            15      0.186204         -1.15            50             0          4          0          0          0          0          0          0          0  #  SzSel_Male_Descend_F3_CTP_LL(3)
           -15            15      0.503553             0            50             0          4          0          0          0          0          0          0          0  #  SzSel_Male_Final_F3_CTP_LL(3)
           -15            15       0.55261          0.62            50             0          5          0          0          0          0          0          0          0  #  SzSel_Male_Scale_F3_CTP_LL(3)
          62.5         297.5       165.514        127.99          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_F4_USA_LL(4)
            -6             4      -2.88409         -5.84          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_F4_USA_LL(4)
            -1             9       7.41022          7.33          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_F4_USA_LL(4)
            -1             9       6.51121          8.08          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_F4_USA_LL(4)
            -5             9      -1.37052          -2.5          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P5_F4_USA_LL(4)
            -5             9      -2.43048            -5          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P6_F4_USA_LL(4)
           -40           200      -25.2415         -2.81            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_F4_USA_LL(4)
           -15            15      -1.53766         -0.93            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_F4_USA_LL(4)
           -15            15       1.38631         -1.15            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_F4_USA_LL(4)
           -15            15      -2.63473             0            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_F4_USA_LL(4)
           -15            15      0.824315          0.62            50             0          5          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_F4_USA_LL(4)
          62.5         297.5        177.29        167.54          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_F5_VEN_LL(5)
            -6             4      -5.17778            -6          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_F5_VEN_LL(5)
            -1             9       7.24854          6.81          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_F5_VEN_LL(5)
            -1             9       6.78855          7.08          0.05             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_F5_VEN_LL(5)
            -5             9            -5            -5          0.05             1         -2          0          0          0          0        0.5          0          0  #  SizeSel_P5_F5_VEN_LL(5)
            -5             9      -2.19612            -5          0.05             1          2          0          0          0          0        0.5          0          0  #  SizeSel_P6_F5_VEN_LL(5)
          -200           200       20.1958         -2.81            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_F5_VEN_LL(5)
           -15            15       0.94356         -0.93            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_F5_VEN_LL(5)
           -15            15      0.201605         -1.15            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_F5_VEN_LL(5)
           -15            15      -2.16093             0            50             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_F5_VEN_LL(5)
           -15            15      0.724039          0.62            50             0          5          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_F5_VEN_LL(5)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_F6_CAN_LL(6)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_F6_CAN_LL(6)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_F7_MOR_LL(7)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_F7_MOR_LL(7)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_F8_USA_RR(8)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_F8_USA_RR(8)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_F9_BEL_LL(9)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_F9_BEL_LL(9)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_F10_MOR_PS(10)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_F10_MOR_PS(10)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_F11_CPR_LL(11)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_F11_CPR_LL(11)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_F12_OTH(12)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_F12_OTH(12)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_S1_USA_LL_Log(13)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_S1_USA_LL_Log(13)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_S2_USA_LL_Obs(14)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_S2_USA_LL_Obs(14)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_S3_JPN_LL(15)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_S3_JPN_LL(15)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_S4_EU_POR_LL(16)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_S4_EU_POR_LL(16)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_S5_EU_ESP_LL(17)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_S5_EU_ESP_LL(17)
             0            10             1             1            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_S6_CTP_LL(18)
            10           100            66            66            25             6        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_S6_CTP_LL(18)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F1_EU_LL(1)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F1_EU_LL(1)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F2_JPN_LL(2)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F2_JPN_LL(2)
             0            10           0.1             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F3_CTP_LL(3)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F3_CTP_LL(3)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F4_USA_LL(4)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F4_USA_LL(4)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F5_VEN_LL(5)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F5_VEN_LL(5)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F6_CAN_LL(6)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F6_CAN_LL(6)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F7_MOR_LL(7)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F7_MOR_LL(7)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F8_USA_RR(8)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F8_USA_RR(8)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F9_BEL_LL(9)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F9_BEL_LL(9)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F10_MOR_PS(10)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F10_MOR_PS(10)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F11_CPR_LL(11)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F11_CPR_LL(11)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_F12_OTH(12)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_F12_OTH(12)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_S1_USA_LL_Log(13)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_S1_USA_LL_Log(13)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_S2_USA_LL_Obs(14)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_S2_USA_LL_Obs(14)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_S3_JPN_LL(15)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_S3_JPN_LL(15)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_S4_EU_POR_LL(16)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_S4_EU_POR_LL(16)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_S5_EU_ESP_LL(17)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_S5_EU_ESP_LL(17)
             0            10          0.01             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P1_S6_CTP_LL(18)
            10           100            30             0            25             6        -99          0          0          0          0        0.5          0          0  #  AgeSel_P2_S6_CTP_LL(18)
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
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
#_Factor  Fleet  Value
      4      1    0.0483
      5      1         0
      6      1         0
      4      2    0.0569
      5      2         0
      6      2         0
      4      3    0.0396
      5      3         0
      6      3         0
      4      4    0.0997
      5      4         0
      6      4         0
      4      5    0.2537
      5      5         0
      6      5         0
      5      6         0
      6      6         0
      5      7         0
      6      7         0
      5      8         0
      6      8         0
      5      9         0
      6      9         0
      5     10         0
      6     10         0
      5     11         0
      6     11         0
      5     12         0
      6     12         0
      5     13         0
      6     13         0
      5     14         0
      6     14         0
      1     15    0.1459
      5     15         0
      6     15         0
      1     16    0.0578
      5     16         0
      6     16         0
      1     17    0.0886
      5     17         0
      6     17         0
      1     18     0.251
      5     18         0
      6     18         0
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 19 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 1 13 1 1 1
 1 14 1 0 1
 1 15 1 1 1
 1 16 1 1 1
 1 17 1 1 1
 1 18 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 4 5 1 1 1
 9 1 1 1 1
 9 2 1 1 1
 9 7 1 1 1
 10 1 1 1 1
 11 1 1 1 1
 12 1 1 1 1
 13 1 1 1 1
 17 1 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  0 #_CPUE/survey:_6
#  0 #_CPUE/survey:_7
#  0 #_CPUE/survey:_8
#  0 #_CPUE/survey:_9
#  0 #_CPUE/survey:_10
#  0 #_CPUE/survey:_11
#  0 #_CPUE/survey:_12
#  1 #_CPUE/survey:_13
#  0 #_CPUE/survey:_14
#  1 #_CPUE/survey:_15
#  1 #_CPUE/survey:_16
#  1 #_CPUE/survey:_17
#  1 #_CPUE/survey:_18
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  0 #_lencomp:_6
#  0 #_lencomp:_7
#  0 #_lencomp:_8
#  0 #_lencomp:_9
#  0 #_lencomp:_10
#  0 #_lencomp:_11
#  0 #_lencomp:_12
#  0 #_lencomp:_13
#  0 #_lencomp:_14
#  0 #_lencomp:_15
#  0 #_lencomp:_16
#  0 #_lencomp:_17
#  0 #_lencomp:_18
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

