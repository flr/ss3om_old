#V3.30.18.00;_safe;_compile_date:_Sep 30 2021;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C Northern stock Lophius piscatorius                           
#_data_and_control_files: databyGender.dat // control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
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
 2007 2022
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: P(y)=f(TVP,env_Zscore) w/ logit to stay in min-max;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  5: like 4 with logit transform to stay in base min-max
#_DevLinks(more):  21-25 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, wt-len, maturity, fecundity, (hermaphro), recr_distr, cohort_grow, (movement), (age error), (catch_mult), sex ratio 
#_NATMORT
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity
 #_Age_natmort_by sex x growthpattern (nest GP in sex)
 1 0.57 0.4 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36
 1 0.57 0.4 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
5 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
# Sex: 1  BioPattern: 1  Growth
 10 30 19.0399 22 3 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 90 210 165 190 15 0 -2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.35 0.112 0.11 0.05 0 -2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.005 0.5 0.25 0.2 0.8 0 -2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.005 0.5 0.1 0.2 0.8 0 -2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -1 1 3.03e-05 3.03e-05 0.05 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 2.82 2.82 0.05 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 40 100 82 61.84 5 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -1 1 -0.1001 -0.1001 0.5 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
# Sex: 2  BioPattern: 1  Growth
 10 30 27.4563 22 3 0 2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 60 210 100 190 15 0 -2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.05 0.3 0.204626 0.11 0.05 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 0.005 0.5 0.25 0.2 0.8 0 -2 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 0.005 0.5 0.1 0.2 0.8 0 -2 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 -1 1 3.03e-05 3.03e-05 0.05 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 2.82 2.82 0.05 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#  M2 parameter for each predator fleet
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
           1.5            30       11.6515             5             1             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2         0.999          0.92         0.999           0.2             0         -5          0          0          0          0          0          0          0 # SR_BH_steep
           0.1             2           0.6           0.6           0.2             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             2             0         -2          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0            -1             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1986 # first year of main recr_devs; early devs can preceed this era
2021 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 -6 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1976.5 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1986.3 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2021 #_last_yr_fullbias_adj_in_MPD
 2021.4 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.9591 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1980E 1981E 1982E 1983E 1984E 1985E 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020R 2021R 2022F
#  -0.681359 -0.426887 0.659069 0.48773 -1.02461 -0.689669 -0.205845 0.488586 -0.887324 -0.612056 -1.81499 -0.500079 0.455177 0.395618 0.167328 -0.0045649 -0.887685 -0.514915 -0.457384 0.403873 -0.894909 1.17907 0.308409 0.151044 0.984596 0.223367 -0.691823 -0.315852 0.333624 0.734572 0.506079 0.181342 0.231744 0.134604 0.93624 0.139352 -0.163492 -0.565168 0.401248 0.145965 0.440017 -0.425762 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-2001 # F ballpark year (neg value to disable)
4 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
2 # max F (methods 2-4) or harvest fraction (method 1)
# read list of fleets that do F as parameter; unlisted fleets stay hybrid, bycatch fleets must be included with start_PH=1, high F fleets should switch early
# (A) fleet, (B) F_initial_value (used if start_PH=1), (C) start_PH for parms (99 to stay in hybrid)
# (A) (B) (C)  (terminate list with -9999 for fleet)
 1 0.5 1 # GNS
 2 0.5 1 # TR_FR
 3 0.5 1 # TR_OT
 4 0.5 1 # TR_SP
-9999 1 1 # end of list
4 #_number of loops for hybrid tuning; 4 good; 3 faster; 2 enough if switching to parms is enabled
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# GNS 0.00026522 0.000461185 0.000261501 0.000310386 0.000263433 0.000244282 0.000233314 0.000205411 0.000194291 0.000193406 0.000136095 0.000140319 0.000151328 0.000166028 0.000221689 0.000215727 0.000259165 0.000338804 0.000355456 0.000403283 0.000366165 0.000424999 0.000501208 0.000519788 0.00042058 0.000474353 0.000534594 0.000480916 0.000584439 0.000800301 0.00122462 0.00174537 0.00212104 0.00477639 0.00610078 0.00556016 0.00375178 0.00557197 0.00699905 0.00909386 0.0129831 0.025836 0.0307416 0.031617 0.0226917 0.0274638 0.0298205 0.035093 0.0531902 0.0584827 0.0389441 0.0380966 0.0487906 0.0491863 0.0635225 0.0550922 0.0437404 0.0516817 0.0601993 0.0441589 0.040241 0.0362762 0.0426092 0.0443821 0.0454311 0.042983 0.0484384 0.046158 0.0308893 0.026908 0.0283842 0.0372986 0.0372986
# TR_FR 0 8.82985e-07 0 0 0 0 0 0 2.67375e-06 0 1.79439e-06 2.70506e-06 2.71762e-06 0 2.74142e-06 0 2.77525e-06 2.79718e-06 0.0252574 0.029234 0.0275319 0.0335879 0.0293314 0.0173001 0.0279444 0.0288788 0.0296113 0.0305545 0.0369277 0.047691 0.0624028 0.0710637 0.0706657 0.0790043 0.0763946 0.0836403 0.0750445 0.0799889 0.0734166 0.0761973 0.0866824 0.073087 0.0524001 0.0542779 0.065657 0.080321 0.076618 0.0788981 0.0665281 0.0677812 0.057695 0.0880063 0.0868564 0.108874 0.0714247 0.0781512 0.0790206 0.0914541 0.06575 0.0751161 0.0667567 0.0649836 0.0745436 0.063037 0.0740835 0.0637139 0.0733493 0.067476 0.0532366 0.0438198 0.051111 0.0613237 0.0613237
# TR_OT 0.00254817 0.0042849 0.00233105 0.00268158 0.00224993 0.00238512 0.00264137 0.00282621 0.00246597 0.00259414 0.00211614 0.00200491 0.00205625 0.00195215 0.00352236 0.00365053 0.00338329 0.00388864 0.0146643 0.0167199 0.0165006 0.0167851 0.0195526 0.0140083 0.0168214 0.018733 0.0177827 0.0179964 0.0212668 0.0295245 0.0429505 0.0526078 0.0655088 0.0969975 0.100906 0.0977744 0.101147 0.106967 0.10039 0.154539 0.119353 0.114825 0.146106 0.1429 0.129462 0.12748 0.140359 0.174438 0.171998 0.198362 0.137703 0.149807 0.136389 0.118364 0.126362 0.109412 0.102278 0.123668 0.115784 0.114863 0.105453 0.103818 0.108983 0.108408 0.117227 0.102306 0.117479 0.106401 0.11124 0.126137 0.106357 0.123488 0.123488
# TR_SP 0.00455215 0.00470907 0.00506104 0.00545263 0.005849 0 0 0 2.85513e-06 0.00972897 0.0106091 0.0123366 0.0115381 0.0129999 0.0145559 0.0174552 0.0198704 0.0249182 0.025477 0.0291149 0.0341136 0.0387211 0.0526372 0.0464826 0.0471278 0.0504111 0.0567193 0.0401298 0.0443746 0.0373302 0.0548168 0.0366178 0.0678412 0.0697122 0.0589734 0.0616307 0.0682948 0.0687778 0.066599 0.0681398 0.0707332 0.0699788 0.056657 0.0596641 0.0594148 0.0563526 0.0698846 0.0628768 0.0739398 0.0753285 0.055554 0.0604708 0.0633446 0.0788372 0.0697643 0.065477 0.0593165 0.0634232 0.0628965 0.0478169 0.0391202 0.0307559 0.0305329 0.0490787 0.0297772 0.0256385 0.0234424 0.0190874 0.0219995 0.0187893 0.019104 0.0193802 0.0193802
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         5         1         0         1         0         1  #  FR-IE-IBTS
         6         1         0         0         0         1  #  IE_MONKSURVEY
         7         1         0         0         0         1  #  SPGFS
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            -5      -9.76054           -13             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_FR-IE-IBTS(5)
             0             1     0.0341016           0.1           0.1             0          4          0          0          0          0          0          0          0  #  Q_extraSD_FR-IE-IBTS(5)
           -15            -5      -6.79499           -13             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_IE_MONKSURVEY(6)
           -15            -5       -8.4959           -13             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_SPGFS(7)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_2;  parm=6; modification of pattern 24 with improved sex-specific offset
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in length
#Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 27 1 0 3 # 1 GNS
 24 1 0 0 # 2 TR_FR
 27 1 0 3 # 3 TR_OT
 27 1 0 3 # 4 TR_SP
 24 0 0 0 # 5 FR-IE-IBTS
 1 0 0 0 # 6 IE_MONKSURVEY
 24 0 0 0 # 7 SPGFS
#
#_age_selex_patterns
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
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 0 0 0 0 # 1 GNS
 0 0 0 0 # 2 TR_FR
 0 0 0 0 # 3 TR_OT
 0 0 0 0 # 4 TR_SP
 0 0 0 0 # 5 FR-IE-IBTS
 0 0 0 0 # 6 IE_MONKSURVEY
 0 0 0 0 # 7 SPGFS
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   GNS LenSelex
             0             2             0             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Code_GNS(1)
        -0.001             1      0.623102             0         0.001             1          6          0          0          0          0          0          0          0  #  SizeSpline_GradLo_GNS(1)
            -1         0.001     -0.049066             0         0.001             1          6          0          0          0          0          0          0          0  #  SizeSpline_GradHi_GNS(1)
             2           180        10.413            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_1_GNS(1)
             2           180       30.1463            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_2_GNS(1)
             2           180       90.0726            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_3_GNS(1)
            -9             7      -4.24254             0         0.001             1          5          0          0          0          0          0          0          0  #  SizeSpline_Val_1_GNS(1)
            -9             7            -1             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Val_2_GNS(1)
            -9             7      -0.81159             0         0.001             1          5          0          0          0          0          0          0          0  #  SizeSpline_Val_3_GNS(1)
             5           100       32.6524            25            99             0          5          0          0          0          0          0          0          0  #  Retain_L_infl_GNS(1)
           0.1            20       3.39202             2            99             0          6          0          0          0          0          0          0          0  #  Retain_L_width_GNS(1)
          -999           999           999            10            99             0         -3          0          0          0          0          0          0          0  #  Retain_L_asymptote_logit_GNS(1)
             0             0             0             0            -1             0         -3          0          0          0          0          0          0          0  #  Retain_L_maleoffset_GNS(1)
# 2   TR_FR LenSelex
            10            60        25.342       25.4259             1             6          5          0          0          0          0          0          0          0  #  Size_DblN_peak_TR_FR(2)
           -25             5           -25             0            99             0         -6          0          0          0          0          0          0          0  #  Size_DblN_top_logit_TR_FR(2)
           -15             8       4.32594             3            99             0          6          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_TR_FR(2)
           -25            15            15             5            99             0         -6          0          0          0          0          0          0          0  #  Size_DblN_descend_se_TR_FR(2)
          -999          -999          -999          -999             0             0         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_TR_FR(2)
          -999          -999          -999          -999             0             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_TR_FR(2)
             5           100       27.5457            25            99             0          5          0         23       2003       2020          7          0          0  #  Retain_L_infl_TR_FR(2)
           0.1            20       2.45731             2            99             0          6          0          0          0          0          0          0          0  #  Retain_L_width_TR_FR(2)
          -999           999           999            10            99             0         -3          0          0          0          0          0          0          0  #  Retain_L_asymptote_logit_TR_FR(2)
             0             0             0             0            -1             0         -3          0          0          0          0          0          0          0  #  Retain_L_maleoffset_TR_FR(2)
# 3   TR_OT LenSelex
             0             2             0             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Code_TR_OT(3)
        -0.001             1      0.528632             0         0.001             1          6          0          0          0          0          0          0          0  #  SizeSpline_GradLo_TR_OT(3)
            -1         0.001    -0.0881256             0         0.001             1          6          0          0          0          0          0          0          0  #  SizeSpline_GradHi_TR_OT(3)
             2           180       11.8206            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_1_TR_OT(3)
             2           180       33.0312            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_2_TR_OT(3)
             2           180       78.0997            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_3_TR_OT(3)
            -9             7      -3.93251             0         0.001             1          5          0          0          0          0          0          0          0  #  SizeSpline_Val_1_TR_OT(3)
            -9             7            -1             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Val_2_TR_OT(3)
            -9             7      -1.85538             0         0.001             1          5          0          0          0          0          0          0          0  #  SizeSpline_Val_3_TR_OT(3)
             5           100       27.0661            25            99             0          5          0         23       2003       2020          7          0          0  #  Retain_L_infl_TR_OT(3)
           0.1            20       3.58888             2            99             0          6          0          0          0          0          0          0          0  #  Retain_L_width_TR_OT(3)
          -999           999           999            10            99             0         -3          0          0          0          0          0          0          0  #  Retain_L_asymptote_logit_TR_OT(3)
             0             0             0             0            -1             0         -3          0          0          0          0          0          0          0  #  Retain_L_maleoffset_TR_OT(3)
# 4   TR_SP LenSelex
             0             2             0             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Code_TR_SP(4)
        -0.001             1      0.537701             0         0.001             1          6          0          0          0          0          0          0          0  #  SizeSpline_GradLo_TR_SP(4)
            -1         0.001    -0.0794195             0         0.001             1          6          0          0          0          0          0          0          0  #  SizeSpline_GradHi_TR_SP(4)
             2           180       10.2892            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_1_TR_SP(4)
             2           180       35.7727            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_2_TR_SP(4)
             2           180       85.0454            91             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_3_TR_SP(4)
            -9             7      -4.73698             0         0.001             1          5          0          0          0          0          0          1          1  #  SizeSpline_Val_1_TR_SP(4)
            -9             7            -1             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Val_2_TR_SP(4)
            -9             7     -0.355972             0         0.001             1          5          0          0          0          0          0          0          0  #  SizeSpline_Val_3_TR_SP(4)
             5           100       18.6988            25            99             0          5          0          0          0          0          0          0          0  #  Retain_L_infl_TR_SP(4)
           0.1            20       2.13927             2            99             0          6          0          0          0          0          0          0          0  #  Retain_L_width_TR_SP(4)
          -999           999           999            10            99             0         -3          0          0          0          0          0          0          0  #  Retain_L_asymptote_logit_TR_SP(4)
             0             0             0             0            -1             0         -3          0          0          0          0          0          0          0  #  Retain_L_maleoffset_TR_SP(4)
# 5   FR-IE-IBTS LenSelex
            25            75       63.9325            10            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_peak_FR-IE-IBTS(5)
           -15             4           -15           -15            99             0         -6          0          0          0          0          0          0          0  #  Size_DblN_top_logit_FR-IE-IBTS(5)
            -9             9       8.24868             5            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_FR-IE-IBTS(5)
            -5            30       7.20479             6            99             0          6          0          0          0          0          0          0          0  #  Size_DblN_descend_se_FR-IE-IBTS(5)
          -999          -999          -999          -999             0             0         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_FR-IE-IBTS(5)
          -999          -999          -999          -999             0             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_FR-IE-IBTS(5)
# 6   IE_MONKSURVEY LenSelex
            10           130       26.3229            45            99             0          5          0          0          0          0          0          0          0  #  Size_inflection_IE_MONKSURVEY(6)
           -15            60       41.8797             5            99             0          6          0          0          0          0          0          0          0  #  Size_95%width_IE_MONKSURVEY(6)
# 7   SPGFS LenSelex
             5           130       87.7709            45            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_peak_SPGFS(7)
           -25             5           -25             0            99             0         -6          0          0          0          0          0          0          0  #  Size_DblN_top_logit_SPGFS(7)
            -1             9        7.3041             5            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_SPGFS(7)
           -25            15            15             5            99             0         -6          0          0          0          0          0          0          0  #  Size_DblN_descend_se_SPGFS(7)
          -999          -999          -999          -999             0             0         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_SPGFS(7)
          -999          -999          -999          -999             0             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_SPGFS(7)
# 1   GNS AgeSelex
# 2   TR_FR AgeSelex
# 3   TR_OT AgeSelex
# 4   TR_SP AgeSelex
# 5   FR-IE-IBTS AgeSelex
# 6   IE_MONKSURVEY AgeSelex
# 7   SPGFS AgeSelex
#_Dirichlet parameters
#_multiple_fleets_can_refer_to_same_parm;_but_list_cannot_have_gaps
            -5             5      0.879847             0         1.813             6          8          0          0          0          0          0          0          0  #  ln(DM_theta)_1
            -5             5      0.974436             0         1.813             6          8          0          0          0          0          0          0          0  #  ln(DM_theta)_2
            -5             5      0.983405             0         1.813             6          8          0          0          0          0          0          0          0  #  ln(DM_theta)_3
            -5             5       4.86604             0         1.813             6          8          0          0          0          0          0          0          0  #  ln(DM_theta)_4
            -5             5       1.24329             0         1.813             6          8          0          0          0          0          0          0          0  #  ln(DM_theta)_5
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        0.0001             2           0.5             2           0.5             6      -7  # Retain_L_infl_TR_FR(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -7  # Retain_L_infl_TR_FR(2)_dev_autocorr
        0.0001             2           0.5             2           0.5             6      -7  # Retain_L_infl_TR_OT(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -7  # Retain_L_infl_TR_OT(3)_dev_autocorr
            -9             7      -2.68597             0         0.001             1      7  # SizeSpline_Val_1_TR_SP(4)_BLK1add_2007
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5    20     1     0     0     0     0     1     3  2003  2020     7 -0.385222 1.59473 2.60428 2.63238  2.713 1.05741 0.945864  1.235 1.51153 0.638373 0.171387 -0.255654 -0.388436 0.961058 0.378463 -0.717097 -0.400572 -0.574635
#      5    33     3     0     0     0     0     2     3  2003  2020     7 -2.74621 -0.443622 1.40156 -1.11809 2.34465 1.83033 0.536403 -0.667026 2.32169 5.15334 0.606602 0.33861 1.92785 -0.55726 -1.11329 -1.20502 -0.786409 -0.727766
#      5    43     5     1     1     0     0     0     0     0     0     0
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
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_discard:_1
#  1 #_discard:_2
#  1 #_discard:_3
#  1 #_discard:_4
#  0 #_discard:_5
#  0 #_discard:_6
#  0 #_discard:_7
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
#  1 #_init_equ_catch7
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

