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

package PkgCompS51ItCtrl is

Component S51ItCtrl
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;
  CpuIdleRq		: in    std_logic;

  -- SFR INTERFACE
  SfrDin		: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
  WriteSfr		: in	std_logic;
  SfrDout		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  ReadSfr		: in	std_logic;
  
  ITCTLCONWen 		: in	std_logic;
  Ie0WEn		: in	std_logic;
  Ie1WEn		: in	std_logic;
  IPH0WEn		: in	std_logic;
  IPH1WEn		: in	std_logic;
  IPL0WEn		: in	std_logic;
  IPL1WEn		: in	std_logic;

  ITCTLCONRen		: in	std_logic;
  Ie0REn		: in	std_logic;
  Ie1REn		: in	std_logic;
  IPH0REn		: in	std_logic;
  IPH1REn		: in	std_logic;
  IPL0REn		: in	std_logic;
  IPL1REn		: in	std_logic;
  
-- S51 DAX
  S51XRetI		: in	std_logic;
  HardCallRq		: out	std_logic;
  HardCallAck		: in	std_logic;  
  HardCallPC		: out	std_logic_vector(PcLenght - 1 downto 0);
  
-- PERIPHERALS
  ItEntriesV		: in	std_logic_vector(ItNumberMax - 1 downto 0)

 );
End Component ;
End PkgCompS51ItCtrl ;

