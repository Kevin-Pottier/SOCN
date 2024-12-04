-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

-- Components Declaration

package PkgCompOpcodeReader is

Component OpcodeReader
Port(
 RomClk			: in    std_logic;
 RomEn			: in    std_logic;

 NotIdleMode		: in    std_logic;
 OROpNb			: in	integer range 0 to 3;
 DisOpcodeFetch		: in	std_logic;

 Ck			: in	std_logic;
 RstB			: in	std_logic;

-- ROMS
 Rom0Clk		: out	std_logic;
 Rom0Me			: out	std_logic; 
 Rom0Address		: out	std_logic_vector(RomAddressBusLenght - 1 downto 0);
 Rom0Out		: in	std_logic_vector(RomDataBusLenght - 1 downto 0);
 
 Rom1Clk		: out	std_logic;
 Rom1Me			: out	std_logic;
 Rom1Address		: out	std_logic_vector(RomAddressBusLenght - 1 downto 0);
 Rom1Out		: in	std_logic_vector(RomDataBusLenght - 1 downto 0);
 RomData		: out	std_logic_vector(3 * OpWord - 1 downto 0);

 Rom2Clk		: out	std_logic;
 Rom2Me			: out	std_logic; 
 Rom2Address		: out	std_logic_vector(RomAddressBusLenght - 1 downto 0);
 Rom2Out		: in	std_logic_vector(RomDataBusLenght - 1 downto 0);
 
 Rom3Clk		: out	std_logic;
 Rom3Me			: out	std_logic;
 Rom3Address		: out	std_logic_vector(RomAddressBusLenght - 1 downto 0);
 Rom3Out		: in	std_logic_vector(RomDataBusLenght - 1 downto 0);

-- PLA
 PCi			: in	std_logic_vector(PcLenght - 1 downto 0)
);
End Component ;
End PkgCompOpcodeReader ;

