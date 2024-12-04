
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler 2002.05-SP1
-- FILENAME     :    c35_IOLIB_3B_4M_VITAL.vhd
-- FILE CONTENTS:    Entity, Structural Architecture(VITAL),
--                   and Configuration
-- DATE CREATED :    Wed Jan 22 14:59:15 2003
-- 
-- LIBRARY      :    c35_IOLIB_3B_4M
-- DATE ENTERED :    $Date: 2001/09/25 12:07:08 $
-- REVISION     :    $Id: csx_IOLIB_3M.lib,v 1.3 2001/09/25 12:07:08 mbo Exp mbo $
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ns
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    VITAL, TimingChecksOn(TRUE), XGenerationOn(TRUE), TimingMessage(TRUE), OnDetect 
--                   Owner: austriamicrosystems AG  HIT-Kit: Digital
-- HISTORY      :
-- 
----------------------------------------------------------------

----- CELL BBC1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.180 ns, 2.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.176 ns, 2.183 ns, 0.580 ns, 2.176 ns, 0.541 ns, 2.183 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.327 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC1P_3B : entity is TRUE;
end BBC1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC1P_3B is
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

configuration CFG_BBC1P_3B_VITAL of BBC1P_3B is
   for VITAL
   end for;
end CFG_BBC1P_3B_VITAL;


----- CELL BBC4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.311 ns, 1.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.312 ns, 1.154 ns, 0.546 ns, 1.312 ns, 0.637 ns, 1.154 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.260 ns, 0.245 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC4P_3B : entity is TRUE;
end BBC4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC4P_3B is
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

configuration CFG_BBC4P_3B_VITAL of BBC4P_3B is
   for VITAL
   end for;
end CFG_BBC4P_3B_VITAL;


----- CELL BBC4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.007 ns, 1.841 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.079 ns, 1.834 ns, 0.512 ns, 2.079 ns, 0.647 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.331 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC4SMP_3B : entity is TRUE;
end BBC4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC4SMP_3B is
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

configuration CFG_BBC4SMP_3B_VITAL of BBC4SMP_3B is
   for VITAL
   end for;
end CFG_BBC4SMP_3B_VITAL;


----- CELL BBC8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.236 ns, 1.162 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.115 ns, 0.577 ns, 1.245 ns, 0.623 ns, 1.115 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.328 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC8P_3B : entity is TRUE;
end BBC8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC8P_3B is
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

configuration CFG_BBC8P_3B_VITAL of BBC8P_3B is
   for VITAL
   end for;
end CFG_BBC8P_3B_VITAL;


----- CELL BBC8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.751 ns, 1.910 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.758 ns, 1.850 ns, 0.449 ns, 1.758 ns, 0.635 ns, 1.850 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.331 ns, 0.328 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC8SMP_3B : entity is TRUE;
end BBC8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC8SMP_3B is
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

configuration CFG_BBC8SMP_3B_VITAL of BBC8SMP_3B is
   for VITAL
   end for;
end CFG_BBC8SMP_3B_VITAL;


----- CELL BBC8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.312 ns, 2.404 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.339 ns, 2.330 ns, 0.484 ns, 2.339 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.332 ns, 0.328 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC8SP_3B : entity is TRUE;
end BBC8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC8SP_3B is
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

configuration CFG_BBC8SP_3B_VITAL of BBC8SP_3B is
   for VITAL
   end for;
end CFG_BBC8SP_3B_VITAL;


----- CELL BBC16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.261 ns, 1.223 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.296 ns, 1.123 ns, 0.623 ns, 1.296 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.326 ns, 0.331 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC16P_3B : entity is TRUE;
end BBC16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC16P_3B is
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

configuration CFG_BBC16P_3B_VITAL of BBC16P_3B is
   for VITAL
   end for;
end CFG_BBC16P_3B_VITAL;


----- CELL BBC16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.864 ns, 2.125 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.906 ns, 2.077 ns, 0.460 ns, 1.906 ns, 0.830 ns, 2.077 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.328 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC16SMP_3B : entity is TRUE;
end BBC16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC16SMP_3B is
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

configuration CFG_BBC16SMP_3B_VITAL of BBC16SMP_3B is
   for VITAL
   end for;
end CFG_BBC16SMP_3B_VITAL;


----- CELL BBC16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.269 ns, 2.445 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.298 ns, 2.396 ns, 0.503 ns, 2.298 ns, 0.743 ns, 2.396 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.328 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC16SP_3B : entity is TRUE;
end BBC16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC16SP_3B is
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

configuration CFG_BBC16SP_3B_VITAL of BBC16SP_3B is
   for VITAL
   end for;
end CFG_BBC16SP_3B_VITAL;


----- CELL BBC24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.351 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.238 ns, 0.731 ns, 1.449 ns, 0.735 ns, 1.238 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC24P_3B : entity is TRUE;
end BBC24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC24P_3B is
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

configuration CFG_BBC24P_3B_VITAL of BBC24P_3B is
   for VITAL
   end for;
end CFG_BBC24P_3B_VITAL;


----- CELL BBC24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.990 ns, 2.143 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.002 ns, 2.046 ns, 0.449 ns, 2.002 ns, 0.935 ns, 2.046 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.326 ns, 0.331 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC24SMP_3B : entity is TRUE;
end BBC24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC24SMP_3B is
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

configuration CFG_BBC24SMP_3B_VITAL of BBC24SMP_3B is
   for VITAL
   end for;
end CFG_BBC24SMP_3B_VITAL;


----- CELL BBC24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.373 ns, 2.569 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.429 ns, 2.541 ns, 0.532 ns, 2.429 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.327 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC24SP_3B : entity is TRUE;
end BBC24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBC24SP_3B is
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

configuration CFG_BBC24SP_3B_VITAL of BBC24SP_3B is
   for VITAL
   end for;
end CFG_BBC24SP_3B_VITAL;


----- CELL BBCD1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.210 ns, 2.229 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.183 ns, 2.180 ns, 0.581 ns, 2.183 ns, 0.541 ns, 2.180 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.378 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD1P_3B : entity is TRUE;
end BBCD1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD1P_3B is
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

configuration CFG_BBCD1P_3B_VITAL of BBCD1P_3B is
   for VITAL
   end for;
end CFG_BBCD1P_3B_VITAL;


----- CELL BBCD4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.327 ns, 1.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.356 ns, 1.141 ns, 0.546 ns, 1.356 ns, 0.637 ns, 1.141 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.312 ns, 0.290 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD4P_3B : entity is TRUE;
end BBCD4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD4P_3B is
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

configuration CFG_BBCD4P_3B_VITAL of BBCD4P_3B is
   for VITAL
   end for;
end CFG_BBCD4P_3B_VITAL;


----- CELL BBCD4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.038 ns, 1.839 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.071 ns, 1.834 ns, 0.512 ns, 2.071 ns, 0.645 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD4SMP_3B : entity is TRUE;
end BBCD4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD4SMP_3B is
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

configuration CFG_BBCD4SMP_3B_VITAL of BBCD4SMP_3B is
   for VITAL
   end for;
end CFG_BBCD4SMP_3B_VITAL;


----- CELL BBCD8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.239 ns, 1.162 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.238 ns, 1.109 ns, 0.577 ns, 1.238 ns, 0.622 ns, 1.109 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD8P_3B : entity is TRUE;
end BBCD8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD8P_3B is
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

configuration CFG_BBCD8P_3B_VITAL of BBCD8P_3B is
   for VITAL
   end for;
end CFG_BBCD8P_3B_VITAL;


----- CELL BBCD8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.747 ns, 1.906 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.815 ns, 1.841 ns, 0.449 ns, 1.815 ns, 0.635 ns, 1.841 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD8SMP_3B : entity is TRUE;
end BBCD8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD8SMP_3B is
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

configuration CFG_BBCD8SMP_3B_VITAL of BBCD8SMP_3B is
   for VITAL
   end for;
end CFG_BBCD8SMP_3B_VITAL;


----- CELL BBCD8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.335 ns, 2.404 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.353 ns, 2.322 ns, 0.484 ns, 2.353 ns, 0.740 ns, 2.322 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD8SP_3B : entity is TRUE;
end BBCD8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD8SP_3B is
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

configuration CFG_BBCD8SP_3B_VITAL of BBCD8SP_3B is
   for VITAL
   end for;
end CFG_BBCD8SP_3B_VITAL;


----- CELL BBCD16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.260 ns, 1.223 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.303 ns, 1.123 ns, 0.623 ns, 1.303 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD16P_3B : entity is TRUE;
end BBCD16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD16P_3B is
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

configuration CFG_BBCD16P_3B_VITAL of BBCD16P_3B is
   for VITAL
   end for;
end CFG_BBCD16P_3B_VITAL;


----- CELL BBCD16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.872 ns, 2.125 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.919 ns, 2.072 ns, 0.460 ns, 1.919 ns, 0.826 ns, 2.072 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.380 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD16SMP_3B : entity is TRUE;
end BBCD16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD16SMP_3B is
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

configuration CFG_BBCD16SMP_3B_VITAL of BBCD16SMP_3B is
   for VITAL
   end for;
end CFG_BBCD16SMP_3B_VITAL;


----- CELL BBCD16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.284 ns, 2.443 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.277 ns, 2.392 ns, 0.504 ns, 2.277 ns, 0.743 ns, 2.392 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD16SP_3B : entity is TRUE;
end BBCD16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD16SP_3B is
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

configuration CFG_BBCD16SP_3B_VITAL of BBCD16SP_3B is
   for VITAL
   end for;
end CFG_BBCD16SP_3B_VITAL;


----- CELL BBCD24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.445 ns, 1.350 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.433 ns, 1.234 ns, 0.732 ns, 1.433 ns, 0.735 ns, 1.234 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.381 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD24P_3B : entity is TRUE;
end BBCD24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD24P_3B is
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

configuration CFG_BBCD24P_3B_VITAL of BBCD24P_3B is
   for VITAL
   end for;
end CFG_BBCD24P_3B_VITAL;


----- CELL BBCD24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.996 ns, 2.141 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.011 ns, 2.043 ns, 0.449 ns, 2.011 ns, 0.930 ns, 2.043 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD24SMP_3B : entity is TRUE;
end BBCD24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD24SMP_3B is
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

configuration CFG_BBCD24SMP_3B_VITAL of BBCD24SMP_3B is
   for VITAL
   end for;
end CFG_BBCD24SMP_3B_VITAL;


----- CELL BBCD24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.385 ns, 2.563 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.421 ns, 2.541 ns, 0.532 ns, 2.421 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.378 ns, 0.369 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD24SP_3B : entity is TRUE;
end BBCD24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCD24SP_3B is
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

configuration CFG_BBCD24SP_3B_VITAL of BBCD24SP_3B is
   for VITAL
   end for;
end CFG_BBCD24SP_3B_VITAL;


----- CELL BBCU1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.356 ns, 2.416 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.351 ns, 2.367 ns, 0.579 ns, 2.351 ns, 0.541 ns, 2.367 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.350 ns, 0.358 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU1P_3B : entity is TRUE;
end BBCU1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU1P_3B is
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

configuration CFG_BBCU1P_3B_VITAL of BBCU1P_3B is
   for VITAL
   end for;
end CFG_BBCU1P_3B_VITAL;


----- CELL BBCU4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.307 ns, 1.241 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.310 ns, 1.186 ns, 0.546 ns, 1.310 ns, 0.637 ns, 1.186 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.271 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU4P_3B : entity is TRUE;
end BBCU4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU4P_3B is
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

configuration CFG_BBCU4P_3B_VITAL of BBCU4P_3B is
   for VITAL
   end for;
end CFG_BBCU4P_3B_VITAL;


----- CELL BBCU4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.003 ns, 1.850 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.071 ns, 1.784 ns, 0.512 ns, 2.071 ns, 0.651 ns, 1.784 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.351 ns, 0.355 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU4SMP_3B : entity is TRUE;
end BBCU4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU4SMP_3B is
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

configuration CFG_BBCU4SMP_3B_VITAL of BBCU4SMP_3B is
   for VITAL
   end for;
end CFG_BBCU4SMP_3B_VITAL;


----- CELL BBCU8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.236 ns, 1.163 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.233 ns, 1.125 ns, 0.577 ns, 1.233 ns, 0.624 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.350 ns, 0.351 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU8P_3B : entity is TRUE;
end BBCU8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU8P_3B is
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

configuration CFG_BBCU8P_3B_VITAL of BBCU8P_3B is
   for VITAL
   end for;
end CFG_BBCU8P_3B_VITAL;


----- CELL BBCU8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.750 ns, 1.908 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.755 ns, 1.866 ns, 0.449 ns, 1.755 ns, 0.635 ns, 1.866 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.352 ns, 0.357 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU8SMP_3B : entity is TRUE;
end BBCU8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU8SMP_3B is
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

configuration CFG_BBCU8SMP_3B_VITAL of BBCU8SMP_3B is
   for VITAL
   end for;
end CFG_BBCU8SMP_3B_VITAL;


----- CELL BBCU8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.324 ns, 2.410 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.332 ns, 2.343 ns, 0.484 ns, 2.332 ns, 0.740 ns, 2.343 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.352 ns, 0.357 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU8SP_3B : entity is TRUE;
end BBCU8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU8SP_3B is
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

configuration CFG_BBCU8SP_3B_VITAL of BBCU8SP_3B is
   for VITAL
   end for;
end CFG_BBCU8SP_3B_VITAL;


----- CELL BBCU16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.261 ns, 1.224 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.298 ns, 1.145 ns, 0.623 ns, 1.298 ns, 0.634 ns, 1.145 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.352 ns, 0.352 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU16P_3B : entity is TRUE;
end BBCU16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU16P_3B is
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

configuration CFG_BBCU16P_3B_VITAL of BBCU16P_3B is
   for VITAL
   end for;
end CFG_BBCU16P_3B_VITAL;


----- CELL BBCU16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.863 ns, 2.132 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.904 ns, 2.085 ns, 0.460 ns, 1.904 ns, 0.831 ns, 2.085 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.353 ns, 0.356 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU16SMP_3B : entity is TRUE;
end BBCU16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU16SMP_3B is
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

configuration CFG_BBCU16SMP_3B_VITAL of BBCU16SMP_3B is
   for VITAL
   end for;
end CFG_BBCU16SMP_3B_VITAL;


----- CELL BBCU16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.287 ns, 2.445 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.316 ns, 2.406 ns, 0.503 ns, 2.316 ns, 0.743 ns, 2.406 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.353 ns, 0.356 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU16SP_3B : entity is TRUE;
end BBCU16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU16SP_3B is
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

configuration CFG_BBCU16SP_3B_VITAL of BBCU16SP_3B is
   for VITAL
   end for;
end CFG_BBCU16SP_3B_VITAL;


----- CELL BBCU24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.350 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.237 ns, 0.731 ns, 1.449 ns, 0.735 ns, 1.237 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.355 ns, 0.353 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU24P_3B : entity is TRUE;
end BBCU24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU24P_3B is
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

configuration CFG_BBCU24P_3B_VITAL of BBCU24P_3B is
   for VITAL
   end for;
end CFG_BBCU24P_3B_VITAL;


----- CELL BBCU24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.993 ns, 2.142 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.034 ns, 2.124 ns, 0.449 ns, 2.034 ns, 0.934 ns, 2.124 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.356 ns, 0.357 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU24SMP_3B : entity is TRUE;
end BBCU24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU24SMP_3B is
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

configuration CFG_BBCU24SMP_3B_VITAL of BBCU24SMP_3B is
   for VITAL
   end for;
end CFG_BBCU24SMP_3B_VITAL;


----- CELL BBCU24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.388 ns, 2.572 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.421 ns, 2.541 ns, 0.532 ns, 2.421 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.354 ns, 0.359 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU24SP_3B : entity is TRUE;
end BBCU24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBCU24SP_3B is
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

configuration CFG_BBCU24SP_3B_VITAL of BBCU24SP_3B is
   for VITAL
   end for;
end CFG_BBCU24SP_3B_VITAL;


----- CELL BBS1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.173 ns, 2.239 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.169 ns, 2.190 ns, 0.580 ns, 2.169 ns, 0.541 ns, 2.190 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.487 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS1P_3B : entity is TRUE;
end BBS1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS1P_3B is
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

configuration CFG_BBS1P_3B_VITAL of BBS1P_3B is
   for VITAL
   end for;
end CFG_BBS1P_3B_VITAL;


----- CELL BBS4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.300 ns, 1.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.355 ns, 1.208 ns, 0.546 ns, 1.355 ns, 0.637 ns, 1.208 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.432 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS4P_3B : entity is TRUE;
end BBS4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS4P_3B is
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

configuration CFG_BBS4P_3B_VITAL of BBS4P_3B is
   for VITAL
   end for;
end CFG_BBS4P_3B_VITAL;


----- CELL BBS4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.041 ns, 1.845 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.082 ns, 1.834 ns, 0.512 ns, 2.082 ns, 0.648 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS4SMP_3B : entity is TRUE;
end BBS4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS4SMP_3B is
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

configuration CFG_BBS4SMP_3B_VITAL of BBS4SMP_3B is
   for VITAL
   end for;
end CFG_BBS4SMP_3B_VITAL;


----- CELL BBS8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.239 ns, 1.160 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.248 ns, 1.125 ns, 0.577 ns, 1.248 ns, 0.623 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS8P_3B : entity is TRUE;
end BBS8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS8P_3B is
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

configuration CFG_BBS8P_3B_VITAL of BBS8P_3B is
   for VITAL
   end for;
end CFG_BBS8P_3B_VITAL;


----- CELL BBS8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.750 ns, 1.904 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.753 ns, 1.885 ns, 0.449 ns, 1.753 ns, 0.635 ns, 1.885 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS8SMP_3B : entity is TRUE;
end BBS8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS8SMP_3B is
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

configuration CFG_BBS8SMP_3B_VITAL of BBS8SMP_3B is
   for VITAL
   end for;
end CFG_BBS8SMP_3B_VITAL;


----- CELL BBS8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.300 ns, 2.408 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.360 ns, 2.330 ns, 0.484 ns, 2.360 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS8SP_3B : entity is TRUE;
end BBS8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS8SP_3B is
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

configuration CFG_BBS8SP_3B_VITAL of BBS8SP_3B is
   for VITAL
   end for;
end CFG_BBS8SP_3B_VITAL;


----- CELL BBS16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.253 ns, 1.226 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.123 ns, 0.623 ns, 1.245 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS16P_3B : entity is TRUE;
end BBS16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS16P_3B is
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

configuration CFG_BBS16P_3B_VITAL of BBS16P_3B is
   for VITAL
   end for;
end CFG_BBS16P_3B_VITAL;


----- CELL BBS16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.886 ns, 2.128 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.911 ns, 2.050 ns, 0.460 ns, 1.911 ns, 0.826 ns, 2.050 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS16SMP_3B : entity is TRUE;
end BBS16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS16SMP_3B is
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

configuration CFG_BBS16SMP_3B_VITAL of BBS16SMP_3B is
   for VITAL
   end for;
end CFG_BBS16SMP_3B_VITAL;


----- CELL BBS16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.251 ns, 2.443 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.322 ns, 2.425 ns, 0.503 ns, 2.322 ns, 0.743 ns, 2.425 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS16SP_3B : entity is TRUE;
end BBS16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS16SP_3B is
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

configuration CFG_BBS16SP_3B_VITAL of BBS16SP_3B is
   for VITAL
   end for;
end CFG_BBS16SP_3B_VITAL;


----- CELL BBS24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.445 ns, 1.351 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.248 ns, 0.732 ns, 1.449 ns, 0.735 ns, 1.248 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.427 ns, 0.489 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS24P_3B : entity is TRUE;
end BBS24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS24P_3B is
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

configuration CFG_BBS24P_3B_VITAL of BBS24P_3B is
   for VITAL
   end for;
end CFG_BBS24P_3B_VITAL;


----- CELL BBS24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.967 ns, 2.146 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.010 ns, 2.112 ns, 0.449 ns, 2.010 ns, 0.929 ns, 2.112 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.429 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS24SMP_3B : entity is TRUE;
end BBS24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS24SMP_3B is
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

configuration CFG_BBS24SMP_3B_VITAL of BBS24SMP_3B is
   for VITAL
   end for;
end CFG_BBS24SMP_3B_VITAL;


----- CELL BBS24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.382 ns, 2.565 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.414 ns, 2.531 ns, 0.532 ns, 2.414 ns, 0.745 ns, 2.531 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.430 ns, 0.486 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS24SP_3B : entity is TRUE;
end BBS24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBS24SP_3B is
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

configuration CFG_BBS24SP_3B_VITAL of BBS24SP_3B is
   for VITAL
   end for;
end CFG_BBS24SP_3B_VITAL;


----- CELL BBSD1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.232 ns, 2.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.227 ns, 2.196 ns, 0.581 ns, 2.227 ns, 0.541 ns, 2.196 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.484 ns, 0.553 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD1P_3B : entity is TRUE;
end BBSD1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD1P_3B is
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

configuration CFG_BBSD1P_3B_VITAL of BBSD1P_3B is
   for VITAL
   end for;
end CFG_BBSD1P_3B_VITAL;


----- CELL BBSD4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.317 ns, 1.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.355 ns, 1.171 ns, 0.546 ns, 1.355 ns, 0.637 ns, 1.171 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.554 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD4P_3B : entity is TRUE;
end BBSD4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD4P_3B is
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

configuration CFG_BBSD4P_3B_VITAL of BBSD4P_3B is
   for VITAL
   end for;
end CFG_BBSD4P_3B_VITAL;


----- CELL BBSD4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.006 ns, 1.844 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.085 ns, 1.834 ns, 0.512 ns, 2.085 ns, 0.645 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.481 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD4SMP_3B : entity is TRUE;
end BBSD4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD4SMP_3B is
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

configuration CFG_BBSD4SMP_3B_VITAL of BBSD4SMP_3B is
   for VITAL
   end for;
end CFG_BBSD4SMP_3B_VITAL;


----- CELL BBSD8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.241 ns, 1.160 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.248 ns, 1.125 ns, 0.577 ns, 1.248 ns, 0.621 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.555 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD8P_3B : entity is TRUE;
end BBSD8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD8P_3B is
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

configuration CFG_BBSD8P_3B_VITAL of BBSD8P_3B is
   for VITAL
   end for;
end CFG_BBSD8P_3B_VITAL;


----- CELL BBSD8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.752 ns, 1.906 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.766 ns, 1.842 ns, 0.449 ns, 1.766 ns, 0.635 ns, 1.842 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.481 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD8SMP_3B : entity is TRUE;
end BBSD8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD8SMP_3B is
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

configuration CFG_BBSD8SMP_3B_VITAL of BBSD8SMP_3B is
   for VITAL
   end for;
end CFG_BBSD8SMP_3B_VITAL;


----- CELL BBSD8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.308 ns, 2.410 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.345 ns, 2.330 ns, 0.484 ns, 2.345 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.477 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD8SP_3B : entity is TRUE;
end BBSD8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD8SP_3B is
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

configuration CFG_BBSD8SP_3B_VITAL of BBSD8SP_3B is
   for VITAL
   end for;
end CFG_BBSD8SP_3B_VITAL;


----- CELL BBSD16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.251 ns, 1.223 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.123 ns, 0.623 ns, 1.245 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.481 ns, 0.554 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD16P_3B : entity is TRUE;
end BBSD16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD16P_3B is
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

configuration CFG_BBSD16P_3B_VITAL of BBSD16P_3B is
   for VITAL
   end for;
end CFG_BBSD16P_3B_VITAL;


----- CELL BBSD16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.861 ns, 2.126 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.919 ns, 2.065 ns, 0.460 ns, 1.919 ns, 0.826 ns, 2.065 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.476 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD16SMP_3B : entity is TRUE;
end BBSD16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD16SMP_3B is
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

configuration CFG_BBSD16SMP_3B_VITAL of BBSD16SMP_3B is
   for VITAL
   end for;
end CFG_BBSD16SMP_3B_VITAL;


----- CELL BBSD16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.257 ns, 2.447 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.322 ns, 2.403 ns, 0.504 ns, 2.322 ns, 0.743 ns, 2.403 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.551 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD16SP_3B : entity is TRUE;
end BBSD16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD16SP_3B is
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

configuration CFG_BBSD16SP_3B_VITAL of BBSD16SP_3B is
   for VITAL
   end for;
end CFG_BBSD16SP_3B_VITAL;


----- CELL BBSD24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.353 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.250 ns, 0.732 ns, 1.449 ns, 0.735 ns, 1.250 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.479 ns, 0.554 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD24P_3B : entity is TRUE;
end BBSD24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD24P_3B is
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

configuration CFG_BBSD24P_3B_VITAL of BBSD24P_3B is
   for VITAL
   end for;
end CFG_BBSD24P_3B_VITAL;


----- CELL BBSD24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.966 ns, 2.145 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.005 ns, 2.060 ns, 0.449 ns, 2.005 ns, 0.932 ns, 2.060 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.477 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD24SMP_3B : entity is TRUE;
end BBSD24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD24SMP_3B is
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

configuration CFG_BBSD24SMP_3B_VITAL of BBSD24SMP_3B is
   for VITAL
   end for;
end CFG_BBSD24SMP_3B_VITAL;


----- CELL BBSD24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.360 ns, 2.570 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.447 ns, 2.538 ns, 0.532 ns, 2.447 ns, 0.745 ns, 2.538 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.482 ns, 0.550 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD24SP_3B : entity is TRUE;
end BBSD24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSD24SP_3B is
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

configuration CFG_BBSD24SP_3B_VITAL of BBSD24SP_3B is
   for VITAL
   end for;
end CFG_BBSD24SP_3B_VITAL;


----- CELL BBSU1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.394 ns, 2.419 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.374 ns, 2.343 ns, 0.579 ns, 2.374 ns, 0.541 ns, 2.343 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.467 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU1P_3B : entity is TRUE;
end BBSU1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU1P_3B is
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

configuration CFG_BBSU1P_3B_VITAL of BBSU1P_3B is
   for VITAL
   end for;
end CFG_BBSU1P_3B_VITAL;


----- CELL BBSU4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.282 ns, 1.241 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.340 ns, 1.193 ns, 0.546 ns, 1.340 ns, 0.637 ns, 1.193 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.472 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU4P_3B : entity is TRUE;
end BBSU4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU4P_3B is
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

configuration CFG_BBSU4P_3B_VITAL of BBSU4P_3B is
   for VITAL
   end for;
end CFG_BBSU4P_3B_VITAL;


----- CELL BBSU4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.007 ns, 1.843 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.092 ns, 1.834 ns, 0.512 ns, 2.092 ns, 0.652 ns, 1.834 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU4SMP_3B : entity is TRUE;
end BBSU4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU4SMP_3B is
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

configuration CFG_BBSU4SMP_3B_VITAL of BBSU4SMP_3B is
   for VITAL
   end for;
end CFG_BBSU4SMP_3B_VITAL;


----- CELL BBSU8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.237 ns, 1.167 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.248 ns, 1.125 ns, 0.577 ns, 1.248 ns, 0.624 ns, 1.125 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.473 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU8P_3B : entity is TRUE;
end BBSU8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU8P_3B is
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

configuration CFG_BBSU8P_3B_VITAL of BBSU8P_3B is
   for VITAL
   end for;
end CFG_BBSU8P_3B_VITAL;


----- CELL BBSU8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.749 ns, 1.909 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.759 ns, 1.852 ns, 0.449 ns, 1.759 ns, 0.635 ns, 1.852 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU8SMP_3B : entity is TRUE;
end BBSU8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU8SMP_3B is
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

configuration CFG_BBSU8SMP_3B_VITAL of BBSU8SMP_3B is
   for VITAL
   end for;
end CFG_BBSU8SMP_3B_VITAL;


----- CELL BBSU8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.306 ns, 2.413 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.343 ns, 2.330 ns, 0.484 ns, 2.343 ns, 0.740 ns, 2.330 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU8SP_3B : entity is TRUE;
end BBSU8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU8SP_3B is
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

configuration CFG_BBSU8SP_3B_VITAL of BBSU8SP_3B is
   for VITAL
   end for;
end CFG_BBSU8SP_3B_VITAL;


----- CELL BBSU16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.250 ns, 1.229 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.245 ns, 1.123 ns, 0.623 ns, 1.245 ns, 0.634 ns, 1.123 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.467 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU16P_3B : entity is TRUE;
end BBSU16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU16P_3B is
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

configuration CFG_BBSU16P_3B_VITAL of BBSU16P_3B is
   for VITAL
   end for;
end CFG_BBSU16P_3B_VITAL;


----- CELL BBSU16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.860 ns, 2.129 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.908 ns, 2.106 ns, 0.460 ns, 1.908 ns, 0.826 ns, 2.106 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.473 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU16SMP_3B : entity is TRUE;
end BBSU16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU16SMP_3B is
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

configuration CFG_BBSU16SMP_3B_VITAL of BBSU16SMP_3B is
   for VITAL
   end for;
end CFG_BBSU16SMP_3B_VITAL;


----- CELL BBSU16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.279 ns, 2.448 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.336 ns, 2.435 ns, 0.503 ns, 2.336 ns, 0.743 ns, 2.435 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU16SP_3B : entity is TRUE;
end BBSU16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU16SP_3B is
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

configuration CFG_BBSU16SP_3B_VITAL of BBSU16SP_3B is
   for VITAL
   end for;
end CFG_BBSU16SP_3B_VITAL;


----- CELL BBSU24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.443 ns, 1.350 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.280 ns, 0.732 ns, 1.449 ns, 0.735 ns, 1.280 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.472 ns, 0.516 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU24P_3B : entity is TRUE;
end BBSU24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU24P_3B is
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

configuration CFG_BBSU24P_3B_VITAL of BBSU24P_3B is
   for VITAL
   end for;
end CFG_BBSU24P_3B_VITAL;


----- CELL BBSU24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.964 ns, 2.143 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.015 ns, 2.065 ns, 0.449 ns, 2.015 ns, 0.927 ns, 2.065 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.466 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU24SMP_3B : entity is TRUE;
end BBSU24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU24SMP_3B is
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

configuration CFG_BBSU24SMP_3B_VITAL of BBSU24SMP_3B is
   for VITAL
   end for;
end CFG_BBSU24SMP_3B_VITAL;


----- CELL BBSU24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.397 ns, 2.571 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.404 ns, 2.541 ns, 0.532 ns, 2.404 ns, 0.745 ns, 2.541 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.472 ns, 0.514 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU24SP_3B : entity is TRUE;
end BBSU24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBSU24SP_3B is
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

configuration CFG_BBSU24SP_3B_VITAL of BBSU24SP_3B is
   for VITAL
   end for;
end CFG_BBSU24SP_3B_VITAL;


----- CELL BBT1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.471 ns, 2.017 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.460 ns, 1.983 ns, 0.580 ns, 2.460 ns, 0.541 ns, 1.983 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.297 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT1P_3B : entity is TRUE;
end BBT1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT1P_3B is
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

configuration CFG_BBT1P_3B_VITAL of BBT1P_3B is
   for VITAL
   end for;
end CFG_BBT1P_3B_VITAL;


----- CELL BBT4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.441 ns, 1.149 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.455 ns, 1.116 ns, 0.546 ns, 1.455 ns, 0.637 ns, 1.116 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.187 ns, 0.212 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT4P_3B : entity is TRUE;
end BBT4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT4P_3B is
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

configuration CFG_BBT4P_3B_VITAL of BBT4P_3B is
   for VITAL
   end for;
end CFG_BBT4P_3B_VITAL;


----- CELL BBT4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.165 ns, 1.706 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.248 ns, 1.713 ns, 0.512 ns, 2.248 ns, 0.647 ns, 1.713 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT4SMP_3B : entity is TRUE;
end BBT4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT4SMP_3B is
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

configuration CFG_BBT4SMP_3B_VITAL of BBT4SMP_3B is
   for VITAL
   end for;
end CFG_BBT4SMP_3B_VITAL;


----- CELL BBT8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.346 ns, 1.084 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.348 ns, 1.025 ns, 0.577 ns, 1.348 ns, 0.623 ns, 1.025 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.294 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT8P_3B : entity is TRUE;
end BBT8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT8P_3B is
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

configuration CFG_BBT8P_3B_VITAL of BBT8P_3B is
   for VITAL
   end for;
end CFG_BBT8P_3B_VITAL;


----- CELL BBT8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.865 ns, 1.779 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.947 ns, 1.731 ns, 0.449 ns, 1.947 ns, 0.635 ns, 1.731 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT8SMP_3B : entity is TRUE;
end BBT8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT8SMP_3B is
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

configuration CFG_BBT8SMP_3B_VITAL of BBT8SMP_3B is
   for VITAL
   end for;
end CFG_BBT8SMP_3B_VITAL;


----- CELL BBT8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.463 ns, 2.220 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.553 ns, 2.214 ns, 0.484 ns, 2.553 ns, 0.740 ns, 2.214 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT8SP_3B : entity is TRUE;
end BBT8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT8SP_3B is
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

configuration CFG_BBT8SP_3B_VITAL of BBT8SP_3B is
   for VITAL
   end for;
end CFG_BBT8SP_3B_VITAL;


----- CELL BBT16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.355 ns, 1.138 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.345 ns, 1.078 ns, 0.623 ns, 1.345 ns, 0.634 ns, 1.078 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.296 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT16P_3B : entity is TRUE;
end BBT16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT16P_3B is
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

configuration CFG_BBT16P_3B_VITAL of BBT16P_3B is
   for VITAL
   end for;
end CFG_BBT16P_3B_VITAL;


----- CELL BBT16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.005 ns, 1.989 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.056 ns, 1.945 ns, 0.460 ns, 2.056 ns, 0.830 ns, 1.945 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT16SMP_3B : entity is TRUE;
end BBT16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT16SMP_3B is
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

configuration CFG_BBT16SMP_3B_VITAL of BBT16SMP_3B is
   for VITAL
   end for;
end CFG_BBT16SMP_3B_VITAL;


----- CELL BBT16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.442 ns, 2.269 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.459 ns, 2.201 ns, 0.503 ns, 2.459 ns, 0.743 ns, 2.201 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT16SP_3B : entity is TRUE;
end BBT16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT16SP_3B is
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

configuration CFG_BBT16SP_3B_VITAL of BBT16SP_3B is
   for VITAL
   end for;
end CFG_BBT16SP_3B_VITAL;


----- CELL BBT24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.550 ns, 1.258 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.549 ns, 1.179 ns, 0.732 ns, 1.549 ns, 0.735 ns, 1.179 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT24P_3B : entity is TRUE;
end BBT24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT24P_3B is
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

configuration CFG_BBT24P_3B_VITAL of BBT24P_3B is
   for VITAL
   end for;
end CFG_BBT24P_3B_VITAL;


----- CELL BBT24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.132 ns, 2.017 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.158 ns, 1.977 ns, 0.449 ns, 2.158 ns, 0.930 ns, 1.977 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.296 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT24SMP_3B : entity is TRUE;
end BBT24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT24SMP_3B is
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

configuration CFG_BBT24SMP_3B_VITAL of BBT24SMP_3B is
   for VITAL
   end for;
end CFG_BBT24SMP_3B_VITAL;


----- CELL BBT24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.546 ns, 2.386 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.563 ns, 2.360 ns, 0.532 ns, 2.563 ns, 0.745 ns, 2.360 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.273 ns, 0.295 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT24SP_3B : entity is TRUE;
end BBT24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBT24SP_3B is
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

configuration CFG_BBT24SP_3B_VITAL of BBT24SP_3B is
   for VITAL
   end for;
end CFG_BBT24SP_3B_VITAL;


----- CELL BBTD1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.538 ns, 2.008 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.507 ns, 1.975 ns, 0.581 ns, 2.507 ns, 0.541 ns, 1.975 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD1P_3B : entity is TRUE;
end BBTD1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD1P_3B is
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

configuration CFG_BBTD1P_3B_VITAL of BBTD1P_3B is
   for VITAL
   end for;
end CFG_BBTD1P_3B_VITAL;


----- CELL BBTD4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.448 ns, 1.143 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.455 ns, 1.115 ns, 0.546 ns, 1.455 ns, 0.637 ns, 1.115 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.319 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD4P_3B : entity is TRUE;
end BBTD4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD4P_3B is
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

configuration CFG_BBTD4P_3B_VITAL of BBTD4P_3B is
   for VITAL
   end for;
end CFG_BBTD4P_3B_VITAL;


----- CELL BBTD4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.169 ns, 1.704 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.248 ns, 1.711 ns, 0.512 ns, 2.248 ns, 0.645 ns, 1.711 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.321 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD4SMP_3B : entity is TRUE;
end BBTD4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD4SMP_3B is
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

configuration CFG_BBTD4SMP_3B_VITAL of BBTD4SMP_3B is
   for VITAL
   end for;
end CFG_BBTD4SMP_3B_VITAL;


----- CELL BBTD8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.347 ns, 1.085 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.348 ns, 1.025 ns, 0.577 ns, 1.348 ns, 0.622 ns, 1.025 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.321 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD8P_3B : entity is TRUE;
end BBTD8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD8P_3B is
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

configuration CFG_BBTD8P_3B_VITAL of BBTD8P_3B is
   for VITAL
   end for;
end CFG_BBTD8P_3B_VITAL;


----- CELL BBTD8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.866 ns, 1.776 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.947 ns, 1.729 ns, 0.449 ns, 1.947 ns, 0.635 ns, 1.729 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.321 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD8SMP_3B : entity is TRUE;
end BBTD8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD8SMP_3B is
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

configuration CFG_BBTD8SMP_3B_VITAL of BBTD8SMP_3B is
   for VITAL
   end for;
end CFG_BBTD8SMP_3B_VITAL;


----- CELL BBTD8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.465 ns, 2.216 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.549 ns, 2.211 ns, 0.484 ns, 2.549 ns, 0.740 ns, 2.211 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.320 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD8SP_3B : entity is TRUE;
end BBTD8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD8SP_3B is
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

configuration CFG_BBTD8SP_3B_VITAL of BBTD8SP_3B is
   for VITAL
   end for;
end CFG_BBTD8SP_3B_VITAL;


----- CELL BBTD16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.356 ns, 1.138 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.347 ns, 1.078 ns, 0.623 ns, 1.347 ns, 0.634 ns, 1.078 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD16P_3B : entity is TRUE;
end BBTD16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD16P_3B is
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

configuration CFG_BBTD16P_3B_VITAL of BBTD16P_3B is
   for VITAL
   end for;
end CFG_BBTD16P_3B_VITAL;


----- CELL BBTD16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.996 ns, 1.989 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.056 ns, 1.941 ns, 0.460 ns, 2.056 ns, 0.826 ns, 1.941 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD16SMP_3B : entity is TRUE;
end BBTD16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD16SMP_3B is
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

configuration CFG_BBTD16SMP_3B_VITAL of BBTD16SMP_3B is
   for VITAL
   end for;
end CFG_BBTD16SMP_3B_VITAL;


----- CELL BBTD16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.442 ns, 2.268 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.459 ns, 2.199 ns, 0.504 ns, 2.459 ns, 0.743 ns, 2.199 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD16SP_3B : entity is TRUE;
end BBTD16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD16SP_3B is
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

configuration CFG_BBTD16SP_3B_VITAL of BBTD16SP_3B is
   for VITAL
   end for;
end CFG_BBTD16SP_3B_VITAL;


----- CELL BBTD24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.550 ns, 1.258 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.549 ns, 1.180 ns, 0.732 ns, 1.549 ns, 0.735 ns, 1.180 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD24P_3B : entity is TRUE;
end BBTD24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD24P_3B is
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

configuration CFG_BBTD24P_3B_VITAL of BBTD24P_3B is
   for VITAL
   end for;
end CFG_BBTD24P_3B_VITAL;


----- CELL BBTD24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.132 ns, 2.017 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.158 ns, 1.982 ns, 0.449 ns, 2.158 ns, 0.929 ns, 1.982 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD24SMP_3B : entity is TRUE;
end BBTD24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD24SMP_3B is
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

configuration CFG_BBTD24SMP_3B_VITAL of BBTD24SMP_3B is
   for VITAL
   end for;
end CFG_BBTD24SMP_3B_VITAL;


----- CELL BBTD24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.550 ns, 2.386 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.563 ns, 2.359 ns, 0.532 ns, 2.563 ns, 0.745 ns, 2.359 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.323 ns, 0.337 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD24SP_3B : entity is TRUE;
end BBTD24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTD24SP_3B is
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

configuration CFG_BBTD24SP_3B_VITAL of BBTD24SP_3B is
   for VITAL
   end for;
end CFG_BBTD24SP_3B_VITAL;


----- CELL BBTU1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.689 ns, 2.167 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.660 ns, 2.149 ns, 0.579 ns, 2.660 ns, 0.541 ns, 2.149 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.325 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU1P_3B : entity is TRUE;
end BBTU1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU1P_3B is
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

configuration CFG_BBTU1P_3B_VITAL of BBTU1P_3B is
   for VITAL
   end for;
end CFG_BBTU1P_3B_VITAL;


----- CELL BBTU4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.443 ns, 1.151 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.455 ns, 1.121 ns, 0.546 ns, 1.455 ns, 0.637 ns, 1.121 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.202 ns, 0.239 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU4P_3B : entity is TRUE;
end BBTU4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU4P_3B is
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

configuration CFG_BBTU4P_3B_VITAL of BBTU4P_3B is
   for VITAL
   end for;
end CFG_BBTU4P_3B_VITAL;


----- CELL BBTU4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.163 ns, 1.710 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.248 ns, 1.718 ns, 0.512 ns, 2.248 ns, 0.651 ns, 1.718 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.289 ns, 0.320 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU4SMP_3B : entity is TRUE;
end BBTU4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU4SMP_3B is
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

configuration CFG_BBTU4SMP_3B_VITAL of BBTU4SMP_3B is
   for VITAL
   end for;
end CFG_BBTU4SMP_3B_VITAL;


----- CELL BBTU8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.343 ns, 1.086 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.348 ns, 1.025 ns, 0.577 ns, 1.348 ns, 0.624 ns, 1.025 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.289 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU8P_3B : entity is TRUE;
end BBTU8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU8P_3B is
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

configuration CFG_BBTU8P_3B_VITAL of BBTU8P_3B is
   for VITAL
   end for;
end CFG_BBTU8P_3B_VITAL;


----- CELL BBTU8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.862 ns, 1.784 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.945 ns, 1.736 ns, 0.449 ns, 1.945 ns, 0.635 ns, 1.736 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU8SMP_3B : entity is TRUE;
end BBTU8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU8SMP_3B is
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

configuration CFG_BBTU8SMP_3B_VITAL of BBTU8SMP_3B is
   for VITAL
   end for;
end CFG_BBTU8SMP_3B_VITAL;


----- CELL BBTU8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.462 ns, 2.218 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.553 ns, 2.219 ns, 0.484 ns, 2.553 ns, 0.740 ns, 2.219 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU8SP_3B : entity is TRUE;
end BBTU8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU8SP_3B is
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

configuration CFG_BBTU8SP_3B_VITAL of BBTU8SP_3B is
   for VITAL
   end for;
end CFG_BBTU8SP_3B_VITAL;


----- CELL BBTU16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.354 ns, 1.139 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.345 ns, 1.079 ns, 0.623 ns, 1.345 ns, 0.634 ns, 1.079 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU16P_3B : entity is TRUE;
end BBTU16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU16P_3B is
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

configuration CFG_BBTU16P_3B_VITAL of BBTU16P_3B is
   for VITAL
   end for;
end CFG_BBTU16P_3B_VITAL;


----- CELL BBTU16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.000 ns, 1.990 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.056 ns, 1.958 ns, 0.460 ns, 2.056 ns, 0.826 ns, 1.958 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.198 ns, 0.229 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU16SMP_3B : entity is TRUE;
end BBTU16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU16SMP_3B is
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

configuration CFG_BBTU16SMP_3B_VITAL of BBTU16SMP_3B is
   for VITAL
   end for;
end CFG_BBTU16SMP_3B_VITAL;


----- CELL BBTU16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.443 ns, 2.271 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.459 ns, 2.204 ns, 0.503 ns, 2.459 ns, 0.743 ns, 2.204 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.290 ns, 0.324 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU16SP_3B : entity is TRUE;
end BBTU16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU16SP_3B is
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

configuration CFG_BBTU16SP_3B_VITAL of BBTU16SP_3B is
   for VITAL
   end for;
end CFG_BBTU16SP_3B_VITAL;


----- CELL BBTU24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.550 ns, 1.259 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.549 ns, 1.169 ns, 0.731 ns, 1.549 ns, 0.735 ns, 1.169 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.287 ns, 0.320 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU24P_3B : entity is TRUE;
end BBTU24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU24P_3B is
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

configuration CFG_BBTU24P_3B_VITAL of BBTU24P_3B is
   for VITAL
   end for;
end CFG_BBTU24P_3B_VITAL;


----- CELL BBTU24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.113 ns, 2.019 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.158 ns, 1.984 ns, 0.449 ns, 2.158 ns, 0.930 ns, 1.984 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.198 ns, 0.231 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU24SMP_3B : entity is TRUE;
end BBTU24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU24SMP_3B is
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

configuration CFG_BBTU24SMP_3B_VITAL of BBTU24SMP_3B is
   for VITAL
   end for;
end CFG_BBTU24SMP_3B_VITAL;


----- CELL BBTU24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.545 ns, 2.386 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.563 ns, 2.360 ns, 0.532 ns, 2.563 ns, 0.745 ns, 2.360 ns);
      tpd_PAD_Y                      :	VitalDelayType01 := (0.287 ns, 0.326 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU24SP_3B : entity is TRUE;
end BBTU24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BBTU24SP_3B is
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

configuration CFG_BBTU24SP_3B_VITAL of BBTU24SP_3B is
   for VITAL
   end for;
end CFG_BBTU24SP_3B_VITAL;


----- CELL BT1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.183 ns, 2.234 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.175 ns, 2.207 ns, 0.580 ns, 2.175 ns, 0.541 ns, 2.207 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT1P_3B : entity is TRUE;
end BT1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT1P_3B is
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

configuration CFG_BT1P_3B_VITAL of BT1P_3B is
   for VITAL
   end for;
end CFG_BT1P_3B_VITAL;


----- CELL BT2P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT2P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.197 ns, 1.268 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.250 ns, 1.198 ns, 0.455 ns, 1.250 ns, 0.532 ns, 1.198 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT2P_3B : entity is TRUE;
end BT2P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT2P_3B is
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

configuration CFG_BT2P_3B_VITAL of BT2P_3B is
   for VITAL
   end for;
end CFG_BT2P_3B_VITAL;


----- CELL BT4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.307 ns, 1.238 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.302 ns, 1.228 ns, 0.546 ns, 1.302 ns, 0.637 ns, 1.228 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT4P_3B : entity is TRUE;
end BT4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT4P_3B is
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

configuration CFG_BT4P_3B_VITAL of BT4P_3B is
   for VITAL
   end for;
end CFG_BT4P_3B_VITAL;


----- CELL BT4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.998 ns, 1.841 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.058 ns, 1.811 ns, 0.512 ns, 2.058 ns, 0.648 ns, 1.811 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT4SMP_3B : entity is TRUE;
end BT4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT4SMP_3B is
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

configuration CFG_BT4SMP_3B_VITAL of BT4SMP_3B is
   for VITAL
   end for;
end CFG_BT4SMP_3B_VITAL;


----- CELL BT8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.234 ns, 1.162 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.243 ns, 1.079 ns, 0.577 ns, 1.243 ns, 0.623 ns, 1.079 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT8P_3B : entity is TRUE;
end BT8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT8P_3B is
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

configuration CFG_BT8P_3B_VITAL of BT8P_3B is
   for VITAL
   end for;
end CFG_BT8P_3B_VITAL;


----- CELL BT8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.742 ns, 1.911 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.770 ns, 1.878 ns, 0.449 ns, 1.770 ns, 0.635 ns, 1.878 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT8SMP_3B : entity is TRUE;
end BT8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT8SMP_3B is
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

configuration CFG_BT8SMP_3B_VITAL of BT8SMP_3B is
   for VITAL
   end for;
end CFG_BT8SMP_3B_VITAL;


----- CELL BT8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.332 ns, 2.400 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.344 ns, 2.354 ns, 0.484 ns, 2.344 ns, 0.740 ns, 2.354 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT8SP_3B : entity is TRUE;
end BT8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT8SP_3B is
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

configuration CFG_BT8SP_3B_VITAL of BT8SP_3B is
   for VITAL
   end for;
end CFG_BT8SP_3B_VITAL;


----- CELL BT12P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.267 ns, 1.198 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.269 ns, 1.145 ns, 0.586 ns, 1.269 ns, 0.612 ns, 1.145 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT12P_3B : entity is TRUE;
end BT12P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT12P_3B is
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

configuration CFG_BT12P_3B_VITAL of BT12P_3B is
   for VITAL
   end for;
end CFG_BT12P_3B_VITAL;


----- CELL BT12SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.862 ns, 2.006 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.917 ns, 1.971 ns, 0.458 ns, 1.917 ns, 0.663 ns, 1.971 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT12SMP_3B : entity is TRUE;
end BT12SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT12SMP_3B is
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

configuration CFG_BT12SMP_3B_VITAL of BT12SMP_3B is
   for VITAL
   end for;
end CFG_BT12SMP_3B_VITAL;


----- CELL BT12SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.363 ns, 2.532 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.365 ns, 2.481 ns, 0.481 ns, 2.365 ns, 0.760 ns, 2.481 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT12SP_3B : entity is TRUE;
end BT12SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT12SP_3B is
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

configuration CFG_BT12SP_3B_VITAL of BT12SP_3B is
   for VITAL
   end for;
end CFG_BT12SP_3B_VITAL;


----- CELL BT16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.262 ns, 1.222 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.296 ns, 1.187 ns, 0.623 ns, 1.296 ns, 0.634 ns, 1.187 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT16P_3B : entity is TRUE;
end BT16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT16P_3B is
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

configuration CFG_BT16P_3B_VITAL of BT16P_3B is
   for VITAL
   end for;
end CFG_BT16P_3B_VITAL;


----- CELL BT16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.851 ns, 2.130 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.932 ns, 2.078 ns, 0.460 ns, 1.932 ns, 0.830 ns, 2.078 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT16SMP_3B : entity is TRUE;
end BT16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT16SMP_3B is
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

configuration CFG_BT16SMP_3B_VITAL of BT16SMP_3B is
   for VITAL
   end for;
end CFG_BT16SMP_3B_VITAL;


----- CELL BT16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.262 ns, 2.448 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.268 ns, 2.390 ns, 0.503 ns, 2.268 ns, 0.743 ns, 2.390 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT16SP_3B : entity is TRUE;
end BT16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT16SP_3B is
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

configuration CFG_BT16SP_3B_VITAL of BT16SP_3B is
   for VITAL
   end for;
end CFG_BT16SP_3B_VITAL;


----- CELL BT24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.444 ns, 1.349 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1.449 ns, 1.269 ns, 0.731 ns, 1.449 ns, 0.735 ns, 1.269 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT24P_3B : entity is TRUE;
end BT24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT24P_3B is
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

configuration CFG_BT24P_3B_VITAL of BT24P_3B is
   for VITAL
   end for;
end CFG_BT24P_3B_VITAL;


----- CELL BT24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.995 ns, 2.137 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.006 ns, 2.068 ns, 0.449 ns, 2.006 ns, 0.935 ns, 2.068 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT24SMP_3B : entity is TRUE;
end BT24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT24SMP_3B is
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

configuration CFG_BT24SMP_3B_VITAL of BT24SMP_3B is
   for VITAL
   end for;
end CFG_BT24SMP_3B_VITAL;


----- CELL BT24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.393 ns, 2.569 ns);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (2.411 ns, 2.527 ns, 0.532 ns, 2.411 ns, 0.745 ns, 2.527 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_EN                        :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT24SP_3B : entity is TRUE;
end BT24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BT24SP_3B is
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

configuration CFG_BT24SP_3B_VITAL of BT24SP_3B is
   for VITAL
   end for;
end CFG_BT24SP_3B_VITAL;


----- CELL BU1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.221 ns, 2.029 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU1P_3B : entity is TRUE;
end BU1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU1P_3B is
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

configuration CFG_BU1P_3B_VITAL of BU1P_3B is
   for VITAL
   end for;
end CFG_BU1P_3B_VITAL;


----- CELL BU2P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU2P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.161 ns, 1.270 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU2P_3B : entity is TRUE;
end BU2P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU2P_3B is
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

configuration CFG_BU2P_3B_VITAL of BU2P_3B is
   for VITAL
   end for;
end CFG_BU2P_3B_VITAL;


----- CELL BU4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.302 ns, 1.241 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU4P_3B : entity is TRUE;
end BU4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU4P_3B is
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

configuration CFG_BU4P_3B_VITAL of BU4P_3B is
   for VITAL
   end for;
end CFG_BU4P_3B_VITAL;


----- CELL BU4SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU4SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.852 ns, 1.682 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU4SMP_3B : entity is TRUE;
end BU4SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU4SMP_3B is
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

configuration CFG_BU4SMP_3B_VITAL of BU4SMP_3B is
   for VITAL
   end for;
end CFG_BU4SMP_3B_VITAL;


----- CELL BU8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.169 ns, 1.116 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU8P_3B : entity is TRUE;
end BU8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU8P_3B is
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

configuration CFG_BU8P_3B_VITAL of BU8P_3B is
   for VITAL
   end for;
end CFG_BU8P_3B_VITAL;


----- CELL BU8SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.683 ns, 1.764 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU8SMP_3B : entity is TRUE;
end BU8SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU8SMP_3B is
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

configuration CFG_BU8SMP_3B_VITAL of BU8SMP_3B is
   for VITAL
   end for;
end CFG_BU8SMP_3B_VITAL;


----- CELL BU8SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.257 ns, 2.261 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU8SP_3B : entity is TRUE;
end BU8SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU8SP_3B is
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

configuration CFG_BU8SP_3B_VITAL of BU8SP_3B is
   for VITAL
   end for;
end CFG_BU8SP_3B_VITAL;


----- CELL BU12P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.220 ns, 1.161 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU12P_3B : entity is TRUE;
end BU12P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU12P_3B is
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

configuration CFG_BU12P_3B_VITAL of BU12P_3B is
   for VITAL
   end for;
end CFG_BU12P_3B_VITAL;


----- CELL BU12SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.826 ns, 1.873 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU12SMP_3B : entity is TRUE;
end BU12SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU12SMP_3B is
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

configuration CFG_BU12SMP_3B_VITAL of BU12SMP_3B is
   for VITAL
   end for;
end CFG_BU12SMP_3B_VITAL;


----- CELL BU12SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.298 ns, 2.406 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU12SP_3B : entity is TRUE;
end BU12SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU12SP_3B is
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

configuration CFG_BU12SP_3B_VITAL of BU12SP_3B is
   for VITAL
   end for;
end CFG_BU12SP_3B_VITAL;


----- CELL BU16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.175 ns, 1.188 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU16P_3B : entity is TRUE;
end BU16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU16P_3B is
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

configuration CFG_BU16P_3B_VITAL of BU16P_3B is
   for VITAL
   end for;
end CFG_BU16P_3B_VITAL;


----- CELL BU16SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.806 ns, 2.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU16SMP_3B : entity is TRUE;
end BU16SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU16SMP_3B is
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

configuration CFG_BU16SMP_3B_VITAL of BU16SMP_3B is
   for VITAL
   end for;
end CFG_BU16SMP_3B_VITAL;


----- CELL BU16SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.193 ns, 2.321 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU16SP_3B : entity is TRUE;
end BU16SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU16SP_3B is
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

configuration CFG_BU16SP_3B_VITAL of BU16SP_3B is
   for VITAL
   end for;
end CFG_BU16SP_3B_VITAL;


----- CELL BU24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.342 ns, 1.332 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU24P_3B : entity is TRUE;
end BU24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU24P_3B is
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

configuration CFG_BU24P_3B_VITAL of BU24P_3B is
   for VITAL
   end for;
end CFG_BU24P_3B_VITAL;


----- CELL BU24SMP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24SMP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1.899 ns, 2.076 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU24SMP_3B : entity is TRUE;
end BU24SMP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU24SMP_3B is
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

configuration CFG_BU24SMP_3B_VITAL of BU24SMP_3B is
   for VITAL
   end for;
end CFG_BU24SMP_3B_VITAL;


----- CELL BU24SP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24SP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (2.275 ns, 2.511 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU24SP_3B : entity is TRUE;
end BU24SP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BU24SP_3B is
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

configuration CFG_BU24SP_3B_VITAL of BU24SP_3B is
   for VITAL
   end for;
end CFG_BU24SP_3B_VITAL;


----- CELL BUDD1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 2.239 ns, 0.587 ns, 0.000 ns, 0.000 ns, 2.239 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD1P_3B : entity is TRUE;
end BUDD1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDD1P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '0',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD1P_3B_VITAL of BUDD1P_3B is
   for VITAL
   end for;
end CFG_BUDD1P_3B_VITAL;


----- CELL BUDD2P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD2P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.237 ns, 0.405 ns, 0.000 ns, 0.000 ns, 1.237 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD2P_3B : entity is TRUE;
end BUDD2P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDD2P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '0',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD2P_3B_VITAL of BUDD2P_3B is
   for VITAL
   end for;
end CFG_BUDD2P_3B_VITAL;


----- CELL BUDD4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.228 ns, 0.530 ns, 0.000 ns, 0.000 ns, 1.228 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD4P_3B : entity is TRUE;
end BUDD4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDD4P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '0',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD4P_3B_VITAL of BUDD4P_3B is
   for VITAL
   end for;
end CFG_BUDD4P_3B_VITAL;


----- CELL BUDD8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.119 ns, 0.522 ns, 0.000 ns, 0.000 ns, 1.119 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD8P_3B : entity is TRUE;
end BUDD8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDD8P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '0',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD8P_3B_VITAL of BUDD8P_3B is
   for VITAL
   end for;
end CFG_BUDD8P_3B_VITAL;


----- CELL BUDD12P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD12P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.255 ns, 0.586 ns, 0.000 ns, 0.000 ns, 1.255 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD12P_3B : entity is TRUE;
end BUDD12P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDD12P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '0',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD12P_3B_VITAL of BUDD12P_3B is
   for VITAL
   end for;
end CFG_BUDD12P_3B_VITAL;


----- CELL BUDD16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.051 ns, 0.454 ns, 0.000 ns, 0.000 ns, 1.051 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD16P_3B : entity is TRUE;
end BUDD16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDD16P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '0',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD16P_3B_VITAL of BUDD16P_3B is
   for VITAL
   end for;
end CFG_BUDD16P_3B_VITAL;


----- CELL BUDD24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0.000 ns, 1.180 ns, 0.552 ns, 0.000 ns, 0.000 ns, 1.180 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD24P_3B : entity is TRUE;
end BUDD24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDD24P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '0',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD24P_3B_VITAL of BUDD24P_3B is
   for VITAL
   end for;
end CFG_BUDD24P_3B_VITAL;


----- CELL BUDU1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.966 ns, 0.000 ns, 0.000 ns, 1.966 ns, 0.356 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU1P_3B : entity is TRUE;
end BUDU1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDU1P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '1',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU1P_3B_VITAL of BUDU1P_3B is
   for VITAL
   end for;
end CFG_BUDU1P_3B_VITAL;


----- CELL BUDU2P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU2P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.071 ns, 0.000 ns, 0.000 ns, 1.071 ns, 0.437 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU2P_3B : entity is TRUE;
end BUDU2P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDU2P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '1',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU2P_3B_VITAL of BUDU2P_3B is
   for VITAL
   end for;
end CFG_BUDU2P_3B_VITAL;


----- CELL BUDU4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.209 ns, 0.000 ns, 0.000 ns, 1.209 ns, 0.563 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU4P_3B : entity is TRUE;
end BUDU4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDU4P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '1',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU4P_3B_VITAL of BUDU4P_3B is
   for VITAL
   end for;
end CFG_BUDU4P_3B_VITAL;


----- CELL BUDU8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.092 ns, 0.000 ns, 0.000 ns, 1.092 ns, 0.527 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU8P_3B : entity is TRUE;
end BUDU8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDU8P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '1',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU8P_3B_VITAL of BUDU8P_3B is
   for VITAL
   end for;
end CFG_BUDU8P_3B_VITAL;


----- CELL BUDU12P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU12P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.227 ns, 0.000 ns, 0.000 ns, 1.227 ns, 0.649 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU12P_3B : entity is TRUE;
end BUDU12P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDU12P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '1',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU12P_3B_VITAL of BUDU12P_3B is
   for VITAL
   end for;
end CFG_BUDU12P_3B_VITAL;


----- CELL BUDU16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.217 ns, 0.000 ns, 0.000 ns, 1.217 ns, 0.673 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU16P_3B : entity is TRUE;
end BUDU16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDU16P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '1',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU16P_3B_VITAL of BUDU16P_3B is
   for VITAL
   end for;
end CFG_BUDU16P_3B_VITAL;


----- CELL BUDU24P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU24P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1.419 ns, 0.000 ns, 0.000 ns, 1.419 ns, 0.839 ns, 0.000 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU24P_3B : entity is TRUE;
end BUDU24P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of BUDU24P_3B is
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
      PAD_zd := VitalBUFIF0 (data => '1',
              enable => A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01Z (
       OutSignal => PAD,
       GlitchData => PAD_GlitchData,
       OutSignalName => "PAD",
       OutTemp => PAD_zd,
       Paths => (0 => (A_ipd'last_event, VitalExtendToFillDelay(tpd_A_PAD), TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU24P_3B_VITAL of BUDU24P_3B is
   for VITAL
   end for;
end CFG_BUDU24P_3B_VITAL;


----- CELL CBU1P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity CBU1P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_Y                        :	VitalDelayType01 := (0.527 ns, 0.565 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of CBU1P_3B : entity is TRUE;
end CBU1P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of CBU1P_3B is
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
   ALIAS Y_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      Y_zd := TO_X01(A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (A_ipd'last_event, tpd_A_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_CBU1P_3B_VITAL of CBU1P_3B is
   for VITAL
   end for;
end CFG_CBU1P_3B_VITAL;


----- CELL CBU2P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity CBU2P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_Y                        :	VitalDelayType01 := (0.496 ns, 0.535 ns);
      tipd_A                         :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of CBU2P_3B : entity is TRUE;
end CBU2P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of CBU2P_3B is
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
   ALIAS Y_zd : STD_LOGIC is Results(1);

   -- output glitch detection variables
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      Y_zd := TO_X01(A_ipd);

      ----------------------
      --  Path Delay Section
      ----------------------
      VitalPathDelay01 (
       OutSignal => Y,
       GlitchData => Y_GlitchData,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (A_ipd'last_event, tpd_A_Y, TRUE)),
       Mode => OnDetect,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_CBU2P_3B_VITAL of CBU2P_3B is
   for VITAL
   end for;
end CFG_CBU2P_3B_VITAL;


----- CELL GND3ALLP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3ALLP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3ALLP_3B : entity is TRUE;
end GND3ALLP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of GND3ALLP_3B is

begin

   assert (FALSE)
     report "Cell GND3ALLP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3ALLP_3B_VITAL of GND3ALLP_3B is
   for VITAL
   end for;
end CFG_GND3ALLP_3B_VITAL;


----- CELL GND3IP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3IP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3IP_3B : entity is TRUE;
end GND3IP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of GND3IP_3B is

begin

   assert (FALSE)
     report "Cell GND3IP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3IP_3B_VITAL of GND3IP_3B is
   for VITAL
   end for;
end CFG_GND3IP_3B_VITAL;


----- CELL GND3OP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3OP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3OP_3B : entity is TRUE;
end GND3OP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of GND3OP_3B is

begin

   assert (FALSE)
     report "Cell GND3OP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3OP_3B_VITAL of GND3OP_3B is
   for VITAL
   end for;
end CFG_GND3OP_3B_VITAL;


----- CELL GND3RP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3RP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3RP_3B : entity is TRUE;
end GND3RP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of GND3RP_3B is

begin

   assert (FALSE)
     report "Cell GND3RP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3RP_3B_VITAL of GND3RP_3B is
   for VITAL
   end for;
end CFG_GND3RP_3B_VITAL;


----- CELL ICCK2P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK2P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.398 ns, 0.376 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICCK2P_3B : entity is TRUE;
end ICCK2P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ICCK2P_3B is
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

configuration CFG_ICCK2P_3B_VITAL of ICCK2P_3B is
   for VITAL
   end for;
end CFG_ICCK2P_3B_VITAL;


----- CELL ICCK4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.447 ns, 0.424 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICCK4P_3B : entity is TRUE;
end ICCK4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ICCK4P_3B is
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

configuration CFG_ICCK4P_3B_VITAL of ICCK4P_3B is
   for VITAL
   end for;
end CFG_ICCK4P_3B_VITAL;


----- CELL ICCK8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.587 ns, 0.535 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICCK8P_3B : entity is TRUE;
end ICCK8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ICCK8P_3B is
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

configuration CFG_ICCK8P_3B_VITAL of ICCK8P_3B is
   for VITAL
   end for;
end CFG_ICCK8P_3B_VITAL;


----- CELL ICCK16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.500 ns, 0.482 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICCK16P_3B : entity is TRUE;
end ICCK16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ICCK16P_3B is
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

configuration CFG_ICCK16P_3B_VITAL of ICCK16P_3B is
   for VITAL
   end for;
end CFG_ICCK16P_3B_VITAL;


----- CELL ICDP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICDP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.379 ns, 0.368 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICDP_3B : entity is TRUE;
end ICDP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ICDP_3B is
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

configuration CFG_ICDP_3B_VITAL of ICDP_3B is
   for VITAL
   end for;
end CFG_ICDP_3B_VITAL;


----- CELL ICP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.330 ns, 0.326 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICP_3B : entity is TRUE;
end ICP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ICP_3B is
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

configuration CFG_ICP_3B_VITAL of ICP_3B is
   for VITAL
   end for;
end CFG_ICP_3B_VITAL;


----- CELL ICUP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICUP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.350 ns, 0.353 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICUP_3B : entity is TRUE;
end ICUP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ICUP_3B is
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

configuration CFG_ICUP_3B_VITAL of ICUP_3B is
   for VITAL
   end for;
end CFG_ICUP_3B_VITAL;


----- CELL ISDP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISDP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.483 ns, 0.554 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ISDP_3B : entity is TRUE;
end ISDP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ISDP_3B is
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

configuration CFG_ISDP_3B_VITAL of ISDP_3B is
   for VITAL
   end for;
end CFG_ISDP_3B_VITAL;


----- CELL ISP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.428 ns, 0.488 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ISP_3B : entity is TRUE;
end ISP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ISP_3B is
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

configuration CFG_ISP_3B_VITAL of ISP_3B is
   for VITAL
   end for;
end CFG_ISP_3B_VITAL;


----- CELL ISUP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISUP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.470 ns, 0.516 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ISUP_3B : entity is TRUE;
end ISUP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ISUP_3B is
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

configuration CFG_ISUP_3B_VITAL of ISUP_3B is
   for VITAL
   end for;
end CFG_ISUP_3B_VITAL;


----- CELL ITCK2P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK2P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.358 ns, 0.487 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITCK2P_3B : entity is TRUE;
end ITCK2P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ITCK2P_3B is
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

configuration CFG_ITCK2P_3B_VITAL of ITCK2P_3B is
   for VITAL
   end for;
end CFG_ITCK2P_3B_VITAL;


----- CELL ITCK4P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK4P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.372 ns, 0.514 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITCK4P_3B : entity is TRUE;
end ITCK4P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ITCK4P_3B is
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

configuration CFG_ITCK4P_3B_VITAL of ITCK4P_3B is
   for VITAL
   end for;
end CFG_ITCK4P_3B_VITAL;


----- CELL ITCK8P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK8P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.453 ns, 0.603 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITCK8P_3B : entity is TRUE;
end ITCK8P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ITCK8P_3B is
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

configuration CFG_ITCK8P_3B_VITAL of ITCK8P_3B is
   for VITAL
   end for;
end CFG_ITCK8P_3B_VITAL;


----- CELL ITCK16P_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK16P_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.396 ns, 0.522 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITCK16P_3B : entity is TRUE;
end ITCK16P_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ITCK16P_3B is
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

configuration CFG_ITCK16P_3B_VITAL of ITCK16P_3B is
   for VITAL
   end for;
end CFG_ITCK16P_3B_VITAL;


----- CELL ITDP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITDP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.324 ns, 0.337 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITDP_3B : entity is TRUE;
end ITDP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ITDP_3B is
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

configuration CFG_ITDP_3B_VITAL of ITDP_3B is
   for VITAL
   end for;
end CFG_ITDP_3B_VITAL;


----- CELL ITP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.275 ns, 0.298 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITP_3B : entity is TRUE;
end ITP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ITP_3B is
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

configuration CFG_ITP_3B_VITAL of ITP_3B is
   for VITAL
   end for;
end CFG_ITP_3B_VITAL;


----- CELL ITUP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITUP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (0.286 ns, 0.321 ns);
      tipd_PAD                       :	VitalDelayType01 := (0.000 ns, 0.000 ns));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITUP_3B : entity is TRUE;
end ITUP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of ITUP_3B is
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

configuration CFG_ITUP_3B_VITAL of ITUP_3B is
   for VITAL
   end for;
end CFG_ITUP_3B_VITAL;


----- CELL VDD3ALLP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3ALLP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3ALLP_3B : entity is TRUE;
end VDD3ALLP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of VDD3ALLP_3B is

begin

   assert (FALSE)
     report "Cell VDD3ALLP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3ALLP_3B_VITAL of VDD3ALLP_3B is
   for VITAL
   end for;
end CFG_VDD3ALLP_3B_VITAL;


----- CELL VDD3IP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3IP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3IP_3B : entity is TRUE;
end VDD3IP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of VDD3IP_3B is

begin

   assert (FALSE)
     report "Cell VDD3IP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3IP_3B_VITAL of VDD3IP_3B is
   for VITAL
   end for;
end CFG_VDD3IP_3B_VITAL;


----- CELL VDD3OP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3OP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3OP_3B : entity is TRUE;
end VDD3OP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of VDD3OP_3B is

begin

   assert (FALSE)
     report "Cell VDD3OP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3OP_3B_VITAL of VDD3OP_3B is
   for VITAL
   end for;
end CFG_VDD3OP_3B_VITAL;


----- CELL VDD3RP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3RP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3RP_3B : entity is TRUE;
end VDD3RP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of VDD3RP_3B is

begin

   assert (FALSE)
     report "Cell VDD3RP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3RP_3B_VITAL of VDD3RP_3B is
   for VITAL
   end for;
end CFG_VDD3RP_3B_VITAL;


----- CELL VSUBP_3B -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VSUBP_3B is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VSUBP_3B : entity is TRUE;
end VSUBP_3B;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_3B_4M;
use c35_IOLIB_3B_4M.VTABLES.all;
architecture VITAL of VSUBP_3B is

begin

   assert (FALSE)
     report "Cell VSUBP_3B was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VSUBP_3B_VITAL of VSUBP_3B is
   for VITAL
   end for;
end CFG_VSUBP_3B_VITAL;


---- end of library ----
