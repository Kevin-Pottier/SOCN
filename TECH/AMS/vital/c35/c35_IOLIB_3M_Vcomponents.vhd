
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler 2000.11
-- FILE CONTENTS:    VITAL Component Package
-- DATE CREATED :    Thu Jun 27 17:07:29 2002
-- 
-- LIBRARY      :    c35_IOLIB_4M
-- DATE ENTERED :    $Date: 2001/09/25 12:07:08 $
-- REVISION     :    $Id: csx_IOLIB_3M.lib,v 1.3 2001/09/25 12:07:08 mbo Exp mbo $
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

----- Component BBC1P -----
component BBC1P
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


----- Component BBC4P -----
component BBC4P
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


----- Component BBC4SMP -----
component BBC4SMP
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


----- Component BBC8P -----
component BBC8P
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


----- Component BBC8SMP -----
component BBC8SMP
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


----- Component BBC8SP -----
component BBC8SP
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


----- Component BBC16P -----
component BBC16P
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


----- Component BBC16SMP -----
component BBC16SMP
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


----- Component BBC16SP -----
component BBC16SP
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


----- Component BBC24P -----
component BBC24P
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


----- Component BBC24SMP -----
component BBC24SMP
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


----- Component BBC24SP -----
component BBC24SP
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


----- Component BBCD1P -----
component BBCD1P
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


----- Component BBCD4P -----
component BBCD4P
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


----- Component BBCD4SMP -----
component BBCD4SMP
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


----- Component BBCD8P -----
component BBCD8P
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


----- Component BBCD8SMP -----
component BBCD8SMP
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


----- Component BBCD8SP -----
component BBCD8SP
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


----- Component BBCD16P -----
component BBCD16P
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


----- Component BBCD16SMP -----
component BBCD16SMP
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


----- Component BBCD16SP -----
component BBCD16SP
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


----- Component BBCD24P -----
component BBCD24P
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


----- Component BBCD24SMP -----
component BBCD24SMP
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


----- Component BBCD24SP -----
component BBCD24SP
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


----- Component BBCU1P -----
component BBCU1P
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


----- Component BBCU4P -----
component BBCU4P
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


----- Component BBCU4SMP -----
component BBCU4SMP
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


----- Component BBCU8P -----
component BBCU8P
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


----- Component BBCU8SMP -----
component BBCU8SMP
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


----- Component BBCU8SP -----
component BBCU8SP
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


----- Component BBCU16P -----
component BBCU16P
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


----- Component BBCU16SMP -----
component BBCU16SMP
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


----- Component BBCU16SP -----
component BBCU16SP
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


----- Component BBCU24P -----
component BBCU24P
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


----- Component BBCU24SMP -----
component BBCU24SMP
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


----- Component BBCU24SP -----
component BBCU24SP
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


----- Component BBS1P -----
component BBS1P
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


----- Component BBS4P -----
component BBS4P
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


----- Component BBS4SMP -----
component BBS4SMP
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


----- Component BBS8P -----
component BBS8P
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


----- Component BBS8SMP -----
component BBS8SMP
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


----- Component BBS8SP -----
component BBS8SP
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


----- Component BBS16P -----
component BBS16P
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


----- Component BBS16SMP -----
component BBS16SMP
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


----- Component BBS16SP -----
component BBS16SP
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


----- Component BBS24P -----
component BBS24P
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


----- Component BBS24SMP -----
component BBS24SMP
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


----- Component BBS24SP -----
component BBS24SP
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


----- Component BBSD1P -----
component BBSD1P
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


----- Component BBSD4P -----
component BBSD4P
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


----- Component BBSD4SMP -----
component BBSD4SMP
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


----- Component BBSD8P -----
component BBSD8P
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


----- Component BBSD8SMP -----
component BBSD8SMP
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


----- Component BBSD8SP -----
component BBSD8SP
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


----- Component BBSD16P -----
component BBSD16P
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


----- Component BBSD16SMP -----
component BBSD16SMP
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


----- Component BBSD16SP -----
component BBSD16SP
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


----- Component BBSD24P -----
component BBSD24P
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


----- Component BBSD24SMP -----
component BBSD24SMP
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


----- Component BBSD24SP -----
component BBSD24SP
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


----- Component BBSU1P -----
component BBSU1P
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


----- Component BBSU4P -----
component BBSU4P
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


----- Component BBSU4SMP -----
component BBSU4SMP
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


----- Component BBSU8P -----
component BBSU8P
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


----- Component BBSU8SMP -----
component BBSU8SMP
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


----- Component BBSU8SP -----
component BBSU8SP
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


----- Component BBSU16P -----
component BBSU16P
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


----- Component BBSU16SMP -----
component BBSU16SMP
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


----- Component BBSU16SP -----
component BBSU16SP
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


----- Component BBSU24P -----
component BBSU24P
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


----- Component BBSU24SMP -----
component BBSU24SMP
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


----- Component BBSU24SP -----
component BBSU24SP
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


----- Component BBT1P -----
component BBT1P
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


----- Component BBT4P -----
component BBT4P
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


----- Component BBT4SMP -----
component BBT4SMP
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


----- Component BBT8P -----
component BBT8P
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


----- Component BBT8SMP -----
component BBT8SMP
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


----- Component BBT8SP -----
component BBT8SP
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


----- Component BBT16P -----
component BBT16P
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


----- Component BBT16SMP -----
component BBT16SMP
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


----- Component BBT16SP -----
component BBT16SP
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


----- Component BBT24P -----
component BBT24P
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


----- Component BBT24SMP -----
component BBT24SMP
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


----- Component BBT24SP -----
component BBT24SP
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


----- Component BBTD1P -----
component BBTD1P
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


----- Component BBTD4P -----
component BBTD4P
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


----- Component BBTD4SMP -----
component BBTD4SMP
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


----- Component BBTD8P -----
component BBTD8P
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


----- Component BBTD8SMP -----
component BBTD8SMP
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


----- Component BBTD8SP -----
component BBTD8SP
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


----- Component BBTD16P -----
component BBTD16P
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


----- Component BBTD16SMP -----
component BBTD16SMP
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


----- Component BBTD16SP -----
component BBTD16SP
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


----- Component BBTD24P -----
component BBTD24P
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


----- Component BBTD24SMP -----
component BBTD24SMP
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


----- Component BBTD24SP -----
component BBTD24SP
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


----- Component BBTU1P -----
component BBTU1P
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


----- Component BBTU4P -----
component BBTU4P
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


----- Component BBTU4SMP -----
component BBTU4SMP
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


----- Component BBTU8P -----
component BBTU8P
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


----- Component BBTU8SMP -----
component BBTU8SMP
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


----- Component BBTU8SP -----
component BBTU8SP
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


----- Component BBTU16P -----
component BBTU16P
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


----- Component BBTU16SMP -----
component BBTU16SMP
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


----- Component BBTU16SP -----
component BBTU16SP
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


----- Component BBTU24P -----
component BBTU24P
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


----- Component BBTU24SMP -----
component BBTU24SMP
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


----- Component BBTU24SP -----
component BBTU24SP
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


----- Component BT1P -----
component BT1P
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


----- Component BT2P -----
component BT2P
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


----- Component BT4P -----
component BT4P
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


----- Component BT4SMP -----
component BT4SMP
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


----- Component BT8P -----
component BT8P
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


----- Component BT8SMP -----
component BT8SMP
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


----- Component BT8SP -----
component BT8SP
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


----- Component BT12P -----
component BT12P
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


----- Component BT12SMP -----
component BT12SMP
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


----- Component BT12SP -----
component BT12SP
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


----- Component BT16P -----
component BT16P
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


----- Component BT16SMP -----
component BT16SMP
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


----- Component BT16SP -----
component BT16SP
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


----- Component BT24P -----
component BT24P
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


----- Component BT24SMP -----
component BT24SMP
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


----- Component BT24SP -----
component BT24SP
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


----- Component BU1P -----
component BU1P
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


----- Component BU2P -----
component BU2P
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


----- Component BU4P -----
component BU4P
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


----- Component BU4SMP -----
component BU4SMP
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


----- Component BU8P -----
component BU8P
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


----- Component BU8SMP -----
component BU8SMP
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


----- Component BU8SP -----
component BU8SP
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


----- Component BU12P -----
component BU12P
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


----- Component BU12SMP -----
component BU12SMP
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


----- Component BU12SP -----
component BU12SP
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


----- Component BU16P -----
component BU16P
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


----- Component BU16SMP -----
component BU16SMP
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


----- Component BU16SP -----
component BU16SP
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


----- Component BU24P -----
component BU24P
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


----- Component BU24SMP -----
component BU24SMP
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


----- Component BU24SP -----
component BU24SP
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


----- Component BUDD1P -----
component BUDD1P
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


----- Component BUDD2P -----
component BUDD2P
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


----- Component BUDD4P -----
component BUDD4P
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


----- Component BUDD8P -----
component BUDD8P
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


----- Component BUDD12P -----
component BUDD12P
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


----- Component BUDD16P -----
component BUDD16P
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


----- Component BUDD24P -----
component BUDD24P
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


----- Component BUDU1P -----
component BUDU1P
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


----- Component BUDU2P -----
component BUDU2P
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


----- Component BUDU4P -----
component BUDU4P
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


----- Component BUDU8P -----
component BUDU8P
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


----- Component BUDU12P -----
component BUDU12P
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


----- Component BUDU16P -----
component BUDU16P
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


----- Component BUDU24P -----
component BUDU24P
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


----- Component CBU1P -----
component CBU1P
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


----- Component CBU2P -----
component CBU2P
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


----- Component GND3ALLP -----
component GND3ALLP
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


----- Component GND3IP -----
component GND3IP
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


----- Component GND3OP -----
component GND3OP
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


----- Component GND3RP -----
component GND3RP
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


----- Component ICCK2P -----
component ICCK2P
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


----- Component ICCK4P -----
component ICCK4P
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


----- Component ICCK8P -----
component ICCK8P
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


----- Component ICCK16P -----
component ICCK16P
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


----- Component ICDP -----
component ICDP
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


----- Component ICP -----
component ICP
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


----- Component ICUP -----
component ICUP
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


----- Component ISDP -----
component ISDP
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


----- Component ISP -----
component ISP
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


----- Component ISUP -----
component ISUP
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


----- Component ITCK2P -----
component ITCK2P
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


----- Component ITCK4P -----
component ITCK4P
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


----- Component ITCK8P -----
component ITCK8P
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


----- Component ITCK16P -----
component ITCK16P
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


----- Component ITDP -----
component ITDP
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


----- Component ITP -----
component ITP
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


----- Component ITUP -----
component ITUP
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


----- Component VDD3ALLP -----
component VDD3ALLP
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


----- Component VDD3IP -----
component VDD3IP
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


----- Component VDD3OP -----
component VDD3OP
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


----- Component VDD3RP -----
component VDD3RP
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
