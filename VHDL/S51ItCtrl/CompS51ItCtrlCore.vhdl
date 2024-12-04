-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkgS51ItCtrl;
 use LibPkgS51ItCtrl.PkgS51ItCtrl.all;

-- Components Declaration

package PkgCompS51ItCtrlCore is

Component S51ItCtrlCore
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;
  En			: in    std_logic;

  ItEntriesPriorityV	: in	T_PRIORITYV;
  NMIIdentifierV	: in	bit_vector(ItNumberMax - 1 downto 0);
  
  AddressLUTV		: in	T_ADDRESSLUTV;
    
  ItfAccessSecure	: in	std_logic;
  S51XRetI		: in	std_logic;
  HardCallRq		: out	std_logic;
  HardCallAck		: in	std_logic;  
  HardCallPC		: out	std_logic_vector(PcLenght - 1 downto 0)
 );
End Component ;
End PkgCompS51ItCtrlCore ;

