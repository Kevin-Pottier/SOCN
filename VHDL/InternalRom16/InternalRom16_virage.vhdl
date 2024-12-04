library IEEE;
 use IEEE.std_logic_1164.all;
-- synopsys translate_off
 use IEEE.std_logic_textio.all;
 use IEEE.vital_timing.all;
 use IEEE.vital_primitives.all;
 use STD.TEXTIO.ALL;
-- synopsys translate_on 
Library LibInternalRom16;
 use LibInternalRom16.PkgCompv2ss1_16384x16cm32.all;

Entity InternalRom16 is
-- synopsys translate_off
 Generic(
  RomFileName	: in 	string
 );
-- synopsys translate_on
 Port(
  RomClk       	: in  	std_logic;
  RomMe       	: in  	std_logic;
  PRaddress 	: in  	std_logic_vector(13 downto 0);
  DataOut   	: out 	std_logic_vector(15 downto 0)
 );
End InternalRom16;

Architecture rtl of InternalRom16 is
 
 signal VCC	: std_logic;
 
begin
 VCC <= '1';
 
 rom_i : v2ss1_16384x16cm32
-- synopsys translate_off 
 Generic Map(
  PreloadFilename => RomFileName
 )
-- synopsys translate_on 
 Port map (
  do	=> DataOut,
  addr	=> PRaddress,
  oe	=> VCC,
  me	=> RomMe,
  clk	=> RomClk
 );
end rtl;
