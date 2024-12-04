.SUBCKT LAT2 C B E S G
* TERMINALS: C=collector B=base E=emitter S=substrate G=gate
QL C B E C LAT
QV S B E S VERT
* ----------------------------------------------------------------------
.MODEL LAT PNP MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : LATSUB
* process   : C35[A-B][3-4][A-C][1-3], H35[A-B]
* revision  : 4.0; 
* extracted : H35_LAT2 B20560 W7D00 2-Jun-5; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-182 REV_4.0
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
*
+IS     ={{EXP(GUMMELPAR)/(1+1e6*DELL)*1.319e-16}}
+IRB    =0.000e+00  
+IKF    ={2.161e-06*EXP(-GUMMELPAR)/(1+1e6*DELL)}  
+BF     ={EXP(GUMMELPAR-RECOMBPAR)*2.367e+03}
+NF     =1.034e+00  
+ISE     ={EXP(RECOMBPAR)*5.739e-15}}
+NE     =2.814e+00  
+VAF    ={(1+1e6*DELL)*EXP(-GUMMELPAR)*2.149e+01}  
+IKR    =1.109e-06  
+BR     ={EXP(GUMMELPAR-RECOMBPAR)*2.224e+01}  
+NR     =1.011e+00  
+ISC    ={EXP(RECOMBPAR)*4.999e-15}  
+NC     =2.448e+00  
+VAR    =1.849e+00  
+RBM    ={RATIORWELL*1.181e+01}  
+
+RB     ={RATIORWELL*1.281e+01}  
+
+RE     =1.0000e+00 LOT/UNIFORM=3.7500e-01  
+AF     =2.000e+00  
+RC     =7.8105e+01 KF     =1.000e-12  
+TF     ={(1+1e6*DELL)*(1+1e6*DELL)*2.000e-10}  
+XTF    =0.000e+00  
+ITF    =0.000e+00  
+VTF    =1.000e+03  
+PTF    =0.000e+00  
+TR     =2.000e-10  
+XCJC   =0.000e+00  
+EG     =8.475e-01  
+XTI    =1.000e+01  
+XTB    =-5.458e-02  
+FC     =7.500e-01  
+CJE    =8.0000e-15 LOT/UNIFORM=1.6000e-15  
+VJE    =1.020e+00  
+MJE    =5.184e-01  
+CJC    =4.3570e-14 LOT/UNIFORM=8.7100e-15  
+VJC    =1.020e+00  
+MJC    =5.210e-01  
+CJS    ={0.000e+00*RATIOCJS}  
+VJS    =8.000e-01  
+MJS    =3.700e-01  
* ----------------------------------------------------------------------
.MODEL VERT PNP MODTYPE=ELDO
+IS     ={EXP(GUMMELPAR)*3.594e-18} 
+BF     ={EXP(GUMMELPAR-RECOMBPAR)*1.668e+01} 
+NF     =1.028e+00 
+VAF    =1.000e+03 
+IKF    =1.433e-04 
+ISE    ={EXP(RECOMBPAR)*6.346e-15} 
+NE     =2.820e+00 
+BR     =1.191e+01 
+NR     =9.294e-01 
+VAR    =5.427e+00 
+IKR    =2.384e-04 
+ISC    =2.490e-17 
+NC     =1.288e+00 
+IRB    =0.000e+00 
+RB     =4.434e+03 
+RBM    =5.170e+00 
+RE     =1.000e+00 
+RC     =1.006e+02 
+TR     =6.480e-10 
+PTF    =0.000e+00 
+TF     =6.480e-10 
+XTF    =0.000e+00 
+ITF    =0.000e+00 
+VTF    =1.000e+03 
+XTI    =1.044e-01 
+XTB    =1.509e+00 
+KF     =1.000e-12 
+AF     =2.000e+00 
+CJE    =8.000e-15 
+VJE    =1.020e+00 
+MJE    =5.184e-01 
+EG     =1.211e+00 
+CJC    =2.840e-14 
+VJC    =5.300e-01 
+MJC    =3.038e-01 
+XCJC   =0.000e+00 
.ENDS LAT2
.MODEL VERT10 PNP MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : BJT
* process   : C35[A-B][3-4][A-C][1-3]
* revision  : 4.0; 
* extracted : C35[A-B][3-4][A-C][1-3] B11264.L2; 2002-11, B20560 H35W7 D00 02-June-05 (200C tempcos); hhl (5481)
* doc#      : ENG-182 REV_4.0
* ----------------------------------------------------------------------
*                      MONTE CARLO SIMULATION 
* ----------------------------------------------------------------------
*
+IS     ={{EXP(GUMMELPAR)*2.3330e-17}+{(MIS_VERT10*0.54e-08*100.0e-12)}}
+IRB    =4.3770e-06  
+IKF    ={1.3760e-03*EXP(-GUMMELPAR)}  
+BF     ={EXP(GUMMELPAR-RECOMBPAR)*5.9810e+00+{(MBF_VERT10*0.5)}}
+NF     =9.9250e-01  
+ISE     ={EXP(RECOMBPAR)*6.5290e-16+{(MISE_VERT10*0.18e-07*100.0e-12)}}
+NE     =1.7760e+00  
+VAF    ={EXP(-GUMMELPAR)/RATIOCJS*1.9420e+02}  
+IKR    =1.9410e-04  
+BR     ={EXP(GUMMELPAR-RECOMBPAR)*9.8740e-02}  
+NR     =9.9470e-01  
+ISC    ={EXP(RECOMBPAR)*2.8430e-14}  
+NC     =1.1490e+00  
+VAR    =1.0320e+01  
+RBM    ={RATIORWELL*1.0000e+00}  
+
+RB     ={RATIORWELL*2.1380e+02}  
+
+RE     =9.7360e+00 LOT/UNIFORM=3.6510e+00  
+
+RC     =4.5400e+01 
+TF     =8.1000e-10 LOT/UNIFORM=4.8600e-10  
+
+
+
+
+
+
+EG     =1.2050e+00  
+XTI    =1.4490e+00  
+XTB    =1.0820e+00  
+
+CJE    =1.4880e-13 LOT/UNIFORM=2.9760e-14  
+VJE    =1.0200e+00  
+MJE    =5.4882e-01  
+CJC    ={4.3387e-14*RATIOCJS}  
+VJC    =5.3000e-01  
+MJC    =3.1214e-01  
+
+
+
* ----------------------------------------------------------------------
* ----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
