
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler 2002.05-SP1
-- FILENAME     :    c35_IOLIB_3B_4M_Vcomponents.vhd
-- FILE CONTENTS:    VITAL Component Package
-- DATE CREATED :    Wed Jan 22 14:59:15 2003
-- 
-- LIBRARY      :    c35_IOLIB_3B_4M
-- DATE ENTERED :    $Date: 2001/09/25 12:07:08 $
-- REVISION     :    $Id: csx_IOLIB_3M.lib,v 1.3 2001/09/25 12:07:08 mbo Exp mbo $
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ns
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
-- synopsys translate_on

package VCOMPONENTS is

constant DefaultTimingChecksOn : Boolean := True;
constant DefaultXon : Boolean := True;
constant DefaultMsgOn : Boolean := True;

----- Component BBC1P_3B -----
component BBC1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.180 ns, 2.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.176 ns, 2.183 ns, 0.580 ns, 2.176 ns, 0.541 ns, 2.183 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.327 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC4P_3B -----
component BBC4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.311 ns, 1.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.312 ns, 1.154 ns, 0.546 ns, 1.312 ns, 0.637 ns, 1.154 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.260 ns, 0.245 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC4SMP_3B -----
component BBC4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.007 ns, 1.841 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.079 ns, 1.834 ns, 0.512 ns, 2.079 ns, 0.647 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.331 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC8P_3B -----
component BBC8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.236 ns, 1.162 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.115 ns, 0.577 ns, 1.245 ns, 0.623 ns, 1.115 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.328 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC8SMP_3B -----
component BBC8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.751 ns, 1.910 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.758 ns, 1.850 ns, 0.449 ns, 1.758 ns, 0.635 ns, 1.850 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.331 ns, 0.328 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC8SP_3B -----
component BBC8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.312 ns, 2.404 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.339 ns, 2.330 ns, 0.484 ns, 2.339 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.332 ns, 0.328 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC16P_3B -----
component BBC16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.261 ns, 1.223 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.296 ns, 1.123 ns, 0.623 ns, 1.296 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.326 ns, 0.331 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC16SMP_3B -----
component BBC16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.864 ns, 2.125 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.906 ns, 2.077 ns, 0.460 ns, 1.906 ns, 0.830 ns, 2.077 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.328 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC16SP_3B -----
component BBC16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.269 ns, 2.445 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.298 ns, 2.396 ns, 0.503 ns, 2.298 ns, 0.743 ns, 2.396 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.328 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC24P_3B -----
component BBC24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.351 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.238 ns, 0.731 ns, 1.449 ns, 0.735 ns, 1.238 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC24SMP_3B -----
component BBC24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.990 ns, 2.143 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.002 ns, 2.046 ns, 0.449 ns, 2.002 ns, 0.935 ns, 2.046 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.326 ns, 0.331 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC24SP_3B -----
component BBC24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.373 ns, 2.569 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.429 ns, 2.541 ns, 0.532 ns, 2.429 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD1P_3B -----
component BBCD1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.210 ns, 2.229 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.183 ns, 2.180 ns, 0.581 ns, 2.183 ns, 0.541 ns, 2.180 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.378 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD4P_3B -----
component BBCD4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.327 ns, 1.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.356 ns, 1.141 ns, 0.546 ns, 1.356 ns, 0.637 ns, 1.141 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.312 ns, 0.290 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD4SMP_3B -----
component BBCD4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.038 ns, 1.839 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.071 ns, 1.834 ns, 0.512 ns, 2.071 ns, 0.645 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD8P_3B -----
component BBCD8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.239 ns, 1.162 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.238 ns, 1.109 ns, 0.577 ns, 1.238 ns, 0.622 ns, 1.109 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD8SMP_3B -----
component BBCD8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.747 ns, 1.906 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.815 ns, 1.841 ns, 0.449 ns, 1.815 ns, 0.635 ns, 1.841 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD8SP_3B -----
component BBCD8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.335 ns, 2.404 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.353 ns, 2.322 ns, 0.484 ns, 2.353 ns, 0.740 ns, 2.322 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD16P_3B -----
component BBCD16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.260 ns, 1.223 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.303 ns, 1.123 ns, 0.623 ns, 1.303 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD16SMP_3B -----
component BBCD16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.872 ns, 2.125 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.919 ns, 2.072 ns, 0.460 ns, 1.919 ns, 0.826 ns, 2.072 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.380 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD16SP_3B -----
component BBCD16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.284 ns, 2.443 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.277 ns, 2.392 ns, 0.504 ns, 2.277 ns, 0.743 ns, 2.392 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD24P_3B -----
component BBCD24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.445 ns, 1.350 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.433 ns, 1.234 ns, 0.732 ns, 1.433 ns, 0.735 ns, 1.234 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.381 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD24SMP_3B -----
component BBCD24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.996 ns, 2.141 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.011 ns, 2.043 ns, 0.449 ns, 2.011 ns, 0.930 ns, 2.043 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD24SP_3B -----
component BBCD24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.385 ns, 2.563 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.421 ns, 2.541 ns, 0.532 ns, 2.421 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.378 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU1P_3B -----
component BBCU1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.356 ns, 2.416 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.351 ns, 2.367 ns, 0.579 ns, 2.351 ns, 0.541 ns, 2.367 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.350 ns, 0.358 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU4P_3B -----
component BBCU4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.307 ns, 1.241 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.310 ns, 1.186 ns, 0.546 ns, 1.310 ns, 0.637 ns, 1.186 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.271 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU4SMP_3B -----
component BBCU4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.003 ns, 1.850 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.071 ns, 1.784 ns, 0.512 ns, 2.071 ns, 0.651 ns, 1.784 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.351 ns, 0.355 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU8P_3B -----
component BBCU8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.236 ns, 1.163 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.233 ns, 1.125 ns, 0.577 ns, 1.233 ns, 0.624 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.350 ns, 0.351 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU8SMP_3B -----
component BBCU8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.750 ns, 1.908 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.755 ns, 1.866 ns, 0.449 ns, 1.755 ns, 0.635 ns, 1.866 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.352 ns, 0.357 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU8SP_3B -----
component BBCU8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.324 ns, 2.410 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.332 ns, 2.343 ns, 0.484 ns, 2.332 ns, 0.740 ns, 2.343 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.352 ns, 0.357 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU16P_3B -----
component BBCU16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.261 ns, 1.224 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.298 ns, 1.145 ns, 0.623 ns, 1.298 ns, 0.634 ns, 1.145 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.352 ns, 0.352 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU16SMP_3B -----
component BBCU16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.863 ns, 2.132 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.904 ns, 2.085 ns, 0.460 ns, 1.904 ns, 0.831 ns, 2.085 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.353 ns, 0.356 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU16SP_3B -----
component BBCU16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.287 ns, 2.445 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.316 ns, 2.406 ns, 0.503 ns, 2.316 ns, 0.743 ns, 2.406 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.353 ns, 0.356 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU24P_3B -----
component BBCU24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.350 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.237 ns, 0.731 ns, 1.449 ns, 0.735 ns, 1.237 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.355 ns, 0.353 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU24SMP_3B -----
component BBCU24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.993 ns, 2.142 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.034 ns, 2.124 ns, 0.449 ns, 2.034 ns, 0.934 ns, 2.124 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.356 ns, 0.357 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU24SP_3B -----
component BBCU24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.388 ns, 2.572 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.421 ns, 2.541 ns, 0.532 ns, 2.421 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.354 ns, 0.359 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS1P_3B -----
component BBS1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.173 ns, 2.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.169 ns, 2.190 ns, 0.580 ns, 2.169 ns, 0.541 ns, 2.190 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.487 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS4P_3B -----
component BBS4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.300 ns, 1.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.355 ns, 1.208 ns, 0.546 ns, 1.355 ns, 0.637 ns, 1.208 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.432 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS4SMP_3B -----
component BBS4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.041 ns, 1.845 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.082 ns, 1.834 ns, 0.512 ns, 2.082 ns, 0.648 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS8P_3B -----
component BBS8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.239 ns, 1.160 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.248 ns, 1.125 ns, 0.577 ns, 1.248 ns, 0.623 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS8SMP_3B -----
component BBS8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.750 ns, 1.904 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.753 ns, 1.885 ns, 0.449 ns, 1.753 ns, 0.635 ns, 1.885 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS8SP_3B -----
component BBS8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.300 ns, 2.408 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.360 ns, 2.330 ns, 0.484 ns, 2.360 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS16P_3B -----
component BBS16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.253 ns, 1.226 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.123 ns, 0.623 ns, 1.245 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS16SMP_3B -----
component BBS16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.886 ns, 2.128 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.911 ns, 2.050 ns, 0.460 ns, 1.911 ns, 0.826 ns, 2.050 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS16SP_3B -----
component BBS16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.251 ns, 2.443 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.322 ns, 2.425 ns, 0.503 ns, 2.322 ns, 0.743 ns, 2.425 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS24P_3B -----
component BBS24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.445 ns, 1.351 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.248 ns, 0.732 ns, 1.449 ns, 0.735 ns, 1.248 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.427 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS24SMP_3B -----
component BBS24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.967 ns, 2.146 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.010 ns, 2.112 ns, 0.449 ns, 2.010 ns, 0.929 ns, 2.112 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS24SP_3B -----
component BBS24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.382 ns, 2.565 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.414 ns, 2.531 ns, 0.532 ns, 2.414 ns, 0.745 ns, 2.531 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.430 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD1P_3B -----
component BBSD1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.232 ns, 2.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.227 ns, 2.196 ns, 0.581 ns, 2.227 ns, 0.541 ns, 2.196 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.484 ns, 0.553 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD4P_3B -----
component BBSD4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.317 ns, 1.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.355 ns, 1.171 ns, 0.546 ns, 1.355 ns, 0.637 ns, 1.171 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.554 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD4SMP_3B -----
component BBSD4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.006 ns, 1.844 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.085 ns, 1.834 ns, 0.512 ns, 2.085 ns, 0.645 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.481 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD8P_3B -----
component BBSD8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.241 ns, 1.160 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.248 ns, 1.125 ns, 0.577 ns, 1.248 ns, 0.621 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.555 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD8SMP_3B -----
component BBSD8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.752 ns, 1.906 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.766 ns, 1.842 ns, 0.449 ns, 1.766 ns, 0.635 ns, 1.842 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.481 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD8SP_3B -----
component BBSD8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.308 ns, 2.410 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.345 ns, 2.330 ns, 0.484 ns, 2.345 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.477 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD16P_3B -----
component BBSD16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.251 ns, 1.223 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.123 ns, 0.623 ns, 1.245 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.481 ns, 0.554 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD16SMP_3B -----
component BBSD16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.861 ns, 2.126 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.919 ns, 2.065 ns, 0.460 ns, 1.919 ns, 0.826 ns, 2.065 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.476 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD16SP_3B -----
component BBSD16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.257 ns, 2.447 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.322 ns, 2.403 ns, 0.504 ns, 2.322 ns, 0.743 ns, 2.403 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.551 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD24P_3B -----
component BBSD24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.353 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.250 ns, 0.732 ns, 1.449 ns, 0.735 ns, 1.250 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.479 ns, 0.554 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD24SMP_3B -----
component BBSD24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.966 ns, 2.145 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.005 ns, 2.060 ns, 0.449 ns, 2.005 ns, 0.932 ns, 2.060 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.477 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD24SP_3B -----
component BBSD24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.360 ns, 2.570 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.447 ns, 2.538 ns, 0.532 ns, 2.447 ns, 0.745 ns, 2.538 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU1P_3B -----
component BBSU1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.394 ns, 2.419 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.374 ns, 2.343 ns, 0.579 ns, 2.374 ns, 0.541 ns, 2.343 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.467 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU4P_3B -----
component BBSU4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.282 ns, 1.241 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.340 ns, 1.193 ns, 0.546 ns, 1.340 ns, 0.637 ns, 1.193 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.472 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU4SMP_3B -----
component BBSU4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.007 ns, 1.843 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.092 ns, 1.834 ns, 0.512 ns, 2.092 ns, 0.652 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU8P_3B -----
component BBSU8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.237 ns, 1.167 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.248 ns, 1.125 ns, 0.577 ns, 1.248 ns, 0.624 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.473 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU8SMP_3B -----
component BBSU8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.749 ns, 1.909 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.759 ns, 1.852 ns, 0.449 ns, 1.759 ns, 0.635 ns, 1.852 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU8SP_3B -----
component BBSU8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.306 ns, 2.413 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.343 ns, 2.330 ns, 0.484 ns, 2.343 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU16P_3B -----
component BBSU16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.250 ns, 1.229 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.123 ns, 0.623 ns, 1.245 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.467 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU16SMP_3B -----
component BBSU16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.860 ns, 2.129 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.908 ns, 2.106 ns, 0.460 ns, 1.908 ns, 0.826 ns, 2.106 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.473 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU16SP_3B -----
component BBSU16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.279 ns, 2.448 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.336 ns, 2.435 ns, 0.503 ns, 2.336 ns, 0.743 ns, 2.435 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU24P_3B -----
component BBSU24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.443 ns, 1.350 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.280 ns, 0.732 ns, 1.449 ns, 0.735 ns, 1.280 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.472 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU24SMP_3B -----
component BBSU24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.964 ns, 2.143 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.015 ns, 2.065 ns, 0.449 ns, 2.015 ns, 0.927 ns, 2.065 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU24SP_3B -----
component BBSU24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.397 ns, 2.571 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.404 ns, 2.541 ns, 0.532 ns, 2.404 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.472 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT1P_3B -----
component BBT1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.471 ns, 2.017 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.460 ns, 1.983 ns, 0.580 ns, 2.460 ns, 0.541 ns, 1.983 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.297 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT4P_3B -----
component BBT4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.441 ns, 1.149 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.455 ns, 1.116 ns, 0.546 ns, 1.455 ns, 0.637 ns, 1.116 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.187 ns, 0.212 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT4SMP_3B -----
component BBT4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.165 ns, 1.706 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.248 ns, 1.713 ns, 0.512 ns, 2.248 ns, 0.647 ns, 1.713 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT8P_3B -----
component BBT8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.346 ns, 1.084 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.348 ns, 1.025 ns, 0.577 ns, 1.348 ns, 0.623 ns, 1.025 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.294 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT8SMP_3B -----
component BBT8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.865 ns, 1.779 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.947 ns, 1.731 ns, 0.449 ns, 1.947 ns, 0.635 ns, 1.731 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT8SP_3B -----
component BBT8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.463 ns, 2.220 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.553 ns, 2.214 ns, 0.484 ns, 2.553 ns, 0.740 ns, 2.214 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT16P_3B -----
component BBT16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.355 ns, 1.138 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.345 ns, 1.078 ns, 0.623 ns, 1.345 ns, 0.634 ns, 1.078 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.296 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT16SMP_3B -----
component BBT16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.005 ns, 1.989 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.056 ns, 1.945 ns, 0.460 ns, 2.056 ns, 0.830 ns, 1.945 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT16SP_3B -----
component BBT16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.442 ns, 2.269 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.459 ns, 2.201 ns, 0.503 ns, 2.459 ns, 0.743 ns, 2.201 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT24P_3B -----
component BBT24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.550 ns, 1.258 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.549 ns, 1.179 ns, 0.732 ns, 1.549 ns, 0.735 ns, 1.179 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT24SMP_3B -----
component BBT24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.132 ns, 2.017 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.158 ns, 1.977 ns, 0.449 ns, 2.158 ns, 0.930 ns, 1.977 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.296 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT24SP_3B -----
component BBT24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.546 ns, 2.386 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.563 ns, 2.360 ns, 0.532 ns, 2.563 ns, 0.745 ns, 2.360 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD1P_3B -----
component BBTD1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.538 ns, 2.008 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.507 ns, 1.975 ns, 0.581 ns, 2.507 ns, 0.541 ns, 1.975 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD4P_3B -----
component BBTD4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.448 ns, 1.143 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.455 ns, 1.115 ns, 0.546 ns, 1.455 ns, 0.637 ns, 1.115 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.319 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD4SMP_3B -----
component BBTD4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.169 ns, 1.704 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.248 ns, 1.711 ns, 0.512 ns, 2.248 ns, 0.645 ns, 1.711 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.321 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD8P_3B -----
component BBTD8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.347 ns, 1.085 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.348 ns, 1.025 ns, 0.577 ns, 1.348 ns, 0.622 ns, 1.025 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.321 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD8SMP_3B -----
component BBTD8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.866 ns, 1.776 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.947 ns, 1.729 ns, 0.449 ns, 1.947 ns, 0.635 ns, 1.729 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.321 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD8SP_3B -----
component BBTD8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.465 ns, 2.216 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.549 ns, 2.211 ns, 0.484 ns, 2.549 ns, 0.740 ns, 2.211 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.320 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD16P_3B -----
component BBTD16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.356 ns, 1.138 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.347 ns, 1.078 ns, 0.623 ns, 1.347 ns, 0.634 ns, 1.078 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD16SMP_3B -----
component BBTD16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.996 ns, 1.989 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.056 ns, 1.941 ns, 0.460 ns, 2.056 ns, 0.826 ns, 1.941 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD16SP_3B -----
component BBTD16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.442 ns, 2.268 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.459 ns, 2.199 ns, 0.504 ns, 2.459 ns, 0.743 ns, 2.199 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD24P_3B -----
component BBTD24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.550 ns, 1.258 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.549 ns, 1.180 ns, 0.732 ns, 1.549 ns, 0.735 ns, 1.180 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD24SMP_3B -----
component BBTD24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.132 ns, 2.017 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.158 ns, 1.982 ns, 0.449 ns, 2.158 ns, 0.929 ns, 1.982 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD24SP_3B -----
component BBTD24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.550 ns, 2.386 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.563 ns, 2.359 ns, 0.532 ns, 2.563 ns, 0.745 ns, 2.359 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU1P_3B -----
component BBTU1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.689 ns, 2.167 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.660 ns, 2.149 ns, 0.579 ns, 2.660 ns, 0.541 ns, 2.149 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.325 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU4P_3B -----
component BBTU4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.443 ns, 1.151 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.455 ns, 1.121 ns, 0.546 ns, 1.455 ns, 0.637 ns, 1.121 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.202 ns, 0.239 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU4SMP_3B -----
component BBTU4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.163 ns, 1.710 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.248 ns, 1.718 ns, 0.512 ns, 2.248 ns, 0.651 ns, 1.718 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.289 ns, 0.320 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU8P_3B -----
component BBTU8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.343 ns, 1.086 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.348 ns, 1.025 ns, 0.577 ns, 1.348 ns, 0.624 ns, 1.025 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.289 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU8SMP_3B -----
component BBTU8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.862 ns, 1.784 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.945 ns, 1.736 ns, 0.449 ns, 1.945 ns, 0.635 ns, 1.736 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU8SP_3B -----
component BBTU8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.462 ns, 2.218 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.553 ns, 2.219 ns, 0.484 ns, 2.553 ns, 0.740 ns, 2.219 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU16P_3B -----
component BBTU16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.354 ns, 1.139 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.345 ns, 1.079 ns, 0.623 ns, 1.345 ns, 0.634 ns, 1.079 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU16SMP_3B -----
component BBTU16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.000 ns, 1.990 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.056 ns, 1.958 ns, 0.460 ns, 2.056 ns, 0.826 ns, 1.958 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.198 ns, 0.229 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU16SP_3B -----
component BBTU16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.443 ns, 2.271 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.459 ns, 2.204 ns, 0.503 ns, 2.459 ns, 0.743 ns, 2.204 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.324 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU24P_3B -----
component BBTU24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.550 ns, 1.259 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.549 ns, 1.169 ns, 0.731 ns, 1.549 ns, 0.735 ns, 1.169 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.287 ns, 0.320 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU24SMP_3B -----
component BBTU24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.113 ns, 2.019 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.158 ns, 1.984 ns, 0.449 ns, 2.158 ns, 0.930 ns, 1.984 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.198 ns, 0.231 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU24SP_3B -----
component BBTU24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.545 ns, 2.386 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.563 ns, 2.360 ns, 0.532 ns, 2.563 ns, 0.745 ns, 2.360 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.287 ns, 0.326 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BT1P_3B -----
component BT1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.183 ns, 2.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.175 ns, 2.207 ns, 0.580 ns, 2.175 ns, 0.541 ns, 2.207 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT2P_3B -----
component BT2P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.197 ns, 1.268 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.250 ns, 1.198 ns, 0.455 ns, 1.250 ns, 0.532 ns, 1.198 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT4P_3B -----
component BT4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.307 ns, 1.238 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.302 ns, 1.228 ns, 0.546 ns, 1.302 ns, 0.637 ns, 1.228 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT4SMP_3B -----
component BT4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.998 ns, 1.841 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.058 ns, 1.811 ns, 0.512 ns, 2.058 ns, 0.648 ns, 1.811 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT8P_3B -----
component BT8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.234 ns, 1.162 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.243 ns, 1.079 ns, 0.577 ns, 1.243 ns, 0.623 ns, 1.079 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT8SMP_3B -----
component BT8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.742 ns, 1.911 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.770 ns, 1.878 ns, 0.449 ns, 1.770 ns, 0.635 ns, 1.878 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT8SP_3B -----
component BT8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.332 ns, 2.400 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.344 ns, 2.354 ns, 0.484 ns, 2.344 ns, 0.740 ns, 2.354 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT12P_3B -----
component BT12P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.267 ns, 1.198 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.269 ns, 1.145 ns, 0.586 ns, 1.269 ns, 0.612 ns, 1.145 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT12SMP_3B -----
component BT12SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.862 ns, 2.006 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.917 ns, 1.971 ns, 0.458 ns, 1.917 ns, 0.663 ns, 1.971 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT12SP_3B -----
component BT12SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.363 ns, 2.532 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.365 ns, 2.481 ns, 0.481 ns, 2.365 ns, 0.760 ns, 2.481 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT16P_3B -----
component BT16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.262 ns, 1.222 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.296 ns, 1.187 ns, 0.623 ns, 1.296 ns, 0.634 ns, 1.187 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT16SMP_3B -----
component BT16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.851 ns, 2.130 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.932 ns, 2.078 ns, 0.460 ns, 1.932 ns, 0.830 ns, 2.078 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT16SP_3B -----
component BT16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.262 ns, 2.448 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.268 ns, 2.390 ns, 0.503 ns, 2.268 ns, 0.743 ns, 2.390 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT24P_3B -----
component BT24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.349 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.269 ns, 0.731 ns, 1.449 ns, 0.735 ns, 1.269 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT24SMP_3B -----
component BT24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.995 ns, 2.137 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.006 ns, 2.068 ns, 0.449 ns, 2.006 ns, 0.935 ns, 2.068 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT24SP_3B -----
component BT24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.393 ns, 2.569 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.411 ns, 2.527 ns, 0.532 ns, 2.411 ns, 0.745 ns, 2.527 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU1P_3B -----
component BU1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.221 ns, 2.029 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU2P_3B -----
component BU2P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.161 ns, 1.270 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU4P_3B -----
component BU4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.302 ns, 1.241 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU4SMP_3B -----
component BU4SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.852 ns, 1.682 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU8P_3B -----
component BU8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.169 ns, 1.116 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU8SMP_3B -----
component BU8SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.683 ns, 1.764 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU8SP_3B -----
component BU8SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.257 ns, 2.261 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU12P_3B -----
component BU12P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.220 ns, 1.161 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU12SMP_3B -----
component BU12SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.826 ns, 1.873 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU12SP_3B -----
component BU12SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.298 ns, 2.406 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU16P_3B -----
component BU16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.175 ns, 1.188 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU16SMP_3B -----
component BU16SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.806 ns, 2.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU16SP_3B -----
component BU16SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.193 ns, 2.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU24P_3B -----
component BU24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.342 ns, 1.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU24SMP_3B -----
component BU24SMP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1.899 ns, 2.076 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU24SP_3B -----
component BU24SP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (2.275 ns, 2.511 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD1P_3B -----
component BUDD1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 2.239 ns, 0.587 ns, 0.000 ns, 0.000 ns, 2.239 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD2P_3B -----
component BUDD2P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.237 ns, 0.405 ns, 0.000 ns, 0.000 ns, 1.237 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD4P_3B -----
component BUDD4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.228 ns, 0.530 ns, 0.000 ns, 0.000 ns, 1.228 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD8P_3B -----
component BUDD8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.119 ns, 0.522 ns, 0.000 ns, 0.000 ns, 1.119 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD12P_3B -----
component BUDD12P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.255 ns, 0.586 ns, 0.000 ns, 0.000 ns, 1.255 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD16P_3B -----
component BUDD16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.051 ns, 0.454 ns, 0.000 ns, 0.000 ns, 1.051 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD24P_3B -----
component BUDD24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.180 ns, 0.552 ns, 0.000 ns, 0.000 ns, 1.180 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU1P_3B -----
component BUDU1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.966 ns, 0.000 ns, 0.000 ns, 1.966 ns, 0.356 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU2P_3B -----
component BUDU2P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.071 ns, 0.000 ns, 0.000 ns, 1.071 ns, 0.437 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU4P_3B -----
component BUDU4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.209 ns, 0.000 ns, 0.000 ns, 1.209 ns, 0.563 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU8P_3B -----
component BUDU8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.092 ns, 0.000 ns, 0.000 ns, 1.092 ns, 0.527 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU12P_3B -----
component BUDU12P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.227 ns, 0.000 ns, 0.000 ns, 1.227 ns, 0.649 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU16P_3B -----
component BUDU16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.217 ns, 0.000 ns, 0.000 ns, 1.217 ns, 0.673 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU24P_3B -----
component BUDU24P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.419 ns, 0.000 ns, 0.000 ns, 1.419 ns, 0.839 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component CBU1P_3B -----
component CBU1P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Y                        :	VitalDelayType01 := (0.527 ns, 0.565 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component CBU2P_3B -----
component CBU2P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Y                        :	VitalDelayType01 := (0.496 ns, 0.535 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component GND3ALLP_3B -----
component GND3ALLP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component GND3IP_3B -----
component GND3IP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component GND3OP_3B -----
component GND3OP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component GND3RP_3B -----
component GND3RP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component ICCK2P_3B -----
component ICCK2P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.398 ns, 0.376 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICCK4P_3B -----
component ICCK4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.447 ns, 0.424 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICCK8P_3B -----
component ICCK8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.587 ns, 0.535 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICCK16P_3B -----
component ICCK16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.500 ns, 0.482 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICDP_3B -----
component ICDP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICP_3B -----
component ICP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.326 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICUP_3B -----
component ICUP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.350 ns, 0.353 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ISDP_3B -----
component ISDP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.483 ns, 0.554 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ISP_3B -----
component ISP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.488 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ISUP_3B -----
component ISUP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.470 ns, 0.516 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITCK2P_3B -----
component ITCK2P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.358 ns, 0.487 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITCK4P_3B -----
component ITCK4P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.372 ns, 0.514 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITCK8P_3B -----
component ITCK8P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.453 ns, 0.603 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITCK16P_3B -----
component ITCK16P_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.396 ns, 0.522 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITDP_3B -----
component ITDP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.324 ns, 0.337 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITP_3B -----
component ITP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.275 ns, 0.298 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITUP_3B -----
component ITUP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.286 ns, 0.321 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component VDD3ALLP_3B -----
component VDD3ALLP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component VDD3IP_3B -----
component VDD3IP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component VDD3OP_3B -----
component VDD3OP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component VDD3RP_3B -----
component VDD3RP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


----- Component VSUBP_3B -----
component VSUBP_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC);
end component;


end VCOMPONENTS;

---- end of VITAL components library ----
