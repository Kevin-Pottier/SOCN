
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler 2000.11
-- FILE CONTENTS:    Entity, Structural Architecture(VITAL),
--                   and Configuration
-- DATE CREATED :    Thu Jun 27 17:07:29 2002
-- 
-- LIBRARY      :    c35_IOLIB_4M
-- DATE ENTERED :    $Date: 2001/09/25 12:07:08 $
-- REVISION     :    $Id: csx_IOLIB_3M.lib,v 1.3 2001/09/25 12:07:08 mbo Exp mbo $
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ps
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    VITAL, TimingChecksOn(TRUE), XGenerationOn(TRUE), TimingMessage(TRUE), OnEvent 
--                   Owner: austriamicrosystems AG  HIT-Kit: Digital
-- HISTORY      :
-- 
----------------------------------------------------------------

----- CELL BBC1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC1P is
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
attribute VITAL_LEVEL0 of BBC1P : entity is TRUE;
end BBC1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC1P is
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

configuration CFG_BBC1P_VITAL of BBC1P is
   for VITAL
   end for;
end CFG_BBC1P_VITAL;


----- CELL BBC4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC4P is
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
attribute VITAL_LEVEL0 of BBC4P : entity is TRUE;
end BBC4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC4P is
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

configuration CFG_BBC4P_VITAL of BBC4P is
   for VITAL
   end for;
end CFG_BBC4P_VITAL;


----- CELL BBC4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC4SMP is
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
attribute VITAL_LEVEL0 of BBC4SMP : entity is TRUE;
end BBC4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC4SMP is
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

configuration CFG_BBC4SMP_VITAL of BBC4SMP is
   for VITAL
   end for;
end CFG_BBC4SMP_VITAL;


----- CELL BBC8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8P is
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
attribute VITAL_LEVEL0 of BBC8P : entity is TRUE;
end BBC8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC8P is
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

configuration CFG_BBC8P_VITAL of BBC8P is
   for VITAL
   end for;
end CFG_BBC8P_VITAL;


----- CELL BBC8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8SMP is
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
attribute VITAL_LEVEL0 of BBC8SMP : entity is TRUE;
end BBC8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC8SMP is
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

configuration CFG_BBC8SMP_VITAL of BBC8SMP is
   for VITAL
   end for;
end CFG_BBC8SMP_VITAL;


----- CELL BBC8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC8SP is
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
attribute VITAL_LEVEL0 of BBC8SP : entity is TRUE;
end BBC8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC8SP is
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

configuration CFG_BBC8SP_VITAL of BBC8SP is
   for VITAL
   end for;
end CFG_BBC8SP_VITAL;


----- CELL BBC16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16P is
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
attribute VITAL_LEVEL0 of BBC16P : entity is TRUE;
end BBC16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC16P is
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

configuration CFG_BBC16P_VITAL of BBC16P is
   for VITAL
   end for;
end CFG_BBC16P_VITAL;


----- CELL BBC16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16SMP is
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
attribute VITAL_LEVEL0 of BBC16SMP : entity is TRUE;
end BBC16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC16SMP is
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

configuration CFG_BBC16SMP_VITAL of BBC16SMP is
   for VITAL
   end for;
end CFG_BBC16SMP_VITAL;


----- CELL BBC16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC16SP is
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
attribute VITAL_LEVEL0 of BBC16SP : entity is TRUE;
end BBC16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC16SP is
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

configuration CFG_BBC16SP_VITAL of BBC16SP is
   for VITAL
   end for;
end CFG_BBC16SP_VITAL;


----- CELL BBC24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24P is
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
attribute VITAL_LEVEL0 of BBC24P : entity is TRUE;
end BBC24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC24P is
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

configuration CFG_BBC24P_VITAL of BBC24P is
   for VITAL
   end for;
end CFG_BBC24P_VITAL;


----- CELL BBC24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24SMP is
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
attribute VITAL_LEVEL0 of BBC24SMP : entity is TRUE;
end BBC24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC24SMP is
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

configuration CFG_BBC24SMP_VITAL of BBC24SMP is
   for VITAL
   end for;
end CFG_BBC24SMP_VITAL;


----- CELL BBC24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBC24SP is
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
attribute VITAL_LEVEL0 of BBC24SP : entity is TRUE;
end BBC24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBC24SP is
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

configuration CFG_BBC24SP_VITAL of BBC24SP is
   for VITAL
   end for;
end CFG_BBC24SP_VITAL;


----- CELL BBCD1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD1P is
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
attribute VITAL_LEVEL0 of BBCD1P : entity is TRUE;
end BBCD1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD1P is
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

configuration CFG_BBCD1P_VITAL of BBCD1P is
   for VITAL
   end for;
end CFG_BBCD1P_VITAL;


----- CELL BBCD4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD4P is
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
attribute VITAL_LEVEL0 of BBCD4P : entity is TRUE;
end BBCD4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD4P is
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

configuration CFG_BBCD4P_VITAL of BBCD4P is
   for VITAL
   end for;
end CFG_BBCD4P_VITAL;


----- CELL BBCD4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD4SMP is
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
attribute VITAL_LEVEL0 of BBCD4SMP : entity is TRUE;
end BBCD4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD4SMP is
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

configuration CFG_BBCD4SMP_VITAL of BBCD4SMP is
   for VITAL
   end for;
end CFG_BBCD4SMP_VITAL;


----- CELL BBCD8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8P is
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
attribute VITAL_LEVEL0 of BBCD8P : entity is TRUE;
end BBCD8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD8P is
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

configuration CFG_BBCD8P_VITAL of BBCD8P is
   for VITAL
   end for;
end CFG_BBCD8P_VITAL;


----- CELL BBCD8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8SMP is
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
attribute VITAL_LEVEL0 of BBCD8SMP : entity is TRUE;
end BBCD8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD8SMP is
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

configuration CFG_BBCD8SMP_VITAL of BBCD8SMP is
   for VITAL
   end for;
end CFG_BBCD8SMP_VITAL;


----- CELL BBCD8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD8SP is
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
attribute VITAL_LEVEL0 of BBCD8SP : entity is TRUE;
end BBCD8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD8SP is
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

configuration CFG_BBCD8SP_VITAL of BBCD8SP is
   for VITAL
   end for;
end CFG_BBCD8SP_VITAL;


----- CELL BBCD16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16P is
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
attribute VITAL_LEVEL0 of BBCD16P : entity is TRUE;
end BBCD16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD16P is
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

configuration CFG_BBCD16P_VITAL of BBCD16P is
   for VITAL
   end for;
end CFG_BBCD16P_VITAL;


----- CELL BBCD16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16SMP is
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
attribute VITAL_LEVEL0 of BBCD16SMP : entity is TRUE;
end BBCD16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD16SMP is
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

configuration CFG_BBCD16SMP_VITAL of BBCD16SMP is
   for VITAL
   end for;
end CFG_BBCD16SMP_VITAL;


----- CELL BBCD16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD16SP is
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
attribute VITAL_LEVEL0 of BBCD16SP : entity is TRUE;
end BBCD16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD16SP is
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

configuration CFG_BBCD16SP_VITAL of BBCD16SP is
   for VITAL
   end for;
end CFG_BBCD16SP_VITAL;


----- CELL BBCD24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24P is
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
attribute VITAL_LEVEL0 of BBCD24P : entity is TRUE;
end BBCD24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD24P is
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

configuration CFG_BBCD24P_VITAL of BBCD24P is
   for VITAL
   end for;
end CFG_BBCD24P_VITAL;


----- CELL BBCD24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24SMP is
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
attribute VITAL_LEVEL0 of BBCD24SMP : entity is TRUE;
end BBCD24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD24SMP is
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

configuration CFG_BBCD24SMP_VITAL of BBCD24SMP is
   for VITAL
   end for;
end CFG_BBCD24SMP_VITAL;


----- CELL BBCD24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCD24SP is
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
attribute VITAL_LEVEL0 of BBCD24SP : entity is TRUE;
end BBCD24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCD24SP is
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

configuration CFG_BBCD24SP_VITAL of BBCD24SP is
   for VITAL
   end for;
end CFG_BBCD24SP_VITAL;


----- CELL BBCU1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU1P is
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
attribute VITAL_LEVEL0 of BBCU1P : entity is TRUE;
end BBCU1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU1P is
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

configuration CFG_BBCU1P_VITAL of BBCU1P is
   for VITAL
   end for;
end CFG_BBCU1P_VITAL;


----- CELL BBCU4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU4P is
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
attribute VITAL_LEVEL0 of BBCU4P : entity is TRUE;
end BBCU4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU4P is
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

configuration CFG_BBCU4P_VITAL of BBCU4P is
   for VITAL
   end for;
end CFG_BBCU4P_VITAL;


----- CELL BBCU4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU4SMP is
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
attribute VITAL_LEVEL0 of BBCU4SMP : entity is TRUE;
end BBCU4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU4SMP is
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

configuration CFG_BBCU4SMP_VITAL of BBCU4SMP is
   for VITAL
   end for;
end CFG_BBCU4SMP_VITAL;


----- CELL BBCU8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8P is
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
attribute VITAL_LEVEL0 of BBCU8P : entity is TRUE;
end BBCU8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU8P is
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

configuration CFG_BBCU8P_VITAL of BBCU8P is
   for VITAL
   end for;
end CFG_BBCU8P_VITAL;


----- CELL BBCU8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8SMP is
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
attribute VITAL_LEVEL0 of BBCU8SMP : entity is TRUE;
end BBCU8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU8SMP is
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

configuration CFG_BBCU8SMP_VITAL of BBCU8SMP is
   for VITAL
   end for;
end CFG_BBCU8SMP_VITAL;


----- CELL BBCU8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU8SP is
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
attribute VITAL_LEVEL0 of BBCU8SP : entity is TRUE;
end BBCU8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU8SP is
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

configuration CFG_BBCU8SP_VITAL of BBCU8SP is
   for VITAL
   end for;
end CFG_BBCU8SP_VITAL;


----- CELL BBCU16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16P is
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
attribute VITAL_LEVEL0 of BBCU16P : entity is TRUE;
end BBCU16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU16P is
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

configuration CFG_BBCU16P_VITAL of BBCU16P is
   for VITAL
   end for;
end CFG_BBCU16P_VITAL;


----- CELL BBCU16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16SMP is
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
attribute VITAL_LEVEL0 of BBCU16SMP : entity is TRUE;
end BBCU16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU16SMP is
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

configuration CFG_BBCU16SMP_VITAL of BBCU16SMP is
   for VITAL
   end for;
end CFG_BBCU16SMP_VITAL;


----- CELL BBCU16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU16SP is
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
attribute VITAL_LEVEL0 of BBCU16SP : entity is TRUE;
end BBCU16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU16SP is
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

configuration CFG_BBCU16SP_VITAL of BBCU16SP is
   for VITAL
   end for;
end CFG_BBCU16SP_VITAL;


----- CELL BBCU24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24P is
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
attribute VITAL_LEVEL0 of BBCU24P : entity is TRUE;
end BBCU24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU24P is
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

configuration CFG_BBCU24P_VITAL of BBCU24P is
   for VITAL
   end for;
end CFG_BBCU24P_VITAL;


----- CELL BBCU24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24SMP is
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
attribute VITAL_LEVEL0 of BBCU24SMP : entity is TRUE;
end BBCU24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU24SMP is
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

configuration CFG_BBCU24SMP_VITAL of BBCU24SMP is
   for VITAL
   end for;
end CFG_BBCU24SMP_VITAL;


----- CELL BBCU24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBCU24SP is
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
attribute VITAL_LEVEL0 of BBCU24SP : entity is TRUE;
end BBCU24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBCU24SP is
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

configuration CFG_BBCU24SP_VITAL of BBCU24SP is
   for VITAL
   end for;
end CFG_BBCU24SP_VITAL;


----- CELL BBS1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS1P is
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
attribute VITAL_LEVEL0 of BBS1P : entity is TRUE;
end BBS1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS1P is
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

configuration CFG_BBS1P_VITAL of BBS1P is
   for VITAL
   end for;
end CFG_BBS1P_VITAL;


----- CELL BBS4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS4P is
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
attribute VITAL_LEVEL0 of BBS4P : entity is TRUE;
end BBS4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS4P is
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

configuration CFG_BBS4P_VITAL of BBS4P is
   for VITAL
   end for;
end CFG_BBS4P_VITAL;


----- CELL BBS4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS4SMP is
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
attribute VITAL_LEVEL0 of BBS4SMP : entity is TRUE;
end BBS4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS4SMP is
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

configuration CFG_BBS4SMP_VITAL of BBS4SMP is
   for VITAL
   end for;
end CFG_BBS4SMP_VITAL;


----- CELL BBS8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8P is
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
attribute VITAL_LEVEL0 of BBS8P : entity is TRUE;
end BBS8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS8P is
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

configuration CFG_BBS8P_VITAL of BBS8P is
   for VITAL
   end for;
end CFG_BBS8P_VITAL;


----- CELL BBS8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8SMP is
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
attribute VITAL_LEVEL0 of BBS8SMP : entity is TRUE;
end BBS8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS8SMP is
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

configuration CFG_BBS8SMP_VITAL of BBS8SMP is
   for VITAL
   end for;
end CFG_BBS8SMP_VITAL;


----- CELL BBS8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS8SP is
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
attribute VITAL_LEVEL0 of BBS8SP : entity is TRUE;
end BBS8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS8SP is
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

configuration CFG_BBS8SP_VITAL of BBS8SP is
   for VITAL
   end for;
end CFG_BBS8SP_VITAL;


----- CELL BBS16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16P is
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
attribute VITAL_LEVEL0 of BBS16P : entity is TRUE;
end BBS16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS16P is
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

configuration CFG_BBS16P_VITAL of BBS16P is
   for VITAL
   end for;
end CFG_BBS16P_VITAL;


----- CELL BBS16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16SMP is
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
attribute VITAL_LEVEL0 of BBS16SMP : entity is TRUE;
end BBS16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS16SMP is
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

configuration CFG_BBS16SMP_VITAL of BBS16SMP is
   for VITAL
   end for;
end CFG_BBS16SMP_VITAL;


----- CELL BBS16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS16SP is
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
attribute VITAL_LEVEL0 of BBS16SP : entity is TRUE;
end BBS16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS16SP is
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

configuration CFG_BBS16SP_VITAL of BBS16SP is
   for VITAL
   end for;
end CFG_BBS16SP_VITAL;


----- CELL BBS24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24P is
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
attribute VITAL_LEVEL0 of BBS24P : entity is TRUE;
end BBS24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS24P is
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

configuration CFG_BBS24P_VITAL of BBS24P is
   for VITAL
   end for;
end CFG_BBS24P_VITAL;


----- CELL BBS24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24SMP is
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
attribute VITAL_LEVEL0 of BBS24SMP : entity is TRUE;
end BBS24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS24SMP is
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

configuration CFG_BBS24SMP_VITAL of BBS24SMP is
   for VITAL
   end for;
end CFG_BBS24SMP_VITAL;


----- CELL BBS24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBS24SP is
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
attribute VITAL_LEVEL0 of BBS24SP : entity is TRUE;
end BBS24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBS24SP is
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

configuration CFG_BBS24SP_VITAL of BBS24SP is
   for VITAL
   end for;
end CFG_BBS24SP_VITAL;


----- CELL BBSD1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD1P is
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
attribute VITAL_LEVEL0 of BBSD1P : entity is TRUE;
end BBSD1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD1P is
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

configuration CFG_BBSD1P_VITAL of BBSD1P is
   for VITAL
   end for;
end CFG_BBSD1P_VITAL;


----- CELL BBSD4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD4P is
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
attribute VITAL_LEVEL0 of BBSD4P : entity is TRUE;
end BBSD4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD4P is
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

configuration CFG_BBSD4P_VITAL of BBSD4P is
   for VITAL
   end for;
end CFG_BBSD4P_VITAL;


----- CELL BBSD4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD4SMP is
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
attribute VITAL_LEVEL0 of BBSD4SMP : entity is TRUE;
end BBSD4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD4SMP is
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

configuration CFG_BBSD4SMP_VITAL of BBSD4SMP is
   for VITAL
   end for;
end CFG_BBSD4SMP_VITAL;


----- CELL BBSD8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8P is
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
attribute VITAL_LEVEL0 of BBSD8P : entity is TRUE;
end BBSD8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD8P is
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

configuration CFG_BBSD8P_VITAL of BBSD8P is
   for VITAL
   end for;
end CFG_BBSD8P_VITAL;


----- CELL BBSD8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8SMP is
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
attribute VITAL_LEVEL0 of BBSD8SMP : entity is TRUE;
end BBSD8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD8SMP is
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

configuration CFG_BBSD8SMP_VITAL of BBSD8SMP is
   for VITAL
   end for;
end CFG_BBSD8SMP_VITAL;


----- CELL BBSD8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD8SP is
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
attribute VITAL_LEVEL0 of BBSD8SP : entity is TRUE;
end BBSD8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD8SP is
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

configuration CFG_BBSD8SP_VITAL of BBSD8SP is
   for VITAL
   end for;
end CFG_BBSD8SP_VITAL;


----- CELL BBSD16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16P is
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
attribute VITAL_LEVEL0 of BBSD16P : entity is TRUE;
end BBSD16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD16P is
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

configuration CFG_BBSD16P_VITAL of BBSD16P is
   for VITAL
   end for;
end CFG_BBSD16P_VITAL;


----- CELL BBSD16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16SMP is
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
attribute VITAL_LEVEL0 of BBSD16SMP : entity is TRUE;
end BBSD16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD16SMP is
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

configuration CFG_BBSD16SMP_VITAL of BBSD16SMP is
   for VITAL
   end for;
end CFG_BBSD16SMP_VITAL;


----- CELL BBSD16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD16SP is
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
attribute VITAL_LEVEL0 of BBSD16SP : entity is TRUE;
end BBSD16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD16SP is
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

configuration CFG_BBSD16SP_VITAL of BBSD16SP is
   for VITAL
   end for;
end CFG_BBSD16SP_VITAL;


----- CELL BBSD24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24P is
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
attribute VITAL_LEVEL0 of BBSD24P : entity is TRUE;
end BBSD24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD24P is
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

configuration CFG_BBSD24P_VITAL of BBSD24P is
   for VITAL
   end for;
end CFG_BBSD24P_VITAL;


----- CELL BBSD24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24SMP is
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
attribute VITAL_LEVEL0 of BBSD24SMP : entity is TRUE;
end BBSD24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD24SMP is
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

configuration CFG_BBSD24SMP_VITAL of BBSD24SMP is
   for VITAL
   end for;
end CFG_BBSD24SMP_VITAL;


----- CELL BBSD24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSD24SP is
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
attribute VITAL_LEVEL0 of BBSD24SP : entity is TRUE;
end BBSD24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSD24SP is
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

configuration CFG_BBSD24SP_VITAL of BBSD24SP is
   for VITAL
   end for;
end CFG_BBSD24SP_VITAL;


----- CELL BBSU1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU1P is
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
attribute VITAL_LEVEL0 of BBSU1P : entity is TRUE;
end BBSU1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU1P is
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

configuration CFG_BBSU1P_VITAL of BBSU1P is
   for VITAL
   end for;
end CFG_BBSU1P_VITAL;


----- CELL BBSU4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU4P is
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
attribute VITAL_LEVEL0 of BBSU4P : entity is TRUE;
end BBSU4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU4P is
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

configuration CFG_BBSU4P_VITAL of BBSU4P is
   for VITAL
   end for;
end CFG_BBSU4P_VITAL;


----- CELL BBSU4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU4SMP is
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
attribute VITAL_LEVEL0 of BBSU4SMP : entity is TRUE;
end BBSU4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU4SMP is
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

configuration CFG_BBSU4SMP_VITAL of BBSU4SMP is
   for VITAL
   end for;
end CFG_BBSU4SMP_VITAL;


----- CELL BBSU8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8P is
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
attribute VITAL_LEVEL0 of BBSU8P : entity is TRUE;
end BBSU8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU8P is
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

configuration CFG_BBSU8P_VITAL of BBSU8P is
   for VITAL
   end for;
end CFG_BBSU8P_VITAL;


----- CELL BBSU8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8SMP is
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
attribute VITAL_LEVEL0 of BBSU8SMP : entity is TRUE;
end BBSU8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU8SMP is
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

configuration CFG_BBSU8SMP_VITAL of BBSU8SMP is
   for VITAL
   end for;
end CFG_BBSU8SMP_VITAL;


----- CELL BBSU8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU8SP is
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
attribute VITAL_LEVEL0 of BBSU8SP : entity is TRUE;
end BBSU8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU8SP is
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

configuration CFG_BBSU8SP_VITAL of BBSU8SP is
   for VITAL
   end for;
end CFG_BBSU8SP_VITAL;


----- CELL BBSU16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16P is
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
attribute VITAL_LEVEL0 of BBSU16P : entity is TRUE;
end BBSU16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU16P is
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

configuration CFG_BBSU16P_VITAL of BBSU16P is
   for VITAL
   end for;
end CFG_BBSU16P_VITAL;


----- CELL BBSU16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16SMP is
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
attribute VITAL_LEVEL0 of BBSU16SMP : entity is TRUE;
end BBSU16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU16SMP is
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

configuration CFG_BBSU16SMP_VITAL of BBSU16SMP is
   for VITAL
   end for;
end CFG_BBSU16SMP_VITAL;


----- CELL BBSU16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU16SP is
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
attribute VITAL_LEVEL0 of BBSU16SP : entity is TRUE;
end BBSU16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU16SP is
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

configuration CFG_BBSU16SP_VITAL of BBSU16SP is
   for VITAL
   end for;
end CFG_BBSU16SP_VITAL;


----- CELL BBSU24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24P is
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
attribute VITAL_LEVEL0 of BBSU24P : entity is TRUE;
end BBSU24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU24P is
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

configuration CFG_BBSU24P_VITAL of BBSU24P is
   for VITAL
   end for;
end CFG_BBSU24P_VITAL;


----- CELL BBSU24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24SMP is
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
attribute VITAL_LEVEL0 of BBSU24SMP : entity is TRUE;
end BBSU24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU24SMP is
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

configuration CFG_BBSU24SMP_VITAL of BBSU24SMP is
   for VITAL
   end for;
end CFG_BBSU24SMP_VITAL;


----- CELL BBSU24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBSU24SP is
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
attribute VITAL_LEVEL0 of BBSU24SP : entity is TRUE;
end BBSU24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBSU24SP is
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

configuration CFG_BBSU24SP_VITAL of BBSU24SP is
   for VITAL
   end for;
end CFG_BBSU24SP_VITAL;


----- CELL BBT1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT1P is
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
attribute VITAL_LEVEL0 of BBT1P : entity is TRUE;
end BBT1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT1P is
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

configuration CFG_BBT1P_VITAL of BBT1P is
   for VITAL
   end for;
end CFG_BBT1P_VITAL;


----- CELL BBT4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT4P is
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
attribute VITAL_LEVEL0 of BBT4P : entity is TRUE;
end BBT4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT4P is
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

configuration CFG_BBT4P_VITAL of BBT4P is
   for VITAL
   end for;
end CFG_BBT4P_VITAL;


----- CELL BBT4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT4SMP is
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
attribute VITAL_LEVEL0 of BBT4SMP : entity is TRUE;
end BBT4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT4SMP is
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

configuration CFG_BBT4SMP_VITAL of BBT4SMP is
   for VITAL
   end for;
end CFG_BBT4SMP_VITAL;


----- CELL BBT8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8P is
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
attribute VITAL_LEVEL0 of BBT8P : entity is TRUE;
end BBT8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT8P is
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

configuration CFG_BBT8P_VITAL of BBT8P is
   for VITAL
   end for;
end CFG_BBT8P_VITAL;


----- CELL BBT8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8SMP is
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
attribute VITAL_LEVEL0 of BBT8SMP : entity is TRUE;
end BBT8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT8SMP is
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

configuration CFG_BBT8SMP_VITAL of BBT8SMP is
   for VITAL
   end for;
end CFG_BBT8SMP_VITAL;


----- CELL BBT8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT8SP is
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
attribute VITAL_LEVEL0 of BBT8SP : entity is TRUE;
end BBT8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT8SP is
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

configuration CFG_BBT8SP_VITAL of BBT8SP is
   for VITAL
   end for;
end CFG_BBT8SP_VITAL;


----- CELL BBT16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16P is
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
attribute VITAL_LEVEL0 of BBT16P : entity is TRUE;
end BBT16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT16P is
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

configuration CFG_BBT16P_VITAL of BBT16P is
   for VITAL
   end for;
end CFG_BBT16P_VITAL;


----- CELL BBT16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16SMP is
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
attribute VITAL_LEVEL0 of BBT16SMP : entity is TRUE;
end BBT16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT16SMP is
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

configuration CFG_BBT16SMP_VITAL of BBT16SMP is
   for VITAL
   end for;
end CFG_BBT16SMP_VITAL;


----- CELL BBT16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT16SP is
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
attribute VITAL_LEVEL0 of BBT16SP : entity is TRUE;
end BBT16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT16SP is
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

configuration CFG_BBT16SP_VITAL of BBT16SP is
   for VITAL
   end for;
end CFG_BBT16SP_VITAL;


----- CELL BBT24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24P is
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
attribute VITAL_LEVEL0 of BBT24P : entity is TRUE;
end BBT24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT24P is
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

configuration CFG_BBT24P_VITAL of BBT24P is
   for VITAL
   end for;
end CFG_BBT24P_VITAL;


----- CELL BBT24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24SMP is
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
attribute VITAL_LEVEL0 of BBT24SMP : entity is TRUE;
end BBT24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT24SMP is
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

configuration CFG_BBT24SMP_VITAL of BBT24SMP is
   for VITAL
   end for;
end CFG_BBT24SMP_VITAL;


----- CELL BBT24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBT24SP is
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
attribute VITAL_LEVEL0 of BBT24SP : entity is TRUE;
end BBT24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBT24SP is
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

configuration CFG_BBT24SP_VITAL of BBT24SP is
   for VITAL
   end for;
end CFG_BBT24SP_VITAL;


----- CELL BBTD1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD1P is
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
attribute VITAL_LEVEL0 of BBTD1P : entity is TRUE;
end BBTD1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD1P is
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

configuration CFG_BBTD1P_VITAL of BBTD1P is
   for VITAL
   end for;
end CFG_BBTD1P_VITAL;


----- CELL BBTD4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD4P is
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
attribute VITAL_LEVEL0 of BBTD4P : entity is TRUE;
end BBTD4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD4P is
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

configuration CFG_BBTD4P_VITAL of BBTD4P is
   for VITAL
   end for;
end CFG_BBTD4P_VITAL;


----- CELL BBTD4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD4SMP is
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
attribute VITAL_LEVEL0 of BBTD4SMP : entity is TRUE;
end BBTD4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD4SMP is
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

configuration CFG_BBTD4SMP_VITAL of BBTD4SMP is
   for VITAL
   end for;
end CFG_BBTD4SMP_VITAL;


----- CELL BBTD8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8P is
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
attribute VITAL_LEVEL0 of BBTD8P : entity is TRUE;
end BBTD8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD8P is
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

configuration CFG_BBTD8P_VITAL of BBTD8P is
   for VITAL
   end for;
end CFG_BBTD8P_VITAL;


----- CELL BBTD8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8SMP is
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
attribute VITAL_LEVEL0 of BBTD8SMP : entity is TRUE;
end BBTD8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD8SMP is
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

configuration CFG_BBTD8SMP_VITAL of BBTD8SMP is
   for VITAL
   end for;
end CFG_BBTD8SMP_VITAL;


----- CELL BBTD8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD8SP is
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
attribute VITAL_LEVEL0 of BBTD8SP : entity is TRUE;
end BBTD8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD8SP is
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

configuration CFG_BBTD8SP_VITAL of BBTD8SP is
   for VITAL
   end for;
end CFG_BBTD8SP_VITAL;


----- CELL BBTD16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16P is
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
attribute VITAL_LEVEL0 of BBTD16P : entity is TRUE;
end BBTD16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD16P is
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

configuration CFG_BBTD16P_VITAL of BBTD16P is
   for VITAL
   end for;
end CFG_BBTD16P_VITAL;


----- CELL BBTD16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16SMP is
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
attribute VITAL_LEVEL0 of BBTD16SMP : entity is TRUE;
end BBTD16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD16SMP is
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

configuration CFG_BBTD16SMP_VITAL of BBTD16SMP is
   for VITAL
   end for;
end CFG_BBTD16SMP_VITAL;


----- CELL BBTD16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD16SP is
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
attribute VITAL_LEVEL0 of BBTD16SP : entity is TRUE;
end BBTD16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD16SP is
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

configuration CFG_BBTD16SP_VITAL of BBTD16SP is
   for VITAL
   end for;
end CFG_BBTD16SP_VITAL;


----- CELL BBTD24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24P is
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
attribute VITAL_LEVEL0 of BBTD24P : entity is TRUE;
end BBTD24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD24P is
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

configuration CFG_BBTD24P_VITAL of BBTD24P is
   for VITAL
   end for;
end CFG_BBTD24P_VITAL;


----- CELL BBTD24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24SMP is
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
attribute VITAL_LEVEL0 of BBTD24SMP : entity is TRUE;
end BBTD24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD24SMP is
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

configuration CFG_BBTD24SMP_VITAL of BBTD24SMP is
   for VITAL
   end for;
end CFG_BBTD24SMP_VITAL;


----- CELL BBTD24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTD24SP is
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
attribute VITAL_LEVEL0 of BBTD24SP : entity is TRUE;
end BBTD24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTD24SP is
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

configuration CFG_BBTD24SP_VITAL of BBTD24SP is
   for VITAL
   end for;
end CFG_BBTD24SP_VITAL;


----- CELL BBTU1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU1P is
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
attribute VITAL_LEVEL0 of BBTU1P : entity is TRUE;
end BBTU1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU1P is
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

configuration CFG_BBTU1P_VITAL of BBTU1P is
   for VITAL
   end for;
end CFG_BBTU1P_VITAL;


----- CELL BBTU4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU4P is
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
attribute VITAL_LEVEL0 of BBTU4P : entity is TRUE;
end BBTU4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU4P is
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

configuration CFG_BBTU4P_VITAL of BBTU4P is
   for VITAL
   end for;
end CFG_BBTU4P_VITAL;


----- CELL BBTU4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU4SMP is
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
attribute VITAL_LEVEL0 of BBTU4SMP : entity is TRUE;
end BBTU4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU4SMP is
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

configuration CFG_BBTU4SMP_VITAL of BBTU4SMP is
   for VITAL
   end for;
end CFG_BBTU4SMP_VITAL;


----- CELL BBTU8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8P is
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
attribute VITAL_LEVEL0 of BBTU8P : entity is TRUE;
end BBTU8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU8P is
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

configuration CFG_BBTU8P_VITAL of BBTU8P is
   for VITAL
   end for;
end CFG_BBTU8P_VITAL;


----- CELL BBTU8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8SMP is
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
attribute VITAL_LEVEL0 of BBTU8SMP : entity is TRUE;
end BBTU8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU8SMP is
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

configuration CFG_BBTU8SMP_VITAL of BBTU8SMP is
   for VITAL
   end for;
end CFG_BBTU8SMP_VITAL;


----- CELL BBTU8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU8SP is
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
attribute VITAL_LEVEL0 of BBTU8SP : entity is TRUE;
end BBTU8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU8SP is
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

configuration CFG_BBTU8SP_VITAL of BBTU8SP is
   for VITAL
   end for;
end CFG_BBTU8SP_VITAL;


----- CELL BBTU16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16P is
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
attribute VITAL_LEVEL0 of BBTU16P : entity is TRUE;
end BBTU16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU16P is
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

configuration CFG_BBTU16P_VITAL of BBTU16P is
   for VITAL
   end for;
end CFG_BBTU16P_VITAL;


----- CELL BBTU16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16SMP is
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
attribute VITAL_LEVEL0 of BBTU16SMP : entity is TRUE;
end BBTU16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU16SMP is
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

configuration CFG_BBTU16SMP_VITAL of BBTU16SMP is
   for VITAL
   end for;
end CFG_BBTU16SMP_VITAL;


----- CELL BBTU16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU16SP is
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
attribute VITAL_LEVEL0 of BBTU16SP : entity is TRUE;
end BBTU16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU16SP is
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

configuration CFG_BBTU16SP_VITAL of BBTU16SP is
   for VITAL
   end for;
end CFG_BBTU16SP_VITAL;


----- CELL BBTU24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24P is
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
attribute VITAL_LEVEL0 of BBTU24P : entity is TRUE;
end BBTU24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU24P is
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

configuration CFG_BBTU24P_VITAL of BBTU24P is
   for VITAL
   end for;
end CFG_BBTU24P_VITAL;


----- CELL BBTU24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24SMP is
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
attribute VITAL_LEVEL0 of BBTU24SMP : entity is TRUE;
end BBTU24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU24SMP is
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

configuration CFG_BBTU24SMP_VITAL of BBTU24SMP is
   for VITAL
   end for;
end CFG_BBTU24SMP_VITAL;


----- CELL BBTU24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BBTU24SP is
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
attribute VITAL_LEVEL0 of BBTU24SP : entity is TRUE;
end BBTU24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BBTU24SP is
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

configuration CFG_BBTU24SP_VITAL of BBTU24SP is
   for VITAL
   end for;
end CFG_BBTU24SP_VITAL;


----- CELL BT1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT1P is
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
attribute VITAL_LEVEL0 of BT1P : entity is TRUE;
end BT1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT1P is
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

configuration CFG_BT1P_VITAL of BT1P is
   for VITAL
   end for;
end CFG_BT1P_VITAL;


----- CELL BT2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT2P is
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
attribute VITAL_LEVEL0 of BT2P : entity is TRUE;
end BT2P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT2P is
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

configuration CFG_BT2P_VITAL of BT2P is
   for VITAL
   end for;
end CFG_BT2P_VITAL;


----- CELL BT4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT4P is
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
attribute VITAL_LEVEL0 of BT4P : entity is TRUE;
end BT4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT4P is
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

configuration CFG_BT4P_VITAL of BT4P is
   for VITAL
   end for;
end CFG_BT4P_VITAL;


----- CELL BT4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT4SMP is
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
attribute VITAL_LEVEL0 of BT4SMP : entity is TRUE;
end BT4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT4SMP is
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

configuration CFG_BT4SMP_VITAL of BT4SMP is
   for VITAL
   end for;
end CFG_BT4SMP_VITAL;


----- CELL BT8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8P is
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
attribute VITAL_LEVEL0 of BT8P : entity is TRUE;
end BT8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT8P is
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

configuration CFG_BT8P_VITAL of BT8P is
   for VITAL
   end for;
end CFG_BT8P_VITAL;


----- CELL BT8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8SMP is
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
attribute VITAL_LEVEL0 of BT8SMP : entity is TRUE;
end BT8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT8SMP is
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

configuration CFG_BT8SMP_VITAL of BT8SMP is
   for VITAL
   end for;
end CFG_BT8SMP_VITAL;


----- CELL BT8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT8SP is
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
attribute VITAL_LEVEL0 of BT8SP : entity is TRUE;
end BT8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT8SP is
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

configuration CFG_BT8SP_VITAL of BT8SP is
   for VITAL
   end for;
end CFG_BT8SP_VITAL;


----- CELL BT12P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12P is
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
attribute VITAL_LEVEL0 of BT12P : entity is TRUE;
end BT12P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT12P is
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

configuration CFG_BT12P_VITAL of BT12P is
   for VITAL
   end for;
end CFG_BT12P_VITAL;


----- CELL BT12SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12SMP is
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
attribute VITAL_LEVEL0 of BT12SMP : entity is TRUE;
end BT12SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT12SMP is
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

configuration CFG_BT12SMP_VITAL of BT12SMP is
   for VITAL
   end for;
end CFG_BT12SMP_VITAL;


----- CELL BT12SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT12SP is
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
attribute VITAL_LEVEL0 of BT12SP : entity is TRUE;
end BT12SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT12SP is
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

configuration CFG_BT12SP_VITAL of BT12SP is
   for VITAL
   end for;
end CFG_BT12SP_VITAL;


----- CELL BT16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16P is
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
attribute VITAL_LEVEL0 of BT16P : entity is TRUE;
end BT16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT16P is
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

configuration CFG_BT16P_VITAL of BT16P is
   for VITAL
   end for;
end CFG_BT16P_VITAL;


----- CELL BT16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16SMP is
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
attribute VITAL_LEVEL0 of BT16SMP : entity is TRUE;
end BT16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT16SMP is
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

configuration CFG_BT16SMP_VITAL of BT16SMP is
   for VITAL
   end for;
end CFG_BT16SMP_VITAL;


----- CELL BT16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT16SP is
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
attribute VITAL_LEVEL0 of BT16SP : entity is TRUE;
end BT16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT16SP is
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

configuration CFG_BT16SP_VITAL of BT16SP is
   for VITAL
   end for;
end CFG_BT16SP_VITAL;


----- CELL BT24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24P is
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
attribute VITAL_LEVEL0 of BT24P : entity is TRUE;
end BT24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT24P is
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

configuration CFG_BT24P_VITAL of BT24P is
   for VITAL
   end for;
end CFG_BT24P_VITAL;


----- CELL BT24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24SMP is
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
attribute VITAL_LEVEL0 of BT24SMP : entity is TRUE;
end BT24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT24SMP is
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

configuration CFG_BT24SMP_VITAL of BT24SMP is
   for VITAL
   end for;
end CFG_BT24SMP_VITAL;


----- CELL BT24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BT24SP is
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
attribute VITAL_LEVEL0 of BT24SP : entity is TRUE;
end BT24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BT24SP is
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

configuration CFG_BT24SP_VITAL of BT24SP is
   for VITAL
   end for;
end CFG_BT24SP_VITAL;


----- CELL BU1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU1P is
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
attribute VITAL_LEVEL0 of BU1P : entity is TRUE;
end BU1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU1P is
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

configuration CFG_BU1P_VITAL of BU1P is
   for VITAL
   end for;
end CFG_BU1P_VITAL;


----- CELL BU2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU2P is
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
attribute VITAL_LEVEL0 of BU2P : entity is TRUE;
end BU2P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU2P is
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

configuration CFG_BU2P_VITAL of BU2P is
   for VITAL
   end for;
end CFG_BU2P_VITAL;


----- CELL BU4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU4P is
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
attribute VITAL_LEVEL0 of BU4P : entity is TRUE;
end BU4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU4P is
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

configuration CFG_BU4P_VITAL of BU4P is
   for VITAL
   end for;
end CFG_BU4P_VITAL;


----- CELL BU4SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU4SMP is
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
attribute VITAL_LEVEL0 of BU4SMP : entity is TRUE;
end BU4SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU4SMP is
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

configuration CFG_BU4SMP_VITAL of BU4SMP is
   for VITAL
   end for;
end CFG_BU4SMP_VITAL;


----- CELL BU8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8P is
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
attribute VITAL_LEVEL0 of BU8P : entity is TRUE;
end BU8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU8P is
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

configuration CFG_BU8P_VITAL of BU8P is
   for VITAL
   end for;
end CFG_BU8P_VITAL;


----- CELL BU8SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8SMP is
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
attribute VITAL_LEVEL0 of BU8SMP : entity is TRUE;
end BU8SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU8SMP is
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

configuration CFG_BU8SMP_VITAL of BU8SMP is
   for VITAL
   end for;
end CFG_BU8SMP_VITAL;


----- CELL BU8SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU8SP is
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
attribute VITAL_LEVEL0 of BU8SP : entity is TRUE;
end BU8SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU8SP is
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

configuration CFG_BU8SP_VITAL of BU8SP is
   for VITAL
   end for;
end CFG_BU8SP_VITAL;


----- CELL BU12P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12P is
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
attribute VITAL_LEVEL0 of BU12P : entity is TRUE;
end BU12P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU12P is
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

configuration CFG_BU12P_VITAL of BU12P is
   for VITAL
   end for;
end CFG_BU12P_VITAL;


----- CELL BU12SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12SMP is
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
attribute VITAL_LEVEL0 of BU12SMP : entity is TRUE;
end BU12SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU12SMP is
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

configuration CFG_BU12SMP_VITAL of BU12SMP is
   for VITAL
   end for;
end CFG_BU12SMP_VITAL;


----- CELL BU12SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU12SP is
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
attribute VITAL_LEVEL0 of BU12SP : entity is TRUE;
end BU12SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU12SP is
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

configuration CFG_BU12SP_VITAL of BU12SP is
   for VITAL
   end for;
end CFG_BU12SP_VITAL;


----- CELL BU16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16P is
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
attribute VITAL_LEVEL0 of BU16P : entity is TRUE;
end BU16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU16P is
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

configuration CFG_BU16P_VITAL of BU16P is
   for VITAL
   end for;
end CFG_BU16P_VITAL;


----- CELL BU16SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16SMP is
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
attribute VITAL_LEVEL0 of BU16SMP : entity is TRUE;
end BU16SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU16SMP is
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

configuration CFG_BU16SMP_VITAL of BU16SMP is
   for VITAL
   end for;
end CFG_BU16SMP_VITAL;


----- CELL BU16SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU16SP is
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
attribute VITAL_LEVEL0 of BU16SP : entity is TRUE;
end BU16SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU16SP is
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

configuration CFG_BU16SP_VITAL of BU16SP is
   for VITAL
   end for;
end CFG_BU16SP_VITAL;


----- CELL BU24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24P is
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
attribute VITAL_LEVEL0 of BU24P : entity is TRUE;
end BU24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU24P is
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

configuration CFG_BU24P_VITAL of BU24P is
   for VITAL
   end for;
end CFG_BU24P_VITAL;


----- CELL BU24SMP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24SMP is
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
attribute VITAL_LEVEL0 of BU24SMP : entity is TRUE;
end BU24SMP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU24SMP is
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

configuration CFG_BU24SMP_VITAL of BU24SMP is
   for VITAL
   end for;
end CFG_BU24SMP_VITAL;


----- CELL BU24SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BU24SP is
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
attribute VITAL_LEVEL0 of BU24SP : entity is TRUE;
end BU24SP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BU24SP is
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

configuration CFG_BU24SP_VITAL of BU24SP is
   for VITAL
   end for;
end CFG_BU24SP_VITAL;


----- CELL BUDD1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD1P is
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
attribute VITAL_LEVEL0 of BUDD1P : entity is TRUE;
end BUDD1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDD1P is
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

configuration CFG_BUDD1P_VITAL of BUDD1P is
   for VITAL
   end for;
end CFG_BUDD1P_VITAL;


----- CELL BUDD2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD2P is
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
attribute VITAL_LEVEL0 of BUDD2P : entity is TRUE;
end BUDD2P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDD2P is
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

configuration CFG_BUDD2P_VITAL of BUDD2P is
   for VITAL
   end for;
end CFG_BUDD2P_VITAL;


----- CELL BUDD4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD4P is
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
attribute VITAL_LEVEL0 of BUDD4P : entity is TRUE;
end BUDD4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDD4P is
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

configuration CFG_BUDD4P_VITAL of BUDD4P is
   for VITAL
   end for;
end CFG_BUDD4P_VITAL;


----- CELL BUDD8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD8P is
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
attribute VITAL_LEVEL0 of BUDD8P : entity is TRUE;
end BUDD8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDD8P is
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

configuration CFG_BUDD8P_VITAL of BUDD8P is
   for VITAL
   end for;
end CFG_BUDD8P_VITAL;


----- CELL BUDD12P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD12P is
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
attribute VITAL_LEVEL0 of BUDD12P : entity is TRUE;
end BUDD12P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDD12P is
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

configuration CFG_BUDD12P_VITAL of BUDD12P is
   for VITAL
   end for;
end CFG_BUDD12P_VITAL;


----- CELL BUDD16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD16P is
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
attribute VITAL_LEVEL0 of BUDD16P : entity is TRUE;
end BUDD16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDD16P is
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

configuration CFG_BUDD16P_VITAL of BUDD16P is
   for VITAL
   end for;
end CFG_BUDD16P_VITAL;


----- CELL BUDD24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDD24P is
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
attribute VITAL_LEVEL0 of BUDD24P : entity is TRUE;
end BUDD24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDD24P is
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

configuration CFG_BUDD24P_VITAL of BUDD24P is
   for VITAL
   end for;
end CFG_BUDD24P_VITAL;


----- CELL BUDU1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU1P is
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
attribute VITAL_LEVEL0 of BUDU1P : entity is TRUE;
end BUDU1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDU1P is
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

configuration CFG_BUDU1P_VITAL of BUDU1P is
   for VITAL
   end for;
end CFG_BUDU1P_VITAL;


----- CELL BUDU2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU2P is
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
attribute VITAL_LEVEL0 of BUDU2P : entity is TRUE;
end BUDU2P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDU2P is
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

configuration CFG_BUDU2P_VITAL of BUDU2P is
   for VITAL
   end for;
end CFG_BUDU2P_VITAL;


----- CELL BUDU4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU4P is
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
attribute VITAL_LEVEL0 of BUDU4P : entity is TRUE;
end BUDU4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDU4P is
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

configuration CFG_BUDU4P_VITAL of BUDU4P is
   for VITAL
   end for;
end CFG_BUDU4P_VITAL;


----- CELL BUDU8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU8P is
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
attribute VITAL_LEVEL0 of BUDU8P : entity is TRUE;
end BUDU8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDU8P is
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

configuration CFG_BUDU8P_VITAL of BUDU8P is
   for VITAL
   end for;
end CFG_BUDU8P_VITAL;


----- CELL BUDU12P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU12P is
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
attribute VITAL_LEVEL0 of BUDU12P : entity is TRUE;
end BUDU12P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDU12P is
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

configuration CFG_BUDU12P_VITAL of BUDU12P is
   for VITAL
   end for;
end CFG_BUDU12P_VITAL;


----- CELL BUDU16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU16P is
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
attribute VITAL_LEVEL0 of BUDU16P : entity is TRUE;
end BUDU16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDU16P is
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

configuration CFG_BUDU16P_VITAL of BUDU16P is
   for VITAL
   end for;
end CFG_BUDU16P_VITAL;


----- CELL BUDU24P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity BUDU24P is
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
attribute VITAL_LEVEL0 of BUDU24P : entity is TRUE;
end BUDU24P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of BUDU24P is
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

configuration CFG_BUDU24P_VITAL of BUDU24P is
   for VITAL
   end for;
end CFG_BUDU24P_VITAL;


----- CELL CBU1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity CBU1P is
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
attribute VITAL_LEVEL0 of CBU1P : entity is TRUE;
end CBU1P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of CBU1P is
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

configuration CFG_CBU1P_VITAL of CBU1P is
   for VITAL
   end for;
end CFG_CBU1P_VITAL;


----- CELL CBU2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity CBU2P is
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
attribute VITAL_LEVEL0 of CBU2P : entity is TRUE;
end CBU2P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of CBU2P is
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

configuration CFG_CBU2P_VITAL of CBU2P is
   for VITAL
   end for;
end CFG_CBU2P_VITAL;


----- CELL GND3ALLP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3ALLP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3ALLP : entity is TRUE;
end GND3ALLP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of GND3ALLP is

begin

   assert (FALSE)
     report "Cell GND3ALLP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3ALLP_VITAL of GND3ALLP is
   for VITAL
   end for;
end CFG_GND3ALLP_VITAL;


----- CELL GND3IP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3IP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3IP : entity is TRUE;
end GND3IP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of GND3IP is

begin

   assert (FALSE)
     report "Cell GND3IP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3IP_VITAL of GND3IP is
   for VITAL
   end for;
end CFG_GND3IP_VITAL;


----- CELL GND3OP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3OP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3OP : entity is TRUE;
end GND3OP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of GND3OP is

begin

   assert (FALSE)
     report "Cell GND3OP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3OP_VITAL of GND3OP is
   for VITAL
   end for;
end CFG_GND3OP_VITAL;


----- CELL GND3RP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity GND3RP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of GND3RP : entity is TRUE;
end GND3RP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of GND3RP is

begin

   assert (FALSE)
     report "Cell GND3RP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_GND3RP_VITAL of GND3RP is
   for VITAL
   end for;
end CFG_GND3RP_VITAL;


----- CELL ICCK2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK2P is
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
attribute VITAL_LEVEL0 of ICCK2P : entity is TRUE;
end ICCK2P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ICCK2P is
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

configuration CFG_ICCK2P_VITAL of ICCK2P is
   for VITAL
   end for;
end CFG_ICCK2P_VITAL;


----- CELL ICCK4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK4P is
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
attribute VITAL_LEVEL0 of ICCK4P : entity is TRUE;
end ICCK4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ICCK4P is
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

configuration CFG_ICCK4P_VITAL of ICCK4P is
   for VITAL
   end for;
end CFG_ICCK4P_VITAL;


----- CELL ICCK8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK8P is
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
attribute VITAL_LEVEL0 of ICCK8P : entity is TRUE;
end ICCK8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ICCK8P is
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

configuration CFG_ICCK8P_VITAL of ICCK8P is
   for VITAL
   end for;
end CFG_ICCK8P_VITAL;


----- CELL ICCK16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICCK16P is
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
attribute VITAL_LEVEL0 of ICCK16P : entity is TRUE;
end ICCK16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ICCK16P is
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

configuration CFG_ICCK16P_VITAL of ICCK16P is
   for VITAL
   end for;
end CFG_ICCK16P_VITAL;


----- CELL ICDP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICDP is
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
attribute VITAL_LEVEL0 of ICDP : entity is TRUE;
end ICDP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ICDP is
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

configuration CFG_ICDP_VITAL of ICDP is
   for VITAL
   end for;
end CFG_ICDP_VITAL;


----- CELL ICP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICP is
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
attribute VITAL_LEVEL0 of ICP : entity is TRUE;
end ICP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ICP is
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

configuration CFG_ICP_VITAL of ICP is
   for VITAL
   end for;
end CFG_ICP_VITAL;


----- CELL ICUP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ICUP is
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
attribute VITAL_LEVEL0 of ICUP : entity is TRUE;
end ICUP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ICUP is
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

configuration CFG_ICUP_VITAL of ICUP is
   for VITAL
   end for;
end CFG_ICUP_VITAL;


----- CELL ISDP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISDP is
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
attribute VITAL_LEVEL0 of ISDP : entity is TRUE;
end ISDP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ISDP is
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

configuration CFG_ISDP_VITAL of ISDP is
   for VITAL
   end for;
end CFG_ISDP_VITAL;


----- CELL ISP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISP is
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
attribute VITAL_LEVEL0 of ISP : entity is TRUE;
end ISP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ISP is
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

configuration CFG_ISP_VITAL of ISP is
   for VITAL
   end for;
end CFG_ISP_VITAL;


----- CELL ISUP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ISUP is
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
attribute VITAL_LEVEL0 of ISUP : entity is TRUE;
end ISUP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ISUP is
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

configuration CFG_ISUP_VITAL of ISUP is
   for VITAL
   end for;
end CFG_ISUP_VITAL;


----- CELL ITCK2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK2P is
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
attribute VITAL_LEVEL0 of ITCK2P : entity is TRUE;
end ITCK2P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ITCK2P is
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

configuration CFG_ITCK2P_VITAL of ITCK2P is
   for VITAL
   end for;
end CFG_ITCK2P_VITAL;


----- CELL ITCK4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK4P is
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
attribute VITAL_LEVEL0 of ITCK4P : entity is TRUE;
end ITCK4P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ITCK4P is
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

configuration CFG_ITCK4P_VITAL of ITCK4P is
   for VITAL
   end for;
end CFG_ITCK4P_VITAL;


----- CELL ITCK8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK8P is
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
attribute VITAL_LEVEL0 of ITCK8P : entity is TRUE;
end ITCK8P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ITCK8P is
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

configuration CFG_ITCK8P_VITAL of ITCK8P is
   for VITAL
   end for;
end CFG_ITCK8P_VITAL;


----- CELL ITCK16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITCK16P is
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
attribute VITAL_LEVEL0 of ITCK16P : entity is TRUE;
end ITCK16P;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ITCK16P is
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

configuration CFG_ITCK16P_VITAL of ITCK16P is
   for VITAL
   end for;
end CFG_ITCK16P_VITAL;


----- CELL ITDP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITDP is
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
attribute VITAL_LEVEL0 of ITDP : entity is TRUE;
end ITDP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ITDP is
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

configuration CFG_ITDP_VITAL of ITDP is
   for VITAL
   end for;
end CFG_ITDP_VITAL;


----- CELL ITP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITP is
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
attribute VITAL_LEVEL0 of ITP : entity is TRUE;
end ITP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ITP is
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

configuration CFG_ITP_VITAL of ITP is
   for VITAL
   end for;
end CFG_ITP_VITAL;


----- CELL ITUP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity ITUP is
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
attribute VITAL_LEVEL0 of ITUP : entity is TRUE;
end ITUP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of ITUP is
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

configuration CFG_ITUP_VITAL of ITUP is
   for VITAL
   end for;
end CFG_ITUP_VITAL;


----- CELL VDD3ALLP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3ALLP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3ALLP : entity is TRUE;
end VDD3ALLP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of VDD3ALLP is

begin

   assert (FALSE)
     report "Cell VDD3ALLP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3ALLP_VITAL of VDD3ALLP is
   for VITAL
   end for;
end CFG_VDD3ALLP_VITAL;


----- CELL VDD3IP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3IP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3IP : entity is TRUE;
end VDD3IP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of VDD3IP is

begin

   assert (FALSE)
     report "Cell VDD3IP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3IP_VITAL of VDD3IP is
   for VITAL
   end for;
end CFG_VDD3IP_VITAL;


----- CELL VDD3OP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3OP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3OP : entity is TRUE;
end VDD3OP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of VDD3OP is

begin

   assert (FALSE)
     report "Cell VDD3OP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3OP_VITAL of VDD3OP is
   for VITAL
   end for;
end CFG_VDD3OP_VITAL;


----- CELL VDD3RP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;


-- entity declaration --
entity VDD3RP is
   generic(
      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True);

   port(
      A                              :	in    STD_ULOGIC);
attribute VITAL_LEVEL0 of VDD3RP : entity is TRUE;
end VDD3RP;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library c35_IOLIB_4M;
use c35_IOLIB_4M.VTABLES.all;
architecture VITAL of VDD3RP is

begin

   assert (FALSE)
     report "Cell VDD3RP was not properly created." & LF &
        "Please refer to the library compiler error log file."
     severity ERROR;

end VITAL;

configuration CFG_VDD3RP_VITAL of VDD3RP is
   for VITAL
   end for;
end CFG_VDD3RP_VITAL;


---- end of library ----
