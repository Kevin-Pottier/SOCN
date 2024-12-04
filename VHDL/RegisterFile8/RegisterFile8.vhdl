
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
--Library LibS51Cpu;
-- use LibS51Cpu.PkgStack.all;

entity RegisterFile8 is
Port(
 Ck		: in    std_logic;
-- Read port A
 AddPortA	: in	std_logic_vector(RegFileAddSize - 1 downto 0);	
 DoutPortA	: out	std_logic_vector(7 downto 0);
-- Read port B
 AddPortB	: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortB	: out	std_logic_vector(7 downto 0);
-- Write port C
 AddPortC	: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortC	: in	std_logic_vector(7 downto 0);
 WePortC	: in	std_logic;
-- Write port D
 AddPortD	: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortD	: in	std_logic_vector(7 downto 0);
 WePortD	: in	std_logic
 );
End RegisterFile8;

Architecture rtl of RegisterFile8 is
 signal RegFile8	: T_ARRAYOF8BITS(RegFileSize - 1 downto 0) := (others => (others =>'0'));
 
 signal PtrPortA	: integer range 0 to RegFileSize - 1;
 signal PtrPortB	: integer range 0 to RegFileSize - 1;
 signal PtrPortC	: integer range 0 to RegFileSize - 1;
 signal PtrPortD	: integer range 0 to RegFileSize - 1;
-- nosynopsys translate_off
 signal i		: integer;   
-- nosynopsys translate_on 
begin

-- nosynopsys translate_off 
 PtrPortA	<= To_integer(unsigned(AddPortA));
 DoutPortA	<= RegFile8(PtrPortA);
 PtrPortB	<= To_integer(unsigned(AddPortB));
 DoutPortB	<= RegFile8(PtrPortB);

 PtrPortC	<= To_integer(unsigned(AddPortC));
 PtrPortD	<= To_integer(unsigned(AddPortD));
 
 process(Ck)	-- Write process
 begin
--  if (RstB = '0') then
--   RegFile8 <= (others => (others =>'0'));	-- Reset value is null
-- synopsys translate_off 
--   for i in 0 to 255 loop
--    RegFile8(i) <= std_logic_vector(TO_UNSIGNED(i, 8));
--   end loop;
-- synopsys translate_on
  if (Ck'event and Ck = '1') then
     
   if WePortC = '1' then
    RegFile8(PtrPortC) <= DinPortC;
   end if;
   
   if WePortD = '1' then
    RegFile8(PtrPortD) <= DinPortD;
   end if;
   
  end if;
 end process;
-- nosynopsys translate_on

end rtl;
