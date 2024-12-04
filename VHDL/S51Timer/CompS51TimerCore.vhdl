-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

-- Components Declaration

package PkgCompS51TimerCore is

Component S51TimerCore
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;

  start			: in	std_logic;
  stop			: in	std_logic;
  cnt			: in	std_logic_vector(15 downto 0);
  reload		: out	std_logic
 );
End Component ;
End PkgCompS51TimerCore ;

