
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibBod;
 use LibBod.PkgCompBod.all;

Entity bod is
 Port(
  bod_det            	: out   std_logic;
  bod_en            	: in    std_logic
 );
End bod;
 
Architecture rtl of bod is

begin

 bod_det <= '1' , not bod_en after 1000 ns;

End rtl;

