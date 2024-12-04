
-- Library Declaration


Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

-- Components Declaration

package PkgCompBod is

Component bod
 Port(
  bod_det            	: out   std_logic;
  bod_en            	: in    std_logic
 );
End Component ;
End PkgCompBod ;

