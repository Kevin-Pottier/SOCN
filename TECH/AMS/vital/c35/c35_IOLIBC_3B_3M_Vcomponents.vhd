
----------------------------------------------------------------
-- FILENAME     :    c35_IOLIBC_3B_4M_Vcomponents.vhd
-- FILE CONTENTS:    VITAL Component Package
-- DATE CREATED :    Wed Jan 22 14:59:15 2003
-- 
-- LIBRARY      :    c35_IOLIBC_3B_4M
-- DATE ENTERED :    $Date: 2001/09/25 12:07:08 $
-- REVISION     :    $Id: csx_IOLIB_3M.lib,v 1.3 2001/09/25 12:07:08 mbo Exp 
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    0.01 ns
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


----- Component BBC1C_3B -----
component BBC1C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;



----- Component BBC4C_3B -----
component BBC4C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC4SMC_3B -----
component BBC4SMC_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBC24C_3B -----
component BBC24C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;



----- Component BBCU8SC_3B -----
component BBCU8SC_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component BBCU24SMC_3B -----
component BBCU24SMC_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;



----- Component BBCU4C_3B -----
component BBCU4C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;



----- Component BT24SMC_3B -----
component BT24SMC_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BT1C_3B -----
component BT1C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;



----- Component BU1C_3B -----
component BU1C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;


----- Component BU4C_3B -----
component BU4C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
end component;



----- Component GND3ALLC_3B -----
component GND3ALLC_3B
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


----- Component GND3IC_3B -----
component GND3IC_3B
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


----- Component GND3OC_3B -----
component GND3OC_3B
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


----- Component GND3RC_3B -----
component GND3RC_3B
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


----- Component ICCK2C_3B -----
component ICCK2C_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICDC_3B -----
component ICDC_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICC_3B -----
component ICC_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component ICUC_3B -----
component ICUC_3B
-- synopsys translate_off
   generic(
      TimingChecksOn: Boolean := DefaultTimingChecksOn;
      InstancePath: STRING := "*";
      Xon: Boolean := DefaultXon;
      MsgOn: Boolean := DefaultMsgOn;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

-- synopsys translate_on
   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
end component;


----- Component VDD3ALLC_3B -----
component VDD3ALLC_3B
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


----- Component VDD3IC_3B -----
component VDD3IC_3B
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


----- Component VDD3OC_3B -----
component VDD3OC_3B
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


----- Component VDD3RC_3B -----
component VDD3RC_3B
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


----- Component VSUBC_3B -----
component VSUBC_3B
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
