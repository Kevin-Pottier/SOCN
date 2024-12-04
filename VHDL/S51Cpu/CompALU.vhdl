-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgALU.all;

-- Components Declaration

package PkgCompALU is

Component ALU
Port(
-- ALU 8 bits
		-- Entries
 Accu			: in	std_logic_vector(OpSize - 1 downto 0);
 Breg			: in	std_logic_vector(OpSize - 1 downto 0);
 Op1			: in	std_logic_vector(OpSize - 1 downto 0);
 Op2			: in	std_logic_vector(OpSize - 1 downto 0);
 --Op3			: in	std_logic_vector(OpSize - 1 downto 0);
 Op5			: in	std_logic_vector(OpSize - 1 downto 0);
 Op6			: in	std_logic_vector(OpSize - 1 downto 0);
		-- Outputs
 S1			: out	std_logic_vector(OpSize - 1 downto 0);
 S1_DIV		: out	std_logic_vector(OpSize - 1 downto 0);
 S2			: out	std_logic_vector(OpSize - 1 downto 0);
 S2_DIV		: out	std_logic_vector(OpSize - 1 downto 0);
 S4			: out	std_logic_vector(OpSize - 1 downto 0); 
 C1			: out	std_logic;	
 AUXCARRY1		: out	std_logic;
 LT			: out	std_logic;
 Ov1			: out	std_logic;
 		-- Command
 CmdAlu			: in	AluCmd
);
End Component ;
End PkgCompALU ;

