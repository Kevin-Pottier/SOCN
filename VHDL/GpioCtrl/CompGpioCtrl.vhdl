-- Library Declaration

Library IEEE;
 Use IEEE.std_logic_1164.all;
 Use IEEE.std_logic_textio.all;
 Use STD.textio.all;
--Library LibPkg;
-- Use LibPkg.Utils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

-- Components Declaration

package PkgCompGpioCtrl is

Component GpioCtrl
 Port(
-- SYSTEM
   RstB			: in std_logic;
   Ck			: in std_logic;
-- PERIPHERAL BUS   
   SrcSfrAddress	: in std_logic_vector(PeriphAddBusSize - 1 downto 0);
   DstSfrAddress  	: in std_logic_vector(PeriphAddBusSize - 1 downto 0);
   SfrDin		: in std_logic_vector(PeriphDataBusSize -1 downto 0);
--   SfrDout		: inout std_logic_vector(PeriphDataBusSize -1 downto 0);
   SfrDout_Dout0 : out std_logic_vector(PeriphDataBusSize -1 downto 0);   
   WriteSfr		: in std_logic;
--   ReadSfr		: in std_logic;
--   Dout0REn		: in std_logic;
   Dout0WEn		: in std_logic
--   Dout0		: out std_logic_vector(PeriphDataBusSize -1 downto 0)
 );
End Component ;
End PkgCompGpioCtrl ;

