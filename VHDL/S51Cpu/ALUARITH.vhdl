
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;

Entity ALUADD8 is
 Port(
  Add8Op1	: in  std_logic_vector(7 downto 0);
  Add8Op2	: in  std_logic_vector(7 downto 0);
  Add8S		: out std_logic_vector(8 downto 0)
 );
End ALUADD8;

Architecture rtl of ALUADD8 is
begin
 process(Add8Op1, Add8Op2)
 begin
  Add8S <= std_logic_vector(unsigned('0'&Add8Op1) + unsigned('0'&Add8Op2));  
 end process;
end rtl;

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

Entity ALUMUL8 is
 Port(
  Mul8Op1	: in  std_logic_vector(7 downto 0);
  Mul8Op2	: in  std_logic_vector(7 downto 0);
  Mul8S		: out std_logic_vector(15 downto 0)
 );
End ALUMUL8;

Architecture rtl of ALUMUL8 is
begin
 process(Mul8Op1, Mul8Op2)
 begin
  Mul8S <= std_logic_vector(unsigned(Mul8Op1) * unsigned(Mul8Op2));
 end process;
end rtl;

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

Entity ALUINC8 is
 Port(
  INC8OP	: in  std_logic_vector(8 downto 0);
  INC8S		: out std_logic_vector(8 downto 0)
 );
End ALUINC8;

Architecture rtl of ALUINC8 is
begin
 process(INC8OP)
 begin
  INC8S <= std_logic_vector(unsigned(INC8OP) + 1);
 end process;
end rtl;

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

Entity ALUDEC8 is
 Port(
  DEC8OP	: in  std_logic_vector(7 downto 0);
  DEC8S		: out std_logic_vector(7 downto 0)
 );
End ALUDEC8;

Architecture rtl of ALUDEC8 is
begin
 process(DEC8OP)
 begin
  DEC8S <= std_logic_vector(unsigned(DEC8OP) - 1);
 end process;
end rtl;

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
--library AWARITH;
-- use AWARITH.COMPONENTS.all;
Library CW;
 use CW.COMPONENTS.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgAlu.all;

Entity ALUDIV8 is
 Port(
  Div8Op1	: in  std_logic_vector(7 downto 0);
  Div8Op2	: in  std_logic_vector(7 downto 0);
  Div8S1	: out std_logic_vector(7 downto 0);
  Div8S2	: out std_logic_vector(7 downto 0)
 );
End ALUDIV8;

Architecture ntl of ALUDIV8 is
begin

--U0 : AWARITH_DIV
--generic map (
--    wN  => 8,
--    wD  => 8,  
--    tc  => 0,     -- two's complement mode off => unsigned mode
--    rem_mode=> 1  -- remainder mode, not modulo mode
--)
U0 : CW_div
generic map (
    a_width  => 8,
    b_width  => 8,  
    tc_mode  => 0,     -- two's complement mode off => unsigned mode
    rem_mode=> 1  -- remainder mode, not modulo mode
)
--port map (
--N   => DIV8OP1,
--D   => Div8Op2,
--Q   => Div8S1,
--R   => Div8S2,
--DBZ => open,
--OVF => open
--);
port map (
a   => DIV8OP1,
b   => Div8Op2,
quotient   => Div8S1,
remainder   => Div8S2,
divide_by_0 => open
);
 
end ntl;

--Architecture behav of ALUDIV8 is
--begin
--
-- process(Div8Op1, Div8Op2)
--  variable DIV8OP1INT	 : integer range 0 to 255;
--  variable DIV8OP2INT	 : integer range 0 to 255;
-- begin
--  DIV8OP1INT := to_integer(unsigned(Div8Op1));
--  DIV8OP2INT := to_integer(unsigned(Div8Op2));
--  -- synopsys translate_off
--  if DIV8OP2INT /= 0 then
--  -- synopsys translate_on
--   Div8S1 <= std_logic_vector(to_unsigned(DIV8OP1INT / DIV8OP2INT, 8));
--   Div8S2 <= std_logic_vector(to_unsigned(DIV8OP1INT rem DIV8OP2INT, 8));
--  -- synopsys translate_off
--  end if;
--  -- synopsys translate_on
-- end process;
-- 
--end behav;

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

Entity ALULT8 is
 Port(
  LT8Op1	: in  std_logic_vector(7 downto 0);
  LT8Op2	: in  std_logic_vector(7 downto 0);
  LT8S		: out std_logic
 );
End ALULT8;

Architecture rtl of ALULT8 is
begin

 LT8S <=	'1' when LT8Op1 < LT8Op2 else
 		'0';

end rtl;
