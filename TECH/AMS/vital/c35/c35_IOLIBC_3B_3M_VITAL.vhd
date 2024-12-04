
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler 2002.05-SP1
-- FILENAME     :    c35_IOLIBC_3B_4M_VITAL.vhd
-- FILE CONTENTS:    Entity, Structural Architecture(VITAL),
--                   and Configuration
-- DATE CREATED :    Wed Jan 22 14:59:15 2003
-- 
-- LIBRARY      :    c35_IOLIBC_3B_4M
-- DATE ENTERED :    $Date: 2001/09/25 12:07:08 $
-- REVISION     :    $Id: csx_IOLIB_3M.lib,v 1.3 2001/09/25 12:07:08 mbo Exp mbo $
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    0.01 ns
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    VITAL, TimingChecksOn(TRUE), XGenerationOn(TRUE), TimingMessage(TRUE), OnDetect 
--                   Owner: austriamicrosystems AG  HIT-Kit: Digital
-- HISTORY      :
-- 
----------------------------------------------------------------


----- CELL BBC1C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC1C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC1C_3B : entity is TRUE;
end BBC1C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BBC1C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';
   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd, PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 2) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);
   ALIAS Y_zd : STD_LOGIC is Results(2);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC1C_3B_VITAL of BBC1C_3B is
   for VITAL
   end for;
end CFG_BBC1C_3B_VITAL;



----- CELL BBC4C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC4C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC4C_3B : entity is TRUE;
end BBC4C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BBC4C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';
   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd, PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 2) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);
   ALIAS Y_zd : STD_LOGIC is Results(2);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC4C_3B_VITAL of BBC4C_3B is
   for VITAL
   end for;
end CFG_BBC4C_3B_VITAL;



----- CELL BBC24C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC24C_3B : entity is TRUE;
end BBC24C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BBC24C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';
   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd, PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 2) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);
   ALIAS Y_zd : STD_LOGIC is Results(2);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC24C_3B_VITAL of BBC24C_3B is
   for VITAL
   end for;
end CFG_BBC24C_3B_VITAL;


----- CELL BBCU24SMC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24SMC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU24SMC_3B : entity is TRUE;
end BBCU24SMC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BBCU24SMC_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';
   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd, PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 2) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);
   ALIAS Y_zd : STD_LOGIC is Results(2);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU24SMC_3B_VITAL of BBCU24SMC_3B is
   for VITAL
   end for;
end CFG_BBCU24SMC_3B_VITAL;


----- CELL BBCU4C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU4C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU4C_3B : entity is TRUE;
end BBCU4C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BBCU4C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';
   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd, PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 2) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);
   ALIAS Y_zd : STD_LOGIC is Results(2);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU4C_3B_VITAL of BBCU4C_3B is
   for VITAL
   end for;
end CFG_BBCU4C_3B_VITAL;



----- CELL BBCU8C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU8C_3B : entity is TRUE;
end BBCU8C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BBCU8C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';
   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd, PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 2) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);
   ALIAS Y_zd : STD_LOGIC is Results(2);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU8C_3B_VITAL of BBCU8C_3B is
   for VITAL
   end for;
end CFG_BBCU8C_3B_VITAL;



----- CELL BT1C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT1C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT1C_3B : entity is TRUE;
end BT1C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BT1C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT1C_3B_VITAL of BT1C_3B is
   for VITAL
   end for;
end CFG_BT1C_3B_VITAL;



----- CELL BT24SMC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24SMC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns);
      tipd_EN                        :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT24SMC_3B : entity is TRUE;
end BT24SMC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BT24SMC_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';
   SIGNAL EN_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   VitalWireDelay (EN_ipd, EN, tipd_EN);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd, EN_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := VitalBUFIF0 (data => A_ipd,
              enable => EN_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE),
                 1 => (EN_ipd'last_event, VitalExtendToFillDelay(tpd_EN_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT24SMC_3B_VITAL of BT24SMC_3B is
   for VITAL
   end for;
end CFG_BT24SMC_3B_VITAL;



----- CELL BU1C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU1C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU1C_3B : entity is TRUE;
end BU1C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BU1C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := TO_X01(A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, tpd_A_PAD, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU1C_3B_VITAL of BU1C_3B is
   for VITAL
   end for;
end CFG_BU1C_3B_VITAL;


----- CELL BU4C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU4C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_A                         :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU4C_3B : entity is TRUE;
end BU4C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of BU4C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL A_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (A_ipd, A, tipd_A);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS PAD_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE PAD_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      PAD_zd := TO_X01(A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, tpd_A_PAD, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU4C_3B_VITAL of BU4C_3B is
   for VITAL
   end for;
end CFG_BU4C_3B_VITAL;


----- CELL GND3ALLC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3ALLC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3ALLC_3B : entity is TRUE;
end GND3ALLC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of GND3ALLC_3B is

begin

   assert (FALSE)
     report "Cell GND3ALLC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3ALLC_3B_VITAL of GND3ALLC_3B is
   for VITAL
   end for;
end CFG_GND3ALLC_3B_VITAL;


----- CELL GND3IC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3IC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3IC_3B : entity is TRUE;
end GND3IC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of GND3IC_3B is

begin

   assert (FALSE)
     report "Cell GND3IC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3IC_3B_VITAL of GND3IC_3B is
   for VITAL
   end for;
end CFG_GND3IC_3B_VITAL;


----- CELL GND3OC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3OC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3OC_3B : entity is TRUE;
end GND3OC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of GND3OC_3B is

begin

   assert (FALSE)
     report "Cell GND3OC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3OC_3B_VITAL of GND3OC_3B is
   for VITAL
   end for;
end CFG_GND3OC_3B_VITAL;


----- CELL GND3RC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3RC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3RC_3B : entity is TRUE;
end GND3RC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of GND3RC_3B is

begin

   assert (FALSE)
     report "Cell GND3RC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3RC_3B_VITAL of GND3RC_3B is
   for VITAL
   end for;
end CFG_GND3RC_3B_VITAL;


----- CELL ICCK2C_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK2C_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICCK2C_3B : entity is TRUE;
end ICCK2C_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of ICCK2C_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS Y_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICCK2C_3B_VITAL of ICCK2C_3B is
   for VITAL
   end for;
end CFG_ICCK2C_3B_VITAL;



----- CELL ICDC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICDC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICDC_3B : entity is TRUE;
end ICDC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of ICDC_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS Y_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICDC_3B_VITAL of ICDC_3B is
   for VITAL
   end for;
end CFG_ICDC_3B_VITAL;


----- CELL ICC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICC_3B : entity is TRUE;
end ICC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of ICC_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS Y_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICC_3B_VITAL of ICC_3B is
   for VITAL
   end for;
end CFG_ICC_3B_VITAL;


----- CELL ICUC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICUC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.01 ns, 0.01 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.00 ns, 0.00 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICUC_3B : entity is TRUE;
end ICUC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of ICUC_3B is
   attribute VITAL_LEVEL1 of VITAL : architecture is TRUE;

   SIGNAL PAD_ipd	 : STD_ULOGIC := 'X';

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (PAD_ipd, PAD, tipd_PAD);
   end block;
   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (PAD_ipd)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS Y_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      Y_zd := TO_X01(PAD_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (PAD_ipd'last_event, tpd_PAD_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICUC_3B_VITAL of ICUC_3B is
   for VITAL
   end for;
end CFG_ICUC_3B_VITAL;


----- CELL VDD3ALLC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3ALLC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3ALLC_3B : entity is TRUE;
end VDD3ALLC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of VDD3ALLC_3B is

begin

   assert (FALSE)
     report "Cell VDD3ALLC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3ALLC_3B_VITAL of VDD3ALLC_3B is
   for VITAL
   end for;
end CFG_VDD3ALLC_3B_VITAL;


----- CELL VDD3IC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3IC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3IC_3B : entity is TRUE;
end VDD3IC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of VDD3IC_3B is

begin

   assert (FALSE)
     report "Cell VDD3IC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3IC_3B_VITAL of VDD3IC_3B is
   for VITAL
   end for;
end CFG_VDD3IC_3B_VITAL;


----- CELL VDD3OC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3OC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3OC_3B : entity is TRUE;
end VDD3OC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of VDD3OC_3B is

begin

   assert (FALSE)
     report "Cell VDD3OC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3OC_3B_VITAL of VDD3OC_3B is
   for VITAL
   end for;
end CFG_VDD3OC_3B_VITAL;


----- CELL VDD3RC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3RC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3RC_3B : entity is TRUE;
end VDD3RC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of VDD3RC_3B is

begin

   assert (FALSE)
     report "Cell VDD3RC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3RC_3B_VITAL of VDD3RC_3B is
   for VITAL
   end for;
end CFG_VDD3RC_3B_VITAL;


----- CELL VSUBC_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VSUBC_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VSUBC_3B : entity is TRUE;
end VSUBC_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBC_3B_4M;
use c35_IOLIBC_3B_4M.VTABLES.all;
architecture VITAL of VSUBC_3B is

begin

   assert (FALSE)
     report "Cell VSUBC_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VSUBC_3B_VITAL of VSUBC_3B is
   for VITAL
   end for;
end CFG_VSUBC_3B_VITAL;


---- end of library ----
