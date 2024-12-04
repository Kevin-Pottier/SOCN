---------------------------------------------------------------------------
-- $Id: InternalRom16_generic.vhdl,v 1.1 2004/05/14 15:25:10 sgarnier Exp $
---------------------------------------------------------------------------

Library IEEE;
 Use IEEE.std_logic_1164.all;
 Use IEEE.std_logic_textio.all;
 use IEEE.std_logic_arith.all;
 Use STD.textio.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

Entity InternalRom16 is
-- synopsys translate_off 
 Generic(
  RomFileName	: in 	string := "rom0_i.txt"
 );
-- synopsys translate_on 
 Port(
  RomClk       	: in  	std_logic;
  RomMe       	: in  	std_logic;
  PRaddress 	: in  	std_logic_vector(RomAddressBusLenght - 1 downto 0);
  DataOut   	: out 	std_logic_vector(RomDataBusLenght - 1 downto 0)
 );
End InternalRom16;

Architecture rtl of InternalRom16 is
-- synopsys translate_off 
 -- Array of 64K representing the Program Memory Address Space
 Type RomTable is array (0 to 16383) of std_logic_vector(RomDataBusLenght - 1 downto 0);
-- Type RomTable is array (0 to 4095) of std_logic_vector(15 downto 0);
--------------
-- Function --
--------------
 Function LoadRom(Filename : string) return RomTable is
  File F : TEXT is in Filename;
  Variable L : LINE;
  Variable Result : RomTable := (others=>(others=>'0'));
 begin
  for i in RomTable'range loop
--   if not Endfile(F) then
--    readline (F,L);
--    read (L, Result(i)(15 downto 8));
--   end if;
   if not Endfile(F) then
    readline (F,L);
    read (L, Result(i)(7 downto 0));
   end if;   
  end loop;
  return Result;
 end LoadRom;

 constant RomContents : RomTable := LoadRom(RomFileName);
-- synopsys translate_on 
begin
 
-- DataOut <= RomContents(To_integer(PRaddress)) after 9 ns when Oeb='0' else
--            (others=>'Z');


-- synopsys translate_off 
	    
 process(RomClk)
 begin
  if RomClk'event and RomClk = '1' then
   if RomMe = '1' then
    DataOut <= (others => 'X'), RomContents(conv_integer(unsigned(PRaddress))) after 8 ns;
   end if;
  end if;
 end process;
-- synopsys translate_on 
	    
end rtl;
