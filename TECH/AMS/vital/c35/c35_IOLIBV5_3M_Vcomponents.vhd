
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler 2000.11
-- FILE CONTENTS:    VITAL Component Package
-- DATE CREATED :    Thu Jun 27 17:09:16 2002
-- 
-- LIBRARY      :    c35_IOLIBV5_4M
-- DATE ENTERED :    $Date: 2001/10/30 09:43:45 $
-- REVISION     :    $Id: csx_IOLIBV5_3M.lib,v 1.2 2001/10/30 09:43:45 mbo Exp mbo $
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
-- synopsys translate_on

package VCOMPONENTS is

constant DefaultTimingChecksOn : Boolean := True;
constant DefaultXon : Boolean := True;
constant DefaultMsgOn : Boolean := True;

----- Component BBC1P_V5 -----
component BBC1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC4P_V5 -----
component BBC4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC4SMP_V5 -----
component BBC4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC8P_V5 -----
component BBC8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC8SMP_V5 -----
component BBC8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC8SP_V5 -----
component BBC8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC16P_V5 -----
component BBC16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC16SMP_V5 -----
component BBC16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC16SP_V5 -----
component BBC16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC24P_V5 -----
component BBC24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC24SMP_V5 -----
component BBC24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC24SP_V5 -----
component BBC24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD1P_V5 -----
component BBCD1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD4P_V5 -----
component BBCD4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD4SMP_V5 -----
component BBCD4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD8P_V5 -----
component BBCD8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD8SMP_V5 -----
component BBCD8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD8SP_V5 -----
component BBCD8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD16P_V5 -----
component BBCD16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD16SMP_V5 -----
component BBCD16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD16SP_V5 -----
component BBCD16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD24P_V5 -----
component BBCD24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD24SMP_V5 -----
component BBCD24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCD24SP_V5 -----
component BBCD24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU1P_V5 -----
component BBCU1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU4P_V5 -----
component BBCU4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU4SMP_V5 -----
component BBCU4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU8P_V5 -----
component BBCU8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU8SMP_V5 -----
component BBCU8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU8SP_V5 -----
component BBCU8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU16P_V5 -----
component BBCU16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU16SMP_V5 -----
component BBCU16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU16SP_V5 -----
component BBCU16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU24P_V5 -----
component BBCU24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU24SMP_V5 -----
component BBCU24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU24SP_V5 -----
component BBCU24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS1P_V5 -----
component BBS1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS4P_V5 -----
component BBS4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS4SMP_V5 -----
component BBS4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS8P_V5 -----
component BBS8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS8SMP_V5 -----
component BBS8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS8SP_V5 -----
component BBS8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS16P_V5 -----
component BBS16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS16SMP_V5 -----
component BBS16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS16SP_V5 -----
component BBS16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS24P_V5 -----
component BBS24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS24SMP_V5 -----
component BBS24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBS24SP_V5 -----
component BBS24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD1P_V5 -----
component BBSD1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD4P_V5 -----
component BBSD4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD4SMP_V5 -----
component BBSD4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD8P_V5 -----
component BBSD8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD8SMP_V5 -----
component BBSD8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD8SP_V5 -----
component BBSD8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD16P_V5 -----
component BBSD16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD16SMP_V5 -----
component BBSD16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD16SP_V5 -----
component BBSD16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD24P_V5 -----
component BBSD24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD24SMP_V5 -----
component BBSD24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSD24SP_V5 -----
component BBSD24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU1P_V5 -----
component BBSU1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU4P_V5 -----
component BBSU4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU4SMP_V5 -----
component BBSU4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU8P_V5 -----
component BBSU8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU8SMP_V5 -----
component BBSU8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU8SP_V5 -----
component BBSU8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU16P_V5 -----
component BBSU16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU16SMP_V5 -----
component BBSU16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU16SP_V5 -----
component BBSU16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU24P_V5 -----
component BBSU24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU24SMP_V5 -----
component BBSU24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBSU24SP_V5 -----
component BBSU24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT1P_V5 -----
component BBT1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT4P_V5 -----
component BBT4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT4SMP_V5 -----
component BBT4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT8P_V5 -----
component BBT8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT8SMP_V5 -----
component BBT8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT8SP_V5 -----
component BBT8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT16P_V5 -----
component BBT16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT16SMP_V5 -----
component BBT16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT16SP_V5 -----
component BBT16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT24P_V5 -----
component BBT24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT24SMP_V5 -----
component BBT24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBT24SP_V5 -----
component BBT24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD1P_V5 -----
component BBTD1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD4P_V5 -----
component BBTD4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD4SMP_V5 -----
component BBTD4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD8P_V5 -----
component BBTD8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD8SMP_V5 -----
component BBTD8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD8SP_V5 -----
component BBTD8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD16P_V5 -----
component BBTD16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD16SMP_V5 -----
component BBTD16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD16SP_V5 -----
component BBTD16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD24P_V5 -----
component BBTD24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD24SMP_V5 -----
component BBTD24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTD24SP_V5 -----
component BBTD24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU1P_V5 -----
component BBTU1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU4P_V5 -----
component BBTU4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU4SMP_V5 -----
component BBTU4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU8P_V5 -----
component BBTU8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU8SMP_V5 -----
component BBTU8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU8SP_V5 -----
component BBTU8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU16P_V5 -----
component BBTU16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU16SMP_V5 -----
component BBTU16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU16SP_V5 -----
component BBTU16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU24P_V5 -----
component BBTU24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU24SMP_V5 -----
component BBTU24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBTU24SP_V5 -----
component BBTU24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BT1P_V5 -----
component BT1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT2P_V5 -----
component BT2P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT4P_V5 -----
component BT4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT4SMP_V5 -----
component BT4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT8P_V5 -----
component BT8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT8SMP_V5 -----
component BT8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT8SP_V5 -----
component BT8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT12P_V5 -----
component BT12P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT12SMP_V5 -----
component BT12SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT12SP_V5 -----
component BT12SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT16P_V5 -----
component BT16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT16SMP_V5 -----
component BT16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT16SP_V5 -----
component BT16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT24P_V5 -----
component BT24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT24SMP_V5 -----
component BT24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT24SP_V5 -----
component BT24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU1P_V5 -----
component BU1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU2P_V5 -----
component BU2P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU4P_V5 -----
component BU4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU4SMP_V5 -----
component BU4SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU8P_V5 -----
component BU8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU8SMP_V5 -----
component BU8SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU8SP_V5 -----
component BU8SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU12P_V5 -----
component BU12P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU12SMP_V5 -----
component BU12SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU12SP_V5 -----
component BU12SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU16P_V5 -----
component BU16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU16SMP_V5 -----
component BU16SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU16SP_V5 -----
component BU16SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU24P_V5 -----
component BU24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU24SMP_V5 -----
component BU24SMP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU24SP_V5 -----
component BU24SP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD1P_V5 -----
component BUDD1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD2P_V5 -----
component BUDD2P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD4P_V5 -----
component BUDD4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD8P_V5 -----
component BUDD8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD12P_V5 -----
component BUDD12P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD16P_V5 -----
component BUDD16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDD24P_V5 -----
component BUDD24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU1P_V5 -----
component BUDU1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU2P_V5 -----
component BUDU2P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU4P_V5 -----
component BUDU4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU8P_V5 -----
component BUDU8P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU12P_V5 -----
component BUDU12P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU16P_V5 -----
component BUDU16P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BUDU24P_V5 -----
component BUDU24P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component CBU1P_V5 -----
component CBU1P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Y                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component CBU2P_V5 -----
component CBU2P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Y                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component GND5ALLP_V5 -----
component GND5ALLP_V5
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


----- Component GND5IP_V5 -----
component GND5IP_V5
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


----- Component GND5OP_V5 -----
component GND5OP_V5
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


----- Component GND5RP_V5 -----
component GND5RP_V5
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


----- Component ICCK2P_V5 -----
component ICCK2P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICCK4P_V5 -----
component ICCK4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICDP_V5 -----
component ICDP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICP_V5 -----
component ICP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICUP_V5 -----
component ICUP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ISDP_V5 -----
component ISDP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ISP_V5 -----
component ISP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ISUP_V5 -----
component ISUP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITCK2P_V5 -----
component ITCK2P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITCK4P_V5 -----
component ITCK4P_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITDP_V5 -----
component ITDP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITP_V5 -----
component ITP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ITUP_V5 -----
component ITUP_V5
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component VDD3IP_V5 -----
component VDD3IP_V5
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


----- Component VDD3RP_V5 -----
component VDD3RP_V5
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


----- Component VDD5ALLP_V5 -----
component VDD5ALLP_V5
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


----- Component VDD5OP_V5 -----
component VDD5OP_V5
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


----- Component VDD5RP_V5 -----
component VDD5RP_V5
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
