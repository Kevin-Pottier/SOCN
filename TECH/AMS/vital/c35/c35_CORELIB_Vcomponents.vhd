
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
-- synopsys translate_on

package VCOMPONENTS is

constant DefaultTimingChecksOn : Boolean := True;
constant DefaultXon : Boolean := True;
constant DefaultMsgOn : Boolean := True;

----- Component ADD21 -----
component ADD21
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      CO                             :	out   STD_ULOGIC;
      S                              :	out   STD_ULOGIC);
end component;


----- Component ADD22 -----
component ADD22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      CO                             :	out   STD_ULOGIC;
      S                              :	out   STD_ULOGIC);
end component;


----- Component ADD31 -----
component ADD31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_CI_CO                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_CI_S                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_CI                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      CI                             :	in    STD_ULOGIC;
      CO                             :	out   STD_ULOGIC;
      S                              :	out   STD_ULOGIC);
end component;


----- Component ADD32 -----
component ADD32
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_CO                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_CI_CO                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_S                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_CI_S                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_CI                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      CI                             :	in    STD_ULOGIC;
      CO                             :	out   STD_ULOGIC;
      S                              :	out   STD_ULOGIC);
end component;


----- Component AOI210 -----
component AOI210
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI211 -----
component AOI211
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI212 -----
component AOI212
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI220 -----
component AOI220
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI221 -----
component AOI221
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI222 -----
component AOI222
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI310 -----
component AOI310
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI311 -----
component AOI311
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI312 -----
component AOI312
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI2110 -----
component AOI2110
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI2111 -----
component AOI2111
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component AOI2112 -----
component AOI2112
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUF2 -----
component BUF2
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUF4 -----
component BUF4
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUF6 -----
component BUF6
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUF8 -----
component BUF8
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUF12 -----
component BUF12
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUF15 -----
component BUF15
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFE2 -----
component BUFE2
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_E_Q                        :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFE4 -----
component BUFE4
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_E_Q                        :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFE6 -----
component BUFE6
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_E_Q                        :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFE8 -----
component BUFE8
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_E_Q                        :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFE10 -----
component BUFE10
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_E_Q                        :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFE12 -----
component BUFE12
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_E_Q                        :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFE15 -----
component BUFE15
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_E_Q                        :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFT2 -----
component BUFT2
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_Q                       :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFT4 -----
component BUFT4
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_Q                       :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFT6 -----
component BUFT6
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_Q                       :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFT8 -----
component BUFT8
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_Q                       :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFT10 -----
component BUFT10
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_Q                       :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFT12 -----
component BUFT12
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_Q                       :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUFT15 -----
component BUFT15
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_Q                       :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component BUSHD -----
component BUSHD
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	inout STD_ULOGIC := 'Z');
end component;


----- Component CLKBU2 -----
component CLKBU2
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKBU4 -----
component CLKBU4
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKBU6 -----
component CLKBU6
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKBU8 -----
component CLKBU8
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKBU12 -----
component CLKBU12
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKBU15 -----
component CLKBU15
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN0 -----
component CLKIN0
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN1 -----
component CLKIN1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN2 -----
component CLKIN2
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN3 -----
component CLKIN3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN4 -----
component CLKIN4
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN6 -----
component CLKIN6
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN8 -----
component CLKIN8
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN10 -----
component CLKIN10
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN12 -----
component CLKIN12
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component CLKIN15 -----
component CLKIN15
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DF1 -----
component DF1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component DF3 -----
component DF3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component DFC1 -----
component DFC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DFC3 -----
component DFC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DFCP1 -----
component DFCP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFCP3 -----
component DFCP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFE1 -----
component DFE1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component DFE3 -----
component DFE3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component DFEC1 -----
component DFEC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DFEC3 -----
component DFEC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DFECP1 -----
component DFECP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFECP3 -----
component DFECP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFEP1 -----
component DFEP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFEP3 -----
component DFEP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFP1 -----
component DFP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFP3 -----
component DFP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := -1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFS1 -----
component DFS1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFS3 -----
component DFS3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFSC1 -----
component DFSC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFSC3 -----
component DFSC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFSCP1 -----
component DFSCP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFSCP3 -----
component DFSCP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFSE1 -----
component DFSE1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFSE3 -----
component DFSE3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFSEC1 -----
component DFSEC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFSEC3 -----
component DFSEC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 0 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component DFSECP1 -----
component DFSECP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFSECP3 -----
component DFSECP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFSEP1 -----
component DFSEP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFSEP3 -----
component DFSEP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_E_C_posedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFSP1 -----
component DFSP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DFSP3 -----
component DFSP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_D_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_D_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_D_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DL1 -----
component DL1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component DL3 -----
component DL3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component DLC1 -----
component DLC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := -1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DLC3 -----
component DLC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := -1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DLCP1 -----
component DLCP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := -1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := -1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLCP3 -----
component DLCP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := -1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := -1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLCPQ1 -----
component DLCPQ1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLCPQ3 -----
component DLCPQ3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLCQ1 -----
component DLCQ1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DLCQ3 -----
component DLCQ3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_RN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component DLP1 -----
component DLP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLP3 -----
component DLP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := -1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLPQ1 -----
component DLPQ1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLPQ3 -----
component DLPQ3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SN_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_GN_posedge_posedge :	VitalDelayType := 0 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component DLQ1 -----
component DLQ1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLQ3 -----
component DLQ3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_GN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_GN_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_D_GN_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_D_GN_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_D_GN_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_GN_negedge                 :	VitalDelayType := 1 ps;
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_GN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      D                              :	in    STD_ULOGIC;
      GN                             :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLY12 -----
component DLY12
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLY22 -----
component DLY22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLY32 -----
component DLY32
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLY42 -----
component DLY42
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component IMAJ30 -----
component IMAJ30
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component IMAJ31 -----
component IMAJ31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component IMUX20 -----
component IMUX20
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component IMUX21 -----
component IMUX21
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component IMUX22 -----
component IMUX22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component IMUX23 -----
component IMUX23
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component IMUX24 -----
component IMUX24
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component IMUX30 -----
component IMUX30
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component IMUX31 -----
component IMUX31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component IMUX32 -----
component IMUX32
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component IMUX33 -----
component IMUX33
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component IMUX40 -----
component IMUX40
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component IMUX41 -----
component IMUX41
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component IMUX42 -----
component IMUX42
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component INV0 -----
component INV0
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV1 -----
component INV1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV2 -----
component INV2
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV3 -----
component INV3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV4 -----
component INV4
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV6 -----
component INV6
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV8 -----
component INV8
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV10 -----
component INV10
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV12 -----
component INV12
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component INV15 -----
component INV15
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JK1 -----
component JK1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component JK3 -----
component JK3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC);
end component;


----- Component JKC1 -----
component JKC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component JKC3 -----
component JKC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component JKCP1 -----
component JKCP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component JKCP3 -----
component JKCP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component JKP1 -----
component JKP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component JKP3 -----
component JKP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component JKS1 -----
component JKS1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := -1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component JKS3 -----
component JKS3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := -1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component JKSC1 -----
component JKSC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := -1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component JKSC3 -----
component JKSC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component JKSCP1 -----
component JKSCP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component JKSCP3 -----
component JKSCP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component JKSP1 -----
component JKSP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := -1 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component JKSP3 -----
component JKSP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_J_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_J_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_J_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_J_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_K_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_K_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_K_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_K_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_J                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_K                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component MAJ31 -----
component MAJ31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component MAJ32 -----
component MAJ32
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component MUX21 -----
component MUX21
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component MUX22 -----
component MUX22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component MUX24 -----
component MUX24
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component MUX26 -----
component MUX26
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S                              :	in    STD_ULOGIC);
end component;


----- Component MUX31 -----
component MUX31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component MUX32 -----
component MUX32
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component MUX33 -----
component MUX33
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component MUX34 -----
component MUX34
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component MUX41 -----
component MUX41
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component MUX42 -----
component MUX42
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component MUX43 -----
component MUX43
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_S0_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_S1_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC);
end component;


----- Component NAND20 -----
component NAND20
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND21 -----
component NAND21
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND22 -----
component NAND22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND23 -----
component NAND23
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND24 -----
component NAND24
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND26 -----
component NAND26
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND28 -----
component NAND28
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND30 -----
component NAND30
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND31 -----
component NAND31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND32 -----
component NAND32
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND33 -----
component NAND33
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND34 -----
component NAND34
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND40 -----
component NAND40
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND41 -----
component NAND41
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND42 -----
component NAND42
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NAND43 -----
component NAND43
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR20 -----
component NOR20
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR21 -----
component NOR21
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR22 -----
component NOR22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR23 -----
component NOR23
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR24 -----
component NOR24
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR30 -----
component NOR30
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR31 -----
component NOR31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR32 -----
component NOR32
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR33 -----
component NOR33
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR40 -----
component NOR40
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR41 -----
component NOR41
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component NOR42 -----
component NOR42
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI210 -----
component OAI210
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI211 -----
component OAI211
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI212 -----
component OAI212
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI220 -----
component OAI220
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI221 -----
component OAI221
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI222 -----
component OAI222
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI310 -----
component OAI310
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI311 -----
component OAI311
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI312 -----
component OAI312
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI2110 -----
component OAI2110
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI2111 -----
component OAI2111
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component OAI2112 -----
component OAI2112
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFC1 -----
component TFC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component TFC3 -----
component TFC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC);
end component;


----- Component TFCP1 -----
component TFCP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TFCP3 -----
component TFCP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TFEC1 -----
component TFEC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFEC3 -----
component TFEC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFECP1 -----
component TFECP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFECP3 -----
component TFECP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFEP1 -----
component TFEP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFEP3 -----
component TFEP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := -1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFP1 -----
component TFP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TFP3 -----
component TFP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TFSC1 -----
component TFSC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component TFSC3 -----
component TFSC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC);
end component;


----- Component TFSCP1 -----
component TFSCP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TFSCP3 -----
component TFSCP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TFSEC1 -----
component TFSEC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := -1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFSEC3 -----
component TFSEC3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_RN_Q                       :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := 1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := -1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFSECP1 -----
component TFSECP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFSECP3 -----
component TFSECP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_RN_Q                       :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_RN_QN                      :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      trecovery_RN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_RN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_RN_negedge                 :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_RN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      RN                             :	in    STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFSEP1 -----
component TFSEP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFSEP3 -----
component TFSEP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := -1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_T_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_T_C_negedge_posedge      :	VitalDelayType := 1 ps;
      tsetup_T_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_T_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_T                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC;
      T                              :	in    STD_ULOGIC);
end component;


----- Component TFSP1 -----
component TFSP1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TFSP3 -----
component TFSP3
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_SN_Q                       :	VitalDelayType01 := (1 ps, 0 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_SN_QN                      :	VitalDelayType01 := (0 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_SD_C_posedge_posedge     :	VitalDelayType := -1 ps;
      thold_SD_C_negedge_posedge     :	VitalDelayType := -1 ps;
      tsetup_SD_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SD_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := -1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 0 ps;
      trecovery_SN_C_posedge_posedge :	VitalDelayType := 0 ps;
      thold_SN_C_posedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_posedge                  :	VitalDelayType := 1 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tpw_SN_negedge                 :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SD                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SN                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      QN                             :	out   STD_ULOGIC;
      SD                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      SN                             :	in    STD_ULOGIC);
end component;


----- Component TIE0 -----
component TIE0
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      Q                              :	out   STD_ULOGIC := '0');
end component;


----- Component TIE1 -----
component TIE1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      Q                              :	out   STD_ULOGIC := '1');
end component;


----- Component XNR20 -----
component XNR20
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XNR21 -----
component XNR21
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XNR22 -----
component XNR22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XNR30 -----
component XNR30
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XNR31 -----
component XNR31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XNR40 -----
component XNR40
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XNR41 -----
component XNR41
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XOR20 -----
component XOR20
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XOR21 -----
component XOR21
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XOR22 -----
component XOR22
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XOR30 -----
component XOR30
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XOR31 -----
component XOR31
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XOR40 -----
component XOR40
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component XOR41 -----
component XOR41
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_B_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_D_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_B                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_D                         :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      B                              :	in    STD_ULOGIC;
      C                              :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLSG1 -----
component DLSG1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_GCK                      :	VitalDelayType01 := (1 ps, 1 ps);
      tsetup_E_C_posedge_posedge     :	VitalDelayType := 1 ps;
      tsetup_E_C_negedge_posedge     :	VitalDelayType := 1 ps;
      thold_E_C_posedge_posedge      :	VitalDelayType := 0 ps;
      thold_E_C_negedge_posedge      :	VitalDelayType := 0 ps;
      tsetup_SE_C_posedge_posedge    :	VitalDelayType := 1 ps;
      tsetup_SE_C_negedge_posedge    :	VitalDelayType := 1 ps;
      thold_SE_C_posedge_posedge     :	VitalDelayType := 0 ps;
      thold_SE_C_negedge_posedge     :	VitalDelayType := 0 ps;
      tpw_C_negedge                  :	VitalDelayType := 1 ps;
      tipd_C                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_E                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_SE                        :	VitalDelayType01 := (0 ps, 0 ps));

-- synopsys translate_on
   port(
      C                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      GCK                            :	out   STD_ULOGIC);
end component;



----- Component LOGIC0 -----
component LOGIC0
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      Q                              :	out   STD_ULOGIC := '0');
end component;


----- Component LOGIC1 -----
component LOGIC1
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn);

-- synopsys translate_on
   port(
      Q                              :	out   STD_ULOGIC := '1');
end component;




end VCOMPONENTS;

---- end of VITAL components library ----
