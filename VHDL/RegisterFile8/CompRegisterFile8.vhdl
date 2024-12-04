-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
--Library LibS51Cpu;
-- use LibS51Cpu.PkgStack.all;


-- Components Declaration

package PkgCompRegisterFile8 is

Component RegisterFile8
Port(
 Ck		: in    std_logic;
-- Read port A
 AddPortA	: in	std_logic_vector(RegFileAddSize - 1 downto 0);	
 DoutPortA	: out	std_logic_vector(7 downto 0);
-- Read port B
 AddPortB	: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortB	: out	std_logic_vector(7 downto 0);
-- Write port C
 AddPortC	: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortC	: in	std_logic_vector(7 downto 0);
 WePortC	: in	std_logic;
-- Write port D
 AddPortD	: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortD	: in	std_logic_vector(7 downto 0);
 WePortD	: in	std_logic
 );
End Component ;
End PkgCompRegisterFile8 ;

