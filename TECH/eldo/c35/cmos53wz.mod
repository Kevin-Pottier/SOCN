.MODEL MODN NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4.0; 
* extracted : B10866 ; 2002-12; ese(5487)
* doc#      : ENG-182 REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.240e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =6.1933e-01 
+K2     =1.9997e-02 K3     =-1.136e+00 K3B    =-4.399e-01 
+NPEAK  =3.094e+17 VTH0=5.579e-01
+VOFF   =-8.925e-02 DVT0   =5.000e+01 DVT1   =1.039e+00 
+DVT2   =-8.375e-03 KETA   =2.032e-02 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =1.089e-01 DVT1W  =6.671e+04 DVT2W  =-1.352e-02 
*        *** Mobility related model parameters ***
+UA     =4.705e-12 UB     =2.137e-18 UC     =1.000e-20 
+U0=4.671e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =1.415e-02 ETAB   =-1.221e-01 
+NFACTOR=4.136e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =6.948e-01 
+PDIBLC1=3.571e-01 PDIBLC2=2.065e-03 DROUT  =5.000e-01 
+A0     =2.541e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =1.338e+05 AGS    =2.408e-01 
+B0     =4.301e-09 B1     =0.000e+00 DELTA  =1.442e-02 
+PDIBLCB=3.222e-01 
*        *** Geometry modulation related parameters ***
+W0     =2.673e-07 DLC    =3.0000e-08 
+DWC    =9.403e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =-1.297e-14 WWL    =-9.411e-21 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.800e+00 
+KT1    =-3.302e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.200e-10 CGSO   =1.200e-10 CGBO   =1.1000e-10 
+CGDL   =1.4167e-10 CGSL   =1.4167e-10 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =3.449e+02 
+CDSC   =0.000e+00 CDSCB  =1.500e-03 CDSCD  =1.000e-03 
+PRWB   =-2.416e-01 PRWG   =0.000e+00 CIT    =4.441e-04 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.6000e-09 NGATE  =0.000e+00 
+NLX    =1.888e-07 
+XL     =5.000e-08 XW     =-2.500e-08 
*        *** Substrate current related model parameters ***
+ALPHA0 =2.600e-06 ALPHA1 =5.000e+00 BETA0  =2.100e+01 
*        *** Noise effect related model parameters ***
+AF     =1.507e+00 KF     =2.170e-26 EF     =1.000e+00 
+NOIA   =1.121e+19 NOIB   =5.336e+04 NOIC   =-5.892e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =8.500e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =-5.005e-08 
+WD     =9.403e-08 
+LDIF   =0.000e+00 HDIF   =8.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.052e-03 CJSW   =2.800e-10 FC     =0.000e+00 
+MJ     =3.400e-01 MJSW   =2.300e-01 TT     =0.000e+00 
+XTI    =2.026e+00 PB     =6.900e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------
.MODEL MODNL NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4; 
* extracted : B24622 ; 2005-03; ese(5487)
* doc#      : REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.24e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =5.6811e-01 
+K2     =2.2555e-02 K3     =1.082e+01 K3B    =3.852e+00 
+NPEAK  =2.740e+17 VTH0=4.711e-01
+VOFF   =-5.242e-02 DVT0   =2.116e+01 DVT1   =8.429e-01 
+DVT2   =9.660e-03 KETA   =5.357e-03 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =-5.000e+00 DVT1W  =1.697e+06 DVT2W  =-1.556e-02 
*        *** Mobility related model parameters ***
+UA     =1.000e-12 UB     =1.038e-18 UC     =-3.984e-11 
+U0=3.719e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =5.158e-02 ETAB   =-6.600e-02 
+NFACTOR=2.678e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =7.657e-01 
+PDIBLC1=1.132e-01 PDIBLC2=1.966e-03 DROUT  =5.000e-01 
+A0     =2.579e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =1.177e+05 AGS    =2.333e-01 
+B0     =-1.488e-07 B1     =0.000e+00 DELTA  =2.350e-03 
+PDIBLCB=3.215e-01 
*        *** Geometry modulation related parameters ***
+W0     =2.767e-06 DLC    =3.000e-08 
+DWC    =7.212e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =-1.297e-14 WWL    =-9.411e-21 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.700e+00 
+KT1    =-3.100e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.200e-11 CGSO   =1.200e-11 CGBO   =1.1000e-10 
+CGDL   =3.8333e-10 CGSL   =3.8333e-10 CKAPPA =1.701e-00 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =6.797e+02 
+CDSC   =0.000e+00 CDSCB  =1.500e-09 CDSCD  =0.000e+00 
+PRWB   =-1.003e-03 PRWG   =0.000e+00 CIT    =8.026e-04 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.6000e-09 NGATE  =0.000e+00 
+NLX    =2.690e-07 
+XL     =5.000e-08 XW     =1.0000e-08 
*        *** Substrate current related model parameters ***
+ALPHA0 =1.904e-06 ALPHA1 =2.500e+00 BETA0  =2.000e+01 
*        *** Noise effect related model parameters ***
+AF     =1.507e+00 KF     =2.170e-26 EF     =1.000e+00 
+NOIA   =1.121e+19 NOIB   =5.336e+04 NOIC   =-5.892e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =8.500e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =-1.104e-08 
+WD     =7.212e-08 
+LDIF   =0.000e+00 HDIF   =8.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =9.960e-04 CJSW   =3.000e-10 FC     =0.000e+00 
+MJ     =3.400e-01 MJSW   =2.300e-01 TT     =0.000e+00 
+XTI    =2.030e+00 PB     =6.900e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------
.SUBCKT ND A C PARAM: AREA=1e-12 PERI=4e-6
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : DIODE
* process   : C35
* revision : 4.0; 
* extracted : B10866 ; 2002-12; ese(5487)
* doc#      : ENG-182 REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
* TERMINALS: A=anode=P-region C=cathode=N-region
* VARIABLES: M (mulitiplier), AREA [m^2], PERI [m].
* NOTE: The role of a protection DIODE is to conduct ESD current to VDD 
* (or from VSS). This forward bias is NOT modelled, only leakage current 
* and capacitance during normal operation. Any inductive load etc that 
* will give forward bias, must be limited by other components to within 
* Operating Conditions, otherwise parasitic bipolar action can occur.
*
D1 A C NDINSUB AREA=AREA PERI=PERI
.ENDS ND
*
.MODEL NDINSUB D LEVEL=1 MODTYPE=ELDO
+IS     =5.100e-07 ISW    =0.600e-12 N      =1.000e+00 
+CJ     =1.052e-03 M      =3.400e-01 VJ     =6.900e-01 TT     =0.000e+00 
+CJSW   =2.800e-10 MJSW   =2.300e-01 FC     =0.500e+00 
+EG     =1.110e+00 XTI    =2.026e+00 AF     =1.000e+00 KF     =0.000e+00
* ----------------------------------------------------------------------
.MODEL MODNM NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4.0; 
* extracted : B11004 ; 2002-12; ese(5487)
* doc#      : ENG-182 REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.24e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =8.1646e-01 
+K2     =1.0194e-01 K3     =-3.776e+00 K3B    =-7.691e-02 
+NPEAK  =2.459e+17 VTH0=8.295e-01
+VOFF   =-8.295e-02 DVT0   =3.000e+01 DVT1   =1.528e+00 
+DVT2   =2.529e-02 KETA   =3.585e-02 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =-5.000e+00 DVT1W  =2.578e+06 DVT2W  =5.105e-02 
*        *** Mobility related model parameters ***
+UA     =4.708e-10 UB     =1.470e-18 UC     =-4.342e-11 
+U0=5.021e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =3.795e-02 ETAB   =-7.653e-04 
+NFACTOR=8.573e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =2.125e-01 
+PDIBLC1=1.000e-04 PDIBLC2=5.458e-04 DROUT  =5.000e-01 
+A0     =2.064e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =1.078e+05 AGS    =1.079e-01 
+B0     =-1.493e-07 B1     =0.000e+00 DELTA  =1.000e-02 
+PDIBLCB=5.186e-01 
*        *** Geometry modulation related parameters ***
+W0     =1.617e-07 DLC    =1.0000e-07 
+DWC    =1.623e-07 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =-5.117e-14 WWL    =-5.704e-21 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.760e+00 
+KT1    =-4.502e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.080e-10 CGSO   =1.080e-10 CGBO   =1.1000e-10 
+CGDL   =2.4500e-10 CGSL   =2.4500e-10 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =1.390e+03 
+CDSC   =0.000e+00 CDSCB  =-1.500e-03 CDSCD  =0.000e+00 
+PRWB   =-6.740e-02 PRWG   =0.000e+00 CIT    =0.000e+00 
*        *** Process and parameters extraction related model parameters ***
+TOX    =1.5000e-08 NGATE  =0.000e+00 
+NLX    =2.283e-07 
+XL     =0.800e-07 XW     =-5.000e-08 
*        *** Substrate current related model parameters ***
+ALPHA0 =7.741e-09 ALPHA1 =3.983e-01 BETA0  =2.070e+01 
*        *** Noise effect related model parameters ***
+AF     =1.629e+00 KF     =9.180e-26 EF     =1.000e+00 
+NOIA   =2.245e+19 NOIB   =1.168e+05 NOIC   =-1.680e-12 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =8.500e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =1.225e-07 
+WD     =1.623e-07 
+LDIF   =0.000e+00 HDIF   =6.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.053e-03 CJSW   =2.800e-10 FC     =0.000e+00 
+MJ     =3.400e-01 MJSW   =2.300e-01 TT     =0.000e+00 
+XTI    =2.026e+00 PB     =6.900e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------
.MODEL MODNML NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4; 
* extracted : B24622 ; 2005-03; ese(5487)
* doc#      : REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.24e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =9.4964e-01 
+K2     =2.1598e-02 K3     =-1.456e+00 K3B    =-2.664e-01 
+NPEAK  =1.715e+17 VTH0=6.794e-01
+VOFF   =-9.684e-02 DVT0   =2.051e+01 DVT1   =1.061e+00 
+DVT2   =2.597e-02 KETA   =1.918e-02 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =-1.418e+01 DVT1W  =3.099e+06 DVT2W  =4.517e-02 
*        *** Mobility related model parameters ***
+UA     =4.407e-10 UB     =1.218e-18 UC     =1.000e-20 
+U0=4.366e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =9.011e-02 ETAB   =-5.126e-03 
+NFACTOR=8.605e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =5.777e-01 
+PDIBLC1=1.000e-04 PDIBLC2=2.267e-04 DROUT  =5.000e-01 
+A0     =1.046e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =1.060e+05 AGS    =9.662e-02 
+B0     =-7.584e-08 B1     =0.000e+00 DELTA  =1.864e-03 
+PDIBLCB=9.798e-01 
*        *** Geometry modulation related parameters ***
+W0     =3.316e-08 DLC    =1.0000e-07 
+DWC    =1.676e-07 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =-5.117e-14 WWL    =-5.704e-21 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.720e+00 
+KT1    =-4.180e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.000e-12 CGSO   =1.000e-12 CGBO   =1.1000e-10 
+CGDL   =4.6867e-10 CGSL   =4.6867e-10 CKAPPA =1.904e-00 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =9.631e+02 
+CDSC   =0.000e+00 CDSCB  =-7.468e-04 CDSCD  =0.000e+00 
+PRWB   =-2.308e-02 PRWG   =0.000e+00 CIT    =0.000e+00 
*        *** Process and parameters extraction related model parameters ***
+TOX    =1.5000e-08 NGATE  =0.000e+00 
+NLX    =2.369e-07 
+XL     =0.800e-07 XW     =0.0000e+00 
*        *** Substrate current related model parameters ***
+ALPHA0 =2.060e-08 ALPHA1 =6.450e-01 BETA0  =2.186e+01 
*        *** Noise effect related model parameters ***
+AF     =1.629e+00 KF     =9.180e-26 EF     =1.000e+00 
+NOIA   =2.245e+19 NOIB   =1.168e+05 NOIC   =-1.680e-12 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =8.394e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =6.414e-08 
+WD     =1.676e-07 
+LDIF   =0.000e+00 HDIF   =6.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =9.960e-03 CJSW   =3.000e-10 FC     =0.000e+00 
+MJ     =3.400e-01 MJSW   =2.300e-01 TT     =0.000e+00 
+XTI    =2.030e+00 PB     =6.900e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------
.MODEL MODPM PMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4.0; 
* extracted : C64685 ; 2002-12; ese(5487)
* doc#      : ENG-182 REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.24e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =5.2612e-01 
+K2     =4.9759e-02 K3     =8.317e+00 K3B    =-1.479e+00 
+NPEAK  =7.483e+16 VTH0=-8.510e-01
+VOFF   =-1.148e-01 DVT0   =5.399e-01 DVT1   =4.112e-01 
+DVT2   =-9.479e-02 KETA   =3.010e-02 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =8.099e-01 DVT1W  =1.480e+05 DVT2W  =4.404e-02 
*        *** Mobility related model parameters ***
+UA     =1.800e-12 UB     =2.218e-18 UC     =-7.278e-11 
+U0=1.513e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =9.736e-02 ETAB   =-2.948e-02 
+NFACTOR=7.046e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =4.395e+00 
+PDIBLC1=2.037e-02 PDIBLC2=1.000e-20 DROUT  =5.000e-01 
+A0     =1.386e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =1.436e+05 AGS    =1.364e-01 
+B0     =1.991e-08 B1     =0.000e+00 DELTA  =1.000e-02 
+PDIBLCB=1.000e+00 
*        *** Geometry modulation related parameters ***
+W0     =1.000e-10 DLC    =2.5000e-08 
+DWC    =6.203e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =-9.750e-16 WWL    =-1.787e-21 WLN    =1.000e+00 
+WWN    =1.040e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.300e+00 
+KT1    =-6.003e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =9.100e-11 CGSO   =9.100e-11 CGBO   =1.1000e-10 
+CGDL   =5.4667e-11 CGSL   =5.4667e-11 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =1.623e+03 
+CDSC   =1.214e-03 CDSCB  =2.945e-04 CDSCD  =0.000e+00 
+PRWB   =-4.521e-01 PRWG   =0.000e+00 CIT    =5.259e-05 
*        *** Process and parameters extraction related model parameters ***
+TOX    =1.5000e-08 NGATE  =0.000e+00 
+NLX    =2.231e-07 
+XL     =-5.000e-08 XW     =0.0000e+00 
*        *** Substrate current related model parameters ***
+ALPHA0 =2.710e-07 ALPHA1 =1.910e+00 BETA0  =3.477e+01 
*        *** Noise effect related model parameters ***
+AF     =1.638e+00 KF     =3.625e-26 EF     =1.000e+00 
+NOIA   =5.846e+17 NOIB   =6.623e+03 NOIC   =7.759e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =1.008e+02 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =-8.504e-08 
+WD     =6.203e-08 
+LDIF   =0.000e+00 HDIF   =6.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =2.800e-07 JSW    =3.700e-13 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.196e-03 CJSW   =2.810e-10 FC     =0.000e+00 
+MJ     =5.400e-01 MJSW   =4.600e-01 TT     =0.000e+00 
+XTI    =1.970e+00 PB     =1.020e+00 PBSW   =1.020e+00 
* ----------------------------------------------------------------------
.MODEL MODPML PMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4; 
* extracted : B26654 ; 2005-06; ese(5487)
* doc#      : REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.24e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =5.8802e-01 
+K2     =2.3656e-03 K3     =6.353e+00 K3B    =-3.586e+00 
+NPEAK  =5.658e+16 VTH0=-5.338e-01
+VOFF   =-1.257e-01 DVT0   =1.154e+00 DVT1   =4.205e-01 
+DVT2   =-4.410e-02 KETA   =2.518e-02 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =5.732e-01 DVT1W  =2.875e+05 DVT2W  =1.668e-01 
*        *** Mobility related model parameters ***
+UA     =1.000e-12 UB     =2.826e-18 UC     =-6.652e-11 
+U0=1.600e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =1.681e-01 ETAB   =-3.726e-04 
+NFACTOR=1.103e+00 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =5.500e+00 
+PDIBLC1=1.127e-02 PDIBLC2=1.250e-03 DROUT  =5.000e-01 
+A0     =1.564e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =3.830e+05 AGS    =1.523e-01 
+B0     =1.294e-08 B1     =0.000e+00 DELTA  =2.918e-02 
+PDIBLCB=8.452e-01 
*        *** Geometry modulation related parameters ***
+W0     =1.471e-06 DLC    =4.500e-08 
+DWC    =5.682e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =-1.875e-15 WWL    =-1.787e-21 WLN    =1.000e+00 
+WWN    =1.068e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.200e+00 
+KT1    =-6.603e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =6.400e-11 CGSO   =6.400e-11 CGBO   =1.1000e-10 
+CGDL   =1.4667e-10 CGSL   =1.4667e-10 CKAPPA =1.437e-00 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =6.353e+02 
+CDSC   =1.454e-04 CDSCB  =-2.792e-05 CDSCD  =0.000e+00 
+PRWB   =-3.897e-01 PRWG   =0.000e+00 CIT    =0.000e+00 
*        *** Process and parameters extraction related model parameters ***
+TOX    =1.5000e-08 NGATE  =0.000e+00 
+NLX    =2.230e-07 
+XL     =-0.300e-07 XW     =0.0000e+00 
*        *** Substrate current related model parameters ***
+ALPHA0 =1.485e-07 ALPHA1 =2.793e+00 BETA0  =3.909e+01 
*        *** Noise effect related model parameters ***
+AF     =1.638e+00 KF     =3.625e-26 EF     =1.000e+00 
+NOIA   =5.846e+17 NOIB   =6.623e+03 NOIC   =7.759e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =1.150e+02 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =-9.553e-08 
+WD     =5.682e-08 
+LDIF   =0.000e+00 HDIF   =6.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =2.800e-07 JSW    =3.700e-13 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.088e-03 CJSW   =2.800e-10 FC     =0.000e+00 
+MJ     =5.400e-01 MJSW   =4.600e-01 TT     =0.000e+00 
+XTI    =1.970e+00 PB     =1.020e+00 PBSW   =1.020e+00 
* ----------------------------------------------------------------------
.MODEL MODP PMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4.0; 
* extracted : C64685 ; 2002-12; ese(5487)
* doc#      : ENG-182 REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.24e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =4.8198e-01 
+K2     =-4.764e-02 K3     =1.103e+01 K3B    =-7.580e-01 
+NPEAK  =7.022e+16 VTH0=-5.715e-01
+VOFF   =-1.170e-01 DVT0   =1.650e+00 DVT1   =3.868e-01 
+DVT2   =1.659e-02 KETA   =-1.440e-02 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =1.879e-01 DVT1W  =7.335e+04 DVT2W  =-6.312e-03 
*        *** Mobility related model parameters ***
+UA     =5.394e-10 UB     =1.053e-18 UC     =1.000e-20 
+U0=1.581e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =2.480e-01 ETAB   =-3.917e-03 
+NFACTOR=1.214e+00 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =3.184e+00 
+PDIBLC1=1.000e-04 PDIBLC2=1.000e-20 DROUT  =5.000e-01 
+A0     =5.850e-01 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =1.158e+05 AGS    =2.468e-01 
+B0     =8.832e-08 B1     =0.000e+00 DELTA  =1.000e-02 
+PDIBLCB=1.000e+00 
*        *** Geometry modulation related parameters ***
+W0     =1.000e-10 DLC    =2.4500e-08 
+DWC    =3.449e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =1.894e-16 WWL    =-1.981e-21 WLN    =1.000e+00 
+WWN    =1.040e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.300e+00 
+KT1    =-5.403e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =8.600e-11 CGSO   =8.600e-11 CGBO   =1.1000e-10 
+CGDL   =9.9333e-11 CGSL   =9.9333e-11 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =1.033e+03 
+CDSC   =2.589e-03 CDSCB  =2.943e-04 CDSCD  =4.370e-04 
+PRWB   =-9.731e-02 PRWG   =1.477e-01 CIT    =0.000e+00 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.6000e-09 NGATE  =0.000e+00 
+NLX    =1.770e-07 
+XL     =-6.000e-08 XW     =5.0000e-09 
*        *** Substrate current related model parameters ***
+ALPHA0 =1.000e-09 ALPHA1 =1.500e+00 BETA0  =3.250e+01 
*        *** Noise effect related model parameters ***
+AF     =1.461e+00 KF     =1.191e-26 EF     =1.000e+00 
+NOIA   =5.245e+17 NOIB   =4.816e+03 NOIC   =8.036e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =1.000e+02 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =-7.130e-08 
+WD     =3.449e-08 
+LDIF   =0.000e+00 HDIF   =8.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =2.800e-07 JSW    =3.700e-13 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.197e-03 CJSW   =2.810e-10 FC     =0.000e+00 
+MJ     =5.400e-01 MJSW   =4.600e-01 TT     =0.000e+00 
+XTI    =1.973e+00 PB     =1.020e+00 PBSW   =1.020e+00 
* ----------------------------------------------------------------------
.MODEL MODPL PMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4; 
* extracted : B24622 ; 2005-03; ese(5487)
* doc#      : REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 VERSION=3.24e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =6.6496e-01 
+K2     =-8.814e-02 K3     =2.000e+01 K3B    =-1.275e+00 
+NPEAK  =8.568e+16 VTH0=-3.733e-01
+VOFF   =-1.307e-01 DVT0   =1.605e+00 DVT1   =3.919e-01 
+DVT2   =1.910e-03 KETA   =-2.155e-02 
+PSCBE1 =1.000e+30 PSCBE2 =1.000e-06 
+DVT0W  =-6.524e+00 DVT1W  =1.770e+06 DVT2W  =9.562e-02 
*        *** Mobility related model parameters ***
+UA     =3.915e-10 UB     =5.489e-19 UC     =1.000e-20 
+U0=1.340e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =2.312e-01 ETAB   =0.000e+00 
+NFACTOR=1.579e+00 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =2.332e+00 
+PDIBLC1=5.320e-03 PDIBLC2=1.000e-20 DROUT  =5.000e-01 
+A0     =9.997e-01 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =1.054e+05 AGS    =3.010e-01 
+B0     =6.060e-08 B1     =0.000e+00 DELTA  =4.333e-03 
+PDIBLCB=9.633e-01 
*        *** Geometry modulation related parameters ***
+W0     =1.069e-06 DLC    =2.000e-08 
+DWC    =2.205e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =1.894e-16 WWL    =-1.981e-21 WLN    =1.000e+00 
+WWN    =1.040e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.280e+00 
+KT1    =-5.577e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =5.600e-11 CGSO   =5.600e-11 CGBO   =1.1000e-10 
+CGDL   =2.2000e-10 CGSL   =2.2000e-10 CKAPPA =0.564e-00 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+NOFF   =1.000e+00 VOFFCV =0.000e+00 
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =1.872e+03 
+CDSC   =1.375e-03 CDSCB  =4.488e-04 CDSCD  =1.913e-04 
+PRWB   =-5.122e-02 PRWG   =0.000e+00 CIT    =0.000e+00 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.6000e-09 NGATE  =0.000e+00 
+NLX    =1.331e-07 
+XL     =-5.000e-08 XW     =0.0000e+00 
*        *** Substrate current related model parameters ***
+ALPHA0 =5.557e-08 ALPHA1 =2.652e-07 BETA0  =2.566e+01 
*        *** Noise effect related model parameters ***
+AF     =1.461e+00 KF     =1.191e-26 EF     =1.000e+00 
+NOIA   =5.245e+17 NOIB   =4.816e+03 NOIC   =8.036e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =1.150e+02 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =-3.285e-08 
+WD     =2.205e-08 
+LDIF   =0.000e+00 HDIF   =8.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =2.800e-07 JSW    =3.700e-13 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.088e-03 CJSW   =2.800e-10 FC     =0.000e+00 
+MJ     =5.400e-01 MJSW   =4.600e-01 TT     =0.000e+00 
+XTI    =1.970e+00 PB     =1.020e+00 PBSW   =1.020e+00 
* ----------------------------------------------------------------------
.SUBCKT PD A C PARAM: AREA=1e-12 PERI=4e-6
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : DIODE
* process   : C35
* revision : 4.0; 
* extracted : C64685 ; 2002-12; ese(5487)
* doc#      : ENG-182 REV_4
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
* TERMINALS: A=anode=P-region C=cathode=N-region
* VARIABLES: M (mulitiplier), AREA [m^2], PERI [m].
* NOTE: The role of a protection DIODE is to conduct ESD current to VDD 
* (or from VSS). This forward bias is NOT modelled, only leakage current 
* and capacitance during normal operation. Any inductive load etc that 
* will give forward bias, must be limited by other components to within 
* Operating Conditions, otherwise parasitic bipolar action can occur.
*
D1 A C PDINSUB AREA=AREA PERI=PERI
.ENDS PD
*
.MODEL PDINSUB D LEVEL=1 MODTYPE=ELDO
+IS     =2.800e-07 ISW    =3.700e-13 N      =1.000e+00 
+CJ     =1.197e-03 M      =5.400e-01 VJ     =1.020e+00 TT     =0.000e+00 
+CJSW   =2.810e-10 MJSW   =4.600e-01 FC     =0.500e+00 
+EG     =1.110e+00 XTI    =1.973e+00 AF     =1.000e+00 KF     =0.000e+00
* ----------------------------------------------------------------------

.SUBCKT MODNH D G S B PARAM: W=1e-6 L=1e-6 AD=0 AS=0 PD=0 PS=0 NRD=0 NRS=0
* VARIABLES: W,L,AD,AS,PD,PS,NRD,NRS = standard MOSFET parameters
*
M1 D1 G S B MODNHINSUB W=W L=L AD=AD AS=AS PD=PD PS=PS NRD=NRD NRS={6.000e-07/W}
RD D1 D {1.660e+03*4.000e-06/(W)} TC=6.200e-03  
.ENDS MODNH
.MODEL MODNHINSUB NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4.0; 
* extracted : C35 B11004.L2; 2002-11; hhl(5481)
* doc#      : REV_4.0
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0.000e+00 
*        *** Flags ***
+NOIMOD =3 FLKLEV =0.000e+00 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 NQSMOD =0.000e+00 
+DERIV  =1.000e+00 
*        *** Threshold voltage related model parameters ***
+K1     =7.3212e-01 
+K2     =-1.732e-02 K3     =-2.240e+00 K3B    =6.954e-01 
+NPEAK  =2.713e+17 VTH0=5.360e-01
+VOFF   =-5.090e-02 DVT0   =4.985e+01 DVT1   =1.296e+00 
+DVT2   =1.311e-02 KETA   =-4.553e-02 
+PSCBE1 =1.000e+10 PSCBE2 =1.024e-05 
+DVT0W  =0.000e+00 DVT1W  =0.000e+00 DVT2W  =0.000e+00 
*        *** Mobility related model parameters ***
+UA     =1.000e-30 UB     =1.949e-18 UC     =1.217e-10 
+U0=3.387e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =3.075e-02 ETAB   =-5.261e-02 
+NFACTOR=2.034e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =2.940e-01 
+PDIBLC1=3.090e-02 PDIBLC2=6.375e-04 DROUT  =5.000e-01 
+A0     =1.893e-01 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =2.402e+05 AGS    =1.245e-01 
+B0     =6.790e-08 B1     =0.000e+00 DELTA  =1.729e-02 
+PDIBLCB=2.067e-01 
*        *** Geometry modulation related parameters ***
+W0     =1.145e-07 DLC    =6.000e-07 
+DWC    =2.605e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =0.000e+00 WWL    =0.000e+00 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+TNOM   =2.700e+01 AT     =3.300e+04 UTE    =-1.800e+00 
+KT1    =-3.302e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.2933e-10 CGSO   =1.2933e-10 CGBO   =1.1000e-10 
+CGDL   =0.000e+00 CGSL   =0.000e+00 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =1.092e+03 
+CDSC   =7.944e-03 CDSCB  =0.000e+00 CDSCD  =8.448e-05 
+PRWB   =0.000e+00 PRWG   =0.000e+00 CIT    =1.000e-03 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.6000e-09 NGATE  =0.000e+00 
+NLX    =1.132e-07 
+XL     =0.000e+00 XW     =-5.000e-08 
*        *** Substrate current related model parameters ***
+ALPHA0 =0.000e+00 ALPHA1 =0.000e+00 BETA0  =3.000e+01 
*        *** Noise effect related model parameters ***
+AF     =1.400e+00 KF     =2.810e-27 EF     =1.000e+00 
+NOIA   =1.000e+20 NOIB   =5.000e+04 NOIC   =-1.400e-12 
*        *** Common extrinsic model parameters ***
+ALEV   =2.000e+00 RLEV   =2.000e+00 
+RD     =0.000e+00 RS     =0.000e+00 RSH    =8.500e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =6.000e-07 
+WD     =2.605e-08 
+LDIF   =0.000e+00 HDIF   =6.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4.000e+00 JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2.000e+00 CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.000e-04 CJSW   =6.375e-10 FC     =0.000e+00 
+MJ     =3.900e-01 MJSW   =2.700e-01 TT     =0.000e+00 
+XTI    =2.026e+00 PB     =5.300e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------

.SUBCKT MODNMH D G S B PARAM: W=1e-6 L=1e-6 AD=0 AS=0 PD=0 PS=0 NRD=0 NRS=0
* VARIABLES: W,L,AD,AS,PD,PS,NRD,NRS = standard MOSFET parameters
*
M1 D1 G S B MODNMHINSUB W=W L=L AD=AD AS=AS PD=PD PS=PS NRD=NRD NRS={6.000e-07/W}
RD D1 D {1.934e+03*4.000e-06/(W)} TC=6.200e-03  
.ENDS MODNMH
.MODEL MODNMHINSUB NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C35
* revision : 4.0; 
* extracted : C35 B11004.L2; 2002-11; hhl(5481)
* doc#      : REV_4.0
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0.000e+00 
*        *** Flags ***
+NOIMOD =3 FLKLEV =0.000e+00 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 NQSMOD =0.000e+00 
+DERIV  =1.000e+00 
*        *** Threshold voltage related model parameters ***
+K1     =1.0716e+00 
+K2     =3.7569e-02 K3     =-2.439e+00 K3B    =4.077e-01 
+NPEAK  =2.411e+17 VTH0=7.549e-01
+VOFF   =-4.948e-02 DVT0   =4.985e+01 DVT1   =1.683e+00 
+DVT2   =4.126e-02 KETA   =-7.397e-02 
+PSCBE1 =4.000e+10 PSCBE2 =1.000e-10 
+DVT0W  =0.000e+00 DVT1W  =0.000e+00 DVT2W  =0.000e+00 
*        *** Mobility related model parameters ***
+UA     =1.000e-12 UB     =3.768e-19 UC     =6.391e-12 
+U0=3.765e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =1.616e-03 ETAB   =-1.373e-02 
+NFACTOR=3.455e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =1.055e-01 
+PDIBLC1=1.000e-10 PDIBLC2=1.000e-10 DROUT  =5.000e-01 
+A0     =2.190e-01 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =5.129e+04 AGS    =9.448e-02 
+B0     =-3.629e-08 B1     =0.000e+00 DELTA  =3.370e-03 
+PDIBLCB=3.872e-01 
*        *** Geometry modulation related parameters ***
+W0     =6.289e-08 DLC    =8.917e-08 
+DWC    =4.938e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =0.000e+00 WWL    =0.000e+00 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+TNOM   =2.700e+01 AT     =3.300e+04 UTE    =-1.760e+00 
+KT1    =-4.502e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.1667e-10 CGSO   =1.1667e-10 CGBO   =1.1000e-10 
+CGDL   =0.000e+00 CGSL   =0.000e+00 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =5.304e+02 
+CDSC   =1.000e-02 CDSCB  =0.000e+00 CDSCD  =8.448e-05 
+PRWB   =0.000e+00 PRWG   =0.000e+00 CIT    =8.122e-04 
*        *** Process and parameters extraction related model parameters ***
+TOX    =1.5000e-08 NGATE  =0.000e+00 
+NLX    =1.593e-07 
+XL     =-1.050e-06 XW     =-5.000e-08 
*        *** Substrate current related model parameters ***
+ALPHA0 =0.000e+00 ALPHA1 =0.000e+00 BETA0  =3.000e+01 
*        *** Noise effect related model parameters ***
+AF     =1.400e+00 KF     =2.810e-27 EF     =1.000e+00 
+NOIA   =1.000e+20 NOIB   =5.000e+04 NOIC   =-1.400e-12 
*        *** Common extrinsic model parameters ***
+ALEV   =2.000e+00 RLEV   =2.000e+00 
+RD     =0.000e+00 RS     =0.000e+00 RSH    =8.500e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =8.917e-08 
+WD     =4.938e-08 
+LDIF   =0.000e+00 HDIF   =6.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4.000e+00 JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2.000e+00 CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.000e-04 CJSW   =6.375e-10 FC     =0.000e+00 
+MJ     =3.900e-01 MJSW   =2.700e-01 TT     =0.000e+00 
+XTI    =2.026e+00 PB     =5.300e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------

.SUBCKT MODNHL D G S B PARAM: W=1e-6 L=1e-6 AD=0 AS=0 PD=0 PS=0 NRD=0 NRS=0
* VARIABLES: W,L,AD,AS,PD,PS,NRD,NRS = standard MOSFET parameters
*
M1 D1 G S B MODNHLINSUB W=W L=L AD=AD AS=AS PD=PD PS=PS NRD=NRD NRS={8.000e-07/W}
RD D1 D {1.7600e+03*4.000e-06/(W+0.000e+00)} TC=6.200e-03  
.ENDS MODNHL
.MODEL MODNHLINSUB NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : c35
* revision : 4.0; 
* extracted : Wafer B26654W01 2005/10/05 REVISION 4.0; wpc(5481)
* doc#      : Eng-182  REV 4.0
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =5.5197e-01 
+K2     =3.1858e-03 K3     =0.000e+00 K3B    =0.000e+00 
+NPEAK  =1.990e+17 VTH0=4.656e-01
+VOFF   =-5.119e-02 DVT0   =0.000e+00 DVT1   =1.296e+00 
+DVT2   =1.311e-02 KETA   =-3.955e-02 
+PSCBE1 =1.000e+10 PSCBE2 =1.024e-05 
+DVT0W  =0.000e+00 DVT1W  =0.000e+00 DVT2W  =0.000e+00 
*        *** Mobility related model parameters ***
+UA     =1.000e-30 UB     =1.949e-18 UC     =1.217e-10 
+U0=3.163e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =0.000e+00 ETAB   =0.000e+00 
+NFACTOR=1.153e+00 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =2.940e-01 
+PDIBLC1=3.090e-02 PDIBLC2=6.375e-04 DROUT  =5.000e-01 
+A0     =3.310e-01 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =2.402e+06 AGS    =3.231e-01 
+B0     =0.000e+00 B1     =0.000e+00 DELTA  =3.185e-02 
+PDIBLCB=2.067e-04 
*        *** Geometry modulation related parameters ***
+W0     =1.145e-07 DLC    =0.000e+00 
+DWC    =0.000e+00 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =0.000e+00 WWL    =0.000e+00 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.700e+00 
+KT1    =-3.001e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.2933e-10 CGSO   =1.2933e-10 CGBO   =1.1000e-10 
+CGDL   =0.000e+00 CGSL   =0.000e+00 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =1.092e+03 
+CDSC   =0.000e+00 CDSCB  =0.000e+00 CDSCD  =0.000e+00 
+PRWB   =0.000e+00 PRWG   =0.000e+00 CIT    =-2.050e-04 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.6000e-09 NGATE  =0.000e+00 
+NLX    =1.132e-07 
+XL     =2.500e-07 XW     =0.0000e+00 
*        *** Substrate current related model parameters ***
+ALPHA0 =0.000e+00 ALPHA1 =0.000e+00 BETA0  =3.000e+01 
*        *** Noise effect related model parameters ***
+AF     =1.400e+00 KF     =2.810e-27 EF     =1.000e+00 
+NOIA   =1.000e+20 NOIB   =5.000e+04 NOIC   =-1.400e-12 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =7.500e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =6.000e-07 
+WD     =0.000e+00 
+LDIF   =0.000e+00 HDIF   =8.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.038e-03 CJSW   =3.125e-10 FC     =0.000e+00 
+MJ     =3.400e-01 MJSW   =2.300e-01 TT     =0.000e+00 
+XTI    =2.030e-00 PB     =6.900e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------

.SUBCKT MODNMHL D G S B PARAM: W=1e-6 L=1e-6 AD=0 AS=0 PD=0 PS=0 NRD=0 NRS=0
* VARIABLES: W,L,AD,AS,PD,PS,NRD,NRS = standard MOSFET parameters
*
M1 D1 G S B MODNMHLINSUB W=W L=L AD=AD AS=AS PD=PD PS=PS NRD=NRD NRS={8.000e-07/W}
RD D1 D {2.184e+03*4.000e-06/(W+0.000e+00)} TC=6.200e-03  
.ENDS MODNMHL
.MODEL MODNMHLINSUB NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : c35
* revision : 4.0; 
* extracted : Wafer B26654W01 2005/10/10 REVISION 4.0; wpc(5481)
* doc#      : Eng-182  REV 4.0
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =7.4656e-01 
+K2     =7.9454e-02 K3     =0.000e+00 K3B    =0.000e-01 
+NPEAK  =1.707e+17 VTH0=5.950e-01
+VOFF   =-5.565e-02 DVT0   =0.000e+00 DVT1   =1.683e+00 
+DVT2   =4.126e-02 KETA   =-8.210e-02 
+PSCBE1 =4.000e+10 PSCBE2 =1.000e-10 
+DVT0W  =0.000e+00 DVT1W  =0.000e+00 DVT2W  =0.000e+00 
*        *** Mobility related model parameters ***
+UA     =2.238e-10 UB     =0.000e+00 UC     =-1.429e-11 
+U0=4.078e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =1.616e-03 ETAB   =-1.373e-02 
+NFACTOR=8.550e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =1.055e-01 
+PDIBLC1=1.000e-10 PDIBLC2=1.000e-10 DROUT  =5.000e-01 
+A0     =4.754e-02 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =5.206e+04 AGS    =-3.227e-01 
+B0     =0.000e+00 B1     =0.000e+00 DELTA  =1.585e-02 
+PDIBLCB=3.872e-01 
*        *** Geometry modulation related parameters ***
+W0     =0.000e+00 DLC    =0.000e+00 
+DWC    =0.000e+00 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =0.000e+00 WWL    =0.000e+00 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.720e+00 
+KT1    =-4.202e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.1333e-10 CGSO   =1.1333e-10 CGBO   =1.1000e-10 
+CGDL   =0.000e+00 CGSL   =0.000e+00 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =5.304e+02 
+CDSC   =0.000e+00 CDSCB  =0.000e+00 CDSCD  =0.000e+00 
+PRWB   =0.000e+00 PRWG   =0.000e+00 CIT    =2.931e-05 
*        *** Process and parameters extraction related model parameters ***
+TOX    =1.5400e-08 NGATE  =0.000e+00 
+NLX    =1.593e-07 
+XL     =1.000e-07 XW     =0.0000e+00 
*        *** Substrate current related model parameters ***
+ALPHA0 =0.000e+00 ALPHA1 =0.000e+00 BETA0  =3.000e+01 
*        *** Noise effect related model parameters ***
+AF     =1.400e+00 KF     =2.810e-27 EF     =1.000e+00 
+NOIA   =1.000e+20 NOIB   =5.000e+04 NOIC   =-1.400e-12 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =7.500e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =6.000e-07 
+WD     =0.000e+00 
+LDIF   =0.000e+00 HDIF   =8.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =5.100e-07 JSW    =0.600e-12 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =1.038e-03 CJSW   =3.125e-10 FC     =0.000e+00 
+MJ     =3.400e-01 MJSW   =2.300e-01 TT     =0.000e+00 
+XTI    =2.030e-00 PB     =6.900e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------

* ----------------------------------------------------------------------
* Owner: Austria Mikro Systeme
* HIT-Kit: Digital
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : modnrf
* process   : CS ADFI
* revision  : 3.1;
* extracted : CSD C64330.04e3; 2002-09; kmo(5966)
* doc#      : ENG-188 REV_5  
* ----------------------------------------------------------------------
*                        WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*
*  RF CMOS TRANSISTOR MODEL
*
*-----------------------------------------------------------------------
.SUBCKT MODNRF D G S B PARAM: W=1.0E-6 L=1.0E-6 NRD=0.0 NRS=0.0 AD=0.0 AS=0.0 PD=0.0 PS=0.0 NG=1
* --------- GATE NETWORK ------------------------------
LG  G  20 1.000e-15
RG  20 21 {(6.895e-04/W+4.758e+01 )/NG+(3.726e+05*W+2.740e+00)}
*
* --------- DRAIN NETWORK -----------------------------
LDRAIN D  13  1.000e-15
RDRAIN 13 11 {3.320e-04/(W*NG)+1.669e-01}
*
* --------- SOURCE NETWORK -----------------------------
LSOURCE S 33 1.000e-15
RSOURCE 33 31 {3.320e-04/(W*NG)+1.669e-01}
*
* --------- SUBSTRATE NETWORK -------------------------
* DIODES ARE FOR N-TYPE/P-TYPE MOS TRANSISTORS
*
DJDB  12 11 BULKDIODEN AREA={AD*NG} PERI={PD*NG}
DJSB  32 31 BULKDIODEN AREA={AS*NG} PERI={PS*NG}
*
RSUB1 12 B {((0.000e+00/W+0.000e+00)/NG+(9.524e+06*W+(4.156e+01)))}
RSUB2 32 B {((0.000e+00/W+0.000e+00)/NG+(9.524e+06*W+(4.156e+01)))}
*
* --------- IDEAL MOS TRANSISTOR ----------------------
M1  11 21 31 B MODNRFINSUB L=L W={W*NG} AD=0.0 AS=0.0 PD=0.0 PS=0.0 NRD=0 NRS=0
* Intrinsic MOS transistor
.ENDS MODNRF
*------------ Intrinsic transistor model for MODNRF -------------------------
.MODEL MODNRFINSUB NMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : CS ADFI
* revision : 3.1; 
* extracted : CSD C64330.04e3; 2002-09; kmo(5966)
* doc#      : ENG-188 REV_5
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =7.0007e-01 
+K2     =-1.076e-02 K3     =-1.715e+00 K3B    =6.325e-01 
+NPEAK  =2.747e+17 VTH0=5.355e-01
+VOFF   =-5.719e-02 DVT0   =2.227e+01 DVT1   =1.051e+00 
+DVT2   =3.393e-03 KETA   =-6.207e-04 
+PSCBE1 =2.756e+08 PSCBE2 =9.645e-06 
+DVT0W  =0.000e+00 DVT1W  =0.000e+00 DVT2W  =0.000e+00 
*        *** Mobility related model parameters ***
+UA     =1.000e-12 UB     =4.851e-18 UC     =5.756e-11 
+U0=6.114e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =3.085e-02 ETAB   =-3.947e-02 
+NFACTOR=1.119e-01 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =1.527e+00 
+PDIBLC1=1.076e-01 PDIBLC2=1.453e-03 DROUT  =5.000e-01 
+A0     =2.208e+00 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =7.580e+04 AGS    =2.490e-01 
+B0     =-1.765e-08 B1     =0.000e+00 DELTA  =1.000e-02 
+PDIBLCB=2.583e-01 
*        *** Geometry modulation related parameters ***
+W0     =1.184e-07 DLC    =6.605e-08 
+DWC    =2.676e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =0.000e+00 WWL    =0.000e+00 WLN    =1.000e+00 
+WWN    =1.000e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.800e+00 
+KT1    =-3.302e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.873e-10 CGSO   =1.873e-10 CGBO   =1.1000e-10 
+CGDL   =1.2547e-10 CGSL   =1.2547e-10 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =0.000e+00 
+CDSC   =0.000e+00 CDSCB  =0.000e+00 CDSCD  =8.448e-05 
+PRWB   =0.000e+00 PRWG   =0.000e+00 CIT    =1.000e-03 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.5000e-09 NGATE  =0.000e+00 
+NLX    =1.918e-07 
+XL     =5.000e-08 XW     =2.5000e-08 
*        *** Substrate current related model parameters ***
+ALPHA0 =0.000e+00 ALPHA1 =0.000e+00 BETA0  =3.000e+01 
*        *** Noise effect related model parameters ***
+AF     =1.507e+00 KF     =2.170e-26 EF     =1.000e+00 
+NOIA   =1.121e+19 NOIB   =5.336e+04 NOIC   =-5.892e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =8.200e+01 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =8.285e-09 
+WD     =2.676e-08 
+LDIF   =0.000e+00 HDIF   =6.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =5.100e-07 JSW    =0.000e+00 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =0.000e+00 CJSW   =0.000e+00 FC     =0.000e+00 
+MJ     =3.100e-01 MJSW   =1.900e-01 TT     =0.000e+00 
+PB     =6.900e-01 PBSW   =6.900e-01 
* ----------------------------------------------------------------------
* Bulk Diode Model
.MODEL BULKDIODEN D LEVEL=1
+     IS=5.100e-07      ISW=0.600e-12       N=1.0000000  
+    CJO=1.580e-03       M=3.100e-01
+    CJSW=0.000e+00       MJSW=2.011E-01
+     FC=0.000e+00      TT=0.000e+00      VJ=6.900e-01 
+     KF=0.000e+00      EG=1.11e+00     XTI=2.026e+00      AF=1.000e+00
* ----------------------------------------------------------------------

* ----------------------------------------------------------------------
* Owner: Austria Mikro Systeme
* HIT-Kit: Digital
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : modprf
* process   : C/B/S 35
* revision  : 3.1;
* extracted : C35B3 B11634.L1 04PA3; 2002-09; kmo(5966)
* doc#      : ENG-188 REV_5  
* ----------------------------------------------------------------------
*                        WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*
*  RF CMOS TRANSISTOR MODEL
*
*-----------------------------------------------------------------------
.SUBCKT MODPRF D G S B PARAM: W=1.0E-6 L=1.0E-6 NRD=0.0 NRS=0.0 AD=0.0 AS=0.0 PD=0.0 PS=0.0 NG=1
* --------- GATE NETWORK ------------------------------
LG  G  20 1.000e-15
RG  20 21 {(-5.800e-04/W+2.884e+02 )/NG+(-5.394e+05*W+1.596e+00)}
*
* --------- DRAIN NETWORK -----------------------------
LDRAIN D  13  1.000e-15
RDRAIN 13 11 {8.051e-04/(W*NG)+1.731e+00}
*
* --------- SOURCE NETWORK -----------------------------
LSOURCE S 33 1.000e-15
RSOURCE 33 31 {8.051e-04/(W*NG)+1.731e+00}
*
* --------- SUBSTRATE NETWORK -------------------------
* DIODES ARE FOR N-TYPE/P-TYPE MOS TRANSISTORS
*
DJDB  11 12 BULKDIODEP AREA={AD*NG} PERI={PD*NG}
DJSB  31 32 BULKDIODEP AREA={AS*NG} PERI={PS*NG}
*
RSUB1 12 B {((1.064e-04/W+1.682e+02)/NG+(1.724e+06*W+(-2.292e+00)))}
RSUB2 32 B {((1.064e-04/W+1.682e+02)/NG+(1.724e+06*W+(-2.292e+00)))}
*
* --------- IDEAL MOS TRANSISTOR ----------------------
M1  11 21 31 B MODPRFINSUB L=L W={W*NG} AD=0.0 AS=0.0 PD=0.0 PS=0.0 NRD=0 NRS=0
* Intrinsic MOS transistor
.ENDS MODPRF
*------------ Intrinsic transistor model for MODNRF -------------------------
.MODEL MODPRFINSUB PMOS LEVEL=53 MODTYPE=ELDO
* ----------------------------------------------------------------------
************************* SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO, AccusimII, Continuum
* model     : MOS BSIM3v3
* process   : C/B/S 35
* revision : 3.1; 
* extracted : C35B3 B11634.L1 04PA3; 2002-09; kmo(5966)
* doc#      : ENG-188 REV_5
* ----------------------------------------------------------------------
*                       WORST CASE ZERO CONDITION
* ----------------------------------------------------------------------
*

+THMLEV =0         
*        *** Flags ***
+NOIMOD =3 FLKLEV =0 
+MOBMOD =1.000e+00 CAPMOD =2.000e+00 NQSMOD =0.000e+00 
+DERIV  =1         
*        *** Threshold voltage related model parameters ***
+K1     =3.0459e-01 
+K2     =3.1999e-02 K3     =1.103e+01 K3B    =-7.580e-01 
+NPEAK  =1.100e+17 VTH0=-6.299e-01
+VOFF   =-1.170e-01 DVT0   =1.650e+00 DVT1   =3.868e-01 
+DVT2   =1.659e-02 KETA   =-1.440e-02 
+PSCBE1 =5.000e+09 PSCBE2 =1.000e-04 
+DVT0W  =1.879e-01 DVT1W  =7.335e+04 DVT2W  =-6.312e-03 
*        *** Mobility related model parameters ***
+UA     =5.394e-10 UB     =3.976e-19 UC     =1.000e-20 
+U0=1.442e+02
*        *** Subthreshold related parameters ***
+DSUB   =5.000e-01 ETA0   =2.480e-01 ETAB   =-3.917e-03 
+NFACTOR=1.214e+00 
*        *** Saturation related parameters ***
+EM     =4.100e+07 PCLM   =1.829e+00 
+PDIBLC1=1.000e-04 PDIBLC2=1.000e-20 DROUT  =5.000e-01 
+A0     =5.850e-01 A1     =0.000e+00 A2     =1.000e+00 
+PVAG   =0.000e+00 VSAT   =4.824e+04 AGS    =2.468e-01 
+B0     =8.832e-08 B1     =0.000e+00 DELTA  =1.000e-02 
+PDIBLCB=1.000e+00 
*        *** Geometry modulation related parameters ***
+W0     =1.000e-10 DLC    =5.673e-08 
+DWC    =3.449e-08 DWB    =0.000e+00 DWG    =0.000e+00 
+LL     =0.000e+00 LW     =0.000e+00 LWL    =0.000e+00 
+LLN    =1.000e+00 LWN    =1.000e+00 WL     =0.000e+00 
+WW     =1.894e-16 WWL    =-1.981e-21 WLN    =1.000e+00 
+WWN    =1.040e+00 
*        *** Temperature effect parameters ***
+AT     =3.300e+04 UTE    =-1.300e+00 
+KT1    =-5.403e-01 KT2    =2.200e-02 KT1L   =0.000e+00 
+UA1    =0.000e+00 UB1    =0.000e+00 UC1    =0.000e+00 
+PRT    =0.000e+00 
*        *** Overlap capacitance related and dynamic model parameters   ***
+CGDO   =1.000e-12 CGSO   =1.000e-12 CGBO   =1.1000e-10 
+CGDL   =2.3813e-10 CGSL   =2.3813e-10 CKAPPA =6.000e-01 
+CF     =0.000e+00 ELM    =5.000e+00 
+XPART  =1.000e+00 CLC    =1.000e-15 CLE    =6.000e-01 
+
*        *** Parasitic resistance and capacitance related model parameters ***
+RDSW   =0.000e+00 
+CDSC   =2.589e-03 CDSCB  =2.943e-04 CDSCD  =4.370e-04 
+PRWB   =-9.731e-02 PRWG   =1.477e-01 CIT    =0.000e+00 
*        *** Process and parameters extraction related model parameters ***
+TOX    =7.6000e-09 NGATE  =0.000e+00 
+NLX    =1.770e-07 
+XL     =-6.000e-08 XW     =5.0000e-09 
*        *** Substrate current related model parameters ***
+ALPHA0 =0.000e+00 ALPHA1 =0.000e+00 BETA0  =3.000e+01 
*        *** Noise effect related model parameters ***
+AF     =1.461e+00 KF     =1.191e-26 EF     =1.000e+00 
+NOIA   =5.245e+17 NOIB   =4.816e+03 NOIC   =8.036e-13 
*        *** Common extrinsic model parameters ***
+ALEV   =2         RLEV   =2         
+RD     =0.000e+00 RS     =0.000e+00 RSH    =1.290e+02 
+RDC    =0.000e+00 RSC    =0.000e+00 LD     =-1.164e-08 
+WD     =3.449e-08 
+LDIF   =0.000e+00 HDIF   =8.000e-07 WMLT   =1.000e+00 
+LMLT   =1.000e+00 DEL    =0.000e+00 XJ     =3.000e-07 
+DIOLEV =4         JS     =2.800e-07 JSW    =3.700e-13 
+IS     =0.000e+00 N      =1.000e+00 
+DCAPLEV=2         CBD    =0.000e+00 CBS    =0.000e+00 
+CJ     =0.000e+00 CJSW   =0.000e+00 FC     =0.000e+00 
+MJ     =5.600e-01 MJSW   =4.300e-01 TT     =0.000e+00 
+XTI    =1.970e+00 PB     =1.020e+00 PBSW   =1.020e+00 
* ----------------------------------------------------------------------
* Bulk Diode Model
.MODEL BULKDIODEP D LEVEL=1
+     IS=2.800e-07      ISW=3.700e-13       N=1.0000000  
+    CJO=1.526e-03       M=1.176e-01
+    CJSW=0.000e+00       MJSW=4.300e-01
+     FC=0.000e+00      TT=0.000e+00      VJ=1.020e+00 
+     KF=0.000e+00      EG=1.11e+00     XTI=1.973e+00      AF=1.000e+00
* ----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
