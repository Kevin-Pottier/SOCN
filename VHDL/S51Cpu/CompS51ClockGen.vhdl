-- Library Declaration

Library IEEE;
  Use IEEE.std_logic_1164.all;
-- synopsys translate_off
  Use IEEE.vital_primitives.all;
  Use IEEE.vital_timing.all;

-- synopsys translate_on

-- Components Declaration

package PkgCompS51ClockGen is

Component S51ClockGen
Port(
 RstB			: in	std_logic;
 Ck			: in	std_logic;
 GatedCk		: out	std_logic;

 RstBQ			: in	std_logic;
 CpuIdleRq		: in	std_logic;
 CpuIdleAck		: out   std_logic;
 NotIdleMode		: out   std_logic;
 DisOpcodeFetch		: in	std_logic;

 XRamClk		: out	std_logic;
 XRamEn			: out	std_logic;
 StackClk		: out	std_logic;
 StackEn		: out	std_logic;
 RomClk			: out	std_logic;
 RomEn			: out	std_logic
);
End Component ;
End PkgCompS51ClockGen ;

