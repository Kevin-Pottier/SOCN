
-- Library Declaration


Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibBod;
 use LibBod.PkgCompBod.all;

-- Components Declaration

package PkgCompRstCtl is

Component RstCtl
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;
  iRstB			: out	std_logic
 );
End Component ;
End PkgCompRstCtl ;

