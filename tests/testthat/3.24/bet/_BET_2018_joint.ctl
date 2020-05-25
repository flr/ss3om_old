#C control file created using the SS_writectl function in the R package r4ss
#C should work with SS version: SSv3.24
#C file write time: 2018-06-20 19:41:09
#
1 # N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern
4 #_number of recruitment assignments (overrides GP*area*seas parameter values)
0 #_recruitment interaction requested
#_GP	seas	area
1	1	1	#_recr_dist_pattern1
1	2	1	#_recr_dist_pattern2
1	3	1	#_recr_dist_pattern3
1	4	1	#_recr_dist_pattern4
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
6 #_Nblock_Patterns
52 2 2 1 1 1 #_blocks_per_pattern
#_#_begin and end years of blocks
1963 1963 1964 1964 1965 1965 1966 1966 1967 1967 1968 1968 1969 1969 1970 1970 1971 1971 1972 1972 1973 1973 1974 1974 1975 1975 1976 1976 1977 1977 1978 1978 1979 1979 1980 1980 1981 1981 1982 1982 1983 1983 1984 1984 1985 1985 1986 1986 1987 1987 1988 1988 1989 1989 1990 1990 1991 1991 1992 1992 1993 1993 1994 1994 1995 1995 1996 1996 1997 1997 1998 1998 1999 1999 2000 2000 2001 2001 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2014
1950 2006 2007 2018
1950 2003 2004 2018
2008 2018
2005 2018
1979 2018
0.5 #_fracfemale
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_Age_natmort_by gender x growthpattern
11 #_Number of M_segments
0 1 2 3 4 5 6 7 8 9 10 # age(real) at M breakpoints
2 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
1 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10
0	0	0	0.5	1	1	1	1	1	1	1	#_Age_Maturity1
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
  0.01	  3.00	  0.72700000	  0.727000	-1	 0.0910	-2	0	0	0	0	0.5	0	0	#_NatM_p_1_Fem_GP_1  
  0.01	  3.00	  0.45600000	  0.456000	-1	 0.0440	-2	0	0	0	0	0.5	0	0	#_NatM_p_2_Fem_GP_1  
  0.01	  1.00	  0.35800000	  0.358000	-1	 0.0510	-2	0	0	0	0	0.5	0	0	#_NatM_p_3_Fem_GP_1  
  0.01	  1.00	  0.30800000	  0.308000	-1	 0.0540	-2	0	0	0	0	0.5	0	0	#_NatM_p_4_Fem_GP_1  
  0.01	  1.00	  0.27900000	  0.279000	-1	 0.0440	-2	0	0	0	0	0.5	0	0	#_NatM_p_5_Fem_GP_1  
  0.01	  1.00	  0.26000000	  0.260000	-1	 0.0350	-2	0	0	0	0	0.5	0	0	#_NatM_p_6_Fem_GP_1  
  0.01	  1.00	  0.24800000	  0.248000	-1	 0.0290	-2	0	0	0	0	0.5	0	0	#_NatM_p_7_Fem_GP_1  
  0.01	  1.00	  0.23900000	  0.239000	-1	 0.0260	-2	0	0	0	0	0.5	0	0	#_NatM_p_8_Fem_GP_1  
  0.01	  1.00	  0.23300000	  0.233000	-1	 0.0230	-2	0	0	0	0	0.5	0	0	#_NatM_p_9_Fem_GP_1  
  0.01	  1.00	  0.22800000	  0.228000	-1	 0.0260	-2	0	0	0	0	0.5	0	0	#_NatM_p_10_Fem_GP_1 
  0.01	  1.00	  0.22100000	  0.221000	-1	 0.0230	-2	0	0	0	0	0.5	0	0	#_NatM_p_11_Fem_GP_1 
 20.00	 70.00	 57.62000000	 57.542000	-1	 2.8771	-3	0	0	0	0	0.5	0	0	#_L_at_Amin__Fem_GP_1
150.00	300.00	178.63000000	217.280000	-1	 8.5992	-3	0	0	0	0	0.5	0	0	#_L_at_Amax__Fem_GP_1
  0.10	  0.45	  0.42398576	  0.180000	-1	 0.0090	-3	0	0	0	0	0.5	0	0	#_VonBert_K__Fem_GP_1
 -0.10	  0.35	 -0.00034060	  0.180000	-1	 0.0090	-3	0	0	0	0	0.5	0	0	#_Richards__Fem_GP_1 
  0.01	 20.00	  0.10000000	  0.400000	-1	99.0000	-6	0	0	0	0	0.5	0	0	#_CV_young__Fem_GP_1 
  0.01	 30.00	  0.06720210	  0.400000	-1	99.0000	-6	0	0	0	0	0.5	0	0	#_CV_old__Fem_GP_1   
  0.00	  1.00	  0.00002396	  0.000024	-1	 0.8000	-2	0	0	0	0	0.5	0	0	#_Wtlen_1_Fem        
  0.00	  4.00	  2.97740000	  2.976000	-1	 0.8000	-2	0	0	0	0	0.5	0	0	#_Wtlen_2_Fem        
 35.00	119.00	105.00000000	105.000000	-1	 0.8000	-2	0	0	0	0	0.5	0	0	#_Mat50%_Fem         
-10.00	  3.00	-10.00000000	-10.000000	-1	 0.8000	-2	0	0	0	0	0.5	0	0	#_Mat_slope_Fem      
 -3.00	  3.00	  1.00000000	  1.000000	-1	 0.8000	-2	0	0	0	0	0.5	0	0	#_Eggs_scalar_Fem    
 -3.00	  3.00	  0.00000000	  0.000000	-1	 0.8000	-2	0	0	0	0	0.5	0	0	#_Eggs_exp_wt_Fem    
 -4.00	  4.00	  0.00000000	  0.000000	-1	99.0000	-2	0	0	0	0	0.5	0	0	#_RecrDist_GP_1      
 -4.00	  4.00	  0.00000000	  0.000000	-1	 0.0100	-2	0	0	0	0	0.5	0	0	#_RecrDist_Area_1    
 -4.00	  4.00	  0.00000000	  1.820000	-1	 0.0100	-2	0	0	0	0	0.5	0	0	#_RecrDist_Seas_1    
 -6.00	  6.00	  0.00000000	  4.000000	-1	 0.0100	 2	0	0	0	0	0.5	0	0	#_RecrDist_Seas_2    
 -6.00	  6.00	  0.00000000	 -4.000000	-1	 0.0100	 2	0	0	0	0	0.5	0	0	#_RecrDist_Seas_3    
 -4.00	  4.00	  0.00000000	  3.110000	-1	 0.0100	 2	0	0	0	0	0.5	0	0	#_RecrDist_Seas_4    
 -5.00	  4.00	  0.00000000	  0.000000	-1	99.0000	-2	0	0	0	0	0.5	0	0	#_CohortGrowDev      
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
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
 9.0	18.0	9.99881	 9.0	-1	99.0	 1	#_SR_LN(R0)   
 0.2	 1.0	0.70000	 0.7	-1	 0.5	-3	#_SR_BH_steep 
 0.1	 1.5	0.30000	 0.3	-1	 0.5	-5	#_SR_sigmaR   
-5.0	 5.0	0.00000	 0.0	-1	99.0	-5	#_SR_envlink  
-5.0	 5.0	0.00000	 0.0	-1	99.0	-6	#_SR_R1_offset
 0.0	 2.0	0.00000	-1.0	-1	 1.0	-3	#_SR_autocorr 
0 #_SR_env_link
0 #_SR_env_target
1 #_do_recdev
1974 #_first year of main recr_devs; early devs can preceed this era
2012 #_last year of main recr_devs; forecast devs start in following year
6 #_recdev phase
1 #_(0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4 #_recdev_early_phase
-1 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1963.2 #_last_early_yr_nobias_adj_in_MPD
1977.4 #_first_yr_fullbias_adj_in_MPD
2010.7 #_last_yr_fullbias_adj_in_MPD
2014.4 #_first_recent_yr_nobias_adj_in_MPD
0.7671 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-5 #min rec_dev
5 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#Fishing Mortality info
0.25 #_F ballpark for annual F (=Z-M) for specified year
2000 #_F ballpark year (neg value to disable)
3 #_F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 #_max F or harvest rate, depends on F_Method
5 #_N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
0	1	0	0	0	99	-1	#_InitF_1_1_PS_ESFR2_6585     
0	1	0	0	0	99	-1	#_InitF_2_2_PS_ESFR2_8690     
0	1	0	0	0	99	-1	#_InitF_3_3_PS_ESFR2_9114     
0	1	0	0	0	99	-1	#_InitF_4_4_ESFR_FADS2_PS_9114
0	1	0	0	0	99	-1	#_InitF_5_5_BB+PS_Ghana2_6514 
0	1	0	0	0	99	-1	#_InitF_6_6_BB_FisTropS2_6214 
0	1	0	0	0	99	-1	#_InitF_7_7_BB_FisTropN2_6579 
0	1	0	0	0	99	-1	#_InitF_8_8_BB_FisTropN2_8014 
0	1	0	0	0	99	-1	#_InitF_9_9_BB_North1_6514    
0	1	0	0	0	99	-1	#_InitF_10_10_Japan_LL1_6114  
0	1	0	0	0	99	-1	#_InitF_11_11_Japan_LL2_6114  
0	1	0	0	0	99	-1	#_InitF_12_12_Japan_LL3_6114  
0	1	0	0	0	99	-1	#_InitF_13_13_Others1_LL_6514 
0	1	0	0	0	99	-1	#_InitF_14_14_Others2_LL_6514 
0	1	0	0	0	99	-1	#_InitF_15_15_Others3_LL_6114 
#_Q_setup
# Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den_dep	env_var	extra_se	Q_type
0	0	0	0	#_1 1_PS_ESFR2_6585     
0	0	0	0	#_2 2_PS_ESFR2_8690     
0	0	0	0	#_3 3_PS_ESFR2_9114     
0	0	0	0	#_4 4_ESFR_FADS2_PS_9114
0	0	0	0	#_5 5_BB+PS_Ghana2_6514 
0	0	0	0	#_6 6_BB_FisTropS2_6214 
0	0	0	0	#_7 7_BB_FisTropN2_6579 
0	0	0	0	#_8 8_BB_FisTropN2_8014 
0	0	0	0	#_9 9_BB_North1_6514    
0	0	0	0	#_10 10_Japan_LL1_6114  
0	0	0	0	#_11 11_Japan_LL2_6114  
0	0	0	0	#_12 12_Japan_LL3_6114  
0	0	0	0	#_13 13_Others1_LL_6514 
0	0	0	0	#_14 14_Others2_LL_6514 
0	0	0	0	#_15 15_Others3_LL_6114 
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern	Discard	Male	Special
27	0	0	5	#_1 1_PS_ESFR2_6585     
27	0	0	5	#_2 2_PS_ESFR2_8690     
27	0	0	5	#_3 3_PS_ESFR2_9114     
27	0	0	5	#_4 4_ESFR_FADS2_PS_9114
27	0	0	5	#_5 5_BB+PS_Ghana2_6514 
24	0	0	0	#_6 6_BB_FisTropS2_6214 
24	0	0	0	#_7 7_BB_FisTropN2_6579 
24	0	0	0	#_8 8_BB_FisTropN2_8014 
27	0	0	5	#_9 9_BB_North1_6514    
27	0	0	5	#_10 10_Japan_LL1_6114  
24	0	0	5	#_11 11_Japan_LL2_6114  
27	0	0	5	#_12 12_Japan_LL3_6114  
27	0	0	5	#_13 13_Others1_LL_6514 
24	0	0	0	#_14 14_Others2_LL_6514 
27	0	0	5	#_15 15_Others3_LL_6114 
#
#_age_selex_types
#_Pattern	___	Male	Special
14	0	0	0	#_1 1_PS_ESFR2_6585     
15	0	0	1	#_2 2_PS_ESFR2_8690     
15	0	0	1	#_3 3_PS_ESFR2_9114     
15	0	0	1	#_4 4_ESFR_FADS2_PS_9114
15	0	0	1	#_5 5_BB+PS_Ghana2_6514 
15	0	0	1	#_6 6_BB_FisTropS2_6214 
15	0	0	1	#_7 7_BB_FisTropN2_6579 
15	0	0	1	#_8 8_BB_FisTropN2_8014 
15	0	0	1	#_9 9_BB_North1_6514    
15	0	0	1	#_10 10_Japan_LL1_6114  
15	0	0	1	#_11 11_Japan_LL2_6114  
15	0	0	1	#_12 12_Japan_LL3_6114  
15	0	0	1	#_13 13_Others1_LL_6514 
15	0	0	1	#_14 14_Others2_LL_6514 
15	0	0	1	#_15 15_Others3_LL_6114 
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
  0.000	  2.000	   1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_1_PS_ESFR2_6585_1       
  0.100	  2.000	   0.3204100	  1.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_1_PS_ESFR2_6585_1     
 -5.000	  5.000	  -0.0536397	  0.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_1_PS_ESFR2_6585_1     
 25.000	100.000	  34.6067000	  2.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_1_PS_ESFR2_6585_1     
 35.000	150.000	  48.1493000	  3.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_1_PS_ESFR2_6585_1     
 40.000	150.000	  56.3517000	  6.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_1_PS_ESFR2_6585_1     
 40.000	150.000	  74.9580000	 12.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_1_PS_ESFR2_6585_1     
 60.000	200.000	 143.8070000	 20.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_1_PS_ESFR2_6585_1     
 -5.000	  1.000	  -3.9020000	 -2.78	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_1_PS_ESFR2_6585_1      
 -5.000	  1.000	  -0.9523670	 -4.90	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_1_PS_ESFR2_6585_1      
 -5.000	  1.000	  -1.0000000	  0.00	-1	 2.000	 -2	0	0	0	0	0	0	0	#_SizeSpline_Val_3_1_PS_ESFR2_6585_1      
 -5.000	  1.000	  -2.1269500	 -0.77	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_4_1_PS_ESFR2_6585_1      
 -7.000	  1.000	  -3.5295800	  0.00	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_5_1_PS_ESFR2_6585_1      
  0.000	  2.000	   1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_2_PS_ESFR2_8690_2       
  0.100	  2.000	   0.5277800	  1.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_2_PS_ESFR2_8690_2     
 -1.000	  0.000	  -0.1630960	  0.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_2_PS_ESFR2_8690_2     
 25.000	100.000	  36.9486000	  2.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_2_PS_ESFR2_8690_2     
 35.000	150.000	  47.3655000	  3.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_2_PS_ESFR2_8690_2     
 40.000	150.000	  54.8927000	  6.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_2_PS_ESFR2_8690_2     
 40.000	150.000	  69.8236000	 12.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_2_PS_ESFR2_8690_2     
 60.000	200.000	 121.7880000	 20.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_2_PS_ESFR2_8690_2     
 -5.000	  1.000	  -4.5377400	 -2.78	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_2_PS_ESFR2_8690_2      
 -5.000	  1.000	  -1.0540600	 -4.90	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_2_PS_ESFR2_8690_2      
 -5.000	  1.000	  -1.0000000	  0.00	-1	 2.000	 -2	0	0	0	0	0	0	0	#_SizeSpline_Val_3_2_PS_ESFR2_8690_2      
 -5.000	  1.000	  -2.5335400	 -0.77	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_4_2_PS_ESFR2_8690_2      
 -6.000	  1.000	  -4.4121300	  0.00	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_5_2_PS_ESFR2_8690_2      
  0.000	  2.000	   1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_3_PS_ESFR2_9114_3       
  0.100	  1.000	   0.4481530	  1.00	-1	 0.010	 -3	0	0	0	0	0	4	2	#_SizeSpline_GradLo_3_PS_ESFR2_9114_3     
 -1.000	  1.000	  -0.1085550	  0.00	-1	 0.010	 -3	0	0	0	0	0	4	2	#_SizeSpline_GradHi_3_PS_ESFR2_9114_3     
 25.000	100.000	  31.2403000	  2.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_3_PS_ESFR2_9114_3     
 35.000	150.000	  42.1642000	  3.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_3_PS_ESFR2_9114_3     
 40.000	150.000	  49.0302000	  6.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_3_PS_ESFR2_9114_3     
 40.000	150.000	  72.6790000	 12.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_3_PS_ESFR2_9114_3     
130.000	200.000	 155.2070000	 20.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_3_PS_ESFR2_9114_3     
 -5.000	  1.000	  -3.5105700	 -2.78	-1	 2.000	 -2	0	0	0	0	0	4	2	#_SizeSpline_Val_1_3_PS_ESFR2_9114_3      
 -5.000	  1.000	  -1.0189700	 -4.90	-1	 2.000	 -2	0	0	0	0	0	4	2	#_SizeSpline_Val_2_3_PS_ESFR2_9114_3      
 -5.000	  1.000	  -1.0000000	  0.00	-1	 2.000	 -2	0	0	0	0	0	0	0	#_SizeSpline_Val_3_3_PS_ESFR2_9114_3      
 -5.000	  1.000	  -2.7502100	 -0.77	-1	 2.000	 -3	0	0	0	0	0	4	2	#_SizeSpline_Val_4_3_PS_ESFR2_9114_3      
 -5.000	  1.000	  -4.0740000	  0.00	-1	 2.000	 -3	0	0	0	0	0	4	2	#_SizeSpline_Val_5_3_PS_ESFR2_9114_3      
  0.000	  2.000	   1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_4_ESFR_FADS2_PS_9114_4  
  0.100	  2.000	   0.3475470	  1.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_4_ESFR_FADS2_PS_9114_4
 -1.000	  0.010	  -0.1190810	  0.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_4_ESFR_FADS2_PS_9114_4
 25.000	100.000	  33.1646000	  2.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_4_ESFR_FADS2_PS_9114_4
 35.000	150.000	  43.9326000	  3.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_4_ESFR_FADS2_PS_9114_4
 40.000	150.000	  49.8490000	  6.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_4_ESFR_FADS2_PS_9114_4
 40.000	150.000	  60.4926000	 12.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_4_ESFR_FADS2_PS_9114_4
 60.000	200.000	 123.3360000	 20.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_4_ESFR_FADS2_PS_9114_4
 -5.000	  1.000	  -4.7959200	 -2.78	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_4_ESFR_FADS2_PS_9114_4 
 -5.000	  1.000	  -1.5446600	 -4.90	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_4_ESFR_FADS2_PS_9114_4 
 -5.000	  1.000	  -1.0000000	  0.00	-1	 2.000	 -2	0	0	0	0	0	0	0	#_SizeSpline_Val_3_4_ESFR_FADS2_PS_9114_4 
 -5.000	  1.000	  -2.0276000	 -0.77	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_4_4_ESFR_FADS2_PS_9114_4 
 -6.000	  1.000	  -4.3215300	  0.00	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_5_4_ESFR_FADS2_PS_9114_4 
  0.000	  2.000	   1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_5_BB+PS_Ghana2_6514_5   
  0.100	  2.000	   0.9224410	  1.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_5_BB+PS_Ghana2_6514_5 
 -1.000	  0.010	  -0.4026830	  0.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_5_BB+PS_Ghana2_6514_5 
 25.000	100.000	  33.6816000	  2.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_5_BB+PS_Ghana2_6514_5 
 35.000	150.000	  42.6226000	  3.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_5_BB+PS_Ghana2_6514_5 
 40.000	150.000	  45.9627000	  6.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_5_BB+PS_Ghana2_6514_5 
 40.000	150.000	  49.1467000	 12.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_5_BB+PS_Ghana2_6514_5 
 60.000	200.000	  63.6073000	 20.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_5_BB+PS_Ghana2_6514_5 
 -5.000	  1.000	  -4.9593700	 -2.78	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_5_BB+PS_Ghana2_6514_5  
 -5.000	  1.000	  -2.2333600	 -4.90	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_5_BB+PS_Ghana2_6514_5  
 -5.000	  1.000	  -1.0000000	  0.00	-1	 2.000	 -2	0	0	0	0	0	0	0	#_SizeSpline_Val_3_5_BB+PS_Ghana2_6514_5  
 -5.000	  1.000	  -0.3203130	 -0.77	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_4_5_BB+PS_Ghana2_6514_5  
 -7.000	  1.000	  -5.3305000	  0.00	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_5_5_BB+PS_Ghana2_6514_5  
 25.000	200.000	  45.1109000	 50.00	-1	99.000	  2	0	0	0	0	0	0	0	#_SizeSel_6P_1_6_BB_FisTropS2_6214        
-25.000	  0.000	 -13.7809000	-18.57	-1	99.000	  3	0	0	0	0	0	0	0	#_SizeSel_6P_2_6_BB_FisTropS2_6214        
-25.000	 10.000	   3.3148000	 -0.98	-1	99.000	  2	0	0	0	0	0	0	0	#_SizeSel_6P_3_6_BB_FisTropS2_6214        
  0.000	 10.000	   5.8772300	 -2.48	-1	99.000	  4	0	0	0	0	0	0	0	#_SizeSel_6P_4_6_BB_FisTropS2_6214        
-15.000	  0.000	 -15.0000000	-15.00	-1	99.000	 -1	0	0	0	0	0	0	0	#_SizeSel_6P_5_6_BB_FisTropS2_6214        
-20.000	  1.000	  -3.7251300	 -0.91	-1	99.000	  6	0	0	0	0	0	0	0	#_SizeSel_6P_6_6_BB_FisTropS2_6214        
 30.000	 80.000	  58.2830000	 50.00	 1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSel_7P_1_7_BB_FisTropN2_6579        
-25.000	  0.000	 -12.5000000	-18.57	 1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSel_7P_2_7_BB_FisTropN2_6579        
  0.000	 10.000	   4.0539400	 -0.98	 1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSel_7P_3_7_BB_FisTropN2_6579        
  0.000	 10.000	   7.5332300	 -2.48	 1	 2.000	  4	0	0	0	0	0	0	0	#_SizeSel_7P_4_7_BB_FisTropN2_6579        
-15.000	  0.000	 -15.0000000	-15.00	 1	99.000	 -1	0	0	0	0	0	0	0	#_SizeSel_7P_5_7_BB_FisTropN2_6579        
-20.000	  1.000	  -9.4822400	 -0.91	 1	 2.000	  6	0	0	0	0	0	0	0	#_SizeSel_7P_6_7_BB_FisTropN2_6579        
 30.000	150.000	  55.0077000	 50.00	 1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSel_8P_1_8_BB_FisTropN2_8014        
-10.000	  0.000	  -4.7043900	-18.57	 1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSel_8P_2_8_BB_FisTropN2_8014        
  0.000	 10.000	   4.5674500	 -0.98	 1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSel_8P_3_8_BB_FisTropN2_8014        
  0.000	 10.000	   8.1804000	 -2.48	 1	 2.000	  4	0	0	0	0	0	0	0	#_SizeSel_8P_4_8_BB_FisTropN2_8014        
-15.000	 10.000	 -15.0000000	-15.00	 1	99.000	 -1	0	0	0	0	0	0	0	#_SizeSel_8P_5_8_BB_FisTropN2_8014        
-25.000	  5.000	 -10.0230000	 -0.91	 1	 2.000	  6	0	0	0	0	0	0	0	#_SizeSel_8P_6_8_BB_FisTropN2_8014        
  0.000	  2.000	   1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_9_BB_North1_6514_9      
  0.010	  1.000	   0.2130290	  1.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_9_BB_North1_6514_9    
 -1.000	  2.000	  -0.0413683	  0.00	-1	 0.010	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_9_BB_North1_6514_9    
 35.000	100.000	  53.8608000	  2.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_9_BB_North1_6514_9    
 35.000	150.000	  78.9683000	  3.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_9_BB_North1_6514_9    
 40.000	150.000	  96.4421000	  6.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_9_BB_North1_6514_9    
 40.000	150.000	 115.6990000	 12.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_9_BB_North1_6514_9    
 60.000	200.000	 166.1030000	 20.00	-1	 0.500	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_9_BB_North1_6514_9    
 -5.000	  1.000	  -3.4045100	 -2.78	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_9_BB_North1_6514_9     
 -5.000	  1.000	  -1.5631300	 -4.90	-1	 2.000	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_9_BB_North1_6514_9     
 -5.000	  1.000	  -1.0000000	  0.00	-1	 2.000	 -2	0	0	0	0	0	0	0	#_SizeSpline_Val_3_9_BB_North1_6514_9     
 -5.000	  1.000	  -1.1817600	 -0.77	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_4_9_BB_North1_6514_9     
 -5.000	  3.000	  -2.4384700	  0.00	-1	 2.000	  3	0	0	0	0	0	0	0	#_SizeSpline_Val_5_9_BB_North1_6514_9     
  0.000	  2.000	   2.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_10_Japan_LL1_6114_10    
 -0.001	  1.000	   0.1469600	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_10_Japan_LL1_6114_10  
 -1.000	  0.001	  -0.2092360	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_10_Japan_LL1_6114_10  
  1.000	 10.000	  74.4538000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_10_Japan_LL1_6114_10  
  1.000	 10.000	  98.4854000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_10_Japan_LL1_6114_10  
  1.000	 10.000	 111.2460000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_10_Japan_LL1_6114_10  
  1.000	 10.000	 124.5750000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_10_Japan_LL1_6114_10  
  1.000	 10.000	 155.8120000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_10_Japan_LL1_6114_10  
 -9.000	  7.000	  -3.6421900	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_10_Japan_LL1_6114_10   
 -9.000	  7.000	  -1.4665000	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_10_Japan_LL1_6114_10   
 -9.000	  7.000	  -1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Val_3_10_Japan_LL1_6114_10   
 -9.000	  7.000	  -1.0919600	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_4_10_Japan_LL1_6114_10   
 -9.000	  7.000	  -3.4095300	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_5_10_Japan_LL1_6114_10   
 25.000	200.000	 100.0000000	100.00	-1	99.000	  2	0	0	0	0	0	6	2	#_SizeSel_11P_1_11_Japan_LL2_6114         
-25.000	  0.000	 -13.7809000	-18.57	-1	99.000	  3	0	0	0	0	0	0	0	#_SizeSel_11P_2_11_Japan_LL2_6114         
-20.000	 10.000	   3.3148000	 -0.98	-1	99.000	  2	0	0	0	0	0	0	0	#_SizeSel_11P_3_11_Japan_LL2_6114         
  0.000	 10.000	   5.8772300	 -2.48	-1	99.000	  5	0	0	0	0	0	6	2	#_SizeSel_11P_4_11_Japan_LL2_6114         
-15.000	  0.000	-999.0000000	-15.00	-1	99.000	 -1	0	0	0	0	0	0	0	#_SizeSel_11P_5_11_Japan_LL2_6114         
-20.000	  5.000	   5.0000000	  2.00	-1	99.000	 -5	0	0	0	0	0	0	0	#_SizeSel_11P_6_11_Japan_LL2_6114         
  0.000	  2.000	   2.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_12_Japan_LL3_6114_12    
 -0.001	  1.000	   0.1095200	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_12_Japan_LL3_6114_12  
 -1.000	  0.001	  -0.0952184	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_12_Japan_LL3_6114_12  
  1.000	 10.000	  71.5041000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_12_Japan_LL3_6114_12  
  1.000	 10.000	 103.7500000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_12_Japan_LL3_6114_12  
  1.000	 10.000	 119.8780000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_12_Japan_LL3_6114_12  
  1.000	 10.000	 134.0090000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_12_Japan_LL3_6114_12  
  1.000	 10.000	 165.2750000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_12_Japan_LL3_6114_12  
 -9.000	  7.000	  -3.7838500	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_12_Japan_LL3_6114_12   
 -9.000	  7.000	  -1.5679400	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_12_Japan_LL3_6114_12   
 -9.000	  7.000	  -1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Val_3_12_Japan_LL3_6114_12   
 -9.000	  7.000	  -0.9187010	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_4_12_Japan_LL3_6114_12   
 -9.000	  7.000	  -2.6849300	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_5_12_Japan_LL3_6114_12   
  0.000	  2.000	   2.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_13_Others1_LL_6514_13   
 -0.001	  1.000	   0.1299700	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_13_Others1_LL_6514_13 
 -1.000	  0.001	  -0.1914660	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_13_Others1_LL_6514_13 
  1.000	 10.000	  72.7990000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_13_Others1_LL_6514_13 
  1.000	 10.000	  98.0751000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_13_Others1_LL_6514_13 
  1.000	 10.000	 111.7460000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_13_Others1_LL_6514_13 
  1.000	 10.000	 124.8830000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_13_Others1_LL_6514_13 
  1.000	 10.000	 154.7940000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_13_Others1_LL_6514_13 
 -9.000	  7.000	  -3.6080300	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_13_Others1_LL_6514_13  
 -9.000	  7.000	  -1.4161700	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_13_Others1_LL_6514_13  
 -9.000	  7.000	  -1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Val_3_13_Others1_LL_6514_13  
 -9.000	  7.000	  -0.8718010	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_4_13_Others1_LL_6514_13  
 -9.000	  7.000	  -3.1808000	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_5_13_Others1_LL_6514_13  
 25.000	200.000	 100.0000000	100.00	-1	99.000	  2	0	0	0	0	0	5	2	#_SizeSel_14P_1_14_Others2_LL_6514        
-25.000	  0.000	 -13.7809000	-18.57	-1	99.000	  3	0	0	0	0	0	0	0	#_SizeSel_14P_2_14_Others2_LL_6514        
-20.000	 10.000	   3.3148000	 -0.98	-1	99.000	  2	0	0	0	0	0	0	0	#_SizeSel_14P_3_14_Others2_LL_6514        
  0.000	 10.000	   5.8772300	 -2.48	-1	99.000	  5	0	0	0	0	0	5	2	#_SizeSel_14P_4_14_Others2_LL_6514        
-15.000	  0.000	-999.0000000	-15.00	-1	99.000	 -1	0	0	0	0	0	0	0	#_SizeSel_14P_5_14_Others2_LL_6514        
-20.000	  5.000	   3.0000000	  2.00	-1	99.000	  5	0	0	0	0	0	5	2	#_SizeSel_14P_6_14_Others2_LL_6514        
  0.000	  2.000	   2.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Code_15_Others3_LL_6114_15   
 -0.001	  1.000	   0.0974065	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradLo_15_Others3_LL_6114_15 
 -1.000	  0.001	  -0.0716595	  0.00	 1	 0.001	  3	0	0	0	0	0	0	0	#_SizeSpline_GradHi_15_Others3_LL_6114_15 
  1.000	 10.000	  70.8085000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_1_15_Others3_LL_6114_15 
  1.000	 10.000	 105.9630000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_2_15_Others3_LL_6114_15 
  1.000	 10.000	 122.3460000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_3_15_Others3_LL_6114_15 
  1.000	 10.000	 137.2960000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_4_15_Others3_LL_6114_15 
  1.000	 10.000	 168.6140000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Knot_5_15_Others3_LL_6114_15 
 -9.000	  7.000	  -3.9048500	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_1_15_Others3_LL_6114_15  
 -9.000	  7.000	  -1.6163300	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_2_15_Others3_LL_6114_15  
 -9.000	  7.000	  -1.0000000	  0.00	-1	 0.000	-99	0	0	0	0	0	0	0	#_SizeSpline_Val_3_15_Others3_LL_6114_15  
 -9.000	  7.000	  -0.9629610	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_4_15_Others3_LL_6114_15  
 -9.000	  7.000	  -2.4432900	  0.00	 1	 0.001	  2	0	0	0	0	0	0	0	#_SizeSpline_Val_5_15_Others3_LL_6114_15  
#_AgeSelex
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE	env_var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_1_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_2_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_3_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_4_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_5_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_6_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_7_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_8_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_9_1_PS_ESFR2_6585 
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_10_1_PS_ESFR2_6585
-5	9	9	9	-1	99	-3	0	0	0	0	0.5	0	0	#_AgeSel_1P_11_1_PS_ESFR2_6585
#_Cond 0 #_custom_sel-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
1 #_custom_sel-blk_setup (0/1) 
#_LO	HI	INIT	PRIOR	PR_type	SD	PHASE
0.01	1  	0.526913 	0.51892 	1 	2 	5 	#_custom_sel_blk_setup1 
0.1 	1  	0.148316 	0.50803 	1 	2 	5 	#_custom_sel_blk_setup2 
-5  	1  	-2.26504 	-0.68458	1 	2 	5 	#_custom_sel_blk_setup3 
-5  	1  	-0.223822	-2.7376 	1 	2 	5 	#_custom_sel_blk_setup4 
-5  	1  	-1.90927 	-4.57259	1 	2 	5 	#_custom_sel_blk_setup5 
-5  	1  	-0.784245	-2.77911	1 	2 	5 	#_custom_sel_blk_setup6 
20  	200	100      	100     	-1	99	6 	#_custom_sel_blk_setup7 
0   	10 	5.87723  	-2.48   	-1	99	6 	#_custom_sel_blk_setup8 
#   	#  	#        	#       	# 	# 	# 	#_custom_sel_blk_setup9 
20  	200	100      	100     	-1	99	6 	#_custom_sel_blk_setup10
0   	10 	5.87723  	-2.48   	-1	99	6 	#_custom_sel_blk_setup11
-20 	5  	5        	2       	-1	99	-6	#_custom_sel_blk_setup12
#_Cond No selex parm trends 
#_Cond -4 # placeholder for selparm_Dev_Phase
2 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
#
# Tag loss and Tag reporting parameters go next
0 #_TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_Fleet1	Fleet2	Fleet3	Fleet4	Fleet5	Fleet6	Fleet7	Fleet8	Fleet9	Fleet10	Fleet11	Fleet12	Fleet13	Fleet14	Fleet15
0.00000	0	0.000000	0.000000	0.000000	0.000000	0	0.00000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	#_add_to_survey_CV     
0.00000	0	0.000000	0.000000	0.000000	0.000000	0	0.00000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	#_add_to_discard_stddev
0.00000	0	0.000000	0.000000	0.000000	0.000000	0	0.00000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	0.000000	#_add_to_bodywt_CV     
1.27682	1	0.386217	0.505838	0.698057	0.487444	1	0.15374	0.171793	0.129711	0.114048	0.152398	0.247076	0.159575	0.133499	#_mult_by_lencomp_N    
1.00000	1	1.000000	1.000000	1.000000	1.000000	1	1.00000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	#_mult_by_agecomp_N    
1.00000	1	1.000000	1.000000	1.000000	1.000000	1	1.00000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	1.000000	#_mult_by_size-at-age_N
2 #_maxlambdaphase
1 #_sd_offset
29 #_number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch;
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#_like_comp	fleet/survey	phase	value	sizefreq_method
1	 4	1	0.0	1	#_Surv_4_ESFR_FADS2_PS_9114_Phz1  
1	 8	1	0.0	1	#_Surv_8_BB_FisTropN2_8014_Phz1   
1	10	1	1.0	1	#_Surv_10_Japan_LL1_6114_Phz1     
1	11	1	1.0	1	#_Surv_11_Japan_LL2_6114_Phz1     
1	12	1	1.0	1	#_Surv_12_Japan_LL3_6114_Phz1     
1	13	1	1.0	1	#_Surv_13_Others1_LL_6514_Phz1    
1	14	1	1.0	1	#_Surv_14_Others2_LL_6514_Phz1    
1	15	1	1.0	1	#_Surv_15_Others3_LL_6114_Phz1    
4	 1	1	0.5	1	#_length_1_PS_ESFR2_6585_Phz1     
4	 2	1	0.5	1	#_length_2_PS_ESFR2_8690_Phz1     
4	 3	1	0.5	1	#_length_3_PS_ESFR2_9114_Phz1     
4	 4	1	0.5	1	#_length_4_ESFR_FADS2_PS_9114_Phz1
4	 5	1	0.5	1	#_length_5_BB+PS_Ghana2_6514_Phz1 
4	 6	1	0.5	1	#_length_6_BB_FisTropS2_6214_Phz1 
4	 7	1	0.5	1	#_length_7_BB_FisTropN2_6579_Phz1 
4	 8	1	0.5	1	#_length_8_BB_FisTropN2_8014_Phz1 
4	 9	1	0.5	1	#_length_9_BB_North1_6514_Phz1    
4	10	1	0.5	1	#_length_10_Japan_LL1_6114_Phz1   
4	11	1	0.5	1	#_length_11_Japan_LL2_6114_Phz1   
4	12	1	0.5	1	#_length_12_Japan_LL3_6114_Phz1   
4	13	1	0.5	1	#_length_13_Others1_LL_6514_Phz1  
4	14	1	0.5	1	#_length_14_Others2_LL_6514_Phz1  
4	15	1	0.5	1	#_length_15_Others3_LL_6114_Phz1  
7	 1	1	0.0	1	#_lambdas24                       
7	 5	1	0.0	1	#_lambdas25                       
7	 6	1	0.0	1	#_lambdas26                       
7	 8	1	0.0	1	#_lambdas27                       
7	 9	1	0.0	1	#_lambdas28                       
7	11	1	0.0	1	#_lambdas29                       
0 #_more_stddev_reporting
# 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
# placeholder for vector of selex bins to be reported
# placeholder for vector of growth ages to be reported
# placeholder for vector of NatAges ages to be reported
#
999
