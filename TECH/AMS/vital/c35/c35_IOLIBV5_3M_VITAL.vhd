
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler 2000.11
-- FILE CONTENTS:    Entity, Structural Architecture(VITAL),
--                   and Configuration
-- DATE CREATED :    Thu Jun 27 17:09:16 2002
-- 
-- LIBRARY      :    c35_IOLIBV5_4M
-- DATE ENTERED :    $Date: 2001/10/30 09:43:45 $
-- REVISION     :    $Id: csx_IOLIBV5_3M.lib,v 1.2 2001/10/30 09:43:45 mbo Exp mbo $
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ps
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    VITAL, TimingChecksOn(TRUE), XGenerationOn(TRUE), TimingMessage(TRUE), OnEvent 
--                   Owner: austriamicrosystems AG  HIT-Kit: Digital
-- HISTORY      :
-- 
----------------------------------------------------------------

----- CELL BBC1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC1P_V5 : entity is TRUE;
end BBC1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC1P_V5_VITAL of BBC1P_V5 is
   for VITAL
   end for;
end CFG_BBC1P_V5_VITAL;


----- CELL BBC4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC4P_V5 : entity is TRUE;
end BBC4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC4P_V5_VITAL of BBC4P_V5 is
   for VITAL
   end for;
end CFG_BBC4P_V5_VITAL;


----- CELL BBC4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC4SMP_V5 : entity is TRUE;
end BBC4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC4SMP_V5_VITAL of BBC4SMP_V5 is
   for VITAL
   end for;
end CFG_BBC4SMP_V5_VITAL;


----- CELL BBC8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC8P_V5 : entity is TRUE;
end BBC8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC8P_V5_VITAL of BBC8P_V5 is
   for VITAL
   end for;
end CFG_BBC8P_V5_VITAL;


----- CELL BBC8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC8SMP_V5 : entity is TRUE;
end BBC8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC8SMP_V5_VITAL of BBC8SMP_V5 is
   for VITAL
   end for;
end CFG_BBC8SMP_V5_VITAL;


----- CELL BBC8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC8SP_V5 : entity is TRUE;
end BBC8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC8SP_V5_VITAL of BBC8SP_V5 is
   for VITAL
   end for;
end CFG_BBC8SP_V5_VITAL;


----- CELL BBC16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC16P_V5 : entity is TRUE;
end BBC16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC16P_V5_VITAL of BBC16P_V5 is
   for VITAL
   end for;
end CFG_BBC16P_V5_VITAL;


----- CELL BBC16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC16SMP_V5 : entity is TRUE;
end BBC16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC16SMP_V5_VITAL of BBC16SMP_V5 is
   for VITAL
   end for;
end CFG_BBC16SMP_V5_VITAL;


----- CELL BBC16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC16SP_V5 : entity is TRUE;
end BBC16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC16SP_V5_VITAL of BBC16SP_V5 is
   for VITAL
   end for;
end CFG_BBC16SP_V5_VITAL;


----- CELL BBC24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC24P_V5 : entity is TRUE;
end BBC24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC24P_V5_VITAL of BBC24P_V5 is
   for VITAL
   end for;
end CFG_BBC24P_V5_VITAL;


----- CELL BBC24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC24SMP_V5 : entity is TRUE;
end BBC24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC24SMP_V5_VITAL of BBC24SMP_V5 is
   for VITAL
   end for;
end CFG_BBC24SMP_V5_VITAL;


----- CELL BBC24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBC24SP_V5 : entity is TRUE;
end BBC24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBC24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBC24SP_V5_VITAL of BBC24SP_V5 is
   for VITAL
   end for;
end CFG_BBC24SP_V5_VITAL;


----- CELL BBCD1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD1P_V5 : entity is TRUE;
end BBCD1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD1P_V5_VITAL of BBCD1P_V5 is
   for VITAL
   end for;
end CFG_BBCD1P_V5_VITAL;


----- CELL BBCD4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD4P_V5 : entity is TRUE;
end BBCD4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD4P_V5_VITAL of BBCD4P_V5 is
   for VITAL
   end for;
end CFG_BBCD4P_V5_VITAL;


----- CELL BBCD4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD4SMP_V5 : entity is TRUE;
end BBCD4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD4SMP_V5_VITAL of BBCD4SMP_V5 is
   for VITAL
   end for;
end CFG_BBCD4SMP_V5_VITAL;


----- CELL BBCD8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD8P_V5 : entity is TRUE;
end BBCD8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD8P_V5_VITAL of BBCD8P_V5 is
   for VITAL
   end for;
end CFG_BBCD8P_V5_VITAL;


----- CELL BBCD8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD8SMP_V5 : entity is TRUE;
end BBCD8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD8SMP_V5_VITAL of BBCD8SMP_V5 is
   for VITAL
   end for;
end CFG_BBCD8SMP_V5_VITAL;


----- CELL BBCD8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD8SP_V5 : entity is TRUE;
end BBCD8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD8SP_V5_VITAL of BBCD8SP_V5 is
   for VITAL
   end for;
end CFG_BBCD8SP_V5_VITAL;


----- CELL BBCD16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD16P_V5 : entity is TRUE;
end BBCD16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD16P_V5_VITAL of BBCD16P_V5 is
   for VITAL
   end for;
end CFG_BBCD16P_V5_VITAL;


----- CELL BBCD16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD16SMP_V5 : entity is TRUE;
end BBCD16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD16SMP_V5_VITAL of BBCD16SMP_V5 is
   for VITAL
   end for;
end CFG_BBCD16SMP_V5_VITAL;


----- CELL BBCD16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD16SP_V5 : entity is TRUE;
end BBCD16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD16SP_V5_VITAL of BBCD16SP_V5 is
   for VITAL
   end for;
end CFG_BBCD16SP_V5_VITAL;


----- CELL BBCD24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD24P_V5 : entity is TRUE;
end BBCD24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD24P_V5_VITAL of BBCD24P_V5 is
   for VITAL
   end for;
end CFG_BBCD24P_V5_VITAL;


----- CELL BBCD24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD24SMP_V5 : entity is TRUE;
end BBCD24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD24SMP_V5_VITAL of BBCD24SMP_V5 is
   for VITAL
   end for;
end CFG_BBCD24SMP_V5_VITAL;


----- CELL BBCD24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCD24SP_V5 : entity is TRUE;
end BBCD24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCD24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCD24SP_V5_VITAL of BBCD24SP_V5 is
   for VITAL
   end for;
end CFG_BBCD24SP_V5_VITAL;


----- CELL BBCU1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU1P_V5 : entity is TRUE;
end BBCU1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU1P_V5_VITAL of BBCU1P_V5 is
   for VITAL
   end for;
end CFG_BBCU1P_V5_VITAL;


----- CELL BBCU4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU4P_V5 : entity is TRUE;
end BBCU4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU4P_V5_VITAL of BBCU4P_V5 is
   for VITAL
   end for;
end CFG_BBCU4P_V5_VITAL;


----- CELL BBCU4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU4SMP_V5 : entity is TRUE;
end BBCU4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU4SMP_V5_VITAL of BBCU4SMP_V5 is
   for VITAL
   end for;
end CFG_BBCU4SMP_V5_VITAL;


----- CELL BBCU8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU8P_V5 : entity is TRUE;
end BBCU8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU8P_V5_VITAL of BBCU8P_V5 is
   for VITAL
   end for;
end CFG_BBCU8P_V5_VITAL;


----- CELL BBCU8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU8SMP_V5 : entity is TRUE;
end BBCU8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU8SMP_V5_VITAL of BBCU8SMP_V5 is
   for VITAL
   end for;
end CFG_BBCU8SMP_V5_VITAL;


----- CELL BBCU8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU8SP_V5 : entity is TRUE;
end BBCU8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU8SP_V5_VITAL of BBCU8SP_V5 is
   for VITAL
   end for;
end CFG_BBCU8SP_V5_VITAL;


----- CELL BBCU16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU16P_V5 : entity is TRUE;
end BBCU16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU16P_V5_VITAL of BBCU16P_V5 is
   for VITAL
   end for;
end CFG_BBCU16P_V5_VITAL;


----- CELL BBCU16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU16SMP_V5 : entity is TRUE;
end BBCU16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU16SMP_V5_VITAL of BBCU16SMP_V5 is
   for VITAL
   end for;
end CFG_BBCU16SMP_V5_VITAL;


----- CELL BBCU16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU16SP_V5 : entity is TRUE;
end BBCU16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU16SP_V5_VITAL of BBCU16SP_V5 is
   for VITAL
   end for;
end CFG_BBCU16SP_V5_VITAL;


----- CELL BBCU24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU24P_V5 : entity is TRUE;
end BBCU24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU24P_V5_VITAL of BBCU24P_V5 is
   for VITAL
   end for;
end CFG_BBCU24P_V5_VITAL;


----- CELL BBCU24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU24SMP_V5 : entity is TRUE;
end BBCU24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU24SMP_V5_VITAL of BBCU24SMP_V5 is
   for VITAL
   end for;
end CFG_BBCU24SMP_V5_VITAL;


----- CELL BBCU24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBCU24SP_V5 : entity is TRUE;
end BBCU24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBCU24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBCU24SP_V5_VITAL of BBCU24SP_V5 is
   for VITAL
   end for;
end CFG_BBCU24SP_V5_VITAL;


----- CELL BBS1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS1P_V5 : entity is TRUE;
end BBS1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS1P_V5_VITAL of BBS1P_V5 is
   for VITAL
   end for;
end CFG_BBS1P_V5_VITAL;


----- CELL BBS4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS4P_V5 : entity is TRUE;
end BBS4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS4P_V5_VITAL of BBS4P_V5 is
   for VITAL
   end for;
end CFG_BBS4P_V5_VITAL;


----- CELL BBS4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS4SMP_V5 : entity is TRUE;
end BBS4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS4SMP_V5_VITAL of BBS4SMP_V5 is
   for VITAL
   end for;
end CFG_BBS4SMP_V5_VITAL;


----- CELL BBS8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS8P_V5 : entity is TRUE;
end BBS8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS8P_V5_VITAL of BBS8P_V5 is
   for VITAL
   end for;
end CFG_BBS8P_V5_VITAL;


----- CELL BBS8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS8SMP_V5 : entity is TRUE;
end BBS8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS8SMP_V5_VITAL of BBS8SMP_V5 is
   for VITAL
   end for;
end CFG_BBS8SMP_V5_VITAL;


----- CELL BBS8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS8SP_V5 : entity is TRUE;
end BBS8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS8SP_V5_VITAL of BBS8SP_V5 is
   for VITAL
   end for;
end CFG_BBS8SP_V5_VITAL;


----- CELL BBS16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS16P_V5 : entity is TRUE;
end BBS16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS16P_V5_VITAL of BBS16P_V5 is
   for VITAL
   end for;
end CFG_BBS16P_V5_VITAL;


----- CELL BBS16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS16SMP_V5 : entity is TRUE;
end BBS16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS16SMP_V5_VITAL of BBS16SMP_V5 is
   for VITAL
   end for;
end CFG_BBS16SMP_V5_VITAL;


----- CELL BBS16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS16SP_V5 : entity is TRUE;
end BBS16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS16SP_V5_VITAL of BBS16SP_V5 is
   for VITAL
   end for;
end CFG_BBS16SP_V5_VITAL;


----- CELL BBS24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS24P_V5 : entity is TRUE;
end BBS24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS24P_V5_VITAL of BBS24P_V5 is
   for VITAL
   end for;
end CFG_BBS24P_V5_VITAL;


----- CELL BBS24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS24SMP_V5 : entity is TRUE;
end BBS24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS24SMP_V5_VITAL of BBS24SMP_V5 is
   for VITAL
   end for;
end CFG_BBS24SMP_V5_VITAL;


----- CELL BBS24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBS24SP_V5 : entity is TRUE;
end BBS24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBS24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBS24SP_V5_VITAL of BBS24SP_V5 is
   for VITAL
   end for;
end CFG_BBS24SP_V5_VITAL;


----- CELL BBSD1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD1P_V5 : entity is TRUE;
end BBSD1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD1P_V5_VITAL of BBSD1P_V5 is
   for VITAL
   end for;
end CFG_BBSD1P_V5_VITAL;


----- CELL BBSD4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD4P_V5 : entity is TRUE;
end BBSD4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD4P_V5_VITAL of BBSD4P_V5 is
   for VITAL
   end for;
end CFG_BBSD4P_V5_VITAL;


----- CELL BBSD4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD4SMP_V5 : entity is TRUE;
end BBSD4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD4SMP_V5_VITAL of BBSD4SMP_V5 is
   for VITAL
   end for;
end CFG_BBSD4SMP_V5_VITAL;


----- CELL BBSD8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD8P_V5 : entity is TRUE;
end BBSD8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD8P_V5_VITAL of BBSD8P_V5 is
   for VITAL
   end for;
end CFG_BBSD8P_V5_VITAL;


----- CELL BBSD8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD8SMP_V5 : entity is TRUE;
end BBSD8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD8SMP_V5_VITAL of BBSD8SMP_V5 is
   for VITAL
   end for;
end CFG_BBSD8SMP_V5_VITAL;


----- CELL BBSD8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD8SP_V5 : entity is TRUE;
end BBSD8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD8SP_V5_VITAL of BBSD8SP_V5 is
   for VITAL
   end for;
end CFG_BBSD8SP_V5_VITAL;


----- CELL BBSD16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD16P_V5 : entity is TRUE;
end BBSD16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD16P_V5_VITAL of BBSD16P_V5 is
   for VITAL
   end for;
end CFG_BBSD16P_V5_VITAL;


----- CELL BBSD16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD16SMP_V5 : entity is TRUE;
end BBSD16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD16SMP_V5_VITAL of BBSD16SMP_V5 is
   for VITAL
   end for;
end CFG_BBSD16SMP_V5_VITAL;


----- CELL BBSD16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD16SP_V5 : entity is TRUE;
end BBSD16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD16SP_V5_VITAL of BBSD16SP_V5 is
   for VITAL
   end for;
end CFG_BBSD16SP_V5_VITAL;


----- CELL BBSD24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD24P_V5 : entity is TRUE;
end BBSD24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD24P_V5_VITAL of BBSD24P_V5 is
   for VITAL
   end for;
end CFG_BBSD24P_V5_VITAL;


----- CELL BBSD24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD24SMP_V5 : entity is TRUE;
end BBSD24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD24SMP_V5_VITAL of BBSD24SMP_V5 is
   for VITAL
   end for;
end CFG_BBSD24SMP_V5_VITAL;


----- CELL BBSD24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSD24SP_V5 : entity is TRUE;
end BBSD24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSD24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSD24SP_V5_VITAL of BBSD24SP_V5 is
   for VITAL
   end for;
end CFG_BBSD24SP_V5_VITAL;


----- CELL BBSU1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU1P_V5 : entity is TRUE;
end BBSU1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU1P_V5_VITAL of BBSU1P_V5 is
   for VITAL
   end for;
end CFG_BBSU1P_V5_VITAL;


----- CELL BBSU4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU4P_V5 : entity is TRUE;
end BBSU4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU4P_V5_VITAL of BBSU4P_V5 is
   for VITAL
   end for;
end CFG_BBSU4P_V5_VITAL;


----- CELL BBSU4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU4SMP_V5 : entity is TRUE;
end BBSU4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU4SMP_V5_VITAL of BBSU4SMP_V5 is
   for VITAL
   end for;
end CFG_BBSU4SMP_V5_VITAL;


----- CELL BBSU8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU8P_V5 : entity is TRUE;
end BBSU8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU8P_V5_VITAL of BBSU8P_V5 is
   for VITAL
   end for;
end CFG_BBSU8P_V5_VITAL;


----- CELL BBSU8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU8SMP_V5 : entity is TRUE;
end BBSU8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU8SMP_V5_VITAL of BBSU8SMP_V5 is
   for VITAL
   end for;
end CFG_BBSU8SMP_V5_VITAL;


----- CELL BBSU8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU8SP_V5 : entity is TRUE;
end BBSU8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU8SP_V5_VITAL of BBSU8SP_V5 is
   for VITAL
   end for;
end CFG_BBSU8SP_V5_VITAL;


----- CELL BBSU16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU16P_V5 : entity is TRUE;
end BBSU16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU16P_V5_VITAL of BBSU16P_V5 is
   for VITAL
   end for;
end CFG_BBSU16P_V5_VITAL;


----- CELL BBSU16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU16SMP_V5 : entity is TRUE;
end BBSU16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU16SMP_V5_VITAL of BBSU16SMP_V5 is
   for VITAL
   end for;
end CFG_BBSU16SMP_V5_VITAL;


----- CELL BBSU16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU16SP_V5 : entity is TRUE;
end BBSU16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU16SP_V5_VITAL of BBSU16SP_V5 is
   for VITAL
   end for;
end CFG_BBSU16SP_V5_VITAL;


----- CELL BBSU24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU24P_V5 : entity is TRUE;
end BBSU24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU24P_V5_VITAL of BBSU24P_V5 is
   for VITAL
   end for;
end CFG_BBSU24P_V5_VITAL;


----- CELL BBSU24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU24SMP_V5 : entity is TRUE;
end BBSU24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU24SMP_V5_VITAL of BBSU24SMP_V5 is
   for VITAL
   end for;
end CFG_BBSU24SMP_V5_VITAL;


----- CELL BBSU24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBSU24SP_V5 : entity is TRUE;
end BBSU24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBSU24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBSU24SP_V5_VITAL of BBSU24SP_V5 is
   for VITAL
   end for;
end CFG_BBSU24SP_V5_VITAL;


----- CELL BBT1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT1P_V5 : entity is TRUE;
end BBT1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT1P_V5_VITAL of BBT1P_V5 is
   for VITAL
   end for;
end CFG_BBT1P_V5_VITAL;


----- CELL BBT4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT4P_V5 : entity is TRUE;
end BBT4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT4P_V5_VITAL of BBT4P_V5 is
   for VITAL
   end for;
end CFG_BBT4P_V5_VITAL;


----- CELL BBT4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT4SMP_V5 : entity is TRUE;
end BBT4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT4SMP_V5_VITAL of BBT4SMP_V5 is
   for VITAL
   end for;
end CFG_BBT4SMP_V5_VITAL;


----- CELL BBT8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT8P_V5 : entity is TRUE;
end BBT8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT8P_V5_VITAL of BBT8P_V5 is
   for VITAL
   end for;
end CFG_BBT8P_V5_VITAL;


----- CELL BBT8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT8SMP_V5 : entity is TRUE;
end BBT8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT8SMP_V5_VITAL of BBT8SMP_V5 is
   for VITAL
   end for;
end CFG_BBT8SMP_V5_VITAL;


----- CELL BBT8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT8SP_V5 : entity is TRUE;
end BBT8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT8SP_V5_VITAL of BBT8SP_V5 is
   for VITAL
   end for;
end CFG_BBT8SP_V5_VITAL;


----- CELL BBT16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT16P_V5 : entity is TRUE;
end BBT16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT16P_V5_VITAL of BBT16P_V5 is
   for VITAL
   end for;
end CFG_BBT16P_V5_VITAL;


----- CELL BBT16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT16SMP_V5 : entity is TRUE;
end BBT16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT16SMP_V5_VITAL of BBT16SMP_V5 is
   for VITAL
   end for;
end CFG_BBT16SMP_V5_VITAL;


----- CELL BBT16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT16SP_V5 : entity is TRUE;
end BBT16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT16SP_V5_VITAL of BBT16SP_V5 is
   for VITAL
   end for;
end CFG_BBT16SP_V5_VITAL;


----- CELL BBT24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT24P_V5 : entity is TRUE;
end BBT24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT24P_V5_VITAL of BBT24P_V5 is
   for VITAL
   end for;
end CFG_BBT24P_V5_VITAL;


----- CELL BBT24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT24SMP_V5 : entity is TRUE;
end BBT24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT24SMP_V5_VITAL of BBT24SMP_V5 is
   for VITAL
   end for;
end CFG_BBT24SMP_V5_VITAL;


----- CELL BBT24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBT24SP_V5 : entity is TRUE;
end BBT24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBT24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBT24SP_V5_VITAL of BBT24SP_V5 is
   for VITAL
   end for;
end CFG_BBT24SP_V5_VITAL;


----- CELL BBTD1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD1P_V5 : entity is TRUE;
end BBTD1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD1P_V5_VITAL of BBTD1P_V5 is
   for VITAL
   end for;
end CFG_BBTD1P_V5_VITAL;


----- CELL BBTD4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD4P_V5 : entity is TRUE;
end BBTD4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD4P_V5_VITAL of BBTD4P_V5 is
   for VITAL
   end for;
end CFG_BBTD4P_V5_VITAL;


----- CELL BBTD4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD4SMP_V5 : entity is TRUE;
end BBTD4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD4SMP_V5_VITAL of BBTD4SMP_V5 is
   for VITAL
   end for;
end CFG_BBTD4SMP_V5_VITAL;


----- CELL BBTD8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD8P_V5 : entity is TRUE;
end BBTD8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD8P_V5_VITAL of BBTD8P_V5 is
   for VITAL
   end for;
end CFG_BBTD8P_V5_VITAL;


----- CELL BBTD8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD8SMP_V5 : entity is TRUE;
end BBTD8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD8SMP_V5_VITAL of BBTD8SMP_V5 is
   for VITAL
   end for;
end CFG_BBTD8SMP_V5_VITAL;


----- CELL BBTD8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD8SP_V5 : entity is TRUE;
end BBTD8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD8SP_V5_VITAL of BBTD8SP_V5 is
   for VITAL
   end for;
end CFG_BBTD8SP_V5_VITAL;


----- CELL BBTD16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD16P_V5 : entity is TRUE;
end BBTD16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD16P_V5_VITAL of BBTD16P_V5 is
   for VITAL
   end for;
end CFG_BBTD16P_V5_VITAL;


----- CELL BBTD16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD16SMP_V5 : entity is TRUE;
end BBTD16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD16SMP_V5_VITAL of BBTD16SMP_V5 is
   for VITAL
   end for;
end CFG_BBTD16SMP_V5_VITAL;


----- CELL BBTD16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD16SP_V5 : entity is TRUE;
end BBTD16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD16SP_V5_VITAL of BBTD16SP_V5 is
   for VITAL
   end for;
end CFG_BBTD16SP_V5_VITAL;


----- CELL BBTD24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD24P_V5 : entity is TRUE;
end BBTD24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD24P_V5_VITAL of BBTD24P_V5 is
   for VITAL
   end for;
end CFG_BBTD24P_V5_VITAL;


----- CELL BBTD24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD24SMP_V5 : entity is TRUE;
end BBTD24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD24SMP_V5_VITAL of BBTD24SMP_V5 is
   for VITAL
   end for;
end CFG_BBTD24SMP_V5_VITAL;


----- CELL BBTD24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTD24SP_V5 : entity is TRUE;
end BBTD24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTD24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTD24SP_V5_VITAL of BBTD24SP_V5 is
   for VITAL
   end for;
end CFG_BBTD24SP_V5_VITAL;


----- CELL BBTU1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU1P_V5 : entity is TRUE;
end BBTU1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU1P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU1P_V5_VITAL of BBTU1P_V5 is
   for VITAL
   end for;
end CFG_BBTU1P_V5_VITAL;


----- CELL BBTU4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU4P_V5 : entity is TRUE;
end BBTU4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU4P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU4P_V5_VITAL of BBTU4P_V5 is
   for VITAL
   end for;
end CFG_BBTU4P_V5_VITAL;


----- CELL BBTU4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU4SMP_V5 : entity is TRUE;
end BBTU4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU4SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU4SMP_V5_VITAL of BBTU4SMP_V5 is
   for VITAL
   end for;
end CFG_BBTU4SMP_V5_VITAL;


----- CELL BBTU8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU8P_V5 : entity is TRUE;
end BBTU8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU8P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU8P_V5_VITAL of BBTU8P_V5 is
   for VITAL
   end for;
end CFG_BBTU8P_V5_VITAL;


----- CELL BBTU8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU8SMP_V5 : entity is TRUE;
end BBTU8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU8SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU8SMP_V5_VITAL of BBTU8SMP_V5 is
   for VITAL
   end for;
end CFG_BBTU8SMP_V5_VITAL;


----- CELL BBTU8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU8SP_V5 : entity is TRUE;
end BBTU8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU8SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU8SP_V5_VITAL of BBTU8SP_V5 is
   for VITAL
   end for;
end CFG_BBTU8SP_V5_VITAL;


----- CELL BBTU16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU16P_V5 : entity is TRUE;
end BBTU16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU16P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU16P_V5_VITAL of BBTU16P_V5 is
   for VITAL
   end for;
end CFG_BBTU16P_V5_VITAL;


----- CELL BBTU16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU16SMP_V5 : entity is TRUE;
end BBTU16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU16SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU16SMP_V5_VITAL of BBTU16SMP_V5 is
   for VITAL
   end for;
end CFG_BBTU16SMP_V5_VITAL;


----- CELL BBTU16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU16SP_V5 : entity is TRUE;
end BBTU16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU16SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU16SP_V5_VITAL of BBTU16SP_V5 is
   for VITAL
   end for;
end CFG_BBTU16SP_V5_VITAL;


----- CELL BBTU24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU24P_V5 : entity is TRUE;
end BBTU24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU24P_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU24P_V5_VITAL of BBTU24P_V5 is
   for VITAL
   end for;
end CFG_BBTU24P_V5_VITAL;


----- CELL BBTU24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU24SMP_V5 : entity is TRUE;
end BBTU24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU24SMP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU24SMP_V5_VITAL of BBTU24SMP_V5 is
   for VITAL
   end for;
end CFG_BBTU24SMP_V5_VITAL;


----- CELL BBTU24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	inout STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BBTU24SP_V5 : entity is TRUE;
end BBTU24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BBTU24SP_V5 is
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
       Mode => OnEvent,
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BBTU24SP_V5_VITAL of BBTU24SP_V5 is
   for VITAL
   end for;
end CFG_BBTU24SP_V5_VITAL;


----- CELL BT1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT1P_V5 : entity is TRUE;
end BT1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT1P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT1P_V5_VITAL of BT1P_V5 is
   for VITAL
   end for;
end CFG_BT1P_V5_VITAL;


----- CELL BT2P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT2P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT2P_V5 : entity is TRUE;
end BT2P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT2P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT2P_V5_VITAL of BT2P_V5 is
   for VITAL
   end for;
end CFG_BT2P_V5_VITAL;


----- CELL BT4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT4P_V5 : entity is TRUE;
end BT4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT4P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT4P_V5_VITAL of BT4P_V5 is
   for VITAL
   end for;
end CFG_BT4P_V5_VITAL;


----- CELL BT4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT4SMP_V5 : entity is TRUE;
end BT4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT4SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT4SMP_V5_VITAL of BT4SMP_V5 is
   for VITAL
   end for;
end CFG_BT4SMP_V5_VITAL;


----- CELL BT8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT8P_V5 : entity is TRUE;
end BT8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT8P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT8P_V5_VITAL of BT8P_V5 is
   for VITAL
   end for;
end CFG_BT8P_V5_VITAL;


----- CELL BT8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT8SMP_V5 : entity is TRUE;
end BT8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT8SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT8SMP_V5_VITAL of BT8SMP_V5 is
   for VITAL
   end for;
end CFG_BT8SMP_V5_VITAL;


----- CELL BT8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT8SP_V5 : entity is TRUE;
end BT8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT8SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT8SP_V5_VITAL of BT8SP_V5 is
   for VITAL
   end for;
end CFG_BT8SP_V5_VITAL;


----- CELL BT12P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT12P_V5 : entity is TRUE;
end BT12P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT12P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT12P_V5_VITAL of BT12P_V5 is
   for VITAL
   end for;
end CFG_BT12P_V5_VITAL;


----- CELL BT12SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT12SMP_V5 : entity is TRUE;
end BT12SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT12SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT12SMP_V5_VITAL of BT12SMP_V5 is
   for VITAL
   end for;
end CFG_BT12SMP_V5_VITAL;


----- CELL BT12SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT12SP_V5 : entity is TRUE;
end BT12SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT12SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT12SP_V5_VITAL of BT12SP_V5 is
   for VITAL
   end for;
end CFG_BT12SP_V5_VITAL;


----- CELL BT16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT16P_V5 : entity is TRUE;
end BT16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT16P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT16P_V5_VITAL of BT16P_V5 is
   for VITAL
   end for;
end CFG_BT16P_V5_VITAL;


----- CELL BT16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT16SMP_V5 : entity is TRUE;
end BT16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT16SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT16SMP_V5_VITAL of BT16SMP_V5 is
   for VITAL
   end for;
end CFG_BT16SMP_V5_VITAL;


----- CELL BT16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT16SP_V5 : entity is TRUE;
end BT16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT16SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT16SP_V5_VITAL of BT16SP_V5 is
   for VITAL
   end for;
end CFG_BT16SP_V5_VITAL;


----- CELL BT24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT24P_V5 : entity is TRUE;
end BT24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT24P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT24P_V5_VITAL of BT24P_V5 is
   for VITAL
   end for;
end CFG_BT24P_V5_VITAL;


----- CELL BT24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT24SMP_V5 : entity is TRUE;
end BT24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT24SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT24SMP_V5_VITAL of BT24SMP_V5 is
   for VITAL
   end for;
end CFG_BT24SMP_V5_VITAL;


----- CELL BT24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tpd_EN_PAD                     :	VitalDelayType01z := 
               (1 ps, 1 ps, 1 ps, 1 ps, 1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps);
      tipd_EN                        :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      EN                             :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BT24SP_V5 : entity is TRUE;
end BT24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BT24SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BT24SP_V5_VITAL of BT24SP_V5 is
   for VITAL
   end for;
end CFG_BT24SP_V5_VITAL;


----- CELL BU1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU1P_V5 : entity is TRUE;
end BU1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU1P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU1P_V5_VITAL of BU1P_V5 is
   for VITAL
   end for;
end CFG_BU1P_V5_VITAL;


----- CELL BU2P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU2P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU2P_V5 : entity is TRUE;
end BU2P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU2P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU2P_V5_VITAL of BU2P_V5 is
   for VITAL
   end for;
end CFG_BU2P_V5_VITAL;


----- CELL BU4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU4P_V5 : entity is TRUE;
end BU4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU4P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU4P_V5_VITAL of BU4P_V5 is
   for VITAL
   end for;
end CFG_BU4P_V5_VITAL;


----- CELL BU4SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU4SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU4SMP_V5 : entity is TRUE;
end BU4SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU4SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU4SMP_V5_VITAL of BU4SMP_V5 is
   for VITAL
   end for;
end CFG_BU4SMP_V5_VITAL;


----- CELL BU8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU8P_V5 : entity is TRUE;
end BU8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU8P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU8P_V5_VITAL of BU8P_V5 is
   for VITAL
   end for;
end CFG_BU8P_V5_VITAL;


----- CELL BU8SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU8SMP_V5 : entity is TRUE;
end BU8SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU8SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU8SMP_V5_VITAL of BU8SMP_V5 is
   for VITAL
   end for;
end CFG_BU8SMP_V5_VITAL;


----- CELL BU8SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU8SP_V5 : entity is TRUE;
end BU8SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU8SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU8SP_V5_VITAL of BU8SP_V5 is
   for VITAL
   end for;
end CFG_BU8SP_V5_VITAL;


----- CELL BU12P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU12P_V5 : entity is TRUE;
end BU12P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU12P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU12P_V5_VITAL of BU12P_V5 is
   for VITAL
   end for;
end CFG_BU12P_V5_VITAL;


----- CELL BU12SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU12SMP_V5 : entity is TRUE;
end BU12SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU12SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU12SMP_V5_VITAL of BU12SMP_V5 is
   for VITAL
   end for;
end CFG_BU12SMP_V5_VITAL;


----- CELL BU12SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU12SP_V5 : entity is TRUE;
end BU12SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU12SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU12SP_V5_VITAL of BU12SP_V5 is
   for VITAL
   end for;
end CFG_BU12SP_V5_VITAL;


----- CELL BU16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU16P_V5 : entity is TRUE;
end BU16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU16P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU16P_V5_VITAL of BU16P_V5 is
   for VITAL
   end for;
end CFG_BU16P_V5_VITAL;


----- CELL BU16SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU16SMP_V5 : entity is TRUE;
end BU16SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU16SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU16SMP_V5_VITAL of BU16SMP_V5 is
   for VITAL
   end for;
end CFG_BU16SMP_V5_VITAL;


----- CELL BU16SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU16SP_V5 : entity is TRUE;
end BU16SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU16SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU16SP_V5_VITAL of BU16SP_V5 is
   for VITAL
   end for;
end CFG_BU16SP_V5_VITAL;


----- CELL BU24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU24P_V5 : entity is TRUE;
end BU24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU24P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU24P_V5_VITAL of BU24P_V5 is
   for VITAL
   end for;
end CFG_BU24P_V5_VITAL;


----- CELL BU24SMP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24SMP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU24SMP_V5 : entity is TRUE;
end BU24SMP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU24SMP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU24SMP_V5_VITAL of BU24SMP_V5 is
   for VITAL
   end for;
end CFG_BU24SMP_V5_VITAL;


----- CELL BU24SP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24SP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BU24SP_V5 : entity is TRUE;
end BU24SP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BU24SP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_BU24SP_V5_VITAL of BU24SP_V5 is
   for VITAL
   end for;
end CFG_BU24SP_V5_VITAL;


----- CELL BUDD1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD1P_V5 : entity is TRUE;
end BUDD1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDD1P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD1P_V5_VITAL of BUDD1P_V5 is
   for VITAL
   end for;
end CFG_BUDD1P_V5_VITAL;


----- CELL BUDD2P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD2P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD2P_V5 : entity is TRUE;
end BUDD2P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDD2P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD2P_V5_VITAL of BUDD2P_V5 is
   for VITAL
   end for;
end CFG_BUDD2P_V5_VITAL;


----- CELL BUDD4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD4P_V5 : entity is TRUE;
end BUDD4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDD4P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD4P_V5_VITAL of BUDD4P_V5 is
   for VITAL
   end for;
end CFG_BUDD4P_V5_VITAL;


----- CELL BUDD8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD8P_V5 : entity is TRUE;
end BUDD8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDD8P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD8P_V5_VITAL of BUDD8P_V5 is
   for VITAL
   end for;
end CFG_BUDD8P_V5_VITAL;


----- CELL BUDD12P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD12P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD12P_V5 : entity is TRUE;
end BUDD12P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDD12P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD12P_V5_VITAL of BUDD12P_V5 is
   for VITAL
   end for;
end CFG_BUDD12P_V5_VITAL;


----- CELL BUDD16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD16P_V5 : entity is TRUE;
end BUDD16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDD16P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD16P_V5_VITAL of BUDD16P_V5 is
   for VITAL
   end for;
end CFG_BUDD16P_V5_VITAL;


----- CELL BUDD24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (0 ps, 1 ps, 1 ps, 0 ps, 0 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDD24P_V5 : entity is TRUE;
end BUDD24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDD24P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDD24P_V5_VITAL of BUDD24P_V5 is
   for VITAL
   end for;
end CFG_BUDD24P_V5_VITAL;


----- CELL BUDU1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU1P_V5 : entity is TRUE;
end BUDU1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDU1P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU1P_V5_VITAL of BUDU1P_V5 is
   for VITAL
   end for;
end CFG_BUDU1P_V5_VITAL;


----- CELL BUDU2P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU2P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU2P_V5 : entity is TRUE;
end BUDU2P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDU2P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU2P_V5_VITAL of BUDU2P_V5 is
   for VITAL
   end for;
end CFG_BUDU2P_V5_VITAL;


----- CELL BUDU4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU4P_V5 : entity is TRUE;
end BUDU4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDU4P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU4P_V5_VITAL of BUDU4P_V5 is
   for VITAL
   end for;
end CFG_BUDU4P_V5_VITAL;


----- CELL BUDU8P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU8P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU8P_V5 : entity is TRUE;
end BUDU8P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDU8P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU8P_V5_VITAL of BUDU8P_V5 is
   for VITAL
   end for;
end CFG_BUDU8P_V5_VITAL;


----- CELL BUDU12P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU12P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU12P_V5 : entity is TRUE;
end BUDU12P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDU12P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU12P_V5_VITAL of BUDU12P_V5 is
   for VITAL
   end for;
end CFG_BUDU12P_V5_VITAL;


----- CELL BUDU16P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU16P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU16P_V5 : entity is TRUE;
end BUDU16P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDU16P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU16P_V5_VITAL of BUDU16P_V5 is
   for VITAL
   end for;
end CFG_BUDU16P_V5_VITAL;


----- CELL BUDU24P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU24P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_PAD                      :	VitalDelayType01z := 
               (1 ps, 0 ps, 0 ps, 1 ps, 1 ps, 0 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      PAD                            :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of BUDU24P_V5 : entity is TRUE;
end BUDU24P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of BUDU24P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING,
       OutputMap => "UX01ZWLH-");

end process;

end VITAL;

configuration CFG_BUDU24P_V5_VITAL of BUDU24P_V5 is
   for VITAL
   end for;
end CFG_BUDU24P_V5_VITAL;


----- CELL CBU1P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity CBU1P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_Y                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of CBU1P_V5 : entity is TRUE;
end CBU1P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of CBU1P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_CBU1P_V5_VITAL of CBU1P_V5 is
   for VITAL
   end for;
end CFG_CBU1P_V5_VITAL;


----- CELL CBU2P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity CBU2P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_A_Y                        :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_A                         :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      A                              :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of CBU2P_V5 : entity is TRUE;
end CBU2P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of CBU2P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_CBU2P_V5_VITAL of CBU2P_V5 is
   for VITAL
   end for;
end CFG_CBU2P_V5_VITAL;


----- CELL GND5ALLP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND5ALLP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND5ALLP_V5 : entity is TRUE;
end GND5ALLP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of GND5ALLP_V5 is

begin

   assert (FALSE)
     report "Cell GND5ALLP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND5ALLP_V5_VITAL of GND5ALLP_V5 is
   for VITAL
   end for;
end CFG_GND5ALLP_V5_VITAL;


----- CELL GND5IP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND5IP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND5IP_V5 : entity is TRUE;
end GND5IP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of GND5IP_V5 is

begin

   assert (FALSE)
     report "Cell GND5IP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND5IP_V5_VITAL of GND5IP_V5 is
   for VITAL
   end for;
end CFG_GND5IP_V5_VITAL;


----- CELL GND5OP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND5OP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND5OP_V5 : entity is TRUE;
end GND5OP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of GND5OP_V5 is

begin

   assert (FALSE)
     report "Cell GND5OP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND5OP_V5_VITAL of GND5OP_V5 is
   for VITAL
   end for;
end CFG_GND5OP_V5_VITAL;


----- CELL GND5RP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND5RP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND5RP_V5 : entity is TRUE;
end GND5RP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of GND5RP_V5 is

begin

   assert (FALSE)
     report "Cell GND5RP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND5RP_V5_VITAL of GND5RP_V5 is
   for VITAL
   end for;
end CFG_GND5RP_V5_VITAL;


----- CELL ICCK2P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK2P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICCK2P_V5 : entity is TRUE;
end ICCK2P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ICCK2P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICCK2P_V5_VITAL of ICCK2P_V5 is
   for VITAL
   end for;
end CFG_ICCK2P_V5_VITAL;


----- CELL ICCK4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICCK4P_V5 : entity is TRUE;
end ICCK4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ICCK4P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICCK4P_V5_VITAL of ICCK4P_V5 is
   for VITAL
   end for;
end CFG_ICCK4P_V5_VITAL;


----- CELL ICDP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICDP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICDP_V5 : entity is TRUE;
end ICDP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ICDP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICDP_V5_VITAL of ICDP_V5 is
   for VITAL
   end for;
end CFG_ICDP_V5_VITAL;


----- CELL ICP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICP_V5 : entity is TRUE;
end ICP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ICP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICP_V5_VITAL of ICP_V5 is
   for VITAL
   end for;
end CFG_ICP_V5_VITAL;


----- CELL ICUP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICUP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ICUP_V5 : entity is TRUE;
end ICUP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ICUP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ICUP_V5_VITAL of ICUP_V5 is
   for VITAL
   end for;
end CFG_ICUP_V5_VITAL;


----- CELL ISDP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISDP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ISDP_V5 : entity is TRUE;
end ISDP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ISDP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ISDP_V5_VITAL of ISDP_V5 is
   for VITAL
   end for;
end CFG_ISDP_V5_VITAL;


----- CELL ISP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ISP_V5 : entity is TRUE;
end ISP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ISP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ISP_V5_VITAL of ISP_V5 is
   for VITAL
   end for;
end CFG_ISP_V5_VITAL;


----- CELL ISUP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISUP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ISUP_V5 : entity is TRUE;
end ISUP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ISUP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ISUP_V5_VITAL of ISUP_V5 is
   for VITAL
   end for;
end CFG_ISUP_V5_VITAL;


----- CELL ITCK2P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK2P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITCK2P_V5 : entity is TRUE;
end ITCK2P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ITCK2P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ITCK2P_V5_VITAL of ITCK2P_V5 is
   for VITAL
   end for;
end CFG_ITCK2P_V5_VITAL;


----- CELL ITCK4P_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK4P_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITCK4P_V5 : entity is TRUE;
end ITCK4P_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ITCK4P_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ITCK4P_V5_VITAL of ITCK4P_V5 is
   for VITAL
   end for;
end CFG_ITCK4P_V5_VITAL;


----- CELL ITDP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITDP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITDP_V5 : entity is TRUE;
end ITDP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ITDP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ITDP_V5_VITAL of ITDP_V5 is
   for VITAL
   end for;
end CFG_ITDP_V5_VITAL;


----- CELL ITP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITP_V5 : entity is TRUE;
end ITP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ITP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ITP_V5_VITAL of ITP_V5 is
   for VITAL
   end for;
end CFG_ITP_V5_VITAL;


----- CELL ITUP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITUP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;
      tpd_PAD_Y                      :	VitalDelayType01 := (1 ps, 1 ps);
      tipd_PAD                       :	VitalDelayType01 := (0 ps, 0 ps));

   port(
      PAD                            :	in    STD_ULOGIC;
      Y                              :	out   STD_ULOGIC);
attribute VITAL_LEVEL0 of ITUP_V5 : entity is TRUE;
end ITUP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of ITUP_V5 is
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
       Mode => OnEvent,
       Xon => Xon,
       MsgOn => MsgOn,
       MsgSeverity => WARNING);

end process;

end VITAL;

configuration CFG_ITUP_V5_VITAL of ITUP_V5 is
   for VITAL
   end for;
end CFG_ITUP_V5_VITAL;


----- CELL VDD3IP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3IP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3IP_V5 : entity is TRUE;
end VDD3IP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of VDD3IP_V5 is

begin

   assert (FALSE)
     report "Cell VDD3IP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3IP_V5_VITAL of VDD3IP_V5 is
   for VITAL
   end for;
end CFG_VDD3IP_V5_VITAL;


----- CELL VDD3RP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3RP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3RP_V5 : entity is TRUE;
end VDD3RP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of VDD3RP_V5 is

begin

   assert (FALSE)
     report "Cell VDD3RP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3RP_V5_VITAL of VDD3RP_V5 is
   for VITAL
   end for;
end CFG_VDD3RP_V5_VITAL;


----- CELL VDD5ALLP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD5ALLP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD5ALLP_V5 : entity is TRUE;
end VDD5ALLP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of VDD5ALLP_V5 is

begin

   assert (FALSE)
     report "Cell VDD5ALLP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD5ALLP_V5_VITAL of VDD5ALLP_V5 is
   for VITAL
   end for;
end CFG_VDD5ALLP_V5_VITAL;


----- CELL VDD5OP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD5OP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD5OP_V5 : entity is TRUE;
end VDD5OP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of VDD5OP_V5 is

begin

   assert (FALSE)
     report "Cell VDD5OP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD5OP_V5_VITAL of VDD5OP_V5 is
   for VITAL
   end for;
end CFG_VDD5OP_V5_VITAL;


----- CELL VDD5RP_V5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD5RP_V5 is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD5RP_V5 : entity is TRUE;
end VDD5RP_V5;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIBV5_4M;
use c35_IOLIBV5_4M.VTABLES.all;
architecture VITAL of VDD5RP_V5 is

begin

   assert (FALSE)
     report "Cell VDD5RP_V5 was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD5RP_V5_VITAL of VDD5RP_V5 is
   for VITAL
   end for;
end CFG_VDD5RP_V5_VITAL;


---- end of library ----
