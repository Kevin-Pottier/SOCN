
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgAlu.all;
 use LibS51Cpu.PkgCompALUARITH.all;
 use LibS51Cpu.PkgCompAlu.all; 

entity ALU is
Port(
-- ALU 8 bits
                -- Entries
 Accu                        : in        std_logic_vector(OpSize - 1 downto 0); -- dedicated for DIV op to remove long paths
 Breg                        : in        std_logic_vector(OpSize - 1 downto 0); -- dedicated for DIV op to remove long paths

 Op1                         : in        std_logic_vector(OpSize - 1 downto 0);
 Op2                         : in        std_logic_vector(OpSize - 1 downto 0);
 --Op3                       : in        std_logic_vector(OpSize - 1 downto 0);
 Op5                         : in        std_logic_vector(OpSize - 1 downto 0);
 Op6                         : in        std_logic_vector(OpSize - 1 downto 0);
                -- Outputs
 S1                          : out        std_logic_vector(OpSize - 1 downto 0);
 S1_DIV                      : out        std_logic_vector(OpSize - 1 downto 0); -- Added S1_DIV to remove long paths functionnaly not exercised (false paths)
 S2                          : out        std_logic_vector(OpSize - 1 downto 0);
 S2_DIV                      : out        std_logic_vector(OpSize - 1 downto 0);
 S4                          : out        std_logic_vector(OpSize - 1 downto 0); 
 C1                          : out        std_logic;        
 AUXCARRY1                   : out        std_logic;
 LT                          : out        std_logic;
 Ov1                         : out        std_logic;
                 -- Command
 CmdAlu                      : in        AluCmd
);
End ALU;

Architecture rtl of ALU is
 signal ADD8S                : std_logic_vector(OpSize downto 0);
 signal MUL8S                : std_logic_vector(2 * OpSize - 1 downto 0);
 signal INC8S                : std_logic_vector(OpSize downto 0); 
 signal INC8OP               : std_logic_vector(OpSize downto 0);  
 signal DEC8S                : std_logic_vector(OpSize - 1 downto 0);
 signal QUOTIENT             : std_logic_vector(OpSize - 1 downto 0);  
 signal REMAIN               : std_logic_vector(OpSize - 1 downto 0);

-- Gated ports for power consumption purpose
 signal ADD8OP1              : std_logic_vector(OpSize - 1 downto 0);
 signal ADD8OP2              : std_logic_vector(OpSize - 1 downto 0);

 signal MUL8OP1              : std_logic_vector(OpSize - 1 downto 0);
 signal MUL8OP2              : std_logic_vector(OpSize - 1 downto 0);

 signal DIV8OP1              : std_logic_vector(OpSize - 1 downto 0);
 signal DIV8OP2              : std_logic_vector(OpSize - 1 downto 0);
 
 signal DEC8OP               : std_logic_vector(OpSize - 1 downto 0);
 
begin

----------------------------------------------------------
-- case CmdAlu :                                        --
----------------------------------------------------------
-- ADD8                        : S1 <= Op1 + Op2        --
--                                                      --
----------------------------------------------------------
-- INC8                        : S1 <= Op1 + 1          --
--                                                      --
----------------------------------------------------------
-- DEC8                        : S1 <= Op3 - 1          --
--                                                      --
----------------------------------------------------------
-- ADDINC8                     : S1 <= Op1 + Op2 + 1    --
--                                                      --
----------------------------------------------------------
--                                           ___        --
-- SUB8                        : S1 <= Op1 + Op2        --
----------------------------------------------------------
--                                      ___             --
-- SUBINC8                : S1 <= Op1 + Op2 + 1         --
----------------------------------------------------------
-- DIV8                   : S1_DIV <= Accu / Breg       --
--                        : S2_DIV <= Accu % Breg       --
----------------------------------------------------------
-- MUL8                   : S1 <= (Accu * Breg)'high    --
--                        : S2 <= (Accu * Breg)'low     --
----------------------------------------------------------

---------------------------------------------------------------------------------
-- ADDER
---------------------------------------------------------------------------------

 ADD8OP1 <=        scalarprod2(Op1, (CmdAlu = SUB8) or (CmdAlu = SUBINC8) or (CmdAlu = ADD8)  or (CmdAlu = ADDINC8));
 ADD8OP2 <=        scalarprod2(not Op2, (CmdAlu = SUB8) or (CmdAlu = SUBINC8)) or
                   scalarprod2(Op2, (CmdAlu = ADD8) or (CmdAlu = ADDINC8));
  
 ADD8_I : ALUADD8
 Port map (
  Add8Op1        => ADD8OP1,
  Add8Op2        => ADD8OP2,
  Add8S          => ADD8S
 );

---------------------------------------------------------------------------------
-- INCREMENTER
---------------------------------------------------------------------------------

 INC8OP <=        scalarprod2(ADD8S(OpSize downto 0), (CmdAlu = ADDINC8) or (CmdAlu = SUBINC8)) or
--                scalarprod2('0' & Op3, CmdAlu = ADD_AND_INC8) or
                  scalarprod2('0' & Op1, CmdAlu = INC8);

 INC8_I : ALUINC8
 Port map (
  INC8OP        => INC8OP,
  INC8S         => INC8S
 );

---------------------------------------------------------------------------------
-- DECREMENTER
---------------------------------------------------------------------------------

 DEC8OP <= Accu; -- scalarprod2(Accu, CmdAlu = DEC8);

 DEC8_I : ALUDEC8
 Port map (
  DEC8OP        => DEC8OP,
  DEC8S         => DEC8S
 );

---------------------------------------------------------------------------------
-- COMPARATOR
---------------------------------------------------------------------------------

 LT8_I : ALULT8
 Port map (
  LT8Op1        => Op5,
  LT8Op2        => Op6,
  LT8S          => LT
 );

---------------------------------------------------------------------------------
-- MULTIPLIER
---------------------------------------------------------------------------------

 MUL8OP1 <= scalarprod2(Accu, CmdAlu = MUL8);
 MUL8OP2 <= scalarprod2(Breg, CmdAlu = MUL8);

 MUL8_I : ALUMUL8
 Port map (
  Mul8Op1        => MUL8OP1,
  Mul8Op2        => MUL8OP2,
  Mul8S          => MUL8S
 );

---------------------------------------------------------------------------------
-- DIVIDER
---------------------------------------------------------------------------------

 DIV8OP1 <= scalarprod2(Accu, CmdAlu = DIV8);
 DIV8OP2 <= scalarprod2(Breg, CmdAlu = DIV8);

 DIV8_I : ALUDIV8
 Port map (
  Div8Op1       => DIV8OP1,
  Div8Op2       => DIV8OP2,
  Div8S1        => QUOTIENT,
  Div8S2        => REMAIN
 );
---------------------------------------------------------------------------------

-- MUX :         process(CmdAlu, ADD8S, INC8S, Op1, Op2,
--                 DEC8S, QUOTIENT, REMAIN, MUL8S)
-- begin
--  S1                <= (others => '0');
--  C1                <= '0';
--  S2                <= (others => '0');
--  S4                <= (others => '0');      
--  AUXCARRY1        <= '0';
--  OV1                <= '0';
--  case CmdAlu is
--  when ADD8 =>
--   S1 <= ADD8S(7 downto 0);
--   C1 <= ADD8S(8);
--   AUXCARRY1 <= (Op1(4) xor Op2(4)) xor ADD8S(4);
--   OV1 <= ((Op1(7) xor Op2(7)) xor ADD8S(7)) xor ADD8S(8);
--  when ADD_AND_INC8 =>
--   S1 <= ADD8S(7 downto 0);
--   C1 <= ADD8S(8);
--   S4 <= INC8S(7 downto 0);
--  when INC8 =>
--   S1 <= INC8S(7 downto 0);
--   C1 <= INC8S(8);
--  when DEC8 =>
--   S1 <= DEC8S;   
--  when ADDINC8 =>
--   S1 <= INC8S(7 downto 0);
--   C1 <= INC8S(8);
--   AUXCARRY1 <= (Op1(4) xor Op2(4)) xor INC8S(4);
--   OV1 <= ((Op1(7) xor Op2(7)) xor INC8S(7)) xor INC8S(8);
--  when SUB8 =>
--   S1 <= ADD8S(7 downto 0);
--   C1 <= not ADD8S(8);
--   AUXCARRY1 <= Op1(4) xor (Op2(4) xor ADD8S(4));
--   OV1 <= (Op1(7) xor (Op2(7) xor ADD8S(7))) xor (not ADD8S(8));   
--  when SUBINC8 =>
--   S1 <= INC8S(7 downto 0);
--   C1 <= not INC8S(8);
--   AUXCARRY1 <= Op1(4) xor (Op2(4) xor INC8S(4));
--   OV1 <= (Op1(7) xor (Op2(7) xor INC8S(7))) xor (not INC8S(8));
--  when DIV8 =>
--   S1 <= QUOTIENT;
--   S2 <= REMAIN;
--  when MUL8 =>
--   S1 <= MUL8S(OpSize - 1 downto 0);
--   S2 <= MUL8S(2 * OpSize - 1 downto OpSize);
--  when OTHERS => NULL;
--  end case;
-- end process;

 S1 <=           scalarprod2(ADD8S(7 downto 0),                (CmdAlu = ADD8) or (CmdAlu = SUB8)                          ) or
                 scalarprod2(INC8S(7 downto 0),                (CmdAlu = INC8) or (CmdAlu = ADDINC8) or (CmdAlu = SUBINC8) ) or
                 scalarprod2(DEC8S(7 downto 0),                (CmdAlu = DEC8)                                             ) or
--               scalarprod2(QUOTIENT,                        (CmdAlu = DIV8)                                              ) or
                 scalarprod2(MUL8S(OpSize - 1 downto 0),        (CmdAlu = MUL8));

 S1_DIV <= QUOTIENT;

-- S2 <=           scalarprod2(MUL8S(2 * OpSize - 1 downto OpSize)   , (CmdAlu = MUL8)     ) or
--                 scalarprod2(REMAIN                                , (CmdAlu = DIV8)     );

 S2 <=        MUL8S(2 * OpSize - 1 downto OpSize);
 S2_DIV <= REMAIN;

 C1 <=           (ADD8S(8)                        and        bool2_stdlogic(CmdAlu = ADD8)                          ) or
                 (not ADD8S(8)                    and        bool2_stdlogic(CmdAlu = SUB8)                          ) or
                 (INC8S(8)                        and        bool2_stdlogic((CmdAlu = INC8) or (CmdAlu = ADDINC8))  ) or
                 (not INC8S(8)                    and        bool2_stdlogic(CmdAlu = SUBINC8)                       );
                
 --S4 <=                scalarprod2(INC8S(7 downto 0),                (CmdAlu = ADD_AND_INC8));
 S4 <=        INC8S(7 downto 0);
 
 AUXCARRY1 <=        (((Op1(4) xor Op2(4)) xor ADD8S(4))        and bool2_stdlogic((CmdAlu = ADD8) or (CmdAlu = SUB8))        ) or
                     (((Op1(4) xor Op2(4)) xor INC8S(4))        and bool2_stdlogic((CmdAlu = ADDINC8) or (CmdAlu = SUBINC8))  );
                
 OV1 <=          ((((Op1(7) xor Op2(7)) xor ADD8S(7)) xor ADD8S(8))              and bool2_stdlogic(CmdAlu = ADD8)            ) or
                 ((((Op1(7) xor Op2(7)) xor INC8S(7)) xor INC8S(8))              and bool2_stdlogic(CmdAlu = ADDINC8)         ) or
                 (((Op1(7) xor (Op2(7) xor ADD8S(7))) xor (not ADD8S(8)))        and bool2_stdlogic(CmdAlu = SUB8)            ) or
                 (((Op1(7) xor (Op2(7) xor INC8S(7))) xor (not INC8S(8)))        and bool2_stdlogic(CmdAlu = SUBINC8)         );

end rtl;
