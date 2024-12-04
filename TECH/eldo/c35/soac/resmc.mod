.MODEL RDIFFN RES TC1=1.500e-03   MODTYPE=ELDO 
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : RESISTOR
* process   : C35
* revision  : 4.0; 
* extracted : C35 ; 2004-05; ese(5487)
* doc#      : ENG-182 REV_4.0
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* NOTE: The voltage dependance is negligible.
* VARIABLES: W,L = device width and length [m]
*
.SUBCKT RDIFFN N1 N2 PARAM: W=1 L=1
.PARAM RSH    =7.500e+01  
+ WD     =-1.000e-07  
+ LD     =0  
R1 N1 N2 RDIFFN {(DELRDIFFN+RSH)*(L-LD)/(W-WD-(-DELW))}
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoac d r1 v(n1x,psubx)=(-5.5,5.5)  v(n2x,psubx)=(-5.5,5.5) 
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RDIFFN
* ----------------------------------------------------------------------
.SUBCKT RDIFFN3 D B S PARAM: W=1 L=1
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : JFET
* process   : C35
* revision  : 4.0; 
* extracted : C35 ; 2004-05; ese(5487)
* doc#      : ENG-182 REV_4.0
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* NOTE: The voltage dependance is negligible.
* VARIABLES: W,L = device width and length [m]
*
.PARAM RSH=7.500e+01  
+ WD=-1.000e-07 
+ LD=0 
.MODEL RDIFFN3INSUB NJF LEVEL=1  MODTYPE=ELDO
+ BETA  ={7.500e+01/(RSH+DELRDIFFN)*6.667e-06*(W-WD-(-DELW))/(L-LD)/(1+(1.500e-03)*(TEMPER-2.700e+01))}
+ VTO   ={-1.000e+03+(0.000e+00/(W-WD))}
+ LAMBDA=0.000e+00 
+ IS    ={2.550e-07*W*L+0.600e-12*(W+L)}    PB   =6.900e-01
+ XTI    =2.026e+00 
+ CGS   ={4.7000e-04*W*L+2.5000e-10*(W+L)}    RS   =0.000e+00
+ CGD   ={4.7000e-04*W*L+2.5000e-10*(W+L)}    RD   =0.000e+00
J1 D B S RDIFFN3INSUB
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vdx d dx 0
vsx s sx 0
vbx b bx 0
.setsoa d j1 v(sx,bx)=(-5.5,5.5) 
.setsoa d j1 v(dx,bx)=(-5.5,5.5)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RDIFFN3
* ----------------------------------------------------------------------
.MODEL RDIFFP RES TC1=1.500e-03   MODTYPE=ELDO 
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : RESISTOR
* process   : C35
* revision  : 4.0; 
* extracted : C35 ; 2004-05; ese(5487)
* doc#      : ENG-182 REV_4.0
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* NOTE: The voltage dependance is negligible.
* VARIABLES: W,L = device width and length [m]
*
.SUBCKT RDIFFP N1 N2 PARAM: W=1 L=1
.PARAM RSH    =1.400e+02  
+ WD     =-1.000e-07  
+ LD     =0  
R1 N1 N2 RDIFFP {(DELRDIFFP+RSH)*(L-LD)/(W-WD-(-DELW))}
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoac d r1 v(n1x,psubx)=(-5.5,5.5)  v(n2x,psubx)=(-5.5,5.5) 
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RDIFFP
* ----------------------------------------------------------------------
.SUBCKT RDIFFP3 D B S PARAM: W=1 L=1
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : JFET
* process   : C35
* revision  : 4.0; 
* extracted : C35 ; 2004-05; ese(5487)
* doc#      : ENG-182 REV_4.0
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* NOTE: The voltage dependance is negligible.
* VARIABLES: W,L = device width and length [m]
*
.PARAM RSH=1.400e+02  
+ WD=-1.000e-07 
+ LD=0 
.MODEL RDIFFP3INSUB PJF LEVEL=1  MODTYPE=ELDO
+ BETA  ={1.400e+02/(RSH+DELRDIFFP)*3.571e-06*(W-WD-(-DELW))/(L-LD)/(1+(1.500e-03)*(TEMPER-2.700e+01))}
+ VTO   ={-1.000e+03+(0.000e+00/(W-WD))}
+ LAMBDA=0.000e+00 
+ IS    ={1.400e-07*W*L+1.850e-13*(W+L)}    PB   =1.020e+00
+ XTI    =1.970e+00 
+ CGS   ={6.8000e-04*W*L+3.2000e-10*(W+L)}    RS   =0.000e+00
+ CGD   ={6.8000e-04*W*L+3.2000e-10*(W+L)}    RD   =0.000e+00
J1 D B S RDIFFP3INSUB
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vdx d dx 0
vsx s sx 0
vbx b bx 0
.setsoa d j1 v(sx,bx)=(-5.5,5.5) 
.setsoa d j1 v(dx,bx)=(-5.5,5.5)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RDIFFP3
* ----------------------------------------------------------------------

.SUBCKT RNWELL D B S PARAM: W=1 L=1
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : JFET
* process   : C35[A-B][3-4][A-C][1-3]
* revision  : 4.0; 
* extracted : C35[A-B][3-4][A-C][1-3] B11004.L2; 2002-11; ese (5487)
* doc#      : ENG-182
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* VARIABLES: W,L = device width and length [m]
*
.PARAM RSH=1.0000e+03  
+ WD=0.0000e+00 LOT/UNIFORM=2.0000e-07
+ LD=0.0000e+00 
.MODEL RNWELLINSUB NJF LEVEL=1  MODTYPE=ELDO
+ BETA  ={1.0000e+03/(RSH+(RATIORWELL-1)*1.0000e+03)*7.7045e-06*(W-WD-0)/(L-LD)/(1+(6.2000e-03)*(TEMPER-2.7000e+01))}
+ VTO   ={-6.7638e+01+(9.1799e-05/(W-WD))}
+ LAMBDA=0.000e+00 
+ IS    ={1.4000e-06*W*L+7.5905e-12*(W+L)}    PB   =5.3000e-01
+ XTI    =1.465e+00 
+ CGS   ={4.0000e-05*W*L+5.1000e-10*(W+L)}    RS   =2.0000e+01
+ CGD   ={4.0000e-05*W*L+5.1000e-10*(W+L)}    RD   =2.0000e+01
J1 D B S RNWELLINSUB
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vdx d dx 0
vsx s sx 0
vbx b bx 0
.setsoa d j1 v(sx,bx)=(-13.0,13.0) 
.setsoa d j1 v(dx,bx)=(-13.0,13.0)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RNWELL
* ----------------------------------------------------------------------

.SUBCKT NWD A C PARAM: AREA=1e-12 PERI=4e-6
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : DIODE
* process   : C35[A-B][3-4][A-C][1-3]
* revision : 4.0; 
* extracted : C35[A-B][3-4][A-C][1-3] B11004.L2; 2002-11; ese (5487)
* doc#      : ENG-182
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* TERMINALS: A=anode=P-region C=cathode=N-region
* VARIABLES: M (mulitiplier), AREA [m^2], PERI [m].
* NOTE: The role of a protection DIODE is to conduct ESD current to VDD 
* (or from VSS). This forward bias is NOT modelled, only leakage current 
* and capacitance during normal operation. Any inductive load etc that 
* will give forward bias, must be limited by other components to within 
* Operating Conditions, otherwise parasitic bipolar action can occur.
*
D1 A C NWDINSUB AREA=AREA PERI=PERI
.ENDS NWD
*
.MODEL NWDINSUB D LEVEL=1 MODTYPE=ELDO
+IS     =2.8000e-06  
+ISW    =7.5905e-12  
+N      =1.000e+00  
+CJ     =8.0000e-05 LOT/UNIFORM=2.0000e-05  
+M      =3.9000e-01  VJ     =5.3000e-01  TT     =0.000e+00  
+CJSW   =5.1000e-10 LOT/UNIFORM=1.0200e-10  
+MJSW   =2.7000e-01  FC     =0.500e+00  
+EG     =1.110e+00  XTI    =1.465e+00  AF     =1.000e+00 KF     =0.000e+00
* ----------------------------------------------------------------------
.MODEL RPOLY1 RES TC1=9.00e-04  DEV/GAUSS={8.4e-08/SQRT(e(*,L)*e(*,W))} MODTYPE=ELDO 
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : RESISTOR
* process   : C35[D][3-4][C-M][1-5]
* revision  : 4.0; 
* extracted : doc; asi(5617)
* doc#      : Eng-182 Rev. 4
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* VARIABLES: W,L = device width and length [m]
*
.SUBCKT RPOLY1 N1 N2 PARAM: W=1 L=1
.PARAM RSH    =8.0e+00  
+ WD     =0.00  
+ LD     =0  
R1 N1 N2 RPOLY1 {(DELRPOLYN+RSH)*(L-LD)/(W-WD-(-DELL))}
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoac d r1 v(n1x,psubx)=(-20.0,20.0)  v(n2x,psubx)=(-20.0,20.0) 
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RPOLY1
* ----------------------------------------------------------------------
.MODEL RPOLY2 RES  DEV/GAUSS={8.4e-08/SQRT(e(*,L)*e(*,W))} MODTYPE=ELDO
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : SPECTRE (SPECTRE DIRECT)
* model     : RESISTOR 
* process   : C35[B3C0][B3C1-3][B4C0-3]
* revision  : 4.0; 
* extracted : C35 SLM; 2005-11; wpf (4518)
* doc#      : Eng-182
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* VARIABLES: W,L = device width and length [m]
*
.SUBCKT RPOLY2 N1 N2 PARAM: W=1 L=1
.PARAM
+RSH    =5.219e+01  
+WD     =1.500e-07  
+LD     =0  
R1 N1 N2 RPOLY2 VALUE={((DELRPOLY2+RSH)*(L-LD)/(W-WD-(DELWDPOLY2)))*(1+1.316e-01*(5.85e-04)*(W*1e+6)*V(N1,N2)**2)}
+TC1={5.85e-04/sqrt(1+(1.141e+00)/(W*1e+6)**(2.000e+00))} TC2=7.70e-07
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoac d r1 v(n1x,psubx)=(-20.,20.)  v(n2x,psubx)=(-20.,20.) 
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RPOLY2
* ----------------------------------------------------------------------

.MODEL RPOLYH RES  DEV/GAUSS={4.9e-08/SQRT(e(*,L)*e(*,W))} MODTYPE=ELDO
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : SPECTRE (SPECTRE DIRECT)
* model     : RESISTOR 
* process   : C35[A-B][3-4][A-C][2-3]
* revision  : 4.0; 
* extracted : C35 SLM; 2005-11; wpf (4518)
* doc#      : ENG-182
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* VARIABLES: W,L = device width and length [m]
*
.SUBCKT RPOLYH N1 N2 PARAM: W=1 L=1
.PARAM
+RSH    =1.226e+03  
+WD     =1.948e-07  
+LD     =0  
R1 N1 N2 RPOLYH VALUE={((DELRPOLYH+RSH)*(L-LD)/(W-WD-(DELWDPOLY2)))*(1+2.019e-03*(-7.468e-04)*(W*1e+6)*V(N1,N2)**2)}
+TC1={-7.468e-04/sqrt(1+(0.000e+00)/(W*1e+6)**(0.000e+00))} TC2=3.821e-06
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoac d r1 v(n1x,psubx)=(-20.,20.)  v(n2x,psubx)=(-20.,20.) 
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RPOLYH
* ----------------------------------------------------------------------

*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    :  ELDO, AccusimII, Continuum
* model     : RF RESISTOR RPOLY2RF
* process   : C35B4
* revision  : 4.1; 
* extracted : C35 B23118.XL1 ; 2005-03; kmo
* doc#      : Eng-188 REV_5
* ----------------------------------------------------------------------
*                        MONTE-CARLO SIMULATION 
*  
* ----------------------------------------------------------------------
*
* SYNTAX: PARAMETERS W L BENDS
*              
.SUBCKT RPOLY2RF N1 N2 N3 PARAM: W=1.0E-6 L=1.0E-6 BENDS=0
.PARAM CP=(1.666e-05*W+1.666e-11)*L+0.000e+00*W+0.000e+00
+AP=W*(L+1.300e-06)
+PP=2*(W+L+1.300e-06)
+RSH    =5.0000e+01 LOT/UNIFORM=-1.000e+01  
+WD     =1.5000e-07 LOT/UNIFORM=3.0000e-08  
R1 N1 N1L RPOLY2RFRESMOD VALUE={((0+RSH)*L/(W-WD-0))/2*(1+1.316e-01*(5.85e-04)*W*1e+6*V(N1,N2)**2)}
+TC1={5.85e-04/sqrt(1+1.141e+00/(W*1e+6)**2.00e+00)}
R2 N1L N2 RPOLY2RFRESMOD VALUE={((0+RSH)*L/(W-WD-0))/2*(1+1.316e-01*(5.85e-04)*W*1e+6*V(N1,N2)**2)}
+TC1={5.85e-04/sqrt(1+1.141e+00/(W*1e+6)**2.00e+00)}
CP1 N1 N1L {CP}
CP2 N1L N2 {CP}
CW N1L N3 {AP*1.0600e-04+PP*5.0500e-11}
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
VN1 N1 N1X 0
VN2 N2 N2X 0
VSUB0 N3 PSUBX 0
.SETSOA D C1 V(N1X,PSUBX)=(-20.,20.)  V(N2X,PSUBX)=(-20.,20.)
.SETSOA D C1 V(N1X,N2X)=(-5.5,5.5)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RPOLY2RF
.MODEL RPOLY2RFRESMOD RES TC2=7.70e-07 DEV/GAUSS={8.4e-08/SQRT(e(*,L)*e(*,W))} MODTYPE=ELDO
*----------------------------------------------------------------------

*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    :  ELDO, AccusimII, Continuum
* model     : RF RESISTOR RPOLYHRF
* process   : C35B4
* revision  : 1.1; 
* extracted : C35 B23118.XL1 ; 2005-03; kmo
* doc#      : Eng-188 REV_5
* ----------------------------------------------------------------------
*                        MONTE-CARLO SIMULATION 
*  
* ----------------------------------------------------------------------
*
* SYNTAX: PARAMETERS W L BENDS
*              
.SUBCKT RPOLYHRF N1 N2 N3 PARAM: W=1.0E-6 L=1.0E-6 BENDS=0
.PARAM CP=(1.652e-05*W+8.837e-12)*L+1.750e-10*W+1.034e-15
+AP=W*(L+2.500e-06)
+PP=2*(W+L+2.500e-06)
+RSH    =1.2000e+03 LOT/UNIFORM=-2.000e+02  
+WD     =1.9480e-07 LOT/UNIFORM=3.9000e-08  
R1 N1 N1L RPOLYHRFRESMOD VALUE={((0+RSH)*L/(W-WD-0))/2*(1+2.019e-03*(-7.468e-04)*W*1e+6*V(N1,N2)**2)}
+TC1={-7.468e-04/sqrt(1+0.000e+00/(W*1e+6)**0.000e+00)}
R2 N1L N2 RPOLYHRFRESMOD VALUE={((0+RSH)*L/(W-WD-0))/2*(1+2.019e-03*(-7.468e-04)*W*1e+6*V(N1,N2)**2)}
+TC1={-7.468e-04/sqrt(1+0.000e+00/(W*1e+6)**0.000e+00)}
CP1 N1 N1L {CP}
CP2 N1L N2 {CP}
CW N1L N3 {AP*1.0600e-04+PP*5.0500e-11}
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
VN1 N1 N1X 0
VN2 N2 N2X 0
VSUB0 N3 PSUBX 0
.SETSOA D C1 V(N1X,PSUBX)=(-20.,20.)  V(N2X,PSUBX)=(-20.,20.)
.SETSOA D C1 V(N1X,N2X)=(-5.5,5.5)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS RPOLYHRF
.MODEL RPOLYHRFRESMOD RES TC2=3.821e-06 DEV/GAUSS={4.9e-08/SQRT(e(*,L)*e(*,W))} MODTYPE=ELDO
*----------------------------------------------------------------------
.SUBCKT ZD2SM24 A C S PARAM: PROG=0
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : ZENER
* process   : C35[A-B][3-4][A-C][1-3]
* revision :  3.0; 
* extracted : C35[A-B][3-4][A-C][1-3] B11004.L2; 2002-11; wpf (4518)
* doc#      : ENG-182
* ----------------------------------------------------------------------
*                      MONTE-CARLO SIMULATION 
* ----------------------------------------------------------------------
* TERMINALS: A=anode=p+diff, C=cathode=n-diff and n-well, S=p-substrate.
* VARIABLES: M (mulitiplier), PROG (0=zapped, 1=non-zapped).
* NOTE: The Zener diode model is only valid for the predefined layout. 
* Forward bias causes parasitic substrate current and is NOT modelled.
*
.PARAM RZ     =4.0500e+01 LOT/UNIFORM=3.4500e+01  
+ RS     ={3.99800e+01+DELRDIFFN+DELRDIFFP}  
+ BV     ={4.9840e+00*(1-NORMZENER)+2.0000e+00*NORMZENER}  
RZAP A C {RZ + PROG * 1.000e+12}
RCOM C CI RS
VBVT CI B {BV + (-2.40000e-03) * (TEMPER-27)}
DFOR A CI ZD2SM24F 1
DREV CX A ZD2SM24R 1
DREV2 CI CX ZD2SM24R2 1
DBVT B A ZD2SM24B 1
XSUB S CI NWD AREA=8.70000e-11 PERI=3.24000e-05
.ENDS ZD2SM24
*
.MODEL ZD2SM24F D LEVEL=1 MODTYPE=ELDO
+IS     =2.0000e-13 LOT/UNIFORM=1.6000e-13  N      =1.10100e+00  
+EG     =1.12000e+00  XTI    =2.20200e-01  TT     =8.00000e-08  
+M      =5.19705e-01  VJ     =1.02000e+00  FC     =5.00000e-01  
*
.MODEL ZD2SM24R D LEVEL=1 MODTYPE=ELDO
+IS     ={9.30800e-12*EXP(NORMZENER*(9.078710295512153))}  
+N      =6.89200e+00  
+EG     =0.00000e+00  XTI    =1.50000e+02  
*
.MODEL ZD2SM24R2 D LEVEL=1  MODTYPE=ELDO
+IS     ={2.36600e-07*EXP(NORMZENER*3.367295829986474)}  
+N      =1.63600e+01  
+EG     =1.11000e+00  XTI    =3.00000e+00  
*
.MODEL ZD2SM24B D LEVEL=1 MODTYPE=ELDO
+IS     =4.61100e-10  N      =2.75100e+00  
+EG     =1.11000e+00  XTI    =0.00000e+00  
* ----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
