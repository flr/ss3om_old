#V3.24j
#C fishing mortality uses the hybrid method
#_data_and_control_files: data.ss // control.ss
#_SS-V3.24j-opt;_11/14/2012;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_10.1
1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 #  number of recruitment assignments (overrides GP*area*seas parameter values) 
0 # recruitment interaction requested
#GP seas area for each recruitment assignment
 1 1 1
 1 1 4
#

10 #_N_movement_definitions
2 # first age that moves (real age at begin of season, not integer)
# seas,GP,source_area,dest_area,minage,maxage
 1 1 1 1 8 9
 1 1 1 2 8 9
 1 1 1 4 8 9
 1 1 2 1 8 9
 1 1 2 2 8 9
 1 1 3 3 8 9
 1 1 3 4 8 9
 1 1 4 1 8 9
 1 1 4 3 8 9
 1 1 4 4 8 9
#
2 #_Nblock_Patterns
 2 1 #_blocks_per_pattern 
# begin and end years of blocks
 213 260 261 284
 225 244
#
0.5 #_fracfemale 
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
 #_Age_natmort_by gender x growthpattern
 1.3432 1.3432 1.182 1.0208 0.8596 0.6984 0.5372 0.5372 0.5372 0.5372 0.5372 0.564 0.6424 0.712 0.766 0.7976 0.8036 0.7848 0.746 0.6972 0.6492 0.6088 0.5796 0.5604 0.5492 0.5428 0.5396 0.5384 0.5376
3 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
1 #_Growth_Age_for_L1
28 #_Growth_Age_for_L2 (999 to use as Linf)
12 # number of K multipliers to read
 2 3 4 5 6 7 8 9 10 11 12 13 # ages for K multiplier
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#_Age_Maturity by growth pattern
 0 0 0 0 0 0.1 0.15 0.2 0.3 0.5 0.7 0.9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 1 45 22 22 0 10 -2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 120 170 145 145 0 10 -4 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.5 0.455 0.455 0 0.8 -4 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 -5 5 0.5 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_2
 -15 5 0.75 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_3
 -15 5 1 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_4
 -15 5 1 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_5
 -15 5 1 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_6
 -15 5 1.8 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_7
 -15 5 1.8 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_8
 -15 5 1.2 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_9
 -15 5 1.2 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_10
 -15 5 1 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_11
 -15 5 1 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_12
 -15 5 1 1 -1 1 -1 0 0 0 0 0 0 0 # Age_K_Fem_GP_1_a_13
 0.05 0.25 0.1 0.1 0 0.1 -3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.05 0.25 0.1 0.1 0 0.1 -3 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 -3 3 2.459e-005 2.459e-005 0 0.8 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 -3 4 2.9667 2.9667 0 0.8 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 -3 3 1 1 -1 0.8 -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -3 3 -0.25 -0.25 0 0.8 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 3 1 1 0 0.8 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 3 0 0 0 0.8 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 -3 3 0 0 1 0.05 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 -5 5 1.17917 1.5 0 0.25 3 0 2 121 280 1 0 0 # RecrDist_Area_1
 -5 5 -4.9 -4.9 1 0.05 -3 0 0 0 0 0 0 0 # RecrDist_Area_2
 -5 5 -4.9 -4.9 1 0.5 -3 0 0 0 0 0 0 0 # RecrDist_Area_3
 -5 5 0.820828 0.5 0 0.25 3 0 2 121 280 1 0 0 # RecrDist_Area_4
 0 0 0 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_1
 0 0 0 0 -1 0 -4 0 0 0 0 0 0 0 # CohortGrowDev
 -12 12 1.87378 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_1
 -12 12 2.19842 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_1
 -12 12 3.07886 0 0 4 -3 -7 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_2
 -12 12 1.08546 0 0 4 -3 -1 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_2
 -12 12 -4.95263 0 0 4 -3 -5 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_1to_4
 -12 12 -3.28388 0 0 4 -3 -4 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_1to_4
 -12 12 0.528339 0 0 4 -3 -7 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_2to_1
 -12 12 0.38786 0 0 4 3 -1 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_2to_1
 -12 12 -0.528339 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_2to_2
 -12 12 -0.38786 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_2to_2
 -12 12 -0.0274882 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_3to_3
 -12 12 1.48844 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_3to_3
 -12 12 0.027488 0 0 4 -3 -3 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_3to_4
 -12 12 -1.48844 0 0 4 -3 -3 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_3to_4
 -12 12 -3.85706 0 0 4 -3 -5 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_1
 -12 12 -1.93538 0 0 4 -3 -4 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_1
 -12 12 0.862442 0 0 4 -3 -3 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_3
 -12 12 -1.02381 0 0 4 -3 -3 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_3
 -12 12 2.99461 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_4to_4
 -12 12 2.95918 0 0 4 -3 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_4to_4
#
1 #_custom_MG-env_setup (0/1)
 -5 5 -0.0370939 0 0 1 -3 # MoveParm_A_seas_1_GP_1from_1to_2_ENV_add
 -5 5 -0.403398 0 0 1 -3 # MoveParm_B_seas_1_GP_1from_1to_2_ENV_add
 -5 5 0.00600717 0 0 1 -3 # MoveParm_A_seas_1_GP_1from_1to_4_ENV_add
 -5 5 0.686633 0 0 1 -3 # MoveParm_B_seas_1_GP_1from_1to_4_ENV_add
 -5 5 -0.0341498 0 0 1 -3 # MoveParm_A_seas_1_GP_1from_2to_1_ENV_add
 -5 5 -1.23465 0 0 1 -3 # MoveParm_B_seas_1_GP_1from_2to_1_ENV_add
 -5 5 -0.606758 0 0 1 -3 # MoveParm_A_seas_1_GP_1from_3to_4_ENV_add
 -5 5 -0.291743 0 0 1 -3 # MoveParm_B_seas_1_GP_1from_3to_4_ENV_add
 -5 5 0.00333 0 0 1 -3 # MoveParm_A_seas_1_GP_1from_4to_1_ENV_add
 -5 5 -1.15049 0 0 1 -3 # MoveParm_B_seas_1_GP_1from_4to_1_ENV_add
 -5 5 -1.71072 0 0 1 -3 # MoveParm_A_seas_1_GP_1from_4to_3_ENV_add
 -5 5 0.170835 0 0 1 -3 # MoveParm_B_seas_1_GP_1from_4to_3_ENV_add
#
#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_Cond No MG parm trends 
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#DisplayOnly -0.179998 # RecrDist_Area_1_DEVadd_121
#DisplayOnly -0.475958 # RecrDist_Area_1_DEVadd_122
#DisplayOnly -0.449393 # RecrDist_Area_1_DEVadd_123
#DisplayOnly 0.331002 # RecrDist_Area_1_DEVadd_124
#DisplayOnly 0.412041 # RecrDist_Area_1_DEVadd_125
#DisplayOnly -0.158995 # RecrDist_Area_1_DEVadd_126
#DisplayOnly 0.223123 # RecrDist_Area_1_DEVadd_127
#DisplayOnly 0.247784 # RecrDist_Area_1_DEVadd_128
#DisplayOnly 0.465382 # RecrDist_Area_1_DEVadd_129
#DisplayOnly 0.208709 # RecrDist_Area_1_DEVadd_130
#DisplayOnly -0.192656 # RecrDist_Area_1_DEVadd_131
#DisplayOnly 0.0304105 # RecrDist_Area_1_DEVadd_132
#DisplayOnly 0.106301 # RecrDist_Area_1_DEVadd_133
#DisplayOnly 0.0688886 # RecrDist_Area_1_DEVadd_134
#DisplayOnly 0.250913 # RecrDist_Area_1_DEVadd_135
#DisplayOnly 0.0983976 # RecrDist_Area_1_DEVadd_136
#DisplayOnly 0.0828894 # RecrDist_Area_1_DEVadd_137
#DisplayOnly -0.373615 # RecrDist_Area_1_DEVadd_138
#DisplayOnly 0.324254 # RecrDist_Area_1_DEVadd_139
#DisplayOnly -0.0208802 # RecrDist_Area_1_DEVadd_140
#DisplayOnly 0.049844 # RecrDist_Area_1_DEVadd_141
#DisplayOnly -0.0611904 # RecrDist_Area_1_DEVadd_142
#DisplayOnly 0.710978 # RecrDist_Area_1_DEVadd_143
#DisplayOnly -0.200381 # RecrDist_Area_1_DEVadd_144
#DisplayOnly -0.147244 # RecrDist_Area_1_DEVadd_145
#DisplayOnly 0.198972 # RecrDist_Area_1_DEVadd_146
#DisplayOnly 0.638884 # RecrDist_Area_1_DEVadd_147
#DisplayOnly 0.283066 # RecrDist_Area_1_DEVadd_148
#DisplayOnly -0.452773 # RecrDist_Area_1_DEVadd_149
#DisplayOnly -0.472868 # RecrDist_Area_1_DEVadd_150
#DisplayOnly 0.847251 # RecrDist_Area_1_DEVadd_151
#DisplayOnly -0.249824 # RecrDist_Area_1_DEVadd_152
#DisplayOnly -0.679785 # RecrDist_Area_1_DEVadd_153
#DisplayOnly 0.17881 # RecrDist_Area_1_DEVadd_154
#DisplayOnly 0.631702 # RecrDist_Area_1_DEVadd_155
#DisplayOnly 0.0979185 # RecrDist_Area_1_DEVadd_156
#DisplayOnly -0.15478 # RecrDist_Area_1_DEVadd_157
#DisplayOnly -0.161045 # RecrDist_Area_1_DEVadd_158
#DisplayOnly -0.00540016 # RecrDist_Area_1_DEVadd_159
#DisplayOnly 0.37507 # RecrDist_Area_1_DEVadd_160
#DisplayOnly -0.129647 # RecrDist_Area_1_DEVadd_161
#DisplayOnly 0.0979753 # RecrDist_Area_1_DEVadd_162
#DisplayOnly 0.234008 # RecrDist_Area_1_DEVadd_163
#DisplayOnly -0.0282757 # RecrDist_Area_1_DEVadd_164
#DisplayOnly 0.364917 # RecrDist_Area_1_DEVadd_165
#DisplayOnly 0.0969578 # RecrDist_Area_1_DEVadd_166
#DisplayOnly 0.93371 # RecrDist_Area_1_DEVadd_167
#DisplayOnly 0.0234178 # RecrDist_Area_1_DEVadd_168
#DisplayOnly 0.226097 # RecrDist_Area_1_DEVadd_169
#DisplayOnly -0.217371 # RecrDist_Area_1_DEVadd_170
#DisplayOnly 0.820752 # RecrDist_Area_1_DEVadd_171
#DisplayOnly 0.164673 # RecrDist_Area_1_DEVadd_172
#DisplayOnly 0.194517 # RecrDist_Area_1_DEVadd_173
#DisplayOnly 0.105331 # RecrDist_Area_1_DEVadd_174
#DisplayOnly 0.429196 # RecrDist_Area_1_DEVadd_175
#DisplayOnly 0.229583 # RecrDist_Area_1_DEVadd_176
#DisplayOnly 0.101489 # RecrDist_Area_1_DEVadd_177
#DisplayOnly 0.265222 # RecrDist_Area_1_DEVadd_178
#DisplayOnly -0.491023 # RecrDist_Area_1_DEVadd_179
#DisplayOnly 0.109347 # RecrDist_Area_1_DEVadd_180
#DisplayOnly 0.1223 # RecrDist_Area_1_DEVadd_181
#DisplayOnly -0.0489239 # RecrDist_Area_1_DEVadd_182
#DisplayOnly 0.506521 # RecrDist_Area_1_DEVadd_183
#DisplayOnly 0.577859 # RecrDist_Area_1_DEVadd_184
#DisplayOnly -0.105161 # RecrDist_Area_1_DEVadd_185
#DisplayOnly 0.144429 # RecrDist_Area_1_DEVadd_186
#DisplayOnly 0.0666505 # RecrDist_Area_1_DEVadd_187
#DisplayOnly 0.244233 # RecrDist_Area_1_DEVadd_188
#DisplayOnly -0.141479 # RecrDist_Area_1_DEVadd_189
#DisplayOnly -0.231882 # RecrDist_Area_1_DEVadd_190
#DisplayOnly 0.257972 # RecrDist_Area_1_DEVadd_191
#DisplayOnly 0.355222 # RecrDist_Area_1_DEVadd_192
#DisplayOnly 0.286955 # RecrDist_Area_1_DEVadd_193
#DisplayOnly -0.1025 # RecrDist_Area_1_DEVadd_194
#DisplayOnly 0.137188 # RecrDist_Area_1_DEVadd_195
#DisplayOnly -0.0317778 # RecrDist_Area_1_DEVadd_196
#DisplayOnly 0.0334304 # RecrDist_Area_1_DEVadd_197
#DisplayOnly -0.0517755 # RecrDist_Area_1_DEVadd_198
#DisplayOnly 0.388415 # RecrDist_Area_1_DEVadd_199
#DisplayOnly 0.155296 # RecrDist_Area_1_DEVadd_200
#DisplayOnly -0.0700429 # RecrDist_Area_1_DEVadd_201
#DisplayOnly -0.334637 # RecrDist_Area_1_DEVadd_202
#DisplayOnly 0.498614 # RecrDist_Area_1_DEVadd_203
#DisplayOnly 0.553796 # RecrDist_Area_1_DEVadd_204
#DisplayOnly 0.190449 # RecrDist_Area_1_DEVadd_205
#DisplayOnly 0.299402 # RecrDist_Area_1_DEVadd_206
#DisplayOnly 0.118284 # RecrDist_Area_1_DEVadd_207
#DisplayOnly 0.503168 # RecrDist_Area_1_DEVadd_208
#DisplayOnly 0.0763303 # RecrDist_Area_1_DEVadd_209
#DisplayOnly 0.20484 # RecrDist_Area_1_DEVadd_210
#DisplayOnly 0.0364128 # RecrDist_Area_1_DEVadd_211
#DisplayOnly 0.690003 # RecrDist_Area_1_DEVadd_212
#DisplayOnly 0.121889 # RecrDist_Area_1_DEVadd_213
#DisplayOnly 0.102263 # RecrDist_Area_1_DEVadd_214
#DisplayOnly 0.375121 # RecrDist_Area_1_DEVadd_215
#DisplayOnly 0.690866 # RecrDist_Area_1_DEVadd_216
#DisplayOnly 0.161348 # RecrDist_Area_1_DEVadd_217
#DisplayOnly 0.00650918 # RecrDist_Area_1_DEVadd_218
#DisplayOnly 0.398381 # RecrDist_Area_1_DEVadd_219
#DisplayOnly 0.844433 # RecrDist_Area_1_DEVadd_220
#DisplayOnly 0.141779 # RecrDist_Area_1_DEVadd_221
#DisplayOnly 0.0961805 # RecrDist_Area_1_DEVadd_222
#DisplayOnly 0.227635 # RecrDist_Area_1_DEVadd_223
#DisplayOnly 0.466729 # RecrDist_Area_1_DEVadd_224
#DisplayOnly 0.327334 # RecrDist_Area_1_DEVadd_225
#DisplayOnly 0.442284 # RecrDist_Area_1_DEVadd_226
#DisplayOnly 0.165711 # RecrDist_Area_1_DEVadd_227
#DisplayOnly -0.0820796 # RecrDist_Area_1_DEVadd_228
#DisplayOnly 0.279288 # RecrDist_Area_1_DEVadd_229
#DisplayOnly 0.334652 # RecrDist_Area_1_DEVadd_230
#DisplayOnly -0.433063 # RecrDist_Area_1_DEVadd_231
#DisplayOnly 0.629403 # RecrDist_Area_1_DEVadd_232
#DisplayOnly -0.0865478 # RecrDist_Area_1_DEVadd_233
#DisplayOnly -0.196507 # RecrDist_Area_1_DEVadd_234
#DisplayOnly -0.102796 # RecrDist_Area_1_DEVadd_235
#DisplayOnly 0.305331 # RecrDist_Area_1_DEVadd_236
#DisplayOnly -0.462081 # RecrDist_Area_1_DEVadd_237
#DisplayOnly 0.517285 # RecrDist_Area_1_DEVadd_238
#DisplayOnly -0.323299 # RecrDist_Area_1_DEVadd_239
#DisplayOnly 0.391415 # RecrDist_Area_1_DEVadd_240
#DisplayOnly 0.00816998 # RecrDist_Area_1_DEVadd_241
#DisplayOnly 0.727141 # RecrDist_Area_1_DEVadd_242
#DisplayOnly 0.0616767 # RecrDist_Area_1_DEVadd_243
#DisplayOnly 0.540956 # RecrDist_Area_1_DEVadd_244
#DisplayOnly 0.1786 # RecrDist_Area_1_DEVadd_245
#DisplayOnly 0.603028 # RecrDist_Area_1_DEVadd_246
#DisplayOnly 0.142628 # RecrDist_Area_1_DEVadd_247
#DisplayOnly 0.652779 # RecrDist_Area_1_DEVadd_248
#DisplayOnly 0.532164 # RecrDist_Area_1_DEVadd_249
#DisplayOnly 0.5964 # RecrDist_Area_1_DEVadd_250
#DisplayOnly 0.251957 # RecrDist_Area_1_DEVadd_251
#DisplayOnly 0.366341 # RecrDist_Area_1_DEVadd_252
#DisplayOnly 0.43526 # RecrDist_Area_1_DEVadd_253
#DisplayOnly 0.375707 # RecrDist_Area_1_DEVadd_254
#DisplayOnly 0.722486 # RecrDist_Area_1_DEVadd_255
#DisplayOnly 0.829391 # RecrDist_Area_1_DEVadd_256
#DisplayOnly -0.00297747 # RecrDist_Area_1_DEVadd_257
#DisplayOnly 0.0233016 # RecrDist_Area_1_DEVadd_258
#DisplayOnly 0.771059 # RecrDist_Area_1_DEVadd_259
#DisplayOnly 0.159737 # RecrDist_Area_1_DEVadd_260
#DisplayOnly -0.000638751 # RecrDist_Area_1_DEVadd_261
#DisplayOnly 0.273079 # RecrDist_Area_1_DEVadd_262
#DisplayOnly 0.333171 # RecrDist_Area_1_DEVadd_263
#DisplayOnly 0.475875 # RecrDist_Area_1_DEVadd_264
#DisplayOnly 0.468024 # RecrDist_Area_1_DEVadd_265
#DisplayOnly 0.642279 # RecrDist_Area_1_DEVadd_266
#DisplayOnly 0.376306 # RecrDist_Area_1_DEVadd_267
#DisplayOnly 0.314094 # RecrDist_Area_1_DEVadd_268
#DisplayOnly 0.235206 # RecrDist_Area_1_DEVadd_269
#DisplayOnly 0.54705 # RecrDist_Area_1_DEVadd_270
#DisplayOnly 0.545611 # RecrDist_Area_1_DEVadd_271
#DisplayOnly 0.248755 # RecrDist_Area_1_DEVadd_272
#DisplayOnly 0.155074 # RecrDist_Area_1_DEVadd_273
#DisplayOnly 0.207645 # RecrDist_Area_1_DEVadd_274
#DisplayOnly 0.212483 # RecrDist_Area_1_DEVadd_275
#DisplayOnly 0.318743 # RecrDist_Area_1_DEVadd_276
#DisplayOnly 0.368403 # RecrDist_Area_1_DEVadd_277
#DisplayOnly 0.071161 # RecrDist_Area_1_DEVadd_278
#DisplayOnly 0.00761349 # RecrDist_Area_1_DEVadd_279
#DisplayOnly 0.228695 # RecrDist_Area_1_DEVadd_280
#DisplayOnly 0.179998 # RecrDist_Area_4_DEVadd_121
#DisplayOnly 0.475958 # RecrDist_Area_4_DEVadd_122
#DisplayOnly 0.449393 # RecrDist_Area_4_DEVadd_123
#DisplayOnly -0.331002 # RecrDist_Area_4_DEVadd_124
#DisplayOnly -0.412041 # RecrDist_Area_4_DEVadd_125
#DisplayOnly 0.158995 # RecrDist_Area_4_DEVadd_126
#DisplayOnly -0.223123 # RecrDist_Area_4_DEVadd_127
#DisplayOnly -0.247784 # RecrDist_Area_4_DEVadd_128
#DisplayOnly -0.465382 # RecrDist_Area_4_DEVadd_129
#DisplayOnly -0.208709 # RecrDist_Area_4_DEVadd_130
#DisplayOnly 0.192656 # RecrDist_Area_4_DEVadd_131
#DisplayOnly -0.0304105 # RecrDist_Area_4_DEVadd_132
#DisplayOnly -0.106301 # RecrDist_Area_4_DEVadd_133
#DisplayOnly -0.0688886 # RecrDist_Area_4_DEVadd_134
#DisplayOnly -0.250913 # RecrDist_Area_4_DEVadd_135
#DisplayOnly -0.0983976 # RecrDist_Area_4_DEVadd_136
#DisplayOnly -0.0828894 # RecrDist_Area_4_DEVadd_137
#DisplayOnly 0.373615 # RecrDist_Area_4_DEVadd_138
#DisplayOnly -0.324254 # RecrDist_Area_4_DEVadd_139
#DisplayOnly 0.0208802 # RecrDist_Area_4_DEVadd_140
#DisplayOnly -0.049844 # RecrDist_Area_4_DEVadd_141
#DisplayOnly 0.0611904 # RecrDist_Area_4_DEVadd_142
#DisplayOnly -0.710978 # RecrDist_Area_4_DEVadd_143
#DisplayOnly 0.200381 # RecrDist_Area_4_DEVadd_144
#DisplayOnly 0.147244 # RecrDist_Area_4_DEVadd_145
#DisplayOnly -0.198972 # RecrDist_Area_4_DEVadd_146
#DisplayOnly -0.638884 # RecrDist_Area_4_DEVadd_147
#DisplayOnly -0.283066 # RecrDist_Area_4_DEVadd_148
#DisplayOnly 0.452773 # RecrDist_Area_4_DEVadd_149
#DisplayOnly 0.472868 # RecrDist_Area_4_DEVadd_150
#DisplayOnly -0.847251 # RecrDist_Area_4_DEVadd_151
#DisplayOnly 0.249824 # RecrDist_Area_4_DEVadd_152
#DisplayOnly 0.679785 # RecrDist_Area_4_DEVadd_153
#DisplayOnly -0.17881 # RecrDist_Area_4_DEVadd_154
#DisplayOnly -0.631702 # RecrDist_Area_4_DEVadd_155
#DisplayOnly -0.0979185 # RecrDist_Area_4_DEVadd_156
#DisplayOnly 0.15478 # RecrDist_Area_4_DEVadd_157
#DisplayOnly 0.161045 # RecrDist_Area_4_DEVadd_158
#DisplayOnly 0.00540016 # RecrDist_Area_4_DEVadd_159
#DisplayOnly -0.37507 # RecrDist_Area_4_DEVadd_160
#DisplayOnly 0.129647 # RecrDist_Area_4_DEVadd_161
#DisplayOnly -0.0979753 # RecrDist_Area_4_DEVadd_162
#DisplayOnly -0.234008 # RecrDist_Area_4_DEVadd_163
#DisplayOnly 0.0282757 # RecrDist_Area_4_DEVadd_164
#DisplayOnly -0.364917 # RecrDist_Area_4_DEVadd_165
#DisplayOnly -0.0969578 # RecrDist_Area_4_DEVadd_166
#DisplayOnly -0.93371 # RecrDist_Area_4_DEVadd_167
#DisplayOnly -0.0234178 # RecrDist_Area_4_DEVadd_168
#DisplayOnly -0.226097 # RecrDist_Area_4_DEVadd_169
#DisplayOnly 0.217371 # RecrDist_Area_4_DEVadd_170
#DisplayOnly -0.820752 # RecrDist_Area_4_DEVadd_171
#DisplayOnly -0.164673 # RecrDist_Area_4_DEVadd_172
#DisplayOnly -0.194517 # RecrDist_Area_4_DEVadd_173
#DisplayOnly -0.105331 # RecrDist_Area_4_DEVadd_174
#DisplayOnly -0.429196 # RecrDist_Area_4_DEVadd_175
#DisplayOnly -0.229583 # RecrDist_Area_4_DEVadd_176
#DisplayOnly -0.101489 # RecrDist_Area_4_DEVadd_177
#DisplayOnly -0.265222 # RecrDist_Area_4_DEVadd_178
#DisplayOnly 0.491023 # RecrDist_Area_4_DEVadd_179
#DisplayOnly -0.109347 # RecrDist_Area_4_DEVadd_180
#DisplayOnly -0.1223 # RecrDist_Area_4_DEVadd_181
#DisplayOnly 0.0489239 # RecrDist_Area_4_DEVadd_182
#DisplayOnly -0.506521 # RecrDist_Area_4_DEVadd_183
#DisplayOnly -0.577859 # RecrDist_Area_4_DEVadd_184
#DisplayOnly 0.105161 # RecrDist_Area_4_DEVadd_185
#DisplayOnly -0.144429 # RecrDist_Area_4_DEVadd_186
#DisplayOnly -0.0666505 # RecrDist_Area_4_DEVadd_187
#DisplayOnly -0.244233 # RecrDist_Area_4_DEVadd_188
#DisplayOnly 0.141479 # RecrDist_Area_4_DEVadd_189
#DisplayOnly 0.231882 # RecrDist_Area_4_DEVadd_190
#DisplayOnly -0.257972 # RecrDist_Area_4_DEVadd_191
#DisplayOnly -0.355222 # RecrDist_Area_4_DEVadd_192
#DisplayOnly -0.286955 # RecrDist_Area_4_DEVadd_193
#DisplayOnly 0.1025 # RecrDist_Area_4_DEVadd_194
#DisplayOnly -0.137188 # RecrDist_Area_4_DEVadd_195
#DisplayOnly 0.0317778 # RecrDist_Area_4_DEVadd_196
#DisplayOnly -0.0334304 # RecrDist_Area_4_DEVadd_197
#DisplayOnly 0.0517755 # RecrDist_Area_4_DEVadd_198
#DisplayOnly -0.388415 # RecrDist_Area_4_DEVadd_199
#DisplayOnly -0.155296 # RecrDist_Area_4_DEVadd_200
#DisplayOnly 0.0700429 # RecrDist_Area_4_DEVadd_201
#DisplayOnly 0.334637 # RecrDist_Area_4_DEVadd_202
#DisplayOnly -0.498614 # RecrDist_Area_4_DEVadd_203
#DisplayOnly -0.553796 # RecrDist_Area_4_DEVadd_204
#DisplayOnly -0.190449 # RecrDist_Area_4_DEVadd_205
#DisplayOnly -0.299402 # RecrDist_Area_4_DEVadd_206
#DisplayOnly -0.118284 # RecrDist_Area_4_DEVadd_207
#DisplayOnly -0.503168 # RecrDist_Area_4_DEVadd_208
#DisplayOnly -0.0763303 # RecrDist_Area_4_DEVadd_209
#DisplayOnly -0.20484 # RecrDist_Area_4_DEVadd_210
#DisplayOnly -0.0364128 # RecrDist_Area_4_DEVadd_211
#DisplayOnly -0.690003 # RecrDist_Area_4_DEVadd_212
#DisplayOnly -0.121889 # RecrDist_Area_4_DEVadd_213
#DisplayOnly -0.102263 # RecrDist_Area_4_DEVadd_214
#DisplayOnly -0.375121 # RecrDist_Area_4_DEVadd_215
#DisplayOnly -0.690866 # RecrDist_Area_4_DEVadd_216
#DisplayOnly -0.161348 # RecrDist_Area_4_DEVadd_217
#DisplayOnly -0.00650918 # RecrDist_Area_4_DEVadd_218
#DisplayOnly -0.398381 # RecrDist_Area_4_DEVadd_219
#DisplayOnly -0.844433 # RecrDist_Area_4_DEVadd_220
#DisplayOnly -0.141779 # RecrDist_Area_4_DEVadd_221
#DisplayOnly -0.0961805 # RecrDist_Area_4_DEVadd_222
#DisplayOnly -0.227635 # RecrDist_Area_4_DEVadd_223
#DisplayOnly -0.466729 # RecrDist_Area_4_DEVadd_224
#DisplayOnly -0.327334 # RecrDist_Area_4_DEVadd_225
#DisplayOnly -0.442284 # RecrDist_Area_4_DEVadd_226
#DisplayOnly -0.165711 # RecrDist_Area_4_DEVadd_227
#DisplayOnly 0.0820796 # RecrDist_Area_4_DEVadd_228
#DisplayOnly -0.279288 # RecrDist_Area_4_DEVadd_229
#DisplayOnly -0.334652 # RecrDist_Area_4_DEVadd_230
#DisplayOnly 0.433063 # RecrDist_Area_4_DEVadd_231
#DisplayOnly -0.629403 # RecrDist_Area_4_DEVadd_232
#DisplayOnly 0.0865478 # RecrDist_Area_4_DEVadd_233
#DisplayOnly 0.196507 # RecrDist_Area_4_DEVadd_234
#DisplayOnly 0.102796 # RecrDist_Area_4_DEVadd_235
#DisplayOnly -0.305331 # RecrDist_Area_4_DEVadd_236
#DisplayOnly 0.462081 # RecrDist_Area_4_DEVadd_237
#DisplayOnly -0.517285 # RecrDist_Area_4_DEVadd_238
#DisplayOnly 0.323299 # RecrDist_Area_4_DEVadd_239
#DisplayOnly -0.391415 # RecrDist_Area_4_DEVadd_240
#DisplayOnly -0.00816998 # RecrDist_Area_4_DEVadd_241
#DisplayOnly -0.727141 # RecrDist_Area_4_DEVadd_242
#DisplayOnly -0.0616767 # RecrDist_Area_4_DEVadd_243
#DisplayOnly -0.540956 # RecrDist_Area_4_DEVadd_244
#DisplayOnly -0.1786 # RecrDist_Area_4_DEVadd_245
#DisplayOnly -0.603028 # RecrDist_Area_4_DEVadd_246
#DisplayOnly -0.142628 # RecrDist_Area_4_DEVadd_247
#DisplayOnly -0.652779 # RecrDist_Area_4_DEVadd_248
#DisplayOnly -0.532164 # RecrDist_Area_4_DEVadd_249
#DisplayOnly -0.5964 # RecrDist_Area_4_DEVadd_250
#DisplayOnly -0.251957 # RecrDist_Area_4_DEVadd_251
#DisplayOnly -0.366341 # RecrDist_Area_4_DEVadd_252
#DisplayOnly -0.43526 # RecrDist_Area_4_DEVadd_253
#DisplayOnly -0.375707 # RecrDist_Area_4_DEVadd_254
#DisplayOnly -0.722486 # RecrDist_Area_4_DEVadd_255
#DisplayOnly -0.829391 # RecrDist_Area_4_DEVadd_256
#DisplayOnly 0.00297747 # RecrDist_Area_4_DEVadd_257
#DisplayOnly -0.0233016 # RecrDist_Area_4_DEVadd_258
#DisplayOnly -0.771059 # RecrDist_Area_4_DEVadd_259
#DisplayOnly -0.159737 # RecrDist_Area_4_DEVadd_260
#DisplayOnly 0.000638751 # RecrDist_Area_4_DEVadd_261
#DisplayOnly -0.273079 # RecrDist_Area_4_DEVadd_262
#DisplayOnly -0.333171 # RecrDist_Area_4_DEVadd_263
#DisplayOnly -0.475875 # RecrDist_Area_4_DEVadd_264
#DisplayOnly -0.468024 # RecrDist_Area_4_DEVadd_265
#DisplayOnly -0.642279 # RecrDist_Area_4_DEVadd_266
#DisplayOnly -0.376306 # RecrDist_Area_4_DEVadd_267
#DisplayOnly -0.314094 # RecrDist_Area_4_DEVadd_268
#DisplayOnly -0.235206 # RecrDist_Area_4_DEVadd_269
#DisplayOnly -0.54705 # RecrDist_Area_4_DEVadd_270
#DisplayOnly -0.545611 # RecrDist_Area_4_DEVadd_271
#DisplayOnly -0.248755 # RecrDist_Area_4_DEVadd_272
#DisplayOnly -0.155074 # RecrDist_Area_4_DEVadd_273
#DisplayOnly -0.207645 # RecrDist_Area_4_DEVadd_274
#DisplayOnly -0.212483 # RecrDist_Area_4_DEVadd_275
#DisplayOnly -0.318743 # RecrDist_Area_4_DEVadd_276
#DisplayOnly -0.368403 # RecrDist_Area_4_DEVadd_277
#DisplayOnly -0.071161 # RecrDist_Area_4_DEVadd_278
#DisplayOnly -0.00761349 # RecrDist_Area_4_DEVadd_279
#DisplayOnly -0.228695 # RecrDist_Area_4_DEVadd_280
-7 #_MGparm_Dev_Phase
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm
#_LO HI INIT PRIOR PR_type SD PHASE
 -2 25 11.486 10 0 5 1 # SR_LN(R0)
 0.2 1 0.8 0.8 0 0.2 -1 # SR_BH_steep
 0 2 0.6 0.6 0 0.8 -4 # SR_sigmaR
 -5 5 0 0 0 1 -3 # SR_envlink
 -5 5 0 0 0 1 -4 # SR_R1_offset
 0 0 0 0 -1 0 -99 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
101 # first year of main recr_devs; early devs can preceed this era
280 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
0 # (0/1) to read 13 advanced options
#_Cond 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
#_Cond -4 #_recdev_early_phase
#_Cond 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#_Cond 1 #_lambda for Fcast_recr_like occurring before endyr+1
#_Cond -987 #_last_early_yr_nobias_adj_in_MPD
#_Cond -15 #_first_yr_fullbias_adj_in_MPD
#_Cond 280 #_last_yr_fullbias_adj_in_MPD
#_Cond 285 #_first_recent_yr_nobias_adj_in_MPD
#_Cond 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#_Cond 0 #_period of cycles in recruitment (N parms read below)
#_Cond -5 #min rec_dev
#_Cond 5 #max rec_dev
#_Cond 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#DisplayOnly -1.1433 # Main_RecrDev_101
#DisplayOnly -0.768299 # Main_RecrDev_102
#DisplayOnly -0.0773091 # Main_RecrDev_103
#DisplayOnly 0.208974 # Main_RecrDev_104
#DisplayOnly -0.0594412 # Main_RecrDev_105
#DisplayOnly 0.412558 # Main_RecrDev_106
#DisplayOnly 0.604433 # Main_RecrDev_107
#DisplayOnly 0.0310111 # Main_RecrDev_108
#DisplayOnly 0.170911 # Main_RecrDev_109
#DisplayOnly 0.998777 # Main_RecrDev_110
#DisplayOnly 0.218983 # Main_RecrDev_111
#DisplayOnly -0.461808 # Main_RecrDev_112
#DisplayOnly -0.474588 # Main_RecrDev_113
#DisplayOnly 0.0132091 # Main_RecrDev_114
#DisplayOnly 0.559972 # Main_RecrDev_115
#DisplayOnly -0.255764 # Main_RecrDev_116
#DisplayOnly -0.466255 # Main_RecrDev_117
#DisplayOnly -0.30088 # Main_RecrDev_118
#DisplayOnly -0.331244 # Main_RecrDev_119
#DisplayOnly -0.790056 # Main_RecrDev_120
#DisplayOnly -0.862538 # Main_RecrDev_121
#DisplayOnly -0.582516 # Main_RecrDev_122
#DisplayOnly -0.429041 # Main_RecrDev_123
#DisplayOnly -0.619513 # Main_RecrDev_124
#DisplayOnly -0.47262 # Main_RecrDev_125
#DisplayOnly 0.293642 # Main_RecrDev_126
#DisplayOnly 0.0849277 # Main_RecrDev_127
#DisplayOnly -0.102761 # Main_RecrDev_128
#DisplayOnly -0.0385678 # Main_RecrDev_129
#DisplayOnly 0.625894 # Main_RecrDev_130
#DisplayOnly 0.157083 # Main_RecrDev_131
#DisplayOnly -0.349074 # Main_RecrDev_132
#DisplayOnly -0.266385 # Main_RecrDev_133
#DisplayOnly 0.130561 # Main_RecrDev_134
#DisplayOnly 0.0865729 # Main_RecrDev_135
#DisplayOnly -0.0702387 # Main_RecrDev_136
#DisplayOnly 0.116048 # Main_RecrDev_137
#DisplayOnly 0.541325 # Main_RecrDev_138
#DisplayOnly -0.337472 # Main_RecrDev_139
#DisplayOnly -0.408029 # Main_RecrDev_140
#DisplayOnly -0.53686 # Main_RecrDev_141
#DisplayOnly -0.356964 # Main_RecrDev_142
#DisplayOnly 0.0309415 # Main_RecrDev_143
#DisplayOnly 0.541592 # Main_RecrDev_144
#DisplayOnly -0.264352 # Main_RecrDev_145
#DisplayOnly -0.13394 # Main_RecrDev_146
#DisplayOnly 0.740745 # Main_RecrDev_147
#DisplayOnly 0.22143 # Main_RecrDev_148
#DisplayOnly -0.352854 # Main_RecrDev_149
#DisplayOnly -0.167422 # Main_RecrDev_150
#DisplayOnly 0.752025 # Main_RecrDev_151
#DisplayOnly 0.105618 # Main_RecrDev_152
#DisplayOnly -0.263902 # Main_RecrDev_153
#DisplayOnly -0.245631 # Main_RecrDev_154
#DisplayOnly -0.0324153 # Main_RecrDev_155
#DisplayOnly -0.412077 # Main_RecrDev_156
#DisplayOnly -0.433922 # Main_RecrDev_157
#DisplayOnly -0.450846 # Main_RecrDev_158
#DisplayOnly 0.434284 # Main_RecrDev_159
#DisplayOnly 0.374257 # Main_RecrDev_160
#DisplayOnly -0.194459 # Main_RecrDev_161
#DisplayOnly 0.123056 # Main_RecrDev_162
#DisplayOnly -0.048476 # Main_RecrDev_163
#DisplayOnly -0.0383639 # Main_RecrDev_164
#DisplayOnly -0.0639517 # Main_RecrDev_165
#DisplayOnly -0.135874 # Main_RecrDev_166
#DisplayOnly 0.379311 # Main_RecrDev_167
#DisplayOnly -0.0649573 # Main_RecrDev_168
#DisplayOnly -0.486854 # Main_RecrDev_169
#DisplayOnly -0.335163 # Main_RecrDev_170
#DisplayOnly 0.0441321 # Main_RecrDev_171
#DisplayOnly 0.0989949 # Main_RecrDev_172
#DisplayOnly 0.17387 # Main_RecrDev_173
#DisplayOnly 0.197142 # Main_RecrDev_174
#DisplayOnly 0.516643 # Main_RecrDev_175
#DisplayOnly 0.22671 # Main_RecrDev_176
#DisplayOnly -0.433567 # Main_RecrDev_177
#DisplayOnly -0.280765 # Main_RecrDev_178
#DisplayOnly 0.50162 # Main_RecrDev_179
#DisplayOnly -0.170653 # Main_RecrDev_180
#DisplayOnly -0.358624 # Main_RecrDev_181
#DisplayOnly -0.218837 # Main_RecrDev_182
#DisplayOnly 0.319413 # Main_RecrDev_183
#DisplayOnly 0.905869 # Main_RecrDev_184
#DisplayOnly -0.276988 # Main_RecrDev_185
#DisplayOnly -0.169566 # Main_RecrDev_186
#DisplayOnly 0.574123 # Main_RecrDev_187
#DisplayOnly 0.210284 # Main_RecrDev_188
#DisplayOnly -0.275925 # Main_RecrDev_189
#DisplayOnly -0.378011 # Main_RecrDev_190
#DisplayOnly 0.0169793 # Main_RecrDev_191
#DisplayOnly 0.167381 # Main_RecrDev_192
#DisplayOnly -0.0882781 # Main_RecrDev_193
#DisplayOnly 0.0429356 # Main_RecrDev_194
#DisplayOnly 0.169055 # Main_RecrDev_195
#DisplayOnly 0.719134 # Main_RecrDev_196
#DisplayOnly 0.177422 # Main_RecrDev_197
#DisplayOnly -0.163516 # Main_RecrDev_198
#DisplayOnly 0.813329 # Main_RecrDev_199
#DisplayOnly 0.2289 # Main_RecrDev_200
#DisplayOnly -0.215554 # Main_RecrDev_201
#DisplayOnly -0.127396 # Main_RecrDev_202
#DisplayOnly -0.0875469 # Main_RecrDev_203
#DisplayOnly 0.917329 # Main_RecrDev_204
#DisplayOnly -0.0284186 # Main_RecrDev_205
#DisplayOnly -0.182934 # Main_RecrDev_206
#DisplayOnly 0.976571 # Main_RecrDev_207
#DisplayOnly 0.417857 # Main_RecrDev_208
#DisplayOnly -0.302921 # Main_RecrDev_209
#DisplayOnly -0.509193 # Main_RecrDev_210
#DisplayOnly 0.0796728 # Main_RecrDev_211
#DisplayOnly 0.247861 # Main_RecrDev_212
#DisplayOnly -0.490171 # Main_RecrDev_213
#DisplayOnly -0.508512 # Main_RecrDev_214
#DisplayOnly 1.02852 # Main_RecrDev_215
#DisplayOnly 0.769771 # Main_RecrDev_216
#DisplayOnly -0.153077 # Main_RecrDev_217
#DisplayOnly -0.374859 # Main_RecrDev_218
#DisplayOnly 0.793405 # Main_RecrDev_219
#DisplayOnly 1.1134 # Main_RecrDev_220
#DisplayOnly -0.395054 # Main_RecrDev_221
#DisplayOnly -0.305681 # Main_RecrDev_222
#DisplayOnly 0.418971 # Main_RecrDev_223
#DisplayOnly 0.229668 # Main_RecrDev_224
#DisplayOnly -0.311572 # Main_RecrDev_225
#DisplayOnly -0.271927 # Main_RecrDev_226
#DisplayOnly 0.960679 # Main_RecrDev_227
#DisplayOnly -0.162939 # Main_RecrDev_228
#DisplayOnly -0.167654 # Main_RecrDev_229
#DisplayOnly -0.401447 # Main_RecrDev_230
#DisplayOnly -0.0907759 # Main_RecrDev_231
#DisplayOnly 0.153235 # Main_RecrDev_232
#DisplayOnly -0.895467 # Main_RecrDev_233
#DisplayOnly -1.03933 # Main_RecrDev_234
#DisplayOnly -0.508193 # Main_RecrDev_235
#DisplayOnly -0.263209 # Main_RecrDev_236
#DisplayOnly -0.638708 # Main_RecrDev_237
#DisplayOnly 0.344371 # Main_RecrDev_238
#DisplayOnly -0.353786 # Main_RecrDev_239
#DisplayOnly -0.0238497 # Main_RecrDev_240
#DisplayOnly -0.642511 # Main_RecrDev_241
#DisplayOnly 0.23329 # Main_RecrDev_242
#DisplayOnly 0.150462 # Main_RecrDev_243
#DisplayOnly 0.479852 # Main_RecrDev_244
#DisplayOnly -0.416324 # Main_RecrDev_245
#DisplayOnly -0.0503597 # Main_RecrDev_246
#DisplayOnly 1.35153 # Main_RecrDev_247
#DisplayOnly -0.0036399 # Main_RecrDev_248
#DisplayOnly -0.555313 # Main_RecrDev_249
#DisplayOnly -0.44573 # Main_RecrDev_250
#DisplayOnly 0.335048 # Main_RecrDev_251
#DisplayOnly 0.54234 # Main_RecrDev_252
#DisplayOnly 0.0384858 # Main_RecrDev_253
#DisplayOnly -0.313884 # Main_RecrDev_254
#DisplayOnly 0.0852263 # Main_RecrDev_255
#DisplayOnly 0.435036 # Main_RecrDev_256
#DisplayOnly -0.601529 # Main_RecrDev_257
#DisplayOnly -0.249963 # Main_RecrDev_258
#DisplayOnly 0.628908 # Main_RecrDev_259
#DisplayOnly 0.211229 # Main_RecrDev_260
#DisplayOnly -0.0278799 # Main_RecrDev_261
#DisplayOnly 0.0898246 # Main_RecrDev_262
#DisplayOnly 0.978188 # Main_RecrDev_263
#DisplayOnly 0.174351 # Main_RecrDev_264
#DisplayOnly -0.180281 # Main_RecrDev_265
#DisplayOnly -0.00275309 # Main_RecrDev_266
#DisplayOnly 0.532688 # Main_RecrDev_267
#DisplayOnly -0.0745517 # Main_RecrDev_268
#DisplayOnly -0.271998 # Main_RecrDev_269
#DisplayOnly 0.0596938 # Main_RecrDev_270
#DisplayOnly 0.359707 # Main_RecrDev_271
#DisplayOnly -0.261316 # Main_RecrDev_272
#DisplayOnly -0.400074 # Main_RecrDev_273
#DisplayOnly -0.180414 # Main_RecrDev_274
#DisplayOnly 0.253388 # Main_RecrDev_275
#DisplayOnly 0.0314008 # Main_RecrDev_276
#DisplayOnly -0.112105 # Main_RecrDev_277
#DisplayOnly -0.292824 # Main_RecrDev_278
#DisplayOnly 0.270036 # Main_RecrDev_279
#DisplayOnly 0.641271 # Main_RecrDev_280
#DisplayOnly -0.0485511 # Late_RecrDev_281
#DisplayOnly -0.17586 # Late_RecrDev_282
#DisplayOnly -0.159011 # Late_RecrDev_283
#DisplayOnly -0.105436 # Late_RecrDev_284
#DisplayOnly 0 # ForeRecr_285
#DisplayOnly 0 # ForeRecr_286
#DisplayOnly 0 # ForeRecr_287
#DisplayOnly 0 # ForeRecr_288
#DisplayOnly 0 # ForeRecr_289
#DisplayOnly 0 # ForeRecr_290
#DisplayOnly 0 # ForeRecr_291
#DisplayOnly 0 # ForeRecr_292
#DisplayOnly 0 # ForeRecr_293
#DisplayOnly 0 # ForeRecr_294
#DisplayOnly 0 # ForeRecr_295
#DisplayOnly 0 # ForeRecr_296
#DisplayOnly 0 # ForeRecr_297
#DisplayOnly 0 # ForeRecr_298
#DisplayOnly 0 # ForeRecr_299
#DisplayOnly 0 # ForeRecr_300
#DisplayOnly 0 # ForeRecr_301
#DisplayOnly 0 # ForeRecr_302
#DisplayOnly 0 # ForeRecr_303
#DisplayOnly 0 # ForeRecr_304
#DisplayOnly 0 # ForeRecr_305
#DisplayOnly 0 # ForeRecr_306
#DisplayOnly 0 # ForeRecr_307
#DisplayOnly 0 # ForeRecr_308
#DisplayOnly 0 # ForeRecr_309
#DisplayOnly 0 # ForeRecr_310
#DisplayOnly 0 # ForeRecr_311
#DisplayOnly 0 # ForeRecr_312
#DisplayOnly 0 # ForeRecr_313
#DisplayOnly 0 # ForeRecr_314
#DisplayOnly 0 # ForeRecr_315
#DisplayOnly 0 # ForeRecr_316
#DisplayOnly 0 # ForeRecr_317
#DisplayOnly 0 # ForeRecr_318
#DisplayOnly 0 # ForeRecr_319
#DisplayOnly 0 # ForeRecr_320
#DisplayOnly 0 # ForeRecr_321
#DisplayOnly 0 # ForeRecr_322
#DisplayOnly 0 # ForeRecr_323
#DisplayOnly 0 # ForeRecr_324
#DisplayOnly 0 # Impl_err_285
#DisplayOnly 0 # Impl_err_286
#DisplayOnly 0 # Impl_err_287
#DisplayOnly 0 # Impl_err_288
#DisplayOnly 0 # Impl_err_289
#DisplayOnly 0 # Impl_err_290
#DisplayOnly 0 # Impl_err_291
#DisplayOnly 0 # Impl_err_292
#DisplayOnly 0 # Impl_err_293
#DisplayOnly 0 # Impl_err_294
#DisplayOnly 0 # Impl_err_295
#DisplayOnly 0 # Impl_err_296
#DisplayOnly 0 # Impl_err_297
#DisplayOnly 0 # Impl_err_298
#DisplayOnly 0 # Impl_err_299
#DisplayOnly 0 # Impl_err_300
#DisplayOnly 0 # Impl_err_301
#DisplayOnly 0 # Impl_err_302
#DisplayOnly 0 # Impl_err_303
#DisplayOnly 0 # Impl_err_304
#DisplayOnly 0 # Impl_err_305
#DisplayOnly 0 # Impl_err_306
#DisplayOnly 0 # Impl_err_307
#DisplayOnly 0 # Impl_err_308
#DisplayOnly 0 # Impl_err_309
#DisplayOnly 0 # Impl_err_310
#DisplayOnly 0 # Impl_err_311
#DisplayOnly 0 # Impl_err_312
#DisplayOnly 0 # Impl_err_313
#DisplayOnly 0 # Impl_err_314
#DisplayOnly 0 # Impl_err_315
#DisplayOnly 0 # Impl_err_316
#DisplayOnly 0 # Impl_err_317
#DisplayOnly 0 # Impl_err_318
#DisplayOnly 0 # Impl_err_319
#DisplayOnly 0 # Impl_err_320
#DisplayOnly 0 # Impl_err_321
#DisplayOnly 0 # Impl_err_322
#DisplayOnly 0 # Impl_err_323
#DisplayOnly 0 # Impl_err_324
#
#Fishing Mortality info 
0.1 # F ballpark for tuning early phases
220 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
4  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
 0 1 0 0 0 99 -1 # InitF_1FISHERY1
 0 1 0 0 0 99 -1 # InitF_2FISHERY2
 0 1 0 0 0 99 -1 # InitF_3FISHERY3
 0 1 0 0 0 99 -1 # InitF_4FISHERY4
 0 1 0 0 0 99 -1 # InitF_5FISHERY5
 0 1 0 0 0 99 -1 # InitF_6FISHERY6
 0 1 0 0 0 99 -1 # InitF_7FISHERY7
 0 1 0 0 0 99 -1 # InitF_8FISHERY8
 0 1 0 0 0 99 -1 # InitF_9FISHERY9
 0 1 0 0 0 99 -1 # InitF_10FISHERY10
 0 1 0 0 0 99 -1 # InitF_11FISHERY11
 0 1 0 0 0 99 -1 # InitF_12FISHERY12
 0 1 0 0 0 99 -1 # InitF_13FISHERY13
 0 1 0 0 0 99 -1 # InitF_14FISHERY14
 0 1 0 0 0 99 -1 # InitF_15FISHERY15
 0 1 0 0 0 99 -1 # InitF_16FISHERY16
 0 1 0 0 0 99 -1 # InitF_17FISHERY17
 0 1 0 0 0 99 -1 # InitF_18FISHERY18
 0 1 0 0 0 99 -1 # InitF_19FISHERY19
 0 1 0 0 0 99 -1 # InitF_20FISHERY20
 0 1 0 0 0 99 -1 # InitF_21FISHERY21
 0 1 0 0 0 99 -1 # InitF_22FISHERY22
 0 1 0 0 0 99 -1 # InitF_23FISHERY23
 0 1 0 0 0 99 -1 # InitF_24FISHERY24
 0 1 0 0 0 99 -1 # InitF_25FISHERY25
#
#_Q_setup
 # Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den-dep  env-var  extra_se  Q_type
 0 0 0 0 # 1 FISHERY1
 0 0 0 0 # 2 FISHERY2
 0 0 0 0 # 3 FISHERY3
 0 0 0 0 # 4 FISHERY4
 0 0 0 0 # 5 FISHERY5
 0 0 0 0 # 6 FISHERY6
 0 0 0 0 # 7 FISHERY7
 0 0 0 0 # 8 FISHERY8
 0 0 0 0 # 9 FISHERY9
 0 0 0 0 # 10 FISHERY10
 0 0 0 0 # 11 FISHERY11
 0 0 0 0 # 12 FISHERY12
 0 0 0 0 # 13 FISHERY13
 0 0 0 0 # 14 FISHERY14
 0 0 0 0 # 15 FISHERY15
 0 0 0 0 # 16 FISHERY16
 0 0 0 0 # 17 FISHERY17
 0 0 0 0 # 18 FISHERY18
 0 0 0 0 # 19 FISHERY19
 0 0 0 0 # 20 FISHERY20
 0 0 0 0 # 21 FISHERY21
 0 0 0 0 # 22 FISHERY22
 0 0 0 0 # 23 FISHERY23
 0 0 0 0 # 24 FISHERY24
 0 0 0 0 # 25 FISHERY25
 0 0 0 0 # 26 SURVEY1
 0 0 0 -26 # 27 SURVEY2
 0 0 0 -26 # 28 SURVEY3
 0 0 0 -26 # 29 SURVEY4
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 0 0 0 0 # 1 FISHERY1
 0 0 0 0 # 2 FISHERY2
 0 0 0 0 # 3 FISHERY3
 0 0 0 0 # 4 FISHERY4
 0 0 0 0 # 5 FISHERY5
 0 0 0 0 # 6 FISHERY6
 0 0 0 0 # 7 FISHERY7
 0 0 0 0 # 8 FISHERY8
 0 0 0 0 # 9 FISHERY9
 0 0 0 0 # 10 FISHERY10
 0 0 0 0 # 11 FISHERY11
 0 0 0 0 # 12 FISHERY12
 0 0 0 0 # 13 FISHERY13
 0 0 0 0 # 14 FISHERY14
 0 0 0 0 # 15 FISHERY15
 0 0 0 0 # 16 FISHERY16
 0 0 0 0 # 17 FISHERY17
 0 0 0 0 # 18 FISHERY18
 0 0 0 0 # 19 FISHERY19
 0 0 0 0 # 20 FISHERY20
 0 0 0 0 # 21 FISHERY21
 0 0 0 0 # 22 FISHERY22
 0 0 0 0 # 23 FISHERY23
 0 0 0 0 # 24 FISHERY24
 0 0 0 0 # 25 FISHERY25
 0 0 0 0 # 26 SURVEY1
 0 0 0 0 # 27 SURVEY2
 0 0 0 0 # 28 SURVEY3
 0 0 0 0 # 29 SURVEY4
#
#_age_selex_types
#_Pattern ___ Male Special
 20 0 0 0 # 1 FISHERY1
 20 0 0 0 # 2 FISHERY2
 12 0 0 0 # 3 FISHERY3
 20 0 0 0 # 4 FISHERY4
 20 0 0 0 # 5 FISHERY5
 27 0 0 5 # 6 FISHERY6
 15 0 0 3 # 7 FISHERY7
 27 0 0 5 # 8 FISHERY8
 20 0 0 0 # 9 FISHERY9
 15 0 0 3 # 10 FISHERY10
 15 0 0 3 # 11 FISHERY11
 20 0 0 0 # 12 FISHERY12
 15 0 0 3 # 13 FISHERY13
 20 0 0 0 # 14 FISHERY14
 15 0 0 9 # 15 FISHERY15
 15 0 0 6 # 16 FISHERY16
 15 0 0 8 # 17 FISHERY17
 15 0 0 9 # 18 FISHERY18
 15 0 0 6 # 19 FISHERY19
 15 0 0 8 # 20 FISHERY20
 15 0 0 6 # 21 FISHERY21
 15 0 0 8 # 22 FISHERY22
 15 0 0 6 # 23 FISHERY23
 15 0 0 8 # 24 FISHERY24
 12 0 0 0 # 25 FISHERY25
 15 0 0 3 # 26 SURVEY1
 15 0 0 3 # 27 SURVEY2
 15 0 0 3 # 28 SURVEY3
 15 0 0 3 # 29 SURVEY4
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 1 12 8.48928 7 0 3 -3 0 0 0 0 0 1 2 # AgeSel_1P_1_FISHERY1
 -20 -3 -9.70313 -3 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_1P_2_FISHERY1
 -10 9 -0.811695 -1 0 3 -4 0 0 0 0 0 1 2 # AgeSel_1P_3_FISHERY1
 -5 9 1.83812 3 0 1 -4 0 0 0 0 0 0 0 # AgeSel_1P_4_FISHERY1
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_1P_5_FISHERY1
 -9 5 -1.62357 -2 0 -1 5 0 0 0 0 0 0 0 # AgeSel_1P_6_FISHERY1
 1 40 22.5777 10 0 5 -3 0 0 0 0 0 2 2 # AgeSel_2P_1_FISHERY2
 -20 -3 -9.70313 -3 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_2P_2_FISHERY2
 -10 9 3.83318 -1 0 3 -4 0 0 0 0 0 2 2 # AgeSel_2P_3_FISHERY2
 -5 9 3.36543 3 0 1 -4 0 0 0 0 0 0 0 # AgeSel_2P_4_FISHERY2
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_2P_5_FISHERY2
 -9 5 0.152802 -2 0 1 -5 0 0 0 0 0 0 0 # AgeSel_2P_6_FISHERY2
 8 18 12.7485 14 0 2 -3 0 0 0 0 0 0 0 # AgeSel_3P_1_FISHERY3
 2 6 3.44044 4 0 1 -3 0 0 0 0 0 0 0 # AgeSel_3P_2_FISHERY3
 1 40 5.42202 5 0 3 -3 0 0 0 0 0 0 0 # AgeSel_4P_1_FISHERY4
 -20 -3 -9.70313 -3 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_4P_2_FISHERY4
 -10 9 -3.08253 -3 0 1 -4 0 0 0 0 0 0 0 # AgeSel_4P_3_FISHERY4
 -5 9 3.47008 5 0 1 -4 0 0 0 0 0 0 0 # AgeSel_4P_4_FISHERY4
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_4P_5_FISHERY4
 -9 9 -3.13334 -3 0 1 -5 0 0 0 0 0 0 0 # AgeSel_4P_6_FISHERY4
 1 10 2.81484 3 0 1 -3 0 0 0 0 0 0 0 # AgeSel_5P_1_FISHERY5
 -20 -3 -9.70313 -3 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_5P_2_FISHERY5
 -7 5 -0.732997 -2 0 1 -4 0 0 0 0 0 0 0 # AgeSel_5P_3_FISHERY5
 -5 9 3.02869 3 0 1 -4 0 0 0 0 0 0 0 # AgeSel_5P_4_FISHERY5
 -10 9 -6 -6 0 1 -5 0 0 0 0 0 0 0 # AgeSel_5P_5_FISHERY5
 -9 9 -2.32441 -3 0 1 -5 0 0 0 0 0 0 0 # AgeSel_5P_6_FISHERY5
 0 2 0 0 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Code_FISHERY6_6
 -1 2 1.5 1.5 0 0.5 -3 0 0 0 0 0 0 0 # AgeSpline_GradLo_FISHERY6_6
 -1 1 -0.0924751 -0.1 0 0.1 -3 0 0 0 0 0 0 0 # AgeSpline_GradHi_FISHERY6_6
 1 14 2 2 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_1_FISHERY6_6
 1 24 4 4 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_2_FISHERY6_6
 4 24 7 7 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_3_FISHERY6_6
 4 24 16 16 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_4_FISHERY6_6
 4 27 20 20 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_5_FISHERY6_6
 -10 10 -6.69652 -5 0 2 -2 0 0 0 0 0 0 0 # AgeSpline_Val_1_FISHERY6_6
 -10 10 -3.24027 -2.5 0 0.5 -2 0 0 0 0 0 0 0 # AgeSpline_Val_2_FISHERY6_6
 -10 10 -2.6209 -3 0 0.5 -2 0 0 0 0 0 0 0 # AgeSpline_Val_3_FISHERY6_6
 -10 10 0 0 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Val_4_FISHERY6_6
 -10 10 0.202362 -0.5 0 1 -3 0 0 0 0 0 0 0 # AgeSpline_Val_5_FISHERY6_6
 0 2 0 0 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Code_FISHERY8_8
 -1 3 2 2 -1 0 -3 0 0 0 0 0 0 0 # AgeSpline_GradLo_FISHERY8_8
 -1 1 -0.308208 -0.5 0 0.2 -3 0 0 0 0 0 0 0 # AgeSpline_GradHi_FISHERY8_8
 1 14 2 2 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_1_FISHERY8_8
 1 24 4 4 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_2_FISHERY8_8
 4 24 9 9 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_3_FISHERY8_8
 4 24 11 11 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_4_FISHERY8_8
 4 27 13 13 -1 0 -99 0 0 0 0 0 0 0 # AgeSpline_Knot_5_FISHERY8_8
 -10 10 -3.39639 -3 0 0.5 -2 0 0 0 0 0 0 0 # AgeSpline_Val_1_FISHERY8_8
 -10 10 0 0 0 2 -2 0 0 0 0 0 0 0 # AgeSpline_Val_2_FISHERY8_8
 -10 10 -0.0639563 -1 0 2 -2 0 0 0 0 0 0 0 # AgeSpline_Val_3_FISHERY8_8
 -10 10 -0.106651 0 0 1 -3 0 0 0 0 0 0 0 # AgeSpline_Val_4_FISHERY8_8
 -10 10 -0.360991 -0.5 0 2 -4 0 0 0 0 0 0 0 # AgeSpline_Val_5_FISHERY8_8
 1 10 3.28069 2.5 0 1 -3 0 0 0 0 0 0 0 # AgeSel_9P_1_FISHERY9
 -20 -3 -9.70313 -3 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_9P_2_FISHERY9
 -7 3 -2.26554 -2 0 1 -4 0 0 0 0 0 0 0 # AgeSel_9P_3_FISHERY9
 -5 9 1.00491 4 0 1 -4 0 0 0 0 0 0 0 # AgeSel_9P_4_FISHERY9
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_9P_5_FISHERY9
 -9 7 -2.62894 1 0 2 -5 0 0 0 0 0 0 0 # AgeSel_9P_6_FISHERY9
 1 10 7.522 5.5 0 2 -3 0 0 0 0 0 0 0 # AgeSel_12P_1_FISHERY12
 -20 -3 -9.70313 -3 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_12P_2_FISHERY12
 -10 5 1.72751 2 0 2 -4 0 0 0 0 0 0 0 # AgeSel_12P_3_FISHERY12
 -5 9 0.879741 1 0 2 -4 0 0 0 0 0 0 0 # AgeSel_12P_4_FISHERY12
 -10 9 -6 -6 0 1 -5 0 0 0 0 0 0 0 # AgeSel_12P_5_FISHERY12
 -9 9 -2.00545 -2 0 1 -5 0 0 0 0 0 0 0 # AgeSel_12P_6_FISHERY12
 1 10 2.96487 2 0 1 -3 0 0 0 0 0 0 0 # AgeSel_14P_1_FISHERY14
 -20 -3 -9.70313 -3 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_14P_2_FISHERY14
 -15 2 -7.6446 -6 0 2 -4 0 0 0 0 0 0 0 # AgeSel_14P_3_FISHERY14
 0 12 4.29781 7 0 1 -4 0 0 0 0 0 0 0 # AgeSel_14P_4_FISHERY14
 -10 9 -6 -6 0 1000 -5 0 0 0 0 0 0 0 # AgeSel_14P_5_FISHERY14
 -9 9 -1.90061 0 0 1 -5 0 0 0 0 0 0 0 # AgeSel_14P_6_FISHERY14
 5 20 14.6728 14 0 1 -3 0 0 0 0 0 0 0 # AgeSel_25P_1_FISHERY25
 2 10 4.20306 4 0 1 -3 0 0 0 0 0 0 0 # AgeSel_25P_2_FISHERY25
#_Cond 0 #_custom_sel-env_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
1 #_custom_sel-blk_setup (0/1) 
 1 12 7.23286 7 0 3 -3 # AgeSel_1P_1_FISHERY1_BLK1repl_213
 1 12 8.29666 7 0 3 -3 # AgeSel_1P_1_FISHERY1_BLK1repl_261
 -10 9 -2.97862 -1 0 3 -4 # AgeSel_1P_3_FISHERY1_BLK1repl_213
 -10 9 -1.92424 -1 0 3 -4 # AgeSel_1P_3_FISHERY1_BLK1repl_261
 1 40 13.4456 10 0 5 -3 # AgeSel_2P_1_FISHERY2_BLK2repl_225
 -10 9 2.16999 -1 0 3 -4 # AgeSel_2P_3_FISHERY2_BLK2repl_225
#_Cond No selex parm trends 
#_Cond -4 # placeholder for selparm_Dev_Phase
1 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
#
# Tag loss and Tag reporting parameters go next
1 # TG_custom:  0=no read; 1=read
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_1
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_2
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_3
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_4
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_5
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_6
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_7
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_8
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_9
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_10
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_11
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_12
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_13
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_14
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_15
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_16
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_17
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_18
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_19
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_20
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_21
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_22
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_23
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_24
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_25
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_26
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_27
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_28
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_29
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_30
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_31
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_32
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_33
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_34
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_35
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_36
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_37
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_38
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_39
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_40
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_41
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_42
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_43
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_44
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_45
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_46
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_47
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_48
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_49
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_50
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_51
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_52
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_53
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_54
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_55
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_56
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_57
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_58
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_59
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_60
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_61
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_62
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_63
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_64
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_65
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_66
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_67
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_68
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_69
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_70
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_71
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_72
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_73
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_74
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_75
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_76
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_77
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_78
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_79
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_80
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_81
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_82
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_83
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_84
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_85
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_86
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_87
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_88
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_89
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_90
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_91
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_92
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_93
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_94
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_95
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_96
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_97
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_98
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_99
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_100
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_101
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_102
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_103
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_104
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_105
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_106
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_107
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_108
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_109
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_110
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_111
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_112
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_113
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_114
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_115
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_116
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_117
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_118
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_119
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_120
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_121
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_122
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_123
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_124
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_125
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_126
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_127
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_128
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_129
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_130
 -15 10 -10 -10 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_init_131
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_2
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_3
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_4
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_5
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_6
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_7
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_8
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_9
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_10
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_11
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_12
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_13
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_14
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_15
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_16
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_17
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_18
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_19
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_20
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_21
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_22
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_23
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_24
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_25
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_26
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_27
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_28
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_29
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_30
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_31
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_32
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_33
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_34
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_35
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_36
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_37
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_38
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_39
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_40
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_41
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_42
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_43
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_44
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_45
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_46
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_47
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_48
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_49
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_50
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_51
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_52
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_53
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_54
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_55
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_56
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_57
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_58
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_59
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_60
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_61
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_62
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_63
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_64
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_65
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_66
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_67
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_68
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_69
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_70
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_71
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_72
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_73
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_74
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_75
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_76
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_77
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_78
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_79
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_80
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_81
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_82
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_83
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_84
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_85
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_86
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_87
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_88
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_89
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_90
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_91
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_92
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_93
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_94
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_95
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_96
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_97
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_98
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_99
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_100
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_101
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_102
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_103
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_104
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_105
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_106
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_107
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_108
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_109
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_110
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_111
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_112
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_113
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_114
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_115
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_116
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_117
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_118
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_119
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_120
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_121
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_122
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_123
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_124
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_125
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_126
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_127
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_128
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_129
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_130
 -15 10 -3.5 -3.5 1 0.001 -4 0 0 0 0 0 0 0 # TG_loss_chronic_131
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_1
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_2
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_3
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_4
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_5
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_6
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_7
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_8
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_9
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_10
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_11
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_12
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_13
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_14
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_15
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_16
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_17
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_18
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_19
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_20
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_21
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_22
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_23
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_24
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_25
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_26
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_27
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_28
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_29
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_30
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_31
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_32
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_33
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_34
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_35
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_36
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_37
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_38
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_39
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_40
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_41
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_42
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_43
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_44
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_45
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_46
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_47
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_48
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_49
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_50
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_51
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_52
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_53
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_54
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_55
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_56
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_57
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_58
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_59
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_60
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_61
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_62
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_63
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_64
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_65
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_66
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_67
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_68
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_69
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_70
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_71
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_72
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_73
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_74
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_75
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_76
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_77
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_78
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_79
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_80
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_81
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_82
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_83
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_84
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_85
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_86
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_87
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_88
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_89
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_90
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_91
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_92
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_93
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_94
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_95
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_96
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_97
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_98
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_99
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_100
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_101
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_102
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_103
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_104
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_105
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_106
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_107
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_108
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_109
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_110
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_111
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_112
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_113
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_114
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_115
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_116
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_117
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_118
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_119
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_120
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_121
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_122
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_123
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_124
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_125
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_126
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_127
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_128
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_129
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_130
 1 10 7 7 1 0.001 -4 0 0 0 0 0 0 0 # TG_overdispersion_131
 -10 10 -2.81911 -2.81911 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_1
 -10 10 -6.05099 -6.05099 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_2
 -10 10 -1.5506 -1.5506 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_3
 -10 10 4.59512 4.59512 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_4
 -10 10 -2.81161 -2.81161 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_5
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_6
 -10 10 -2.34957 -2.34957 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_7
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_8
 -10 10 0.0640219 0.0640219 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_9
 -10 10 -1.89215 -1.89215 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_10
 -10 10 -0.605878 -0.605878 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_11
 -10 10 -5.43322 -5.43322 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_12
 -10 10 -1.27736 -1.27736 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_13
 -10 10 1.53681 1.53681 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_14
 -10 10 -1.92775 -1.92775 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_15
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_16
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_17
 -10 10 -2.31853 -2.31853 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_18
 -10 10 1.43063 1.43063 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_19
 -10 10 1.43063 1.43063 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_20
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_21
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_22
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_23
 -20 20 10 10 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_24
 -10 10 1.43063 1.43063 0 2 -6 0 0 0 0 0 0 0 # TG_report_fleet:_25
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_2
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_3
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_4
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_5
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_6
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_7
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_8
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_9
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_10
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_11
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_12
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_13
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_14
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_15
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_16
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_17
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_18
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_19
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_20
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_21
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_22
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_23
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_24
 -4 0 0 0 0 2 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_25
#
1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_survey_CV
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_lencomp_N
  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_agecomp_N
  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_mult_by_size-at-age_N
#
1 #_maxlambdaphase
1 #_sd_offset
#
25 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 
# 9=init_equ_catch; 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin
#like_comp fleet/survey  phase  value  sizefreq_method
#
# lambdas (for info only; columns are phases)
 4 1 1 0 1 # TURN OFF all size or age comps
 4 2 1 0 1 
 4 3 1 0 1
 4 4 1 0 1
 4 5 1 0 1 # TURN OFF all size or age comps
 4 6 1 0 1 
 4 7 1 0 1
 4 8 1 0 1
 4 9 1 0 1 # TURN OFF all size or age comps
 4 10 1 0 1 
 4 11 1 0 1
 4 12 1 0 1
 4 13 1 0 1 # TURN OFF all size or age comps
 4 14 1 0 1 
 4 15 1 0 1
 4 16 1 0 1
 4 17 1 0 1 # TURN OFF all size or age comps
 4 18 1 0 1 
 4 19 1 0 1
 4 20 1 0 1
 4 21 1 0 1 # TURN OFF all size or age comps
 4 22 1 0 1 
 4 23 1 0 1
 4 24 1 0 1
 4 25 1 0 1
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
#  0 #_CPUE/survey:_13
#  0 #_CPUE/survey:_14
#  0 #_CPUE/survey:_15
#  0 #_CPUE/survey:_16
#  0 #_CPUE/survey:_17
#  0 #_CPUE/survey:_18
#  0 #_CPUE/survey:_19
#  0 #_CPUE/survey:_20
#  0 #_CPUE/survey:_21
#  0 #_CPUE/survey:_22
#  0 #_CPUE/survey:_23
#  0 #_CPUE/survey:_24
#  0 #_CPUE/survey:_25
#  1 #_CPUE/survey:_26
#  1 #_CPUE/survey:_27
#  1 #_CPUE/survey:_28
#  1 #_CPUE/survey:_29
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_lencomp:_8
#  1 #_lencomp:_9
#  1 #_lencomp:_10
#  1 #_lencomp:_11
#  1 #_lencomp:_12
#  1 #_lencomp:_13
#  1 #_lencomp:_14
#  1 #_lencomp:_15
#  1 #_lencomp:_16
#  1 #_lencomp:_17
#  0 #_lencomp:_18
#  1 #_lencomp:_19
#  1 #_lencomp:_20
#  1 #_lencomp:_21
#  1 #_lencomp:_22
#  1 #_lencomp:_23
#  1 #_lencomp:_24
#  1 #_lencomp:_25
#  0 #_lencomp:_26
#  0 #_lencomp:_27
#  0 #_lencomp:_28
#  0 #_lencomp:_29
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  1 #_TG-comp_group:_1
#  1 #_TG-comp_group:_2
#  1 #_TG-comp_group:_3
#  1 #_TG-comp_group:_4
#  1 #_TG-comp_group:_5
#  1 #_TG-comp_group:_6
#  1 #_TG-comp_group:_7
#  1 #_TG-comp_group:_8
#  1 #_TG-comp_group:_9
#  1 #_TG-comp_group:_10
#  1 #_TG-comp_group:_11
#  1 #_TG-comp_group:_12
#  1 #_TG-comp_group:_13
#  1 #_TG-comp_group:_14
#  1 #_TG-comp_group:_15
#  1 #_TG-comp_group:_16
#  1 #_TG-comp_group:_17
#  1 #_TG-comp_group:_18
#  1 #_TG-comp_group:_19
#  1 #_TG-comp_group:_20
#  1 #_TG-comp_group:_21
#  1 #_TG-comp_group:_22
#  1 #_TG-comp_group:_23
#  1 #_TG-comp_group:_24
#  1 #_TG-comp_group:_25
#  1 #_TG-comp_group:_26
#  1 #_TG-comp_group:_27
#  1 #_TG-comp_group:_28
#  1 #_TG-comp_group:_29
#  1 #_TG-comp_group:_30
#  1 #_TG-comp_group:_31
#  1 #_TG-comp_group:_32
#  1 #_TG-comp_group:_33
#  1 #_TG-comp_group:_34
#  1 #_TG-comp_group:_35
#  1 #_TG-comp_group:_36
#  1 #_TG-comp_group:_37
#  1 #_TG-comp_group:_38
#  1 #_TG-comp_group:_39
#  1 #_TG-comp_group:_40
#  1 #_TG-comp_group:_41
#  1 #_TG-comp_group:_42
#  1 #_TG-comp_group:_43
#  1 #_TG-comp_group:_44
#  1 #_TG-comp_group:_45
#  1 #_TG-comp_group:_46
#  1 #_TG-comp_group:_47
#  1 #_TG-comp_group:_48
#  1 #_TG-comp_group:_49
#  1 #_TG-comp_group:_50
#  1 #_TG-comp_group:_51
#  1 #_TG-comp_group:_52
#  1 #_TG-comp_group:_53
#  1 #_TG-comp_group:_54
#  1 #_TG-comp_group:_55
#  1 #_TG-comp_group:_56
#  1 #_TG-comp_group:_57
#  1 #_TG-comp_group:_58
#  1 #_TG-comp_group:_59
#  1 #_TG-comp_group:_60
#  1 #_TG-comp_group:_61
#  1 #_TG-comp_group:_62
#  1 #_TG-comp_group:_63
#  1 #_TG-comp_group:_64
#  1 #_TG-comp_group:_65
#  1 #_TG-comp_group:_66
#  1 #_TG-comp_group:_67
#  1 #_TG-comp_group:_68
#  1 #_TG-comp_group:_69
#  1 #_TG-comp_group:_70
#  1 #_TG-comp_group:_71
#  1 #_TG-comp_group:_72
#  1 #_TG-comp_group:_73
#  1 #_TG-comp_group:_74
#  1 #_TG-comp_group:_75
#  1 #_TG-comp_group:_76
#  1 #_TG-comp_group:_77
#  1 #_TG-comp_group:_78
#  1 #_TG-comp_group:_79
#  1 #_TG-comp_group:_80
#  1 #_TG-comp_group:_81
#  1 #_TG-comp_group:_82
#  1 #_TG-comp_group:_83
#  1 #_TG-comp_group:_84
#  1 #_TG-comp_group:_85
#  1 #_TG-comp_group:_86
#  1 #_TG-comp_group:_87
#  1 #_TG-comp_group:_88
#  1 #_TG-comp_group:_89
#  1 #_TG-comp_group:_90
#  1 #_TG-comp_group:_91
#  1 #_TG-comp_group:_92
#  1 #_TG-comp_group:_93
#  1 #_TG-comp_group:_94
#  1 #_TG-comp_group:_95
#  1 #_TG-comp_group:_96
#  1 #_TG-comp_group:_97
#  1 #_TG-comp_group:_98
#  1 #_TG-comp_group:_99
#  1 #_TG-comp_group:_100
#  1 #_TG-comp_group:_101
#  1 #_TG-comp_group:_102
#  1 #_TG-comp_group:_103
#  1 #_TG-comp_group:_104
#  1 #_TG-comp_group:_105
#  1 #_TG-comp_group:_106
#  1 #_TG-comp_group:_107
#  1 #_TG-comp_group:_108
#  1 #_TG-comp_group:_109
#  1 #_TG-comp_group:_110
#  1 #_TG-comp_group:_111
#  1 #_TG-comp_group:_112
#  1 #_TG-comp_group:_113
#  1 #_TG-comp_group:_114
#  1 #_TG-comp_group:_115
#  1 #_TG-comp_group:_116
#  1 #_TG-comp_group:_117
#  1 #_TG-comp_group:_118
#  1 #_TG-comp_group:_119
#  1 #_TG-comp_group:_120
#  1 #_TG-comp_group:_121
#  1 #_TG-comp_group:_122
#  1 #_TG-comp_group:_123
#  1 #_TG-comp_group:_124
#  1 #_TG-comp_group:_125
#  1 #_TG-comp_group:_126
#  1 #_TG-comp_group:_127
#  1 #_TG-comp_group:_128
#  1 #_TG-comp_group:_129
#  1 #_TG-comp_group:_130
#  1 #_TG-comp_group:_131
#  1 #_TG-negbin_group:_1
#  1 #_TG-negbin_group:_2
#  1 #_TG-negbin_group:_3
#  1 #_TG-negbin_group:_4
#  1 #_TG-negbin_group:_5
#  1 #_TG-negbin_group:_6
#  1 #_TG-negbin_group:_7
#  1 #_TG-negbin_group:_8
#  1 #_TG-negbin_group:_9
#  1 #_TG-negbin_group:_10
#  1 #_TG-negbin_group:_11
#  1 #_TG-negbin_group:_12
#  1 #_TG-negbin_group:_13
#  1 #_TG-negbin_group:_14
#  1 #_TG-negbin_group:_15
#  1 #_TG-negbin_group:_16
#  1 #_TG-negbin_group:_17
#  1 #_TG-negbin_group:_18
#  1 #_TG-negbin_group:_19
#  1 #_TG-negbin_group:_20
#  1 #_TG-negbin_group:_21
#  1 #_TG-negbin_group:_22
#  1 #_TG-negbin_group:_23
#  1 #_TG-negbin_group:_24
#  1 #_TG-negbin_group:_25
#  1 #_TG-negbin_group:_26
#  1 #_TG-negbin_group:_27
#  1 #_TG-negbin_group:_28
#  1 #_TG-negbin_group:_29
#  1 #_TG-negbin_group:_30
#  1 #_TG-negbin_group:_31
#  1 #_TG-negbin_group:_32
#  1 #_TG-negbin_group:_33
#  1 #_TG-negbin_group:_34
#  1 #_TG-negbin_group:_35
#  1 #_TG-negbin_group:_36
#  1 #_TG-negbin_group:_37
#  1 #_TG-negbin_group:_38
#  1 #_TG-negbin_group:_39
#  1 #_TG-negbin_group:_40
#  1 #_TG-negbin_group:_41
#  1 #_TG-negbin_group:_42
#  1 #_TG-negbin_group:_43
#  1 #_TG-negbin_group:_44
#  1 #_TG-negbin_group:_45
#  1 #_TG-negbin_group:_46
#  1 #_TG-negbin_group:_47
#  1 #_TG-negbin_group:_48
#  1 #_TG-negbin_group:_49
#  1 #_TG-negbin_group:_50
#  1 #_TG-negbin_group:_51
#  1 #_TG-negbin_group:_52
#  1 #_TG-negbin_group:_53
#  1 #_TG-negbin_group:_54
#  1 #_TG-negbin_group:_55
#  1 #_TG-negbin_group:_56
#  1 #_TG-negbin_group:_57
#  1 #_TG-negbin_group:_58
#  1 #_TG-negbin_group:_59
#  1 #_TG-negbin_group:_60
#  1 #_TG-negbin_group:_61
#  1 #_TG-negbin_group:_62
#  1 #_TG-negbin_group:_63
#  1 #_TG-negbin_group:_64
#  1 #_TG-negbin_group:_65
#  1 #_TG-negbin_group:_66
#  1 #_TG-negbin_group:_67
#  1 #_TG-negbin_group:_68
#  1 #_TG-negbin_group:_69
#  1 #_TG-negbin_group:_70
#  1 #_TG-negbin_group:_71
#  1 #_TG-negbin_group:_72
#  1 #_TG-negbin_group:_73
#  1 #_TG-negbin_group:_74
#  1 #_TG-negbin_group:_75
#  1 #_TG-negbin_group:_76
#  1 #_TG-negbin_group:_77
#  1 #_TG-negbin_group:_78
#  1 #_TG-negbin_group:_79
#  1 #_TG-negbin_group:_80
#  1 #_TG-negbin_group:_81
#  1 #_TG-negbin_group:_82
#  1 #_TG-negbin_group:_83
#  1 #_TG-negbin_group:_84
#  1 #_TG-negbin_group:_85
#  1 #_TG-negbin_group:_86
#  1 #_TG-negbin_group:_87
#  1 #_TG-negbin_group:_88
#  1 #_TG-negbin_group:_89
#  1 #_TG-negbin_group:_90
#  1 #_TG-negbin_group:_91
#  1 #_TG-negbin_group:_92
#  1 #_TG-negbin_group:_93
#  1 #_TG-negbin_group:_94
#  1 #_TG-negbin_group:_95
#  1 #_TG-negbin_group:_96
#  1 #_TG-negbin_group:_97
#  1 #_TG-negbin_group:_98
#  1 #_TG-negbin_group:_99
#  1 #_TG-negbin_group:_100
#  1 #_TG-negbin_group:_101
#  1 #_TG-negbin_group:_102
#  1 #_TG-negbin_group:_103
#  1 #_TG-negbin_group:_104
#  1 #_TG-negbin_group:_105
#  1 #_TG-negbin_group:_106
#  1 #_TG-negbin_group:_107
#  1 #_TG-negbin_group:_108
#  1 #_TG-negbin_group:_109
#  1 #_TG-negbin_group:_110
#  1 #_TG-negbin_group:_111
#  1 #_TG-negbin_group:_112
#  1 #_TG-negbin_group:_113
#  1 #_TG-negbin_group:_114
#  1 #_TG-negbin_group:_115
#  1 #_TG-negbin_group:_116
#  1 #_TG-negbin_group:_117
#  1 #_TG-negbin_group:_118
#  1 #_TG-negbin_group:_119
#  1 #_TG-negbin_group:_120
#  1 #_TG-negbin_group:_121
#  1 #_TG-negbin_group:_122
#  1 #_TG-negbin_group:_123
#  1 #_TG-negbin_group:_124
#  1 #_TG-negbin_group:_125
#  1 #_TG-negbin_group:_126
#  1 #_TG-negbin_group:_127
#  1 #_TG-negbin_group:_128
#  1 #_TG-negbin_group:_129
#  1 #_TG-negbin_group:_130
#  1 #_TG-negbin_group:_131
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

