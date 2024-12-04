-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgAlu.all;

-- Components Declaration

package PkgCompALUARITH is

Component ALUADD8
 Port(
  Add8Op1	: in  std_logic_vector(7 downto 0);
  Add8Op2	: in  std_logic_vector(7 downto 0);
  Add8S		: out std_logic_vector(8 downto 0)
 );
End Component ;
Component ALUMUL8
 Port(
  Mul8Op1	: in  std_logic_vector(7 downto 0);
  Mul8Op2	: in  std_logic_vector(7 downto 0);
  Mul8S		: out std_logic_vector(15 downto 0)
 );
End Component ;
Component ALUINC8
 Port(
  INC8OP	: in  std_logic_vector(8 downto 0);
  INC8S		: out std_logic_vector(8 downto 0)
 );
End Component ;
Component ALUDEC8
 Port(
  DEC8OP	: in  std_logic_vector(7 downto 0);
  DEC8S		: out std_logic_vector(7 downto 0)
 );
End Component ;
Component ALUDIV8
 Port(
  Div8Op1	: in  std_logic_vector(7 downto 0);
  Div8Op2	: in  std_logic_vector(7 downto 0);
  Div8S1	: out std_logic_vector(7 downto 0);
  Div8S2	: out std_logic_vector(7 downto 0)
 );
End Component ;
Component ALULT8
 Port(
  LT8Op1	: in  std_logic_vector(7 downto 0);
  LT8Op2	: in  std_logic_vector(7 downto 0);
  LT8S		: out std_logic
 );
End Component ;
End PkgCompALUARITH ;

