-- Library Declaration

Library IEEE;
  Use IEEE.std_logic_1164.all;
-- synopsys translate_off
  Use IEEE.vital_primitives.all;
  Use IEEE.vital_timing.all;

-- synopsys translate_on

-- Components Declaration

package PkgCompDriver is

Component Driver
 Generic(
  Period	: time := 20 ns
 );
 Port(
  RstB		: inout std_logic;
  Ck		: in    std_logic;
  CpuIdleRq	: out	std_logic;
  RxD		: out	std_logic;
  TxD		: in	std_logic  
 );
End Component ;
End PkgCompDriver ;

