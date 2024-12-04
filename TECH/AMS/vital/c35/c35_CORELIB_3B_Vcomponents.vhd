
----------------------------------------------------------------
-- 
-- DATE CREATED :    Tue Aug  6 2006
-- 
-- LIBRARY      :    c35_CORELIB_3B
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
component ADD21_3B
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
component ADD22_3B
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
component ADD31_3B
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
component ADD32_3B
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
component AOI210_3B
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
component AOI211_3B
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
component AOI212_3B
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
component AOI220_3B
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
component AOI221_3B
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
component AOI222_3B
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
component AOI310_3B
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
component AOI311_3B
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
component AOI312_3B
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
component AOI2110_3B
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
component AOI2111_3B
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
component AOI2112_3B
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
component BUF2_3B
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
component BUF4_3B
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
component BUF6_3B
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
component BUF8_3B
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
component BUF12_3B
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
component BUF15_3B
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
component BUFE2_3B
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
component BUFE4_3B
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
component BUFE6_3B
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
component BUFE8_3B
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
component BUFE12_3B
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
component BUFE15_3B
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


----- Component BUSHD -----
component BUSHD_3B
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


----- Component BUFT2 -----
component BUFT2_3B
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
component BUFT4_3B
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
component BUFT6_3B
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
component BUFT8_3B
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
component BUFT12_3B
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
component BUFT15_3B
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


----- Component CLKBUF2 -----
component CLKBUF2_3B
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


----- Component CLKBUF4 -----
component CLKBUF4_3B
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


----- Component CLKBUF6 -----
component CLKBUF6_3B
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


----- Component CLKBUF8 -----
component CLKBUF8_3B
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


----- Component CLKBUF12 -----
component CLKBUF12_3B
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


----- Component CLKBUF15 -----
component CLKBUF15_3B
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
component CLKIN0_3B
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
component CLKIN1_3B
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
component CLKIN2_3B
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
component CLKIN3_3B
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
component CLKIN4_3B
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
component CLKIN6_3B
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
component CLKIN8_3B
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
component CLKIN10_3B
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
component CLKIN12_3B
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
component CLKIN15_3B
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
component DF1_3B
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
component DF3_3B
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
component DFC1_3B
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
component DFC3_3B
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
component DFCP1_3B
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
component DFCP3_3B
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
component DFE1_3B
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
component DFE3_3B
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
component DFEC1_3B
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
component DFEC3_3B
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
component DFECP1_3B
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
component DFECP3_3B
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
component DFEP1_3B
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
component DFEP3_3B
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
component DFP1_3B
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
component DFP3_3B
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
component DFS1_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_C_Q                        :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_C_QN                       :	VitalDelayType01 := (1 ps, 1 ps);
      thold_D_C_negedge_posedge      :	VitalDelayType := 0 ps;
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
component DFS3_3B
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
component DFSC1_3B
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
component DFSC3_3B
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
component DFSCP1_3B
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
component DFSCP3_3B
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
component DFSE1_3B
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
component DFSE3_3B
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
component DFSEC1_3B
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
component DFSEC3_3B
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
component DFSECP1_3B
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
component DFSECP3_3B
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
component DFSEP1_3B
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
component DFSEP3_3B
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
component DFSP1_3B
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
component DFSP3_3B
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
component DL1_3B
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
component DL3_3B
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
component DLC1_3B
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
component DLC3_3B
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
component DLCP1_3B
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
component DLCP3_3B
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
component DLCPQ1_3B
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
component DLCPQ3_3B
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
component DLCQ1_3B
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
component DLCQ3_3B
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
component DLP1_3B
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
component DLP3_3B
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
component DLPQ1_3B
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
component DLPQ3_3B
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
component DLQ1_3B
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
component DLQ3_3B
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
component DLY12_3B
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
component DLY22_3B
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
component DLY32_3B
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
component DLY42_3B
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
component IMAJ30_3B
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
component IMAJ31_3B
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


----- Component IMU20 -----
component IMU20_3B
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


----- Component IMU21 -----
component IMU21_3B
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


----- Component IMU22 -----
component IMU22_3B
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


----- Component IMU23 -----
component IMU23_3B
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


----- Component IMU24 -----
component IMU24_3B
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


----- Component IMU30 -----
component IMU30_3B
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


----- Component IMU31 -----
component IMU31_3B
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


----- Component IMU32 -----
component IMU32_3B
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


----- Component IMU33 -----
component IMU33_3B
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


----- Component IMU40 -----
component IMU40_3B
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


----- Component IMU41 -----
component IMU41_3B
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


----- Component IMU42 -----
component IMU42_3B
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


----- Component IN0 -----
component IN0_3B
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


----- Component IN1 -----
component IN1_3B
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


----- Component IN2 -----
component IN2_3B
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


----- Component IN3 -----
component IN3_3B
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


----- Component IN4 -----
component IN4_3B
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


----- Component IN6 -----
component IN6_3B
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


----- Component IN8 -----
component IN8_3B
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


----- Component IN10 -----
component IN10_3B
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


----- Component IN12 -----
component IN12_3B
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


----- Component IN15 -----
component IN15_3B
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
component JK1_3B
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
component JK3_3B
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
component JKC1_3B
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
component JKC3_3B
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
component JKCP1_3B
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
component JKCP3_3B
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
component JKP1_3B
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
component JKP3_3B
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
component JKS1_3B
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
component JKS3_3B
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
component JKSC1_3B
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
component JKSC3_3B
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
component JKSCP1_3B
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
component JKSCP3_3B
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
component JKSP1_3B
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
component JKSP3_3B
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


----- Component LOGIC0 -----
component LOGIC0_3B
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
component LOGIC1_3B
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


----- Component MAJ31 -----
component MAJ31_3B
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
component MAJ32_3B
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


----- Component MU21 -----
component MU21_3B
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


----- Component MU22 -----
component MU22_3B
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


----- Component MU24 -----
component MU24_3B
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


----- Component MU26 -----
component MU26_3B
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


----- Component MU31 -----
component MU31_3B
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


----- Component MU32 -----
component MU32_3B
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


----- Component MU33 -----
component MU33_3B
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


----- Component MU34 -----
component MU34_3B
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


----- Component MU41 -----
component MU41_3B
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


----- Component MU42 -----
component MU42_3B
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


----- Component MU43 -----
component MU43_3B
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


----- Component NA20 -----
component NA20_3B
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


----- Component NA21 -----
component NA21_3B
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


----- Component NA22 -----
component NA22_3B
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


----- Component NA23 -----
component NA23_3B
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


----- Component NA24 -----
component NA24_3B
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


----- Component NA26 -----
component NA26_3B
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


----- Component NA28 -----
component NA28_3B
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


----- Component NA30 -----
component NA30_3B
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


----- Component NA31 -----
component NA31_3B
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


----- Component NA32 -----
component NA32_3B
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


----- Component NA33 -----
component NA33_3B
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


----- Component NA34 -----
component NA34_3B
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


----- Component NA40 -----
component NA40_3B
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


----- Component NA41 -----
component NA41_3B
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


----- Component NA42 -----
component NA42_3B
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


----- Component NA43 -----
component NA43_3B
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


----- Component NO20 -----
component NO20_3B
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


----- Component NO21 -----
component NO21_3B
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


----- Component NO22 -----
component NO22_3B
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


----- Component NO23 -----
component NO23_3B
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


----- Component NO24 -----
component NO24_3B
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


----- Component NO30 -----
component NO30_3B
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


----- Component NO31 -----
component NO31_3B
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


----- Component NO32 -----
component NO32_3B
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


----- Component NO33 -----
component NO33_3B
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


----- Component NO40 -----
component NO40_3B
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


----- Component NO41 -----
component NO41_3B
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


----- Component NO42 -----
component NO42_3B
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
component OAI210_3B
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
component OAI211_3B
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
component OAI212_3B
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
component OAI220_3B
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
component OAI221_3B
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
component OAI222_3B
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
component OAI310_3B
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
component OAI311_3B
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
component OAI312_3B
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
component OAI2110_3B
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
component OAI2111_3B
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
component OAI2112_3B
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
component TFC1_3B
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
component TFC3_3B
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
component TFCP1_3B
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
component TFCP3_3B
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
component TFEC1_3B
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
component TFEC3_3B
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
component TFECP1_3B
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
component TFECP3_3B
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
component TFEP1_3B
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
component TFEP3_3B
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
component TFP1_3B
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
component TFP3_3B
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
component TFSC1_3B
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
component TFSC3_3B
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
component TFSCP1_3B
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
component TFSCP3_3B
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
component TFSEC1_3B
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
component TFSEC3_3B
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
component TFSECP1_3B
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
component TFSECP3_3B
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
component TFSEP1_3B
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
component TFSEP3_3B
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
component TFSP1_3B
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
component TFSP3_3B
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


----- Component XNR20 -----
component XNR20_3B
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
component XNR21_3B
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
component XNR22_3B
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
component XNR30_3B
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
component XNR31_3B
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
component XNR40_3B
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
component XNR41_3B
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
component XOR20_3B
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
component XOR21_3B
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
component XOR22_3B
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
component XOR30_3B
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
component XOR31_3B
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
component XOR40_3B
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
component XOR41_3B
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



----- Component DLSG1_3B -----
component DLSG1_3B
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



end VCOMPONENTS;

---- end of VITAL components library ----
