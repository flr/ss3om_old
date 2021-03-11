# io_h70_t4_rttp_tlambda01
#V3.30.15.00-trans;_2020_03_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: data.ss // control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none, only when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
4 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
 1 4 1 0
 1 7 1 0
 1 10 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
3 #_Nblock_Patterns
 5 5 1 #_blocks_per_pattern 
# begin and end years of blocks
 1960 1988 1989 1993 1994 1998 1999 2003 2004 2009
 1960 1976 1977 1984 1985 1992 1993 2000 2001 2009
 1949 1949
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: null;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  21-24 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
5 #_N_breakpoints
 0 1 2 3 4 # age(real) at M breakpoints
#
2 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0.1 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.075 2 0.8 0.8 1 6 -5 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 -3 3 -0 -0 1 6 -7 0 0 0 0 0.5 0 0 # NatM_p_2_Fem_GP_1
 -3 3 -0 -0 1 6 -7 0 0 0 0 0.5 0 0 # NatM_p_3_Fem_GP_1
 -3 3 -0 -0 1 6 -6 0 0 0 0 0.5 0 0 # NatM_p_4_Fem_GP_1
 -3 3 -0 -0 1 6 -6 0 0 0 0 0.5 0 0 # NatM_p_5_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 -30 30 5.89629 20 100 6 -5 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 50 100 70.3509 70.2 100 6 -5 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 -3 3 0.34809 0.373 100 6 -1 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0 5 2.9096 1 1 0 -5 0 0 0 0 0 0 0 # Richards_Fem_GP_1
 0.01 60 0.2 0.2 100 6 -5 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 -3 3 -0.69 -0.69 100 6 -5 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 4.97e-006 4.97e-006 100 6 -1 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 2 4 3.39292 3.39292 100 6 -1 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 1 150 38 38 100 6 -1 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -8 1 -1.25 -1.25 100 6 -1 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 0 2 1 1 100 6 -1 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -1 1 0 0 100 6 -1 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
# Hermaphroditism
#  Recruitment Distribution  
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_timing_1
 -4 4 0 0 0.1 6 5 0 1 1983 2015 5 0 0 # RecrDist_timing_2
 -4 4 0 0 0.1 6 5 0 1 1983 2015 5 0 0 # RecrDist_timing_3
 -4 4 0 0 0.1 6 5 0 1 1983 2015 5 0 0 # RecrDist_timing_4
#  Cohort growth dev base
 0.1 10 1 1 1 6 -1 0 0 0 0 0.5 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
# timevary MG parameters 
#_ LO HI INIT PRIOR PR_SD PR_type  PHASE
 0.0001 2 0.3 0.3 0.5 6 -5 # RecrDist_timing_2_dev_se
 -0.99 0.99 0 0 0.5 6 -6 # RecrDist_timing_2_dev_autocorr
 0.0001 2 0.3 0.3 0.5 6 -5 # RecrDist_timing_3_dev_se
 -0.99 0.99 0 0 0.5 6 -6 # RecrDist_timing_3_dev_autocorr
 0.0001 2 0.3 0.3 0.5 6 -5 # RecrDist_timing_4_dev_se
 -0.99 0.99 0 0 0.5 6 -6 # RecrDist_timing_4_dev_autocorr
# info on dev vectors created for MGparms are reported with other devs after tag parameter section 
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
6 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             0            35            20            20            10             6          1          0          0          0          0          0          0          0 # SR_LN(R0)
   0.201          0.99           0.7           0.7            10             6         -2          0          0          0          0          0          0          0 # SR_BH_flat_steep
# xxx h80   0.201          0.99           0.8           0.8            10             6         -2          0          0          0          0          0          0          0 # SR_BH_flat_steep
# xxx h90   0.201          0.99           0.9           0.9            10             6         -2          0          0          0          0          0          0          0 # SR_BH_flat_steep
             0             2           0.3           0.3           0.8             6         -4          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             6         -4          0          0          0          0          0          0          0 # SR_regime
             0           0.5             0             0            99             0         -2          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1983 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
4 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 -10 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1960 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1983 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2018 #_last_yr_fullbias_adj_in_MPD
 2018 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 1 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -15 #min rec_dev
 15 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.15 # F ballpark value in units of annual_F
2000 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
7 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2026 2301
# F rates by fleet
# Yr:  1950 1950 1950 1950 1951 1951 1951 1951 1952 1952 1952 1952 1953 1953 1953 1953 1954 1954 1954 1954 1955 1955 1955 1955 1956 1956 1956 1956 1957 1957 1957 1957 1958 1958 1958 1958 1959 1959 1959 1959 1960 1960 1960 1960 1961 1961 1961 1961 1962 1962 1962 1962 1963 1963 1963 1963 1964 1964 1964 1964 1965 1965 1965 1965 1966 1966 1966 1966 1967 1967 1967 1967 1968 1968 1968 1968 1969 1969 1969 1969 1970 1970 1970 1970 1971 1971 1971 1971 1972 1972 1972 1972 1973 1973 1973 1973 1974 1974 1974 1974 1975 1975 1975 1975 1976 1976 1976 1976 1977 1977 1977 1977 1978 1978 1978 1978 1979 1979 1979 1979 1980 1980 1980 1980 1981 1981 1981 1981 1982 1982 1982 1982 1983 1983 1983 1983 1984 1984 1984 1984 1985 1985 1985 1985 1986 1986 1986 1986 1987 1987 1987 1987 1988 1988 1988 1988 1989 1989 1989 1989 1990 1990 1990 1990 1991 1991 1991 1991 1992 1992 1992 1992 1993 1993 1993 1993 1994 1994 1994 1994 1995 1995 1995 1995 1996 1996 1996 1996 1997 1997 1997 1997 1998 1998 1998 1998 1999 1999 1999 1999 2000 2000 2000 2000 2001 2001 2001 2001 2002 2002 2002 2002 2003 2003 2003 2003 2004 2004 2004 2004 2005 2005 2005 2005 2006 2006 2006 2006 2007 2007 2007 2007 2008 2008 2008 2008 2009 2009 2009 2009 2010 2010 2010 2010 2011 2011 2011 2011 2012 2012 2012 2012 2013 2013 2013 2013 2014 2014 2014 2014 2015 2015 2015 2015 2016 2016 2016 2016 2017 2017 2017 2017 2018 2018 2018 2018 2019 2019 2019 2019 2020 2020 2020 2020 2021 2021 2021 2021 2022 2022 2022 2022 2023 2023 2023 2023 2024 2024 2024 2024 2025 2025 2025 2025 2026 2026 2026 2026
# seas:  1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4
# PL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0 7 0 0 0
# PSLS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# PSFS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# GL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# LI 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# LL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# Other 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         8         1         0         0         0         1  #  PL_CPUE
         9         1         0         0         0         1  #  PSLS_CPUE_LONG
        10         1         0         0         0         1  #  BAI_CPUE
        11         1         0         0         0         1  #  Behaviour_CPUE
		
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -25            25      -22.9567             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_PL_CPUE(8)
           -25            25      -22.5903             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_PSLS_CPUE_LONG(9)
           -25            25      -19.3442             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_BAI_CPUE(10)
           -25            25      -19.3442             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Behaviour_CPUE(11)		   
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
 27 0 0 7 # 1 PL
 27 0 0 5 # 2 PSLS
 27 0 0 5 # 3 PSFS
 24 0 0 0 # 4 GL
 24 0 0 0 # 5 LI
 1 0 0 0 # 6 LL
 24 0 0 0 # 7 Other
 5 0 0 1 # 8 PL_CPUE
 5 0 0 2 # 9 PSLS_CPUE_LONG
 5 0 0 2 # 10 BAI_CPUE
 5 0 0 2 # 11 Behaviour_CPUE 
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
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 11 0 0 0 # 1 PL
 11 0 0 0 # 2 PSLS
 11 0 0 0 # 3 PSFS
 11 0 0 0 # 4 GL
 11 0 0 0 # 5 LI
 11 0 0 0 # 6 LL
 11 0 0 0 # 7 Other
 11 0 0 0 # 8 PL_CPUE
 11 0 0 0 # 9 PSLS_CPUE_LONG
 11 0 0 0 # 10 BAI_CPUE
 11 0 0 0 # 11 Behaviour_CPUE
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   PL LenSelex
             0             0             0             0             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Code_PL(1)
        -0.001             1      0.247221             0         0.001             1          3          0          0          0          0        0.5          0          0  #  SizeSpline_GradLo_PL(1)
            -1         0.001     -0.658209             0         0.001             1          3          0          0          0          0        0.5          0          0  #  SizeSpline_GradHi_PL(1)
             1             1       22.6447             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_1_PL(1)
             1             1       37.5977             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_2_PL(1)
             1             1       42.0377             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_3_PL(1)
             1             1        45.702             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_4_PL(1)
             1             1       51.7386             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_5_PL(1)
             1             1       59.9904             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_6_PL(1)
             1             1       71.3145             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_7_PL(1)
            -9             7      -4.42509             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_1_PL(1)
            -9             7       -2.2233             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_2_PL(1)
            -9             7      -1.56912             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_3_PL(1)
            -9             7            -1             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_4_PL(1)
            -9             7      -1.26099             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_5_PL(1)
            -9             7      -0.55179             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_6_PL(1)
            -9             7     -0.579285             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_7_PL(1)
# 2   PSLS LenSelex
             0             0             0             0             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Code_PSLS(2)
        -0.001             1      0.622317             0         0.001             1          3          0          0          0          0        0.5          0          0  #  SizeSpline_GradLo_PSLS(2)
            -1         0.001     -0.110388             0         0.001             1          3          0          0          0          0        0.5          0          0  #  SizeSpline_GradHi_PSLS(2)
             1             1        23.125             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_1_PSLS(2)
             1             1       41.9035             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_2_PSLS(2)
             1             1       45.6322             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_3_PSLS(2)
             1             1       50.2975             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_4_PSLS(2)
             1             1       70.9228             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_5_PSLS(2)
            -9             7       -8.9974             0         0.001             1         -2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_1_PSLS(2)
            -9             7      -2.05844             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_2_PSLS(2)
            -9             7            -1             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_3_PSLS(2)
            -9             7     -0.954789             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_4_PSLS(2)
            -9             7      -2.24451             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_5_PSLS(2)
# 3   PSFS LenSelex
             0             0             0             0             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Code_PSFS(3)
        -0.001             1     0.0149309             0         0.001             1          3          0          0          0          0        0.5          0          0  #  SizeSpline_GradLo_PSFS(3)
            -1         0.001     -0.245826             0         0.001             1          3          0          0          0          0        0.5          0          0  #  SizeSpline_GradHi_PSFS(3)
             1             1       23.1313             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_1_PSFS(3)
             1             1       44.1442             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_2_PSFS(3)
             1             1       48.4634             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_3_PSFS(3)
             1             1       54.7779             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_4_PSFS(3)
             1             1       71.2972             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Knot_5_PSFS(3)
            -9             7      -8.99994             0         0.001             1         -2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_1_PSFS(3)
            -9             7      -2.04755             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_2_PSFS(3)
            -9             7            -1             0             0             0        -99          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_3_PSFS(3)
            -9             7      -1.02858             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_4_PSFS(3)
            -9             7      -1.20735             0         0.001             1          2          0          1       2004       2008         -4          0          0  #  SizeSpline_Val_5_PSFS(3)
# 4   GL LenSelex
            10           100            40            40            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_GL(4)
            -6             4        -1.061            -3            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_GL(4)
            -1             9         4.714           8.3            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_GL(4)
            -1             9             4             4            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_GL(4)
           -15            -5           -10            -1            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_GL(4)
            -5             9     -0.730581            -1            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P6_GL(4)
# 5   LI LenSelex
            10           100            40            40            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_LI(5)
            -6             4        -1.061            -3            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_LI(5)
            -1             9         4.714           8.3            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_LI(5)
            -1             9             4             4            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_LI(5)
           -15            -5           -10            -1            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_LI(5)
            -5             9     -0.730581            -1            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P6_LI(5)
# 6   LL LenSelex
             5           100            40            40            99             1          3          0          0          0          0          0          0          0  #  SizeSel_P1_LL(6)
           -12            40            10            10            99             1          3          0          0          0          0          0          0          0  #  SizeSel_P2_LL(6)
# 7   Other LenSelex
            10           100            40            40            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Other(7)
            -6             4        -1.061            -3            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_Other(7)
            -1             9         4.714           8.3            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_Other(7)
            -1             9             4             4            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_Other(7)
           -15            -5           -10            -1            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_Other(7)
            -5             9     -0.730581            -1            99             1          3          0          0          0          0        0.5          0          0  #  SizeSel_P6_Other(7)
# 8   PL_CPUE LenSelex
             1             1             1             1            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_PL_CPUE(8)
            27            27            27            27            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_PL_CPUE(8)
# 9   PSLS_CPUE_LONG LenSelex
             1             1             1             1            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_PSLS_CPUE_LONG(9)
            27            27            27            27            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_PSLS_CPUE_LONG(9)
# 10   BAI_CPUE LenSelex
             1             1             1             1            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_BAI_CPUE(10)
            27            27            27            27            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_BAI_CPUE(10)
# 11   Behaviour_CPUE LenSelex
             1             1             1             1            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_OTHER_CPUE(11)
            27            27            27            27            99             1         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_Behavior_CPUE(11)			
# 1   PL AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_PL(1)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_PL(1)
# 2   PSLS AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_PSLS(2)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_PSLS(2)
# 3   PSFS AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_PSFS(3)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_PSFS(3)
# 4   GL AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_GL(4)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_GL(4)
# 5   LI AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_LI(5)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_LI(5)
# 6   LL AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_LL(6)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_LL(6)
# 7   Other AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_Other(7)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_Other(7)
# 8   PL_CPUE AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_PL_CPUE(8)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_PL_CPUE(8)
# 9   PSLS_CPUE_LONG AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_PSLS_CPUE_LONG(9)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_PSLS_CPUE_LONG(9)
# 10   BAI_CPUE AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_BAI_CPUE(10)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_BAI_CPUE(10)
# 11   Behaviour_CPUE AgeSelex
             0             8             0             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_Behavior_CPUE(11)
             0             8             8             5            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_Behavior_CPUE(11)			 
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_1_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_1_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_2_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_2_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_3_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_3_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_4_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_4_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_5_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_5_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_6_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_6_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_7_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_7_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_1_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_1_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_2_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_2_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_3_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_3_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_4_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_4_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_5_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_5_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_6_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_6_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_7_PL(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_7_PL(1)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_1_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_1_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_2_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_2_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_3_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_3_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_4_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_4_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_5_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_5_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_1_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_1_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_2_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_2_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_3_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_3_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_4_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_4_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_5_PSLS(2)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_5_PSLS(2)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_1_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_1_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_2_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_2_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_3_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_3_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_4_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_4_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Knot_5_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Knot_5_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_1_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_1_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_2_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_2_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_3_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_3_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_4_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_4_PSFS(3)_dev_autocorr
        0.0001             2          0.05          0.05           0.5             6      -5  # SizeSpline_Val_5_PSFS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # SizeSpline_Val_5_PSFS(3)_dev_autocorr
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
1 # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Note -  tag parameters cannot be time-varying
#_Note -  phase=-1000 sets parm value to previous parm; phase=-100X sets to parm(X) value
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_1	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_2	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_3	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_4	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_5	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_6	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_7	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_8	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_9	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_10	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_11	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_12	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_13	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_14	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_15	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_16	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_17	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_18	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_19	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_20	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_21	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_22	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_23	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_24	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_25	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_26	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_27	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_28	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_29	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_30	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_31	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_32	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_33	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_34	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_35	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_36	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_37	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_38	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_39	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_40	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_41	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_42	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_43	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_44	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_45	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_46	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_47	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_48	
	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_49	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_1	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_2	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_3	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_4	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_5	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_6	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_7	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_8	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_9	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_10	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_11	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_12	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_13	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_14	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_15	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_16	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_17	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_18	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_19	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_20	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_21	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_22	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_23	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_24	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_25	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_26	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_27	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_28	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_29	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_30	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_31	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_32	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_33	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_34	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_35	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_36	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_37	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_38	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_39	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_40	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_41	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_42	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_43	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_44	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_45	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_46	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_47	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_48	
	-15	10	-4.185	-4.185	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_chronic_49	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_1	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_2	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_3	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_4	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_5	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_6	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_7	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_8	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_9	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_10	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_11	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_12	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_13	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_14	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_15	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_16	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_17	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_18	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_19	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_20	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_21	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_22	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_23	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_24	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_25	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_26	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_27	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_28	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_29	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_30	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_31	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_32	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_33	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_34	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_35	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_36	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_37	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_38	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_39	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_40	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_41	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_42	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_43	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_44	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_45	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_46	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_47	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_48	
	1	150	20	20	0.001	1	-4	0	0	0	0	0	0	0	#	TG_overdispersion_49	
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_1
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_2
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_3
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_4
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_5
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_6
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_7
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_8
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_9
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_10
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_11
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_12
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_13
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_14
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_15
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_16
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_17
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_18
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_19
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_20
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_21
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_22
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_23
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_24
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_25
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_26
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_27
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_28
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_29
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_30
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_31
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_32
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_33
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_34
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_35
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_36
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_37
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_38
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_39
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_40
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_41
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_42
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_43
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_44
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_45
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_46
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_47
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_48
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_49
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_50
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_51
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_52
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_53
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_54
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_55
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_56
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_57
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_58
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_59
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_60
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_61
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_62
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_63
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_64
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_65
# xxx rtss	-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#	TG_loss_init_66																						
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss										
# xxx rtss	-15	10	-4.185	-4.185	1	0.001	-4	0	0	0	0	0	0	0	#	chronic	tag	loss																																			
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
# xxx rtss	1	150	20	20	1	0.001	-4	0	0	0	0	0	0	0	#	tag	overdispersion											
 -20 20 -10  -10 2 1 -4 0 0 0 0 0 0 0 # TG_report_fleet:_1
 -20 20 10  10 0.2 1 -4 0 0 0 0 0 0 0 # TG_report_fleet:_2
 -20 20 10  10 0.2 1 -4 0 0 0 0 0 0 0 # TG_report_fleet:_3
 -20 20 -10  -10 2 1 -4 0 0 0 0 0 0 0 # TG_report_fleet:_4
 -20 20 -10  -10 2 1 -4 0 0 0 0 0 0 0 # TG_report_fleet:_5
 -20 20 -10  -10 2 1 -4 0 0 0 0 0 0 0 # TG_report_fleet:_6
 -20 20 -10  -10 2 1 -4 0 0 0 0 0 0 0 # TG_report_fleet:_7
 -4 0 0  0 2 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1
 -4 0 0  0 2 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_2
 -4 0 0  0 2 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_3
 -4 0 0  0 2 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_4
 -4 0 0  0 2 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_5
 -4 0 0  0 2 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_6
 -4 0 0  0 2 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_7
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      1    21     1     0     0     2     0     1     1  1983  2015     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      1    22     3     0     0     2     0     2     1  1983  2015     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      1    23     5     0     0     2     0     3     1  1983  2015     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     4     7     0     0     2     0     4     1  2004  2008    -4      0      0      0      0      0
#      5     5     9     0     0     2     0     5     1  2004  2008    -4      0      0      0      0      0
#      5     6    11     0     0     2     0     6     1  2004  2008    -4      0      0      0      0      0
#      5     7    13     0     0     2     0     7     1  2004  2008    -4      0      0      0      0      0
#      5     8    15     0     0     2     0     8     1  2004  2008    -4      0      0      0      0      0
#      5     9    17     0     0     2     0     9     1  2004  2008    -4      0      0      0      0      0
#      5    10    19     0     0     2     0    10     1  2004  2008    -4      0      0      0      0      0
#      5    11    21     0     0     2     0    11     1  2004  2008    -4      0      0      0      0      0
#      5    12    23     0     0     2     0    12     1  2004  2008    -4      0      0      0      0      0
#      5    13    25     0     0     2     0    13     1  2004  2008    -4      0      0      0      0      0
#      5    14    27     0     0     2     0    14     1  2004  2008    -4      0      0      0      0      0
#      5    15    29     0     0     2     0    15     1  2004  2008    -4      0      0      0      0      0
#      5    16    31     0     0     2     0    16     1  2004  2008    -4      0      0      0      0      0
#      5    17    33     0     0     2     0    17     1  2004  2008    -4      0      0      0      0      0
#      5    21    35     0     0     2     0    18     1  2004  2008    -4      0      0      0      0      0
#      5    22    37     0     0     2     0    19     1  2004  2008    -4      0      0      0      0      0
#      5    23    39     0     0     2     0    20     1  2004  2008    -4      0      0      0      0      0
#      5    24    41     0     0     2     0    21     1  2004  2008    -4      0      0      0      0      0
#      5    25    43     0     0     2     0    22     1  2004  2008    -4      0      0      0      0      0
#      5    26    45     0     0     2     0    23     1  2004  2008    -4      0      0      0      0      0
#      5    27    47     0     0     2     0    24     1  2004  2008    -4      0      0      0      0      0
#      5    28    49     0     0     2     0    25     1  2004  2008    -4      0      0      0      0      0
#      5    29    51     0     0     2     0    26     1  2004  2008    -4      0      0      0      0      0
#      5    30    53     0     0     2     0    27     1  2004  2008    -4      0      0      0      0      0
#      5    34    55     0     0     2     0    28     1  2004  2008    -4      0      0      0      0      0
#      5    35    57     0     0     2     0    29     1  2004  2008    -4      0      0      0      0      0
#      5    36    59     0     0     2     0    30     1  2004  2008    -4      0      0      0      0      0
#      5    37    61     0     0     2     0    31     1  2004  2008    -4      0      0      0      0      0
#      5    38    63     0     0     2     0    32     1  2004  2008    -4      0      0      0      0      0
#      5    39    65     0     0     2     0    33     1  2004  2008    -4      0      0      0      0      0
#      5    40    67     0     0     2     0    34     1  2004  2008    -4      0      0      0      0      0
#      5    41    69     0     0     2     0    35     1  2004  2008    -4      0      0      0      0      0
#      5    42    71     0     0     2     0    36     1  2004  2008    -4      0      0      0      0      0
#      5    43    73     0     0     2     0    37     1  2004  2008    -4      0      0      0      0      0
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
      4      1      0.01
      4      2      0.01
      4      3      0.01
      4      4      0.01
      4      5      0.01
      4      6      0.01
      4      7      0.01
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 10 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 8 1 1 1
 1 9 1 1 1
 1 10 1 0 1
 1 11 1 0 1 
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 4 5 1 1 1
 4 6 1 1 1
 4 7 1 1 1
   15	1	1	0.1	1
   15	2	1	0.1	1
   15	3	1	0.1	1
   15	4	1	0.1	1
   15	5	1	0.1	1
   15	6	1	0.1	1
   15	7	1	0.1	1
   15	8	1	0.1	1
   15	9	1	0.1	1
   15	10	1	0.1	1
   15	11	1	0.1	1
   15	12	1	0.1	1
   15	13	1	0.1	1
   15	14	1	0.1	1
   15	15	1	0.1	1
   15	16	1	0.1	1
   15	17	1	0.1	1
   15	18	1	0.1	1
   15	19	1	0.1	1
   15	20	1	0.1	1
   15	21	1	0.1	1
   15	22	1	0.1	1
   15	23	1	0.1	1
   15	24	1	0.1	1
   15	25	1	0.1	1
   15	26	1	0.1	1
   15	27	1	0.1	1
   15	28	1	0.1	1
   15	29	1	0.1	1
   15	30	1	0.1	1
   15	31	1	0.1	1
   15	32	1	0.1	1
   15	33	1	0.1	1
   15	34	1	0.1	1
   15	35	1	0.1	1
   15	36	1	0.1	1
   15	37	1	0.1	1
   15	38	1	0.1	1
   15	39	1	0.1	1
   15	40	1	0.1	1
   15	41	1	0.1	1
   15	42	1	0.1	1
   15	43	1	0.1	1
   15	44	1	0.1	1
   15	45	1	0.1	1
   15	46	1	0.1	1
   15	47	1	0.1	1
   15	48	1	0.1	1
   15	49	1	0.1	1
   16	1	1	0.1	1
   16	2	1	0.1	1
   16	3	1	0.1	1
   16	4	1	0.1	1
   16	5	1	0.1	1
   16	6	1	0.1	1
   16	7	1	0.1	1
   16	8	1	0.1	1
   16	9	1	0.1	1
   16	10	1	0.1	1
   16	11	1	0.1	1
   16	12	1	0.1	1
   16	13	1	0.1	1
   16	14	1	0.1	1
   16	15	1	0.1	1
   16	16	1	0.1	1
   16	17	1	0.1	1
   16	18	1	0.1	1
   16	19	1	0.1	1
   16	20	1	0.1	1
   16	21	1	0.1	1
   16	22	1	0.1	1
   16	23	1	0.1	1
   16	24	1	0.1	1
   16	25	1	0.1	1
   16	26	1	0.1	1
   16	27	1	0.1	1
   16	28	1	0.1	1
   16	29	1	0.1	1
   16	30	1	0.1	1
   16	31	1	0.1	1
   16	32	1	0.1	1
   16	33	1	0.1	1
   16	34	1	0.1	1
   16	35	1	0.1	1
   16	36	1	0.1	1
   16	37	1	0.1	1
   16	38	1	0.1	1
   16	39	1	0.1	1
   16	40	1	0.1	1
   16	41	1	0.1	1
   16	42	1	0.1	1
   16	43	1	0.1	1
   16	44	1	0.1	1
   16	45	1	0.1	1
   16	46	1	0.1	1
   16	47	1	0.1	1
   16	48	1	0.1	1
   16	49	1	0.1	1
# xxx rtss   15	1	1	0.1	1
# xxx rtss   15	2	1	0.1	1
# xxx rtss   15	3	1	0.1	1
# xxx rtss   15	4	1	0.1	1
# xxx rtss   15	5	1	0.1	1
# xxx rtss   15	6	1	0.1	1
# xxx rtss   15	7	1	0.1	1
# xxx rtss   15	8	1	0.1	1
# xxx rtss   15	9	1	0.1	1
# xxx rtss   15	10	1	0.1	1
# xxx rtss   15	11	1	0.1	1
# xxx rtss   15	12	1	0.1	1
# xxx rtss   15	13	1	0.1	1
# xxx rtss   15	14	1	0.1	1
# xxx rtss   15	15	1	0.1	1
# xxx rtss   15	16	1	0.1	1
# xxx rtss   15	17	1	0.1	1
# xxx rtss   15	18	1	0.1	1
# xxx rtss   15	19	1	0.1	1
# xxx rtss   15	20	1	0.1	1
# xxx rtss   15	21	1	0.1	1
# xxx rtss   15	22	1	0.1	1
# xxx rtss   15	23	1	0.1	1
# xxx rtss   15	24	1	0.1	1
# xxx rtss   15	25	1	0.1	1
# xxx rtss   15	26	1	0.1	1
# xxx rtss   15	27	1	0.1	1
# xxx rtss   15	28	1	0.1	1
# xxx rtss   15	29	1	0.1	1
# xxx rtss   15	30	1	0.1	1
# xxx rtss   15	31	1	0.1	1
# xxx rtss   15	32	1	0.1	1
# xxx rtss   15	33	1	0.1	1
# xxx rtss   15	34	1	0.1	1
# xxx rtss   15	35	1	0.1	1
# xxx rtss   15	36	1	0.1	1
# xxx rtss   15	37	1	0.1	1
# xxx rtss   15	38	1	0.1	1
# xxx rtss   15	39	1	0.1	1
# xxx rtss   15	40	1	0.1	1
# xxx rtss   15	41	1	0.1	1
# xxx rtss   15	42	1	0.1	1
# xxx rtss   15	43	1	0.1	1
# xxx rtss   15	44	1	0.1	1
# xxx rtss   15	45	1	0.1	1
# xxx rtss   15	46	1	0.1	1
# xxx rtss   15	47	1	0.1	1
# xxx rtss   15	48	1	0.1	1
# xxx rtss   15	49	1	0.1	1
# xxx rtss   15	50	1	0.1	1
# xxx rtss   15	51	1	0.1	1
# xxx rtss   15	52	1	0.1	1
# xxx rtss   15	53	1	0.1	1
# xxx rtss   15	54	1	0.1	1
# xxx rtss   15	55	1	0.1	1
# xxx rtss   15	56	1	0.1	1
# xxx rtss   15	57	1	0.1	1
# xxx rtss   15	58	1	0.1	1
# xxx rtss   15	59	1	0.1	1
# xxx rtss   15	60	1	0.1	1
# xxx rtss   15	61	1	0.1	1
# xxx rtss   15	62	1	0.1	1
# xxx rtss   15	63	1	0.1	1
# xxx rtss   15	64	1	0.1	1
# xxx rtss   15	65	1	0.1	1
# xxx rtss   15	66	1	0.1	1
# xxx rtss   16	1	1	0.1	1
# xxx rtss   16	2	1	0.1	1
# xxx rtss   16	3	1	0.1	1
# xxx rtss   16	4	1	0.1	1
# xxx rtss   16	5	1	0.1	1
# xxx rtss   16	6	1	0.1	1
# xxx rtss   16	7	1	0.1	1
# xxx rtss   16	8	1	0.1	1
# xxx rtss   16	9	1	0.1	1
# xxx rtss   16	10	1	0.1	1
# xxx rtss   16	11	1	0.1	1
# xxx rtss   16	12	1	0.1	1
# xxx rtss   16	13	1	0.1	1
# xxx rtss   16	14	1	0.1	1
# xxx rtss   16	15	1	0.1	1
# xxx rtss   16	16	1	0.1	1
# xxx rtss   16	17	1	0.1	1
# xxx rtss   16	18	1	0.1	1
# xxx rtss   16	19	1	0.1	1
# xxx rtss   16	20	1	0.1	1
# xxx rtss   16	21	1	0.1	1
# xxx rtss   16	22	1	0.1	1
# xxx rtss   16	23	1	0.1	1
# xxx rtss   16	24	1	0.1	1
# xxx rtss   16	25	1	0.1	1
# xxx rtss   16	26	1	0.1	1
# xxx rtss   16	27	1	0.1	1
# xxx rtss   16	28	1	0.1	1
# xxx rtss   16	29	1	0.1	1
# xxx rtss   16	30	1	0.1	1
# xxx rtss   16	31	1	0.1	1
# xxx rtss   16	32	1	0.1	1
# xxx rtss   16	33	1	0.1	1
# xxx rtss   16	34	1	0.1	1
# xxx rtss   16	35	1	0.1	1
# xxx rtss   16	36	1	0.1	1
# xxx rtss   16	37	1	0.1	1
# xxx rtss   16	38	1	0.1	1
# xxx rtss   16	39	1	0.1	1
# xxx rtss   16	40	1	0.1	1
# xxx rtss   16	41	1	0.1	1
# xxx rtss   16	42	1	0.1	1
# xxx rtss   16	43	1	0.1	1
# xxx rtss   16	44	1	0.1	1
# xxx rtss   16	45	1	0.1	1
# xxx rtss   16	46	1	0.1	1
# xxx rtss   16	47	1	0.1	1
# xxx rtss   16	48	1	0.1	1
# xxx rtss   16	49	1	0.1	1
# xxx rtss   16	50	1	0.1	1
# xxx rtss   16	51	1	0.1	1
# xxx rtss   16	52	1	0.1	1
# xxx rtss   16	53	1	0.1	1
# xxx rtss   16	54	1	0.1	1
# xxx rtss   16	55	1	0.1	1
# xxx rtss   16	56	1	0.1	1
# xxx rtss   16	57	1	0.1	1
# xxx rtss   16	58	1	0.1	1
# xxx rtss   16	59	1	0.1	1
# xxx rtss   16	60	1	0.1	1
# xxx rtss   16	61	1	0.1	1
# xxx rtss   16	62	1	0.1	1
# xxx rtss   16	63	1	0.1	1
# xxx rtss   16	64	1	0.1	1
# xxx rtss   16	65	1	0.1	1
# xxx rtss   16	66	1	0.1	1
  
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
#  0 0 0 0 #_CPUE/survey:_10
#  0 0 0 0 #_CPUE/survey:_11
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
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_TG-comp_group:_1
#  1 1 1 1 #_TG-comp_group:_2
#  1 1 1 1 #_TG-comp_group:_3
#  1 1 1 1 #_TG-comp_group:_4
#  1 1 1 1 #_TG-comp_group:_5
#  1 1 1 1 #_TG-comp_group:_6
#  1 1 1 1 #_TG-comp_group:_7
#  1 1 1 1 #_TG-comp_group:_8
#  1 1 1 1 #_TG-comp_group:_9
#  1 1 1 1 #_TG-comp_group:_10
#  1 1 1 1 #_TG-comp_group:_11
#  1 1 1 1 #_TG-comp_group:_12
#  1 1 1 1 #_TG-comp_group:_13
#  1 1 1 1 #_TG-comp_group:_14
#  1 1 1 1 #_TG-comp_group:_15
#  1 1 1 1 #_TG-comp_group:_16
#  1 1 1 1 #_TG-comp_group:_17
#  1 1 1 1 #_TG-comp_group:_18
#  1 1 1 1 #_TG-comp_group:_19
#  1 1 1 1 #_TG-comp_group:_20
#  1 1 1 1 #_TG-comp_group:_21
#  1 1 1 1 #_TG-comp_group:_22
#  1 1 1 1 #_TG-comp_group:_23
#  1 1 1 1 #_TG-comp_group:_24
#  1 1 1 1 #_TG-comp_group:_25
#  1 1 1 1 #_TG-comp_group:_26
#  1 1 1 1 #_TG-comp_group:_27
#  1 1 1 1 #_TG-comp_group:_28
#  1 1 1 1 #_TG-comp_group:_29
#  1 1 1 1 #_TG-comp_group:_30
#  1 1 1 1 #_TG-comp_group:_31
#  1 1 1 1 #_TG-comp_group:_32
#  1 1 1 1 #_TG-comp_group:_33
#  1 1 1 1 #_TG-comp_group:_34
#  1 1 1 1 #_TG-comp_group:_35
#  1 1 1 1 #_TG-comp_group:_36
#  1 1 1 1 #_TG-comp_group:_37
#  1 1 1 1 #_TG-comp_group:_38
#  1 1 1 1 #_TG-comp_group:_39
#  1 1 1 1 #_TG-comp_group:_40
#  1 1 1 1 #_TG-comp_group:_41
#  1 1 1 1 #_TG-comp_group:_42
#  1 1 1 1 #_TG-comp_group:_43
#  1 1 1 1 #_TG-comp_group:_44
#  1 1 1 1 #_TG-comp_group:_45
#  1 1 1 1 #_TG-comp_group:_46
#  1 1 1 1 #_TG-comp_group:_47
#  1 1 1 1 #_TG-comp_group:_48
#  1 1 1 1 #_TG-comp_group:_49
#  1 1 1 1 #_TG-negbin_group:_1
#  1 1 1 1 #_TG-negbin_group:_2
#  1 1 1 1 #_TG-negbin_group:_3
#  1 1 1 1 #_TG-negbin_group:_4
#  1 1 1 1 #_TG-negbin_group:_5
#  1 1 1 1 #_TG-negbin_group:_6
#  1 1 1 1 #_TG-negbin_group:_7
#  1 1 1 1 #_TG-negbin_group:_8
#  1 1 1 1 #_TG-negbin_group:_9
#  1 1 1 1 #_TG-negbin_group:_10
#  1 1 1 1 #_TG-negbin_group:_11
#  1 1 1 1 #_TG-negbin_group:_12
#  1 1 1 1 #_TG-negbin_group:_13
#  1 1 1 1 #_TG-negbin_group:_14
#  1 1 1 1 #_TG-negbin_group:_15
#  1 1 1 1 #_TG-negbin_group:_16
#  1 1 1 1 #_TG-negbin_group:_17
#  1 1 1 1 #_TG-negbin_group:_18
#  1 1 1 1 #_TG-negbin_group:_19
#  1 1 1 1 #_TG-negbin_group:_20
#  1 1 1 1 #_TG-negbin_group:_21
#  1 1 1 1 #_TG-negbin_group:_22
#  1 1 1 1 #_TG-negbin_group:_23
#  1 1 1 1 #_TG-negbin_group:_24
#  1 1 1 1 #_TG-negbin_group:_25
#  1 1 1 1 #_TG-negbin_group:_26
#  1 1 1 1 #_TG-negbin_group:_27
#  1 1 1 1 #_TG-negbin_group:_28
#  1 1 1 1 #_TG-negbin_group:_29
#  1 1 1 1 #_TG-negbin_group:_30
#  1 1 1 1 #_TG-negbin_group:_31
#  1 1 1 1 #_TG-negbin_group:_32
#  1 1 1 1 #_TG-negbin_group:_33
#  1 1 1 1 #_TG-negbin_group:_34
#  1 1 1 1 #_TG-negbin_group:_35
#  1 1 1 1 #_TG-negbin_group:_36
#  1 1 1 1 #_TG-negbin_group:_37
#  1 1 1 1 #_TG-negbin_group:_38
#  1 1 1 1 #_TG-negbin_group:_39
#  1 1 1 1 #_TG-negbin_group:_40
#  1 1 1 1 #_TG-negbin_group:_41
#  1 1 1 1 #_TG-negbin_group:_42
#  1 1 1 1 #_TG-negbin_group:_43
#  1 1 1 1 #_TG-negbin_group:_44
#  1 1 1 1 #_TG-negbin_group:_45
#  1 1 1 1 #_TG-negbin_group:_46
#  1 1 1 1 #_TG-negbin_group:_47
#  1 1 1 1 #_TG-negbin_group:_48
#  1 1 1 1 #_TG-negbin_group:_49
#  1 1 1 1 #_crashPenLambda
#  1 1 1 1 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = mortality in addition to values in option 1
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999
