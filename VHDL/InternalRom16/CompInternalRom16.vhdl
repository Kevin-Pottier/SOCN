-- Library Declaration

Library IEEE;
 Use IEEE.std_logic_1164.all;
 Use IEEE.std_logic_textio.all;
 use IEEE.std_logic_arith.all;
 Use STD.textio.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

-- Components Declaration

package PkgCompInternalRom16 is

Component InternalRom16
-- synopsys translate_off 
 Generic(
  RomFileName	: in 	string
 );
-- synopsys translate_on
 Port(
  RomClk       	: in  	std_logic;
  RomMe       	: in  	std_logic;
  PRaddress 	: in  	std_logic_vector(RomAddressBusLenght - 1 downto 0);
  DataOut   	: out 	std_logic_vector(RomDataBusLenght - 1 downto 0)
 );
End Component ;
End PkgCompInternalRom16 ;

