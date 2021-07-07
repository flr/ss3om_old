# YFT-EPO model.  SAC7, 2016. Developed by A. Aires-da-Silva and M. Maunder (2012)  
# DATA UPDATED April 5 2018 by C.V. Minte-Vera  
#_data_and_control_files: YFT-EPO.dat, YFT-EPO.ctl  
# includes survey fleets for LL _LF  
#FisheryNum FisheryAlpha Gear SetType Years  
#1-F1 F1-OBJ_S PS OBJ 1975-present  
#2-F2 F2-OBJ_C PS OBJ 1975-present  
#3-F3 F3-OBJ_I PS OBJ 1975-present  
#4-F4 F4-OBJ_N PS OBJ 1975-present  
#5-F5 F5-NOA_N PS NOA 1975-present  
#6-F6 F6-NOA_S PS NOA 1975-present  
#7-F7 F7-DEL_N PS DEL 1975-present  
#8-F8 F8-DEL_I PS DEL 1975-present  
#9-F9 F9-DEL_S PS DEL 1975-present  
#10-F10 F10-BB LP LP 1975-present  
#11-F11 F11-LL_N LL LL 1975-present  
#12-F12 F12-LL_S LL LL 1975-present  
#13-F13 F13-OBJ_S_disc PS OBJ 1993-present  
#14-F14 F14-OBJ_C_disc PS OBJ 1993-present  
#15-F15 F15-OBJ_I_disc PS OBJ 1993-present  
#16-F16 F16-OBJ_N_disc PS OBJ 1993-present  
#17-F17 S1-LLc_N_Weight LL LL 1975-present  
#18-F18 S2-LLc_S_Weight LL LL 1975-present  
#19-F19 S3-LLt_N_Length LL LL 1975-present  
#20-F20 S4-LLt_S_Length LL LL 1975-present  
1 #_N_Growth_Patterns 
1 #_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)                              
#_Cond 1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)    
#_Cond 0 # N recruitment designs goes here if N_GP*nseas*area>1                           
#_Cond 0 # placeholder for recruitment interaction request - year*area                           
#_Cond 1 1 1 # example recruitment design element for GP=1 seas=1 area=1                        
#_Cond 0 # N_movement_definitions goes here if N_areas > 1                           
#_Cond 1 # first age that moves (real age at begin of season not integer) also cond on do_migration>0                  
#_Cond 1 1 1 2 4 10 # example move definition for seas=1 morph=1 source=1 dest=2 age1=4 age2=10                   
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
0.7 0.6 0.5 0.44 0.38 0.32 0.26 0.199999968 0.200465008 0.213709829 0.260307784 0.324727122 0.380456027 0.418454468 0.441602776 0.455123355 0.463001474 0.467679908 0.470540921 0.472349102 0.473529685 0.474323941 0.47487256 0.475260119 0.475539077 0.475742968 0.475893854 0.476006629 0.476091588 0.476155993       
0.7 0.6 0.5 0.44 0.38 0.32 0.26 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968 0.199999968       
2 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=not implemented; 4=not implemented                        
0 #_Growth_Age_for_L1 
29 #_Growth_Age_for_L2 (999 to use as Linf)                              
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)                            
1 #_CV_Growth_Pattern: 0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A)                           
4 #_maturity_option: 1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity                        
#_Age_Maturity by growth pattern   
#Includes fecundity 
0 0 0 0 0 5.67E-05 0.007159248 0.066470331 0.237111472 0.529453484 0.914928666 1.359411008 1.836150768 2.325351971 2.811596501 3.282498215 3.728382556 4.14228158 4.519844774 4.859063474 5.159853909 5.423583587 5.652613797 5.849903483 6.018693952 6.162275687 6.283828144 6.386319002 6.472448731 6.544627761       
0 #_First_Mature_Age 
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b    
0 #_hermaphroditism option: 0=none; 1=age-specific fxn 
3 #_parameter_offset_approach (1=none 2= M G CV_G as offset from female-GP1 3=like SS2 V1.x)                       
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)                      
#_growth_parms  
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn                       
##_Gpattern:_1_Gender:_1  
# -3 3 0.2 0.2 0 0.8 -3 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP:1_                    
# -3 3 -2 -2 0 0.8 -3 0 0 0 0 0 0 0 # NatM_p_2_Fem_GP:1_                    
# L-A-A 
1 45 18.36857873 26.7812 -1 10 -4 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1                     
40 250 182.3073124 192.446 -1 10 -2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1                     
0.01 1 0.192285372 0.0676951 -1 0.8 -4 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1_                     
-5 5 -0.54299533 0.0676951 -1 0.8 -4 0 0 0 0 0.5 0 0 # Richards_shape_Fem_GP_1_                     
0.001 4 0.099747 0.0834877 -1 0.8 -3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1_                     
-3 3 0 1.815753115 -1 0.8 -3 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1_                     
##_Gpattern:_1_Gender:_2  
# M 
#-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0 # NatM_p_1_Male_GP:1_                     
#-3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0 # NatM_p_2_Male_GP:1_                     
# L-A-A 
-3 3 0 0 -1 0.8 -3 0 0 0 0 0.5 0 0 # L_at_Amin_Male_GP_1                     
-3 3 0 0 -1 0.8 -2 0 0 0 0 0.5 0 0 # L_at_Amax_Male_GP_1                     
-3 3 0 0 -1 0.8 -3 0 0 0 0 0.5 0 0 # VonBert_K_Male_GP_1_                     
-3 3 0 0 -1 0.8 -3 0 0 0 0 0.5 0 0 # VonBert_K_Male_GP_1_                     
-3 3 0 0 -1 0.8 -3 0 0 0 0 0.5 0 0 # CV_young_Male_GP_1_                     
-3 3 0 1.815753115 -1 0.8 -3 0 0 0 0 0.5 0 0 # CV_old_Male_GP_1_                     
## FEMALE BIOLOGY    
# W-L 
-3 3 0.00001387 3.66E-05 -1 0.8 -3 0 0 0 0 0.5 0 0 # W-L (a)                    
-3 5 3.086 2.90182 -1 0.8 -3 0 0 0 0 0.5 0 0 # W-L (b)                    
# Maturity 
-10000 10000 -9999 55 -1 0.8 -3 0 0 0 0 0.5 0 0 # Maturity (logistic - inflection: age)                 
-3 3 -0.25 -0.25 -1 0.8 -3 0 0 0 0 0.5 0 0 # Maturity (logistic - slope: age)                 
-3 3 0 1 -1 0.8 -3 0 0 0 0 0.5 0 0 # Eggs/gm (intercept)                    
-3 3 1 0 -1 0.8 -3 0 0 0 0 0.5 0 0 # Eggs/gm (slope)                    
## MALE BIOLOGY    
# W-L 
-3 3 0.00001387 3.66E-05 -1 0.8 -3 0 0 0 0 0.5 0 0 # W-L (a)                    
-3 5 3.086 2.90182 -1 0.8 -3 0 0 0 0 0.5 0 0 # W-L (a)                    
# Recruitment distribution (Growth pattern x Area x Season 'parameter lines')                          
-4 4 0 0 -1 99 -3 0 0 0 0 0.5 0 0 # Recruitment distribution by Growth pattern                 
-4 4 0 0 -1 99 -3 0 0 0 0 0.5 0 0 # Recruitment distribution by Area 1                 
-4 4 4 0 -1 99 -3 0 0 0 0 0.5 0 0 # Recruitment distribution by Season 1                 
1 1 1 1 -1 99 -3 0 0 0 0 0.5 0 0 # Cohort growth deviation                   
# Movement parameters    
# LO HI INIT PRIOR Pr_type SD PHASE                             
# switch on estimation at phase 5                              
# area 1 to 2 - start end ramp                            
#-8 1 -6 -6 0 5 5 0 0 0 0 0 0 0                       
#-8 1 -4 -4 0 5 5 0 0 0 0 0 0 0                       
#_Cond 0 #custom_MG-env_setup (0/1)   
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters                        
#_Cond 0 #custom_MG-block_setup (0/1)   
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters                        
#_Cond No MG parm trends  
#_seasonal_effects_on_biology_parms  
0 0 0 0 0 0 0 0 0 0 #_femwtlen1 femwtlen2 mat1 mat2 fec1 fec2 Malewtlen1 malewtlen2 L1 K                 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters                       
#_Spawner-Recruitment  
3 # S-R model: 1=B-H (flat-top); 2=Ricker; 3=B-H (std.); 4=ignore steepness and bias adjustment                       
#_LO HI INIT PRIOR PR_type SD PHASE                              
3 80 14 9.3 -1 10 6 # ln(R0) # Free up in phase6                       
0.2 1 1 1 -1 0.2 -4 # Steepness of S-R                          
0 2 0.6 0.6 -1 0.8 -3 # Sigma-R (SD) of ln(R_devs)                         
-5 5 0 0 -1 1 -3 # Env_link coefficient                           
-5 5 0 0 -1 1 1 # Offset for initial equilibrium R1 relative to virgin recruitment                    
0 0 0 0 -1 99 -99 # Auto-correlation factor                           
0 #_SR_env_link 
0 #_SR_env_target_1=devs;_2=R0;_3=steepness 
1 #do_recdev: 0=none; 1=devvector; 2=simple deviations 
# rec devs start earlier than model start year to establish init conditions                        
1 # first year of main recr_devs; early devs can preceed this era                        
172 # last year of main recr_devs; forecast devs start in following year                        
1 #_recdev phase    
## introduced to do temporal variation in rec devs for region                          
1 # (0/1) to read 13 advanced options                             
-15 #_recdev_early_start (0=none; neg value makes relative to recdev_start)                            
2 #_recdev_early_PH 
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)                          
1 #_lambda for prior_fore_recr occurring before endyr+1                              
-16 #_last_yr_nobias_adj_in_MPD 
-4 #_first_yr_fullbias_adj_in_MPD 
171 #_last_yr_fullbias_adj_in_MPD # 145   
172 #_first_recent_yr_nobias_adj_in_MPD # 146   
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
0.2 # F ballpark for tuning early phases                             
172 # F ballpark year (neg value to disable)                            
3 # F_Method: 1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)                           
5 # max F or harvest rate depends on F_Method                           
# no additional F input needed for Fmethod 1                            
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read                      
# if Fmethod=3; read N iterations for tuning for Fmethod 3 (recommend 3 to 7)                      
5 # N iterations for tuning F in hybrid method (recommend 3 to 7)                       
#Fleet Year Seas F_value se phase (for detailed setup of F_Method=2)                          
#_initial_F_parms  
#_LO HI INIT PRIOR PR_type SD PHASE                              
0 1 0 0.01 -1 99 -1 # F1-OBJ_S                            
0 1 0 0.01 -1 99 -1 # F2-OBJ_C                            
0 1 0 0.01 -1 99 -1 # F3-OBJ_I                            
0 1 0 0.01 -1 99 -1 # F4-OBJ_N                            
0 1 0 0.01 -1 99 -1 # F5-NOA_N                            
0 1 0 0.01 -1 99 -1 # F6-NOA_S                            
0 1 0.05 0.01 -1 99 1 # F7-DEL_N                            
0 1 0 0.01 -1 99 -1 # F8-DEL_I                            
0 1 0 0.01 -1 99 -1 # F9-DEL_S                            
0 1 0 0.01 -1 99 -1 # F10-BB                            
0 1 0 0.01 -1 99 -1 # F11-LL_N                            
0 1 0 0.01 -1 99 -1 # F12-LL_S                            
0 1 0 0.01 -1 99 -1 # F13-OBJ_S_disc                            
0 1 0 0.01 -1 99 -1 # F14-OBJ_C_disc                            
0 1 0 0.01 -1 99 -1 # F15-OBJ_I_disc                            
0 1 0 0.01 -1 99 -1 # F16-OBJ_N_disc                            
#_Q_setup  
 # A=do power B=env-var C=extra SD D=devtype(<0=mirror 0/1=none 2=cons 3=rand 4=randwalk)                         
 #_A B C D  
0 0 0 0 # F1-OBJ_S 
0 0 0 0 # F2-OBJ_C 
0 0 0 0 # F3-OBJ_I 
0 0 0 0 # F4-OBJ_N 
0 0 1 0 # F5-NOA_N 
0 0 1 0 # F6-NOA_S 
0 0 1 0 # F7-DEL_N 
0 0 1 0 # F8-DEL_I 
0 0 0 0 # F9-DEL_S 
0 0 0 0 # F10-BB 
0 0 0 0 # F11-LL_N 
0 0 0 0 # F12-LL_S 
0 0 0 0 # F13-OBJ_S_disc 
0 0 0 0 # F14-OBJ_C_disc 
0 0 0 0 # F15-OBJ_I_disc 
0 0 0 0 # F16-OBJ_N_disc 
0 0 0 0 # S1-LLc_N_Weight 
0 0 0 0 # S2-LLc_S_Weight 
0 0 0 0 # S3-LLt_N_Length 
0 0 0 0 # S4-LLt_S_Length 
#_Cond 0 #_If q has random component then 0=read one parm for each fleet with random q; 1=read a parm for each year of index            
#_Q_parms(if_any)  
# LO HI INIT PRIOR PR_type SD PHASE                             
-0.25 10 0 0.01 -1 99 3 # F5-NOA_N                            
-0.25 10 0 0.01 -1 99 3 # F6-NOA_S                            
-0.25 10 0 0.01 -1 99 3 # F7-DEL_N                            
-0.25 10 0 0.01 -1 99 3 # F8-DEL_I                            
#-0.15 10 0 0.01 -1 99 3 # F12-LL_S                            
#_size_selex_types  
#_Pattern Discard Male Special   
24 0 0 0 # F1-OBJ_S 
24 0 0 0 # F2-OBJ_C 
24 0 0 0 # F3-OBJ_I 
24 0 0 0 # F4-OBJ_N 
24 0 0 0 # F5-NOA_N 
24 0 0 0 # F6-NOA_S 
24 0 0 0 # F7-DEL_N 
24 0 0 0 # F8-DEL_I 
24 0 0 0 # F9-DEL_S 
24 0 0 0 # F10-BB 
24 0 0 0 # F11-LL_N 
5 0 0 9 # F12-LL_S 
0 0 0 0 # F13-OBJ_S_disc 
0 0 0 0 # F14-OBJ_C_disc 
0 0 0 0 # F15-OBJ_I_disc 
0 0 0 0 # F16-OBJ_N_disc 
5 0 0 11 #F17 S1-LLc_N_Weight  mirrows F11                            
5 0 0 12 #F18 S2-LLc_S_Weight  F12                             
24 0 0 0 #F19 S3-LLt_N_Length estimates                              
24 0 0 0 #F20 S4-LLt_S_Length estimates                              
#_age_selex_types  
#_Pattern Discard Male Special   
10 0 0 0 # F1-OBJ_S 
10 0 0 0 # F2-OBJ_C 
10 0 0 0 # F3-OBJ_I 
10 0 0 0 # F4-OBJ_N 
10 0 0 0 # F5-NOA_N 
10 0 0 0 # F6-NOA_S 
10 0 0 0 # F7-DEL_N 
10 0 0 0 # F8-DEL_I 
10 0 0 0 # F9-DEL_S 
10 0 0 0 # F10-BB 
10 0 0 0 # F11-LL_N 
10 0 0 0 # F12-LL_S 
11 0 0 0 # F13-OBJ_S_disc 
11 0 0 0 # F14-OBJ_C_disc 
11 0 0 0 # F15-OBJ_I_disc 
11 0 0 0 # F16-OBJ_N_disc 
10 0 0 0 #F17 S1-LLc_N_Weight 
10 0 0 0 #F18 S2-LLc_S_Weight 
10 0 0 0 #F19 S3-LLt_N_Length 
10 0 0 0 #F20 S4-LLt_S_Length 
# Length selectivity parameterization   
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn                       
#_size_sel: F1-OBJ_S 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 0 0 -1 0 7 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 4.8 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6.527866643 0 -1 0 -7 0 0 0 0 0.5 0 0 # p4 - Descending width # This parameter had to be fixed to obtain Hessian        
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F2-OBJ_C 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 0 0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 4.8 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -15 0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F3-OBJ_I 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 0 0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 4.8 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 6 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F4-OBJ_N 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 0 0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 4.8 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -15 0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F5-NOA_N 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 -1 0 -1 0 5 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 4.8 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -15 0 -1 -5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F6-NOA_S 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 -3.3 0 -1 0 6 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 6 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F7-DEL_N 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 -2 0 -1 0 7 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 7 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F8-DEL_I 
20 199 93.3115 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 0.0204854 0 -1 0 5 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-15 15 6.28265 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-15 15 7.33786 0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F9-DEL_S 
20 199 160 50 -1 0 3 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 -3.3 0 -1 0 -7 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
0 15 6 0 -1 0 -7 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 15 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F10-BB 
20 199 50 50 -1 0 4 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 0 0 -1 0 3 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 4.8 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -15 0 -1 5 -2 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F11-LL_N 
20 199 160 50 -1 0 3 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 -3.3 0 -1 0 7 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 7 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F12-LL_S 
20 200 -1 50 -1 0 -4 0 0 0 0 0.5 0 0 # p1 - min bin                  
-50 4 -90 0 -1 0 -5 0 0 0 0 0.5 0 0 # p2 - max bin                  
#_size_sel: F13-OBJ_S_disc 
#_size_sel: F14-OBJ_C_disc 
#_size_sel: F15-OBJ_I_disc 
#_size_sel: F16-OBJ_N_disc 
#_size_sel:17-F17 S1-LLc_N_Weight LL mirrows F11  
20 200 -1 50 -1 0 -4 0 0 0 0 0.5 0 0 # p1 - min bin                  
-50 4 -90 0 -1 0 -5 0 0 0 0 0.5 0 0 # p2 - max bin                  
##_size_sel:F18 S2-LLc_S_Weight  mirrows F12  
20 200 -1 50 -1 0 -4 0 0 0 0 0.5 0 0 # p1 - min bin                  
-50 4 -90 0 -1 0 -5 0 0 0 0 0.5 0 0 # p2 - max bin                  
#_size_sel: F19 S3-LLt_N_Length LL   
20 199 160 50 -1 0 3 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 -3.3 0 -1 0 7 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 7 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
#_size_sel: F20 S4-LLt_S_Length    
20 199 160 50 -1 0 3 0 0 0 0 0.5 0 0 # p1 - Peak value                  
-15 15 -3.3 0 -1 0 7 0 0 0 0 0.5 0 0 # p2 - Top logistic                  
-5 15 6 0 -1 0 3 0 0 0 0 0.5 0 0 # p3 - Ascending width                  
-5 15 6 0 -1 0 7 0 0 0 0 0.5 0 0 # p4 - Descending width                  
-15 15 -15 0 -1 0 -2 0 0 0 0 0.5 0 0 # p5 - Initial selectivity at first bin               
-15 15 -999 0 -1 5 -3 0 0 0 0 0.5 0 0 # p6 - Final selectivity at last bin               
# Age selectivity parameterization   
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn                       
#_age_sel: 1 
#_age_sel: 2 
#_age_sel: 3 
#_age_sel: 4 
#_age_sel: 5 
#_age_sel: 6 
#_age_sel: 7 
#_age_sel: 8 
#_age_sel: 9 
#_age_sel: 10 
#_age_sel: 11 
#_age_sel: 12 
#_age_sel: F13-OBJ_S_disc 
1 40 1 1 -1 99 -1 0 0 0 0 0.5 0 0 # min                     
1 40 3 3 -1 99 -1 0 0 0 0 0.5 0 0 # max                     
#_age_sel: F14-OBJ_C_disc 
1 40 1 1 -1 99 -1 0 0 0 0 0.5 0 0 #                      
1 40 3 3 -1 99 -1 0 0 0 0 0.5 0 0 #                      
#_age_sel: F15-OBJ_I_disc 
1 40 1 1 -1 99 -1 0 0 0 0 0.5 0 0 #                      
1 40 3 3 -1 99 -1 0 0 0 0 0.5 0 0 #                      
#_age_sel: F16-OBJ_N_disc 
1 40 1 1 -1 99 -1 0 0 0 0 0.5 0 0 #                      
1 40 3 3 -1 99 -1 0 0 0 0 0.5 0 0 #                      
#_age_sel: 17 
#_age_sel: 18 
#_age_sel: 19 
#_age_sel: 20 
#_Cond 0 #_custom_sel-env_setup (0/1)   
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns                        
#_Cond 0 #_custom_sel-blk_setup (0/1)   
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no block usage                        
#_Cond No selex parm trends  
#_Cond -4 # placeholder for selparm_Dev_Phase 
#_Cond 0 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)                    
# Tag loss and Tag reporting parameters go next                            
0 # TG_custom: 0=no read; 1=read if tags exist                            
1 #_Variance_adjustments_to_input_values 
#_1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20                 
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 # Row 1 value added to survey CV (set to zero for no effect)   
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 # Row 2 value added to discard stddev (set to zero for no effect)   
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 # Row 3 value added to mean body wt stddev (set to zero for no effect) 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 # Row 4 multiplier for lencomp effective N (set to 1 for no effect)   
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 # Row 5 multiplier for agecomp effective N (set to 1 for no effect)   
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 # Row 6 multiplier for size-at-age effective N (set to 1 for no effect)   
1 #_maxlambdaphase 
1 #_sd_offset 
30 # number of changes to make to default Lambdas (default value is 1.0)                       
# Like_comp codes: 1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=WtFreq; 7=sizeage; 8=catch;                          
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin                            
#like_comp fleet/survey phase value wtfreq_method  
# cpue - EPO   
1 1 1 0 1  
1 2 1 0 1  
1 3 1 0 1  
1 4 1 0 1  
1 9 1 0 1  
1 10 1 0 1  
1 11 1 0 1  
# Len comps    
4 9 1 0 1  
4 19 1 1 1 #turn ON LLt data N 
4 20 1 1 1 #turn ON LLt data S 
# Gen size comps (weight)  
6 17 1 0 1 # turn OFF LLc Weight data N                         
6 18 1 0 1 # turn OFF LLc Weight data S                         
# Age comps    
5 5 1 0 1  
# Eq catch    
9 1 1 0 1  
9 2 1 0 1  
9 3 1 0 1  
9 4 1 0 1  
9 5 1 0 1  
9 6 1 0 1  
9 7 1 0 1  
9 8 1 0 1  
9 9 1 0 1  
9 10 1 0 1  
9 11 1 0 1  
9 12 1 0 1  
9 13 1 0 1  
9 14 1 0 1  
9 15 1 0 1  
9 16 1 0 1  
# Param_prior 
11 1 1 0 1  
0 # (0/1) read specs for more stddev reporting                            
# 1 1 -1 5 1 5 1 -1 5 # selex type len/age year N selex bins Growth pattern N growth ages area For N-at-age Year N bins        
# -5 16 27 38 46 # vector with selex std bin picks (-1 in first bin to self-generate)                  
# -1 2 14 26 40 # vector with growth std bin picks (-1 in first bin to self-generate)                  
# -1 2 14 26 40 # vector with N-at-age std bin picks (-1 in first bin to self-generate)                  
999  