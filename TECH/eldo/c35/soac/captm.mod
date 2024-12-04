
.SUBCKT CPOLY N1 N2 PARAM: AREA=0 PERI=0
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : CAPACITOR
* process   : C35[A-B][3-4][B-C][0-3]
* revision :  3.0;
* extracted : B11004.L2 2002-11; hhl(5481)
* doc#      : Eng-182
* ----------------------------------------------------------------------
*                        TYPICAL MEAN CONDITION
* ----------------------------------------------------------------------
* VARIABLES: AREA [m^2], PERI [m].
*
.PARAM CEFF={0.860e-03*AREA+0.086e-09*PERI}
C1 N1 N2 CPOLYCAPMOD {0.860e-03*AREA+0.086e-09*PERI} TC1=3.00e-5 
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoa d c1 v(n1x,psubx)=(-20,20)  v(n2x,psubx)=(-20,20)
.setsoa d c1 v(n1x,n2x)=(-5.5,5.5)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS CPOLY
.MODEL CPOLYCAPMOD C POLY 1 85e-6  

* ----------------------------------------------------------------------

*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format  : ELDO
* model     : RF CAPACITOR CPOLYRF
* process   : C35B4
* revision  : 4.0; 
* extracted : C35 B23118.XL1 ; 2005-02; kmo
* doc#      : Eng-188 REV_5
* ----------------------------------------------------------------------
* ----------------------------------------------------------------------
*
* Syntax: parameters area peri
*                    ap1 pp1 aw1 pw1
*
* ctot = CA*W*L+CP(2(W+L)) 
* 
*
.SUBCKT CPOLYRF N1 N2 N3 PARAM: L=1E-6 W=1E-6 C=1.0E-12 AREA=1E-12 PERI=1e-6
.PARAM
+AREA_CPOLYRF=W*L
+PERI_CPOLYRF=2*(W+L)
+AP1=(W+3.6e-6)*(L+3.6e-6)
+PP1=2*(W+3.6e-6+L+3.6e-6)
+CEFF={8.207e-04*AREA_CPOLYRF+1.987e-11*PERI_CPOLYRF}
C1 N1 N1L CPOLYRFCAPMOD {8.207e-04*AREA_CPOLYRF+1.987e-11*PERI_CPOLYRF}
RS N1L N2 1.300e+00
CW N2 N2P {(1.074e-04*AP1+1.787e-10*PP1)}
RW N2P N3 3.300e+01
.ENDS CPOLYRF
.MODEL CPOLYRFCAPMOD C POLY 1 85e-6  TC1=3.00e-5

*----------------------------------------------------------------------

*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format  : ELDO
* model     : RF CAPACITOR CMIMRF
* process   : S35D4
* revision  : 1.0; 
* extracted : S35 B13143.L1 ; 2004-10; kmo
* doc#      : Eng-188 REV_5
* ----------------------------------------------------------------------
* ----------------------------------------------------------------------
*
* Syntax: parameters area peri
*                   
*
.SUBCKT CMIMRF N1 N2 N3 PARAM: L=1E-6 W=1E-6 C=1.0E-12 AREA=1E-12 PERI=1E-6
.PARAM 
+AREA_CMIMRF=W*L
+PERI_CMIMRF=2*(W+L)
CMIM N1 N12 {(1.197e-03*AREA_CMIMRF+2.127e-10*PERI_CMIMRF)}
RS N12 N2 {(1.200e+00*1.650e-11/AREA_CMIMRF)}
CMW N2 N3 {(8.444e-06*(SQRT(AREA_CMIMRF)+2e-6)**2+7.692e-11*4*(SQRT(AREA_CMIMRF)+2e-6))}
.ENDS CMIMRF


.SUBCKT CMIM N1 N2 PARAM: AREA=0 PERI=0
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : CAPACITOR
* process   : C35[A-B][3-4][B-C][0-3]
* revision :  4.0;
* extracted : Map; 2004-06; kmo(5966)
* doc#      : Eng-182
* ----------------------------------------------------------------------
*                        TYPICAL MEAN CONDITION
* ----------------------------------------------------------------------
* VARIABLES: AREA [m^2], PERI [m].
*
.PARAM CEFF={1.250e-03*AREA+2.130e-10*PERI}
C1 N1 N2 CMIMCAPMOD {1.250e-03*AREA+2.130e-10*PERI} TC1=3.304e-5 
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoa d c1 v(n1x,psubx)=(-20,20)  v(n2x,psubx)=(-20,20)
.setsoa d c1 v(n1x,n2x)=(-5.5,5.5)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS CMIM
.MODEL CMIMCAPMOD C POLY 1 -25.77e-6 12.72e-6 

* ----------------------------------------------------------------------

.SUBCKT NGATECAP N1 N2 PARAM: AREA=0 PERI=0
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : CAPACITOR
* process   : C35
* revision :  4;
* extracted : C35 MAP; ese(5487)
* doc#      : Eng-182 REV_4
* ----------------------------------------------------------------------
*                        TYPICAL MEAN CONDITION
* ----------------------------------------------------------------------
* VARIABLES: AREA [m^2], PERI [m].
*
*
C1 N1 N2 NGATECAPCAPMOD {4.540e-03*AREA+2.10e-10*PERI}  
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
vn1 n1 n1x 0
vn2 n2 n2x 0
vsub0 PSUB psubx 0 
.setsoa d c1 v(n1x,psubx)=(-3.6,3.6)  v(n2x,psubx)=(-3.6,3.6)
.setsoa d c1 v(n1x,n2x)=(-3.6,3.6)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS NGATECAP
.MODEL NGATECAPCAPMOD C 
* ----------------------------------------------------------------------

* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, ACCUSIM 
* model     : varactor
* process   : C35[A-B][3-4][B-C][0-3]
* revision  : 4.0;
* extracted : C35 B11404.L1; 2004-01; kmo
* doc#      : Eng-221 REV_3  
* ----------------------------------------------------------------------
*                        TYPICAL MEAN CONDITION
* ----------------------------------------------------------------------
.SUBCKT CVAR G B S PARAM: W=1e-6 L=1e-6 
+ROW=1 COL=1
+AREA1={((8.000e-01*ROW+(6.600e+00*ROW)+(8.000e-01*(ROW-1))+(-1.000e-01*2))*(3.000e-01*2+(0.8500e+00*2)+(6.500e-01*COL)+(1.000e+00*(COL-1)))*1e-12)}
+AREA2={2*((8.000e-01*ROW+(6.600e+00*ROW)+(8.000e-01*(ROW-1))+(-1.000e-01*2))+(3.000e-01*2+(0.8500e+00*2)+(6.500e-01*COL)+(1.000e+00*(COL-1))))*1e-6}
*
* TERMINALS: G=gate B=bulk S=P-SUB
*
* Gate inductanceand Gate resistance
LG G G0 {0.000e+00*W+(1.000e-15)}
RG G0 G1 {5.615e-04/W+(-2.749e-01)}
* Intrinsic PMOS transistor - Cap modelling
M1 D1 G1 S1 B CVARINSUB W=W L=6.5e-7 AD=0 AS=0 PD=0 PS=0 NRD=0 NRS=0
* N-buried Layer - PSUB diode
DSUB1 B1 B DWELL1 AREA=AREA1
DSUB2 B2 B DWELL2 AREA=AREA2
RSUB1 B1 S {9.581e-01/W+(1.270e+03)}
RSUB2 B2 S {6.1302e-03/W+(2.2398e+01)}
* Capacitance modelling
* drain and source disconnected 
* high impedance to ground 
ROPEN1 D1 S 1.0E+12 NONOISE
ROPEN2 S1 S 1.0E+12 NONOISE
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
.setsoa d m1 vgb=(-3.6,3.6)  vb(*)-v(PSUB)=(*,3.6)
* ---- END - SOAC-CHECKS -----------------------------------------------
.ENDS CVAR
.MODEL CVARINSUB PMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : varactor
* process   : C35[A-B][3-4][B-C][0-3]
* revision : 4.0; 
* extracted : C35 B11404.L1; 2004-01; kmo
* doc#      : Eng-221 REV_3
* ----------------------------------------------------------------------
*                        TYPICAL MEAN CONDITION
* ----------------------------------------------------------------------
*Segment Width = 6.6um, 
* Total Width = R*C*Segment Width, L=0.65um,
* R: number of columns, C: number of rows
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =1 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =3.000e+00 VERSION=3.22 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =2.3561e-01 
+K2     =1.5401e-02 K3     =0.000e+00 K3B    =0.000e+00 
+NPEAK  =4.564e+16 VTH0=-1.139e+00
+VOFF   =0.000e+00 DVT0   =0.000e+00 DVT1   =0.000e+00 
+DVT2   =0.000e+00 KETA   =0.000e+00 
+PSCBE1 =0.000e+00 PSCBE2 =1.000e-08 
+DVT0W  =0.000e+00 DVT1W  =0.000e+00 DVT2W  =0.000e+00 
*        *** Mobility related model parameters ***
+UA     =0.000e+00 UB     =8.29e-19 UC     =0.000e+00 
+U0=1.296e+02
*        *** Subthreshold related parameters ***
+DSUB   =0.000e+00 ETA0   =0.000e+00 ETAB   =0.000e+00 
+NFACTOR=0.000e+00 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =2.979e+00 
+PDIBLC1=3.31e-02 PDIBLC2=1.000e-09 DROUT  =0.000e+00 
+A0     =1.4230e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =2.000e+05 AGS    =0.000e+00 
+B0     =0.000e+00 B1     =0.000e+00 DELTA  =0.000e+00 
+PDIBLCB=0.000e+00 
*        *** Geometry modulation related parameters ***
+W0     =0.000e+00 DLC    =0.000e+00 
+DWC    =0.000e+00 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =0.000e+00 WWL    =0.000e+00 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =0.000e+00 UTE    =0.000e+00 
+KT1    =9.000e-02 KT2    =0.000e+00 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.000e-10 CGSO   =1.000e-10 CGBO   =0.000e+00 
+CGDL   =0.000e+00 CGSL   =0.000e+00 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =0.000e+00 CLE    =0.000e+00 
+NOFF   =4.732e+00 VOFFCV =-8.674e-01 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =0.000e+00 
+CDSC   =0.000e+00 CDSCB  =0.000e+00 CDSCD  =0.000e+00 
+PRWB   =0.000e+00 PRWG   =0.000e+00 CIT    =0.000e+00 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.587e-09 NGATE  =0.000e+00 
+NLX    =0.000e+00 
+XL     =0.000e+00 XW     =0.000e+00 
*        *** Substrate current related model parameters ***
+ALPHA0 =0.000e+00 ALPHA1 =0.000e+00 BETA0  =0.000e+00 
*        *** Noise effect related model parameters ***
+AF     =1.290e+00 KF     =1.090e-27 EF     =1.000e+00 
+NOIA   =1.000e+20 NOIB   =-1.400e-12 NOIC   =1.000e+15 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =1.560e+02 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =0.000e+00 
+WD     =0.000e+00 
+LDIF   =0.000e+00 HDIF   =0.000e+00 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =0.000e+00 JSW    =0.000e+00 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =0.000e+00 CJSW   =0.000e+00 FC     =0.000e+00 
+MJ     =0.000e+00 MJSW   =0.000e+00 TT     =0.000e+00 
+PB     =1.020e+00 PBSW   =1.020e+00 ACDE   =2.393e+00 
* ----------------------------------------------------------------------
* SOAC - CHECKS as defined in "SOAC.M4" (operating conditions)
.MODEL DWELL1 D LEVEL=1
+ IS   =3.0e-05   ISW  =0.0e+00 N    =1.0000000   
+ CJO  =5.512e-05   MJSW =0.000e+00   M    =4.692e-01   
+ FC   =0.000e+00   TT   =0.000e+00   VJ   =5.300e-01   
+ AF   =1.000e+00   KF   =0.000e+00   EG   =1.11e+00   XTI  =3.000e+00   
.MODEL DWELL2 D LEVEL=1
+ IS   =3.0e-10   ISW  =0.0e+00 N    =1.0000000   
+ CJO  =7.385e-10   MJSW =0.000e+00   M    =2.882e-01   
+ FC   =0.000e+00   TT   =0.000e+00   VJ   =5.300e-01   
+ AF   =1.000e+00   KF   =0.000e+00   EG   =1.11e+00   XTI  =3.000e+00   
* ----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
