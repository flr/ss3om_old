### Stock Synthesis Version 3.0.11

_BET_2018_refV2.dat
_BET_2018_split.ctl

#control.ss_new
1 # 0=use init values in control file; 1=use ss3.par
1 # run display detail (0,1,2)
1 # detailed age-structured reports in REPORT.SSO (0,1)
0 # write detailed checkup.sso file (0,1)
1 # write parm values to ParmTrace.sso
0 # report level in CUMREPORT.SSO (0,1,2)
0 # Include prior_like for non-estimated parameters (0,1)
1 # Use Soft Boundaries to aid convergence
1 # Number of bootstrap datafiles to produce
6 # Turn off estimation for parameters entering after this phase
10 # MCMC burn interval
2 # MCMC thin interval
0.00 # jitter initial parm value by this fraction
-1 # min yr for sdreport outputs (-1 for styr)
-1 # max yr for sdreport outputs (-1 for endyr; -2 for endyr+Nforecastyrs
0 # N individual STD years
0.0001 # final convergence criteria
0 # retrospective year relative to end year
1 # min age for calc of summary biomass
1 # Depletion basis:  denom is: 0=skip; 1=rel X*B0; 2=rel X*Bmsy; 3=rel X*B_styr
0.25 # Fraction (X) for Depletion denominator
4 # (1-SPR)_reporting:  0=skip; 1=rel(1-SPR); 2=rel(1-SPR_MSY); 3=rel(1-SPR_Btarget); 4=notrel
4 # F_std reporting: 0=skip; 1=exploit(Bio); 2=exploit(Num); 3=sum(frates); 4=population F for range of ages, note that YFT used exploitation in biomass
1 7
2 # F_report_basis: 0=raw; 1=rel Fspr; 2=rel Fmsy ; 3=rel Fbtgt
999
