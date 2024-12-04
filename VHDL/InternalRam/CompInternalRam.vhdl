-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

-- Components Declaration

package PkgCompInternalRam is

Component InternalRam
 Port(
  XRamAddress	: in 	std_logic_vector(XRamAddBusSize - 1 downto 0);
  XRamDOut	: out	std_logic_vector(XRamDataBusSize - 1 downto 0);
  XRamDIn	: in	std_logic_vector(XRamDataBusSize - 1 downto 0);
  XRamClk	: in	std_logic;
  XRamEn	: in	std_logic;
  XRamME	: in	std_logic;
  XRamWE	: in	std_logic
);
End Component ;
End PkgCompInternalRam ;

