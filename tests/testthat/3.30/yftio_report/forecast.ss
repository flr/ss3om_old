#V3.30.12.00-trans-beta;_2018_06_05;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#C  generic forecast file
# for all year entries except rebuilder; enter either: actual year, -999 for styr, 0 for endyr, neg number for rel. endyr
1 # Benchmarks: 0=skip; 1=calc F_spr,F_btgt,F_msy; 2=calc F_spr,F0.1,F_msy 
2 # MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt) or F0.1; 4=set to F(endyr) 
0.3 # SPR target (e.g. 0.40)
0.3 # Biomass target (e.g. 0.40)
#_Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF, beg_recr_dist, end_recr_dist, beg_SRparm, end_SRparm (enter actual year, or values of 0 or -integer to be rel. endyr)
 2016 2018 2016 2018 2016 2018 1950 2018 1950 2018
1 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below
#
2 # Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt) or F0.1; 4=Ave F (uses first-last relF yrs); 5=input annual F scalar
15 # N forecast years 
1 # F scalar (only used for Do_Forecast==5)
#_Fcast_years:  beg_selex, end_selex, beg_relF, end_relF, beg_recruits, end_recruits  (enter actual year, or values of 0 or -integer to be rel. endyr)
 2016 2018 2016 2018 -999 0
0 # Forecast selectivity (0=fcast selex is mean from year range; 1=fcast selectivity from annual time-vary parms)
2 # Control rule method (1: ramp does catch=f(SSB), buffer on F; 2: ramp does F=f(SSB), buffer on F; 3: ramp does catch=f(SSB), buffer on catch; 4: ramp does F=f(SSB), buffer on catch) 
0.001 # Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40); (Must be > the no F level below) 
0.0001 # Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10) 
1 # Control rule target as fraction of Flimit (e.g. 0.75) 
3 #_N forecast loops (1=OFL only; 2=ABC; 3=get F from forecast ABC catch with allocations applied)
3 #_First forecast loop with stochastic recruitment
0 #_Forecast recruitment:  0= spawn_recr; 1=value*spawn_recr_fxn; 2=value*VirginRecr; 3=recent mean) 
1 # value is ignored 
0 #_Forecast loop control #5 (reserved for future bells&whistles) 
2007  #FirstYear for caps and allocations (should be after years with fixed inputs) 
0 # stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error)
0 # Do West Coast gfish rebuilder output (0/1) 
1999 # Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
2015 # Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
1 # fleet relative F:  1=use first-last alloc year; 2=read seas, fleet, alloc list below
# Note that fleet allocation is used directly as average F if Do_Forecast=4 
2 # basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum)
# Conditional input if relative F choice = 2
# enter list of:  season,  fleet, relF; if used, terminate with season=-9999
# 1 3 0.0583174
# 1 4 0.0107147
# 1 5 0.105787
# 1 6 0.00448683
# 1 8 0.00263673
# 1 9 0.00345773
# 1 10 0.00123212
# 1 11 0.000572201
# 1 12 0.000890266
# 1 14 0.00142595
# 1 15 0.00743586
# 1 17 0.00780448
# 2 3 0.0614617
# 2 4 0.0143303
# 2 5 0.143781
# 2 6 0.00307698
# 2 8 0.0016029
# 2 9 0.00473774
# 2 10 0.00132578
# 2 11 0.00113927
# 2 12 0.00133525
# 2 14 0.00131329
# 2 15 0.00767957
# 2 16 0.0011663
# 2 17 0.00814658
# 3 3 0.0451371
# 3 4 0.0170899
# 3 5 0.206129
# 3 6 0.00108849
# 3 8 0.00268669
# 3 9 0.00493412
# 3 10 0.000943039
# 3 11 0.00102931
# 3 12 0.00286625
# 3 14 0.00146907
# 3 15 0.00768664
# 3 16 0.00775416
# 3 17 0.00682287
# 4 3 0.0281591
# 4 4 0.017548
# 4 5 0.162681
# 4 6 0.00328811
# 4 8 0.00316035
# 4 9 0.00417473
# 4 10 0.000675159
# 4 11 0.000858309
# 4 12 0.00153374
# 4 14 0.00113099
# 4 15 0.00738385
# 4 16 0.000665725
# 4 17 0.00724665
# enter list of: fleet number, max annual catch for fleets with a max; terminate with fleet=-9999
-9999 -1
# enter list of area ID and max annual catch; terminate with area=-9999
-9999 -1
# enter list of fleet number and allocation group assignment, if any; terminate with fleet=-9999
-9999 -1
#_if N allocation groups >0, list year, allocation fraction for each group 
# list sequentially because read values fill to end of N forecast
# terminate with -9999 in year field 
# no allocation groups
2 # basis for input Fcast catch: -1=read basis with each obs; 2=dead catch; 3=retained catch; 99=input Hrate(F)
#enter list of Fcast catches; terminate with line having year=-9999
#_Yr Seas Fleet Catch(or_F)
2019	1	3	11072.8685
2019	2	4	17754.49252
2019	3	5	12422.05908
2019	4	6	6179.968739
2019	1	7	4741.724363
2019	2	8	5032.6962
2019	3	9	5310.094675
2019	4	10	6686.037312
2019	1	11	3620
2019	2	11	5239.5
2019	3	11	7834
2019	4	11	6466
2019	1	12	220.2371683
2019	2	12	102.0577374
2019	3	12	64.95600591
2019	4	12	429.6608224
2019	1	14	587.3480809
2019	2	14	673.7814565
2019	3	14	647.8504981
2019	4	14	1047.03683
2019	1	15	6.094
2019	2	15	6.788
2019	3	15	8.906
2019	4	15	73.381
2019	4	16	374.489173
2019	1	17	765.8792283
2019	2	17	152.6857798
2019	3	17	621.4511416
2019	4	17	423.0349553
2019	1	18	75.96719359
2019	2	18	115.8762262
2019	3	18	624.391318
2019	4	18	170.7886545
2019	1	19	537.2622104
2019	2	19	834.7959741
2019	3	19	878.9729022
2019	4	19	642.0641144
2019	1	20	2577.709958
2019	2	20	2068.281326
2019	3	20	2046.268945
2019	4	20	2180.743842
2019	1	21	6.581031463
2019	2	21	59.59146207
2019	3	21	27.35400121
2019	4	21	15.31852951
2019	2	22	19.33359112
2019	3	22	5133.068443
2019	4	22	9067.454237
2019	1	23	7.284902719
2019	2	23	696.6314524
2019	3	23	890.310018
2019	4	23	42.0269564
2019	1	24	316.3276401
2019	2	24	1056.001015
2019	3	24	737.613072
2019	4	24	443.4895027
2019	1	25	229.7498275
2019	2	25	330.1991175
2019	3	25	226.4875175
2019	4	25	419.0883475
-9999 1 1 0 
#
999 # verify end of input 
