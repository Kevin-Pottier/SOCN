-- Library Declaration

Library IEEE;
  Use IEEE.std_logic_1164.all;
-- synopsys translate_off
  Use IEEE.vital_primitives.all;
  Use IEEE.vital_timing.all;

-- synopsys translate_on

Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

-- Components Declaration

package PkgCompSfrDecoder is

Component SfrDecoder
 Port(
  AddSfr	: in  std_logic_vector(7 downto 0);
--  BitAddressable: in  std_logic;

  Ben   	: out std_logic;
  ACCen		: out std_logic;
  PSWen		: out std_logic;
  SPen		: out std_logic;
  DPLen		: out std_logic;
  DPHen		: out std_logic;
  UartConEn	: out std_logic;
  UartStaEn	: out std_logic;
  UartBuffEn	: out std_logic;
  PrescalHEn	: out std_logic;
  PrescalLEn	: out std_logic;
  Dout0En	: out std_logic;
  TCTRLEn	: out std_logic;
  CNT_HEn	: out std_logic;
  CNT_LEn	: out std_logic;
  TSTATEn	: out std_logic;
  IE0En		: out std_logic;
  IE1En		: out std_logic;
  IPH0En	: out std_logic;
  IPH1En	: out std_logic;
  IPL0En	: out std_logic;
  IPL1En	: out std_logic;
  ITCTLCONEn	: out std_logic;
  
  SfrDout_TSTAT		     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_H		     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_L		     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
     
  SfrDout_IE0     	   : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IE1	         : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPH0	       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPH1	       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPL0     	   : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPL1	       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITCTLCON	   : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITSRCL	     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITSRCH	     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  
  SfrDout_Breg         : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_Accu         : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_PswReg       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_StackPointer : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_Dpl          : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_Dph          : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  
  SfrDout_Dout0        : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  
  SfrDout		           : out std_logic_vector(PeriphDataBusSize -1 downto 0)  
 );
End Component ;
End PkgCompSfrDecoder ;

