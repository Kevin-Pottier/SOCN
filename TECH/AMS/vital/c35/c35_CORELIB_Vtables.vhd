
----------------------------------------------------------------
-- 
-- DATE CREATED :    Tue Aug  6 2006
-- 
-- LIBRARY      :    c35_CORELIB
-- REVISION     :    2.1 bka
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ps
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    
--                   Owner: austriamicrosystems AG  HIT-Kit: Digital
-- HISTORY      :
-- 
----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- synopsys translate_off

library IEEE;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
-- synopsys translate_on

package VTABLES is

   CONSTANT L : VitalTableSymbolType := '0';
   CONSTANT H : VitalTableSymbolType := '1';
   CONSTANT x : VitalTableSymbolType := '-';
   CONSTANT S : VitalTableSymbolType := 'S';
   CONSTANT R : VitalTableSymbolType := '/';
   CONSTANT U : VitalTableSymbolType := 'X';
   CONSTANT V : VitalTableSymbolType := 'B'; -- valid clock signal (non-rising)

   CONSTANT DF1_Q_tab : VitalStateTableType := (
    ( L,  L,  H,  x,  L ),
    ( L,  H,  H,  x,  H ),
    ( H,  x,  x,  x,  S ),
    ( x,  x,  L,  x,  S ));

   CONSTANT DFC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  S ),
    ( H,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  H,  x,  L ));

   CONSTANT DFCP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  x,  H,  x,  H ),
    ( H,  H,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  H,  H,  x,  L ));

   CONSTANT DFCP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  x,  L,  H,  x,  H ),
    ( H,  H,  H,  x,  x,  x,  S ),
    ( H,  x,  L,  x,  x,  x,  H ),
    ( H,  x,  H,  x,  L,  x,  S ),
    ( x,  L,  H,  H,  H,  x,  L ));

   CONSTANT DFE1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  H,  x,  L ),
    ( L,  L,  x,  L,  H,  x,  L ),
    ( L,  H,  H,  x,  H,  x,  H ),
    ( L,  H,  x,  L,  H,  x,  H ),
    ( L,  x,  L,  H,  H,  x,  L ),
    ( L,  x,  H,  H,  H,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  S ),
    ( x,  x,  x,  x,  L,  x,  S ));

   CONSTANT DFEC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  H,  x,  H ),
    ( H,  L,  x,  H,  H,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  H,  x,  L ),
    ( x,  L,  L,  x,  L,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  H,  x,  L ));

   CONSTANT DFECP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  H,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  L,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  H,  H,  x,  L ));

   CONSTANT DFECP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  H,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  H,  H,  H,  H,  x,  L ));

   CONSTANT DFEP1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  L,  H,  H,  x,  L ),
    ( L,  H,  H,  x,  x,  H,  x,  H ),
    ( L,  H,  x,  L,  x,  H,  x,  H ),
    ( L,  x,  L,  H,  H,  H,  x,  L ),
    ( L,  x,  H,  H,  x,  H,  x,  H ),
    ( H,  x,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  x,  H,  L,  x,  S ));

   CONSTANT DFP1_Q_tab : VitalStateTableType := (
    ( L,  L,  H,  H,  x,  L ),
    ( L,  H,  x,  H,  x,  H ),
    ( H,  x,  H,  x,  x,  S ),
    ( x,  x,  L,  x,  x,  H ),
    ( x,  x,  H,  L,  x,  S ));

   CONSTANT DFS1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  H,  x,  L ),
    ( L,  L,  x,  H,  H,  x,  L ),
    ( L,  H,  H,  x,  H,  x,  H ),
    ( L,  H,  x,  H,  H,  x,  H ),
    ( L,  x,  L,  L,  H,  x,  L ),
    ( L,  x,  H,  L,  H,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  S ),
    ( x,  x,  x,  x,  L,  x,  S ));

   CONSTANT DFSC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  H,  x,  L ));

   CONSTANT DFSCP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  H,  H,  x,  L ));

   CONSTANT DFSCP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  H,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  H,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  H,  H,  H,  H,  x,  L ));

   CONSTANT DFSE1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  L,  x,  x,  H,  x,  L ),
    ( L,  L,  L,  x,  x,  L,  H,  x,  L ),
    ( L,  L,  x,  L,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  x,  H,  x,  H,  x,  L ),
    ( L,  H,  H,  H,  x,  x,  H,  x,  H ),
    ( L,  H,  H,  x,  x,  L,  H,  x,  H ),
    ( L,  H,  x,  H,  x,  H,  H,  x,  H ),
    ( L,  H,  x,  x,  H,  x,  H,  x,  H ),
    ( L,  x,  L,  L,  L,  x,  H,  x,  L ),
    ( L,  x,  L,  x,  L,  L,  H,  x,  L ),
    ( L,  x,  H,  H,  L,  x,  H,  x,  H ),
    ( L,  x,  H,  x,  L,  L,  H,  x,  H ),
    ( L,  x,  x,  L,  L,  H,  H,  x,  L ),
    ( L,  x,  x,  H,  L,  H,  H,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  x,  x,  S ),
    ( x,  x,  x,  x,  x,  x,  L,  x,  S ));

   CONSTANT DFSEC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  H,  x,  x,  L,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  x,  H,  H,  x,  H ),
    ( H,  L,  H,  x,  x,  H,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  H,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  x,  L,  L,  H,  x,  H ),
    ( H,  L,  x,  x,  H,  L,  H,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  L,  L,  x,  x,  H,  x,  L ),
    ( x,  L,  L,  L,  x,  x,  L,  H,  x,  L ),
    ( x,  L,  L,  x,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  x,  H,  x,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  L,  x,  H,  x,  L ),
    ( x,  L,  x,  L,  x,  L,  L,  H,  x,  L ),
    ( x,  L,  x,  x,  L,  L,  H,  H,  x,  L ));

   CONSTANT DFSECP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  H,  x,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  H,  x,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  x,  H,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  x,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  H,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  x,  L,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  x,  H,  L,  H,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  L,  x,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  L,  x,  x,  L,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  L,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  x,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  x,  L,  L,  H,  H,  x,  L ),
    ( x,  L,  x,  x,  L,  L,  H,  H,  H,  x,  L ));

   CONSTANT DFSECP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  L,  L,  x,  x,  x,  H,  x,  H ),
    ( H,  L,  L,  H,  x,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  L,  x,  L,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  x,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  x,  L,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  x,  L,  L,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  H,  x,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  H,  x,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  H,  x,  x,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  H,  x,  H,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  x,  H,  H,  H,  H,  H,  x,  L ));

   CONSTANT DFSEP1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  L,  x,  x,  H,  H,  x,  L ),
    ( L,  L,  L,  x,  x,  L,  H,  H,  x,  L ),
    ( L,  L,  x,  L,  x,  H,  H,  H,  x,  L ),
    ( L,  L,  x,  x,  H,  x,  H,  H,  x,  L ),
    ( L,  H,  H,  H,  x,  x,  x,  H,  x,  H ),
    ( L,  H,  H,  x,  x,  L,  x,  H,  x,  H ),
    ( L,  H,  x,  H,  x,  H,  x,  H,  x,  H ),
    ( L,  H,  x,  x,  H,  x,  x,  H,  x,  H ),
    ( L,  x,  L,  L,  L,  x,  H,  H,  x,  L ),
    ( L,  x,  L,  x,  L,  L,  H,  H,  x,  L ),
    ( L,  x,  H,  H,  L,  x,  x,  H,  x,  H ),
    ( L,  x,  H,  x,  L,  L,  x,  H,  x,  H ),
    ( L,  x,  x,  L,  L,  H,  H,  H,  x,  L ),
    ( L,  x,  x,  H,  L,  H,  x,  H,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  x,  x,  x,  H,  L,  x,  S ));

   CONSTANT DFSP1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  H,  H,  H,  x,  L ),
    ( L,  H,  H,  x,  x,  H,  x,  H ),
    ( L,  H,  x,  H,  x,  H,  x,  H ),
    ( L,  x,  L,  L,  H,  H,  x,  L ),
    ( L,  x,  H,  L,  x,  H,  x,  H ),
    ( H,  x,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  x,  H,  L,  x,  S ));

   CONSTANT DL1_Q_tab : VitalStateTableType := (
    ( L,  L,  x,  L ),
    ( L,  H,  x,  H ),
    ( H,  x,  x,  S ));

   CONSTANT DLC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  L ),
    ( H,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  S ),
    ( x,  L,  L,  x,  L ));

   CONSTANT DLCP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  x,  x,  H ),
    ( H,  H,  x,  H,  x,  S ),
    ( H,  x,  x,  L,  x,  H ),
    ( x,  L,  L,  H,  x,  L ));

   CONSTANT DLCP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  L ),
    ( H,  L,  x,  L,  x,  H ),
    ( H,  H,  H,  x,  x,  S ),
    ( H,  x,  L,  x,  x,  H ),
    ( x,  L,  H,  H,  x,  L ));

   CONSTANT DLP1_Q_tab : VitalStateTableType := (
    ( L,  L,  H,  x,  L ),
    ( L,  H,  x,  x,  H ),
    ( H,  x,  H,  x,  S ),
    ( x,  x,  L,  x,  H ));

   CONSTANT JK1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  H,  x,  L ),
    ( L,  L,  x,  H,  H,  x,  L ),
    ( L,  H,  L,  x,  H,  x,  H ),
    ( L,  H,  x,  L,  H,  x,  H ),
    ( L,  x,  H,  L,  H,  x,  H ),
    ( L,  x,  H,  H,  H,  x,  L ),
    ( H,  x,  x,  x,  x,  x,  S ),
    ( x,  x,  x,  x,  L,  x,  S ));

   CONSTANT JKC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  L,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  H,  H,  H,  x,  L ));

   CONSTANT JKCP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  H,  H,  H,  H,  x,  L ));

   CONSTANT JKCP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  H,  H,  x,  L ));

   CONSTANT JKP1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  H,  H,  H,  x,  L ),
    ( L,  H,  L,  x,  x,  H,  x,  H ),
    ( L,  H,  x,  L,  x,  H,  x,  H ),
    ( L,  x,  H,  L,  x,  H,  x,  H ),
    ( L,  x,  H,  H,  H,  H,  x,  L ),
    ( H,  x,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  x,  H,  L,  x,  S ));

   CONSTANT JKS1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  L,  x,  H,  x,  L ),
    ( L,  L,  L,  x,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  H,  x,  x,  H,  x,  L ),
    ( L,  L,  x,  x,  H,  H,  H,  x,  L ),
    ( L,  H,  H,  x,  L,  x,  H,  x,  H ),
    ( L,  H,  H,  x,  x,  L,  H,  x,  H ),
    ( L,  H,  x,  H,  x,  x,  H,  x,  H ),
    ( L,  H,  x,  x,  H,  L,  H,  x,  H ),
    ( L,  x,  L,  L,  L,  x,  H,  x,  L ),
    ( L,  x,  L,  L,  x,  H,  H,  x,  L ),
    ( L,  x,  H,  L,  L,  x,  H,  x,  H ),
    ( L,  x,  H,  L,  x,  L,  H,  x,  H ),
    ( L,  x,  x,  L,  H,  L,  H,  x,  H ),
    ( L,  x,  x,  L,  H,  H,  H,  x,  L ),
    ( H,  x,  x,  x,  x,  x,  x,  x,  S ),
    ( x,  x,  x,  x,  x,  x,  L,  x,  S ));

   CONSTANT JKSC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  H,  H,  x,  x,  L,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  x,  H,  L,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  x,  L,  H,  x,  H ),
    ( H,  L,  x,  x,  L,  H,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  L,  x,  H,  x,  L ),
    ( x,  L,  L,  L,  x,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  x,  x,  H,  x,  L ),
    ( x,  L,  L,  x,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  L,  x,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  x,  L,  H,  H,  H,  x,  L ));

   CONSTANT JKSCP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  H,  x,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  x,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  x,  H,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  L,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  x,  L,  H,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  x,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  L,  x,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  x,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  x,  H,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  x,  L,  H,  H,  H,  H,  x,  L ));

   CONSTANT JKSCP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  L,  H,  x,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  L,  x,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  x,  L,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  x,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  x,  L,  L,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  H,  x,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  L,  x,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  x,  H,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  H,  x,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  x,  L,  H,  H,  H,  H,  x,  L ));

   CONSTANT JKSP1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  L,  x,  H,  H,  x,  L ),
    ( L,  L,  L,  x,  x,  H,  H,  H,  x,  L ),
    ( L,  L,  x,  H,  x,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  x,  H,  H,  H,  H,  x,  L ),
    ( L,  H,  H,  x,  L,  x,  x,  H,  x,  H ),
    ( L,  H,  H,  x,  x,  L,  x,  H,  x,  H ),
    ( L,  H,  x,  H,  x,  x,  x,  H,  x,  H ),
    ( L,  H,  x,  x,  H,  L,  x,  H,  x,  H ),
    ( L,  x,  L,  L,  L,  x,  H,  H,  x,  L ),
    ( L,  x,  L,  L,  x,  H,  H,  H,  x,  L ),
    ( L,  x,  H,  L,  L,  x,  x,  H,  x,  H ),
    ( L,  x,  H,  L,  x,  L,  x,  H,  x,  H ),
    ( L,  x,  x,  L,  H,  L,  x,  H,  x,  H ),
    ( L,  x,  x,  L,  H,  H,  H,  H,  x,  L ),
    ( H,  x,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  x,  x,  x,  H,  L,  x,  S ));

   CONSTANT TFC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  S ),
    ( H,  x,  x,  L,  x,  S ),
    ( x,  L,  H,  H,  x,  L ));

   CONSTANT TFEC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  H,  H,  x,  H ),
    ( H,  L,  H,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  L,  H,  x,  L ),
    ( x,  L,  H,  H,  H,  x,  L ));

   CONSTANT TFECP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  H,  x,  H,  x,  H ),
    ( H,  L,  H,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  H,  H,  x,  L ),
    ( x,  L,  H,  H,  H,  H,  x,  L ));

   CONSTANT TFECP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  L,  x,  H,  x,  H ),
    ( H,  L,  H,  H,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  H,  H,  H,  x,  L ),
    ( x,  L,  H,  L,  H,  H,  x,  L ));

   CONSTANT TFEP1_Q_tab : VitalStateTableType := (
    ( L,  L,  L,  H,  H,  x,  L ),
    ( L,  L,  H,  x,  H,  x,  H ),
    ( L,  H,  L,  x,  H,  x,  H ),
    ( L,  H,  H,  H,  H,  x,  L ),
    ( H,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  H,  L,  x,  S ));

   CONSTANT TFP1_Q_tab : VitalStateTableType := (
    ( L,  H,  H,  H,  x,  L ),
    ( L,  x,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  S ),
    ( x,  L,  x,  x,  x,  H ),
    ( x,  H,  x,  L,  x,  S ));

   CONSTANT TFSC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  H,  x,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  H,  x,  L ));

   CONSTANT TFSEC1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  H,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  L,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  H,  H,  x,  H ),
    ( H,  L,  x,  L,  H,  L,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  L,  x,  S ),
    ( x,  L,  L,  H,  x,  x,  H,  x,  L ),
    ( x,  L,  L,  x,  L,  L,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  L,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  H,  H,  x,  L ));

   CONSTANT TFSECP1_Q_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  H,  H,  x,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  L,  H,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  H,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  H,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  H,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  H,  x,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  L,  L,  H,  H,  x,  L ),
    ( x,  L,  L,  x,  H,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  L,  L,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  H,  H,  H,  x,  L ));

   CONSTANT TFSECP1_QN_tab : VitalStateTableType := (
    ( L,  x,  x,  x,  x,  x,  x,  x,  x,  L ),
    ( H,  L,  L,  L,  L,  x,  x,  H,  x,  H ),
    ( H,  L,  L,  H,  H,  x,  x,  H,  x,  H ),
    ( H,  L,  H,  x,  x,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  L,  L,  L,  x,  H,  x,  H ),
    ( H,  L,  x,  H,  H,  L,  x,  H,  x,  H ),
    ( H,  H,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( H,  x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( H,  x,  x,  x,  x,  x,  H,  L,  x,  S ),
    ( x,  L,  L,  L,  H,  x,  H,  H,  x,  L ),
    ( x,  L,  L,  H,  L,  x,  H,  H,  x,  L ),
    ( x,  L,  H,  x,  x,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  L,  H,  H,  H,  H,  x,  L ),
    ( x,  L,  x,  H,  L,  H,  H,  H,  x,  L ));

   CONSTANT TFSEP1_Q_tab : VitalStateTableType := (
    ( L,  L,  H,  x,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  L,  L,  H,  H,  x,  L ),
    ( L,  L,  x,  H,  H,  H,  H,  x,  L ),
    ( L,  H,  H,  x,  x,  x,  H,  x,  H ),
    ( L,  H,  x,  L,  H,  x,  H,  x,  H ),
    ( L,  H,  x,  H,  L,  x,  H,  x,  H ),
    ( L,  x,  L,  L,  L,  H,  H,  x,  L ),
    ( L,  x,  L,  L,  H,  x,  H,  x,  H ),
    ( L,  x,  L,  H,  L,  x,  H,  x,  H ),
    ( L,  x,  L,  H,  H,  H,  H,  x,  L ),
    ( H,  x,  x,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  x,  x,  H,  L,  x,  S ));

   CONSTANT TFSP1_Q_tab : VitalStateTableType := (
    ( L,  L,  H,  x,  H,  H,  x,  L ),
    ( L,  L,  x,  H,  H,  H,  x,  L ),
    ( L,  H,  H,  x,  x,  H,  x,  H ),
    ( L,  H,  x,  L,  x,  H,  x,  H ),
    ( L,  x,  L,  L,  x,  H,  x,  H ),
    ( L,  x,  L,  H,  H,  H,  x,  L ),
    ( H,  x,  x,  x,  H,  x,  x,  S ),
    ( x,  x,  x,  x,  L,  x,  x,  H ),
    ( x,  x,  x,  x,  H,  L,  x,  S ));

   CONSTANT DLSG1_IQ_tab : VitalStateTableType := (
    ( L,  L,  L,  x,  L ),
    ( L,  H,  x,  x,  H ),
    ( L,  x,  H,  x,  H ),
    ( H,  x,  x,  x,  S ));


end VTABLES;

---- end of VITAL tables library ----
