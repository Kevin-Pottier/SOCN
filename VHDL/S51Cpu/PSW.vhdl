
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgPsw.all;
Library LibPkg;
 use LibPkg.myutils.all;

entity PSW is
Port(
-- PSW

		-- Entry
 SetPsw			: in	std_logic_vector(PswRegSize - 1 downto 0);
 ClrPsw			: in	std_logic_vector(PswRegSize - 1 downto 0);
 PswReg			: in	std_logic_vector(PswRegSize - 1 downto 0);
 
 AccuI			: in	std_logic_vector(AccuRegSize - 1 downto 0);
		-- Output
 PswRegI		: out	std_logic_vector(PswRegSize - 1 downto 0)
 );
End PSW;

-------------------PSW----------------------
-- 7  | 6  |  5 |  4  |  3  |  2 |  1 | 0 --
--------------------------------------------
-- CY | AC | F0 | RS1 | RS0 | OV | F1 | P --
--------------------------------------------
-- CY: carry flag receives carry out from ALU operands
-- AC: Auxiliary carry flag receives carry out from add operands
-- F0: General purpose status flag
-- RS1:Register bank select bit
-- RS0:         //
-- OV: PSW2, overflow flag set by arithmetic operations
-- F1: User definable flag
-- P: Parity of accumulator

Architecture rtl of PSW is
begin

 process(ClrPsw, SetPsw, PswReg)
 begin
  PswRegI(PswRegSize - 1 downto 1) <= PswReg(PswRegSize - 1 downto 1);

  if ClrPsw(CY) = '1' then
   PswRegI(CY) <= '0'; 
  elsif SetPsw(CY) = '1' then
   PswRegI(CY) <= '1';    
  end if;

  if ClrPsw(AC) = '1' then
   PswRegI(AC) <= '0';
  elsif SetPsw(AC) = '1' then
   PswRegI(AC) <= '1';
  end if;

  if ClrPsw(F0) = '1' then
   PswRegI(F0) <= '0';
  elsif SetPsw(F0) = '1' then
   PswRegI(F0) <= '1';
  end if;

  if ClrPsw(RS1) = '1' then
   PswRegI(RS1) <= '0';
  elsif SetPsw(RS1) = '1' then
   PswRegI(RS1) <= '1';
  end if;

  if ClrPsw(RS0) = '1' then
   PswRegI(RS0) <= '0';
  elsif SetPsw(RS0) = '1' then 
   PswRegI(RS0) <= '1';
  end if;

  if ClrPsw(OV) = '1' then
   PswRegI(OV) <= '0';
  elsif SetPsw(OV) = '1' then
   PswRegI(OV) <= '1';
  end if;

  if ClrPsw(F1) = '1' then
   PswRegI(F1) <= '0';
  elsif SetPsw(F1) = '1' then
   PswRegI(F1) <= '1';
  end if;

--  if ClrPsw(P) = '1' then
--   PswRegI(P) <= '0';    
--  elsif SetPsw(P) = '1' then
--   PswRegI(P) <= '1';
--  end if;
 end process; 
 
-- PswRegI(P) <= Xor_Reduce(AccuI);
  
end rtl;
