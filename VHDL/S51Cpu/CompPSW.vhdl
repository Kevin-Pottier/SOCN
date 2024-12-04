-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgPSW.all;

-- Components Declaration

package PkgCompPSW is

Component PSW
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
End Component ;
End PkgCompPSW ;

