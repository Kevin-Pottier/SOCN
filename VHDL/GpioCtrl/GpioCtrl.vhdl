Library IEEE;
 Use IEEE.std_logic_1164.all;
 Use IEEE.std_logic_textio.all;
 Use STD.textio.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkg;
 use LibPkg.utils.all; 

Entity GpioCtrl is
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
End GpioCtrl;

Architecture rtl of GpioCtrl is
 signal Dout0I		: std_logic_vector(7 downto 0);
 signal WriteDout0	: std_logic;
begin

-- Dout0 <= Dout0I;

 process(RstB, Ck)
 begin
  if (RstB = '0') then
   Dout0I <= "01010101";
  elsif (Ck'event and Ck = '1') then
   if (WriteSfr = '1' and Dout0Wen = '1') then
    Dout0I <= SfrDin;
   end if;
  end if;
 end process;
	    
-- SfrDout <= 	Dout0I when ReadSfr = '1' and Dout0REn = '1' else
--		(others => 'Z');

 SfrDout_Dout0 <= Dout0I;

 WriteDout0 <= WriteSfr and Dout0Wen;

-- synopsys translate_off
		-- Behavioural: print a warning on simulator command shell
		process(Ck)
		 variable OutLine : line; 
		 File FileOutPut : TEXT is out "gpioctrl.log";
		begin
		 if (ck'event and ck = '1' and WriteDout0 = '1') then
		  write(OutLine, string'("Dummy peripheral : Writing ")); write(OutLine, to_hstring(SfrDin));
		  write(OutLine, string'(" at ")); write(OutLine, now);
	          writeline(FileOutPut, OutLine);
		 end if;
		end process;
-- synopsys translate_on



end rtl;
