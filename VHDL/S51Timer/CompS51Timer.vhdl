
-- Library Declaration


Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

-- Components Declaration

package PkgCompS51Timer is

Component S51Timer
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;

  -- SFR INTERFACE
  SfrDin		: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
  WriteSfr		: in	std_logic;
--  SfrDout		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);

  SfrDout_TSTAT : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_H		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_L		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);  
--  ReadSfr		: in	std_logic;
  
  TCTRLWen 		: in	std_logic;
  CNT_HWen		: in	std_logic;
  CNT_LWen		: in	std_logic;

--  CNT_HRen		: in	std_logic;
--  CNT_LRen		: in	std_logic;
--  TSTATRen		: in	std_logic;
  
-- PERIPHERALS
  Time_out_IT		: out	std_logic;
  timer_auto_idle	: out	std_logic
 );
End Component ;
End PkgCompS51Timer ;

