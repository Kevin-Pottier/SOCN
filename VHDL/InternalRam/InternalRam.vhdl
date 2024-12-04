---------------------------------------------------------------------------
-- $Id: InternalRam.vhdl,v 1.1.2.2 2004/05/11 08:33:54 sgarnier Exp $
---------------------------------------------------------------------------

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

Entity InternalRam is
 Port(
  XRamAddress	: in 	std_logic_vector(XRamAddBusSize - 1 downto 0);
  XRamDOut	: out	std_logic_vector(XRamDataBusSize - 1 downto 0);
  XRamDIn	: in	std_logic_vector(XRamDataBusSize - 1 downto 0);
  XRamClk	: in	std_logic;
  XRamEn	: in	std_logic;
  XRamME	: in	std_logic;
  XRamWE	: in	std_logic
);
End InternalRam;

Architecture rtl of InternalRam is
 -- Array of 64K bytes defining the Data Memory XRamAddress Space
-- synopsys translate_off 
 Type RamTable is array (0 to TOTALXRAMBYTESIZE - 1) of std_logic_vector(7 downto 0);
 Signal RamContents : RamTable;
-- synopsys translate_on
begin

-- synopsys translate_off 

process(XRamClk)
begin
 if XRamClk'event and XRamClk = '1' then
  if XRamEn = '1' then
   if XRamME = '1' then
    XRamDOut <= (others => 'X'), RamContents(conv_integer(unsigned(XRamAddress))) after 4 ns;
   end if;
   if XRamWE = '1' then
    XRamDOut <= XRamDIn;
    RamContents(conv_integer(unsigned(XRamAddress))) <= XRamDIn;
   end if;
  end if;
 end if;
end process;

-- synopsys translate_on 

end rtl;

