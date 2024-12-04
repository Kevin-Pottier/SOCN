
Library IEEE;
 use IEEE.std_logic_1164.all;

package PkgAlu is

 constant OpSize	: integer := 8;

 -- type AluCmd is (ALUNOP, MUL8, DIV8, ADD8, SUB8, SUBINC8, DEC8, ADD_AND_INC8, INC8, ADDINC8);
 type AluCmd is (ALUNOP, MUL8, DIV8, ADD8, SUB8, SUBINC8, DEC8, INC8, ADDINC8);

end PkgAlu;

package body PkgAlu is

end;

