-- Library Declaration

Library IEEE;
  Use IEEE.std_logic_1164.all;
-- synopsys translate_off
  Use IEEE.vital_primitives.all;
  Use IEEE.vital_timing.all;

-- synopsys translate_on

-- Components Declaration

package PkgCompplatch is

Component platch
Port(
 d	: in	std_logic;
 e	: in	std_logic;
 q	: out	std_logic
);
End Component ;
End PkgCompplatch ;

