* test.cmd

* Please setup the AMS_DIR env variable:
* setenv AMS_DIR /nfsi/people/lib/mtual/private/Cours_ESEO/TP/
* or
* setenv (AMS_PATH_TO_PRJ_SOURCE)/source/TECH

*******************************
* TECH SETUP FOR AMS C35 TECH
*******************************
.lib /$AMS_DIR/eldo/c35/wc53.lib tm
.defmod pmosox3 modpm
.defmod nmosox3 modnm
.defmod nwmva modnml
.param VSUP=5

**************************
* TESTBENCH
**************************
.global vdd vcc vss
.param rimp=1

.connect vcc vdd * Mikael uses vcc

.model bod_vhdlams  MACRO LANG=VHDL-AMS LIB=LibBod

vdd           vdd 0 5 PWL (0p 0  1400n 5)
vss           vss 0 0

  **************************
  * CONV MODELS
  **************************  
  .model a2d_std a2d mode=std_logic vth1=2.5 vth2=2.5

 *.model d2a_std d2a mode=std_logic vhi=5      vlo=0      trise=1n tfall=1n
  .model d2a_std d2a mode=std_logic VLOREF=vss VHIREF=vdd trise=1n tfall=1n
**.model d2a_std d2a mode=std_logic vhiref=5   vloref=0   RRISE=1e-6 RFALL=1e-6 *RRISE/FALL=0 badly behaves, divide by 0 make D2A output always 0V !
 *.model d2a_std d2a mode=std_logic VLOREF=vss VHIREF=vdd RRISE=1e-6 RFALL=1e-6 *RRISE/FALL=0 badly behaves, divide by 0 make D2A output always 0V !

  .defhook d2a_std a2d_std

  **************************  

.tran 1n 200u

.probe tran v
