*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI15PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI15PT N1 N2 N3 N4
LS1 N1 N13 4.163e-10
RS1 N13 N3 2.713e+00
LB1 N1R N1L 1.334e-08
RB1 N1 N1R 9.176e+02
LB2 NXR N1L 7.400e-11
RE1 NXR N13 8.785e+00
CB1 N1L N1 5.610e-14
CS1 N1 N3 1.143e-14
LS2 N32 N2 4.163e-10
RS2 N3 N32 2.713e+00
LB3 N2R N2L 1.334e-08 
RB2 N2R N2 9.176e+02
LB4 NyR N2L 7.400e-11 
RE2 N32 NYR 8.785e+00
CB2 N2L N2 5.610e-14
CS2 N3 N2 1.143e-14
COX1 N1 N14 8.243e-20
RSUB1 N14 N4 5.267e+00
COX2 N2 N24 8.243e-20
RSUB2 N24 N4 5.267e+00
COX3 N3 N34 1.959e-13
RSUB3 N34 N4 8.368e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 8.292e-01 
.ENDS DI15PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI20PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI20PT N1 N2 N3 N4
LS1 N1 N13 5.856e-10
RS1 N13 N3 2.258e+00
LB1 N1R N1L 8.021e-09
RB1 N1 N1R 8.299e+02
LB2 NXR N1L 1.334e-09
RE1 NXR N13 1.218e+01
CB1 N1L N1 6.045e-14
CS1 N1 N3 1.000e-20
LS2 N32 N2 5.856e-10
RS2 N3 N32 2.258e+00
LB3 N2R N2L 8.021e-09 
RB2 N2R N2 8.299e+02
LB4 NyR N2L 1.334e-09 
RE2 N32 NYR 1.218e+01
CB2 N2L N2 6.045e-14
CS2 N3 N2 1.000e-20
COX1 N1 N14 1.436e-19
RSUB1 N14 N4 5.267e+00
COX2 N2 N24 1.436e-19
RSUB2 N24 N4 5.267e+00
COX3 N3 N34 2.211e-13
RSUB3 N34 N4 6.310e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 7.670e-01 
.ENDS DI20PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI25PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI25PT N1 N2 N3 N4
LS1 N1 N13 7.394e-10
RS1 N13 N3 2.277e+00
LB1 N1R N1L 2.538e-08
RB1 N1 N1R 1.090e+03
LB2 NXR N1L 1.581e-10
RE1 NXR N13 2.531e+00
CB1 N1L N1 8.333e-14
CS1 N1 N3 7.079e-15
LS2 N32 N2 7.394e-10
RS2 N3 N32 2.277e+00
LB3 N2R N2L 2.538e-08 
RB2 N2R N2 1.090e+03
LB4 NyR N2L 1.581e-10 
RE2 N32 NYR 2.531e+00
CB2 N2L N2 8.333e-14
CS2 N3 N2 7.079e-15
COX1 N1 N14 2.027e-14
RSUB1 N14 N4 1.048e+02
COX2 N2 N24 2.027e-14
RSUB2 N24 N4 1.048e+02
COX3 N3 N34 2.171e-13
RSUB3 N34 N4 5.098e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 6.904e-01 
.ENDS DI25PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI30PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI30PT N1 N2 N3 N4
LS1 N1 N13 8.822e-10
RS1 N13 N3 2.509e+00
LB1 N1R N1L 2.295e-08
RB1 N1 N1R 1.649e+03
LB2 NXR N1L 4.267e-10
RE1 NXR N13 9.724e+00
CB1 N1L N1 1.072e-13
CS1 N1 N3 1.392e-14
LS2 N32 N2 8.822e-10
RS2 N3 N32 2.509e+00
LB3 N2R N2L 2.295e-08 
RB2 N2R N2 1.649e+03
LB4 NyR N2L 4.267e-10 
RE2 N32 NYR 9.724e+00
CB2 N2L N2 1.072e-13
CS2 N3 N2 1.392e-14
COX1 N1 N14 2.967e-15
RSUB1 N14 N4 2.479e+03
COX2 N2 N24 2.967e-15
RSUB2 N24 N4 2.479e+03
COX3 N3 N34 3.042e-13
RSUB3 N34 N4 3.420e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 7.292e-01 
.ENDS DI30PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI35PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI35PT N1 N2 N3 N4
LS1 N1 N13 1.054e-09
RS1 N13 N3 1.904e+00
LB1 N1R N1L 2.913e-08
RB1 N1 N1R 8.093e+02
LB2 NXR N1L 1.529e-10
RE1 NXR N13 9.378e+00
CB1 N1L N1 1.302e-13
CS1 N1 N3 1.965e-14
LS2 N32 N2 1.054e-09
RS2 N3 N32 1.904e+00
LB3 N2R N2L 2.913e-08 
RB2 N2R N2 8.093e+02
LB4 NyR N2L 1.529e-10 
RE2 N32 NYR 9.378e+00
CB2 N2L N2 1.302e-13
CS2 N3 N2 1.965e-14
COX1 N1 N14 6.757e-15
RSUB1 N14 N4 2.053e+02
COX2 N2 N24 6.757e-15
RSUB2 N24 N4 2.053e+02
COX3 N3 N34 3.686e-13
RSUB3 N34 N4 3.906e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 7.210e-01 
.ENDS DI35PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI40PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI40PT N1 N2 N3 N4
LS1 N1 N13 1.103e-09
RS1 N13 N3 3.262e+00
LB1 N1R N1L 2.098e-08
RB1 N1 N1R 1.297e+03
LB2 NXR N1L 2.702e-10
RE1 NXR N13 1.067e+01
CB1 N1L N1 1.292e-13
CS1 N1 N3 3.020e-14
LS2 N32 N2 1.103e-09
RS2 N3 N32 3.262e+00
LB3 N2R N2L 2.098e-08 
RB2 N2R N2 1.297e+03
LB4 NyR N2L 2.702e-10 
RE2 N32 NYR 1.067e+01
CB2 N2L N2 1.292e-13
CS2 N3 N2 3.020e-14
COX1 N1 N14 8.479e-15
RSUB1 N14 N4 4.040e+02
COX2 N2 N24 8.479e-15
RSUB2 N24 N4 4.040e+02
COX3 N3 N34 2.799e-13
RSUB3 N34 N4 5.811e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 8.067e-01 
.ENDS DI40PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI45PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI45PT N1 N2 N3 N4
LS1 N1 N13 1.426e-09
RS1 N13 N3 2.964e+00
LB1 N1R N1L 3.623e-08
RB1 N1 N1R 9.169e+02
LB2 NXR N1L 1.679e-10
RE1 NXR N13 2.268e+01
CB1 N1L N1 1.251e-13
CS1 N1 N3 7.020e-14
LS2 N32 N2 1.426e-09
RS2 N3 N32 2.964e+00
LB3 N2R N2L 3.623e-08 
RB2 N2R N2 9.169e+02
LB4 NyR N2L 1.679e-10 
RE2 N32 NYR 2.268e+01
CB2 N2L N2 1.251e-13
CS2 N3 N2 7.020e-14
COX1 N1 N14 1.717e-15
RSUB1 N14 N4 3.098e+00
COX2 N2 N24 1.717e-15
RSUB2 N24 N4 3.098e+00
COX3 N3 N34 3.773e-13
RSUB3 N34 N4 7.203e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 7.159e-01 
.ENDS DI45PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI50PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI50PT N1 N2 N3 N4
LS1 N1 N13 1.386e-09
RS1 N13 N3 2.526e+00
LB1 N1R N1L 3.471e-08
RB1 N1 N1R 8.772e+02
LB2 NXR N1L 2.997e-10
RE1 NXR N13 1.202e+01
CB1 N1L N1 1.388e-13
CS1 N1 N3 6.656e-14
LS2 N32 N2 1.386e-09
RS2 N3 N32 2.526e+00
LB3 N2R N2L 3.471e-08 
RB2 N2R N2 8.772e+02
LB4 NyR N2L 2.997e-10 
RE2 N32 NYR 1.202e+01
CB2 N2L N2 1.388e-13
CS2 N3 N2 6.656e-14
COX1 N1 N14 9.684e-15
RSUB1 N14 N4 9.184e+02
COX2 N2 N24 9.684e-15
RSUB2 N24 N4 9.184e+02
COX3 N3 N34 4.875e-13
RSUB3 N34 N4 3.443e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 8.540e-01 
.ENDS DI50PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI55PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI55PT N1 N2 N3 N4
LS1 N1 N13 1.741e-09
RS1 N13 N3 2.808e+00
LB1 N1R N1L 7.332e-08
RB1 N1 N1R 1.238e+03
LB2 NXR N1L 7.190e-11
RE1 NXR N13 1.018e+02
CB1 N1L N1 6.027e-14
CS1 N1 N3 1.431e-13
LS2 N32 N2 1.741e-09
RS2 N3 N32 2.808e+00
LB3 N2R N2L 7.332e-08 
RB2 N2R N2 1.238e+03
LB4 NyR N2L 7.190e-11 
RE2 N32 NYR 1.018e+02
CB2 N2L N2 6.027e-14
CS2 N3 N2 1.431e-13
COX1 N1 N14 2.419e-14
RSUB1 N14 N4 1.186e-02
COX2 N2 N24 2.419e-14
RSUB2 N24 N4 1.186e-02
COX3 N3 N34 4.840e-13
RSUB3 N34 N4 6.496e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 7.174e-01 
.ENDS DI55PT
*----------------------------------------------------------------------
*-----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
* *********************** SIMULATION PARAMETERS ************************
* ----------------------------------------------------------------------
* format    : ELDO
* model     : RF INDUCTOR DI60PT
* process   : C35B4M3
* revision  : 1.0; 
* extracted : May-2005; zoltan.huszka@austriamicrosystems.com 
* doc#      : ENG-188 Rev.: 5.0
* ----------------------------------------------------------------------
*  
*  
* ----------------------------------------------------------------------
*
.SUBCKT DI60PT N1 N2 N3 N4
LS1 N1 N13 1.768e-09
RS1 N13 N3 2.031e+00
LB1 N1R N1L 4.351e-08
RB1 N1 N1R 9.323e+01
LB2 NXR N1L 2.630e-10
RE1 NXR N13 2.905e+02
CB1 N1L N1 2.066e-14
CS1 N1 N3 5.958e-14
LS2 N32 N2 1.768e-09
RS2 N3 N32 2.031e+00
LB3 N2R N2L 4.351e-08 
RB2 N2R N2 9.323e+01
LB4 NyR N2L 2.630e-10 
RE2 N32 NYR 2.905e+02
CB2 N2L N2 2.066e-14
CS2 N3 N2 5.958e-14
COX1 N1 N14 1.438e-13
RSUB1 N14 N4 1.284e+01
COX2 N2 N24 1.438e-13
RSUB2 N24 N4 1.284e+01
COX3 N3 N34 4.253e-13
RSUB3 N34 N4 9.136e+00
K1 LB1 LB2 1
K2 LB3 LB4 1
K3 LS1 LS2 7.013e-01 
.ENDS DI60PT
*----------------------------------------------------------------------
* Owner: austriamicrosystems
* HIT-Kit: Digital
