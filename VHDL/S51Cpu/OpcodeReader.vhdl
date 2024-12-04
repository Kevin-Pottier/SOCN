
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkg;
 use LibPkg.MyUtils.all;

entity OpcodeReader is
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

 Rom2Clk		: out	std_logic;
 Rom2Me			: out	std_logic; 
 Rom2Address		: out	std_logic_vector(RomAddressBusLenght - 1 downto 0);
 Rom2Out		: in	std_logic_vector(RomDataBusLenght - 1 downto 0);
 
 Rom3Clk		: out	std_logic;
 Rom3Me			: out	std_logic;
 Rom3Address		: out	std_logic_vector(RomAddressBusLenght - 1 downto 0);
 Rom3Out		: in	std_logic_vector(RomDataBusLenght - 1 downto 0);

 RomData		: out	std_logic_vector(3 * OpWord - 1 downto 0);
-- PLA
 PCi			: in	std_logic_vector(PcLenght - 1 downto 0)
);
End OpcodeReader;

Architecture rtl of OpcodeReader is
 signal Rom0Addresstmp	: std_logic_vector(PcLenght - 3 downto 0);	
 signal Rom1Addresstmp	: std_logic_vector(PcLenght - 3 downto 0);
 signal M0, M1, M2, M3	: std_logic_vector(OpWord - 1 downto 0);
 signal WORDDECODE	: std_logic_vector(1 downto 0);

begin

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--
-- Roms
--
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

 Rom0Addresstmp <=	scalarprod(PCi(PcLenght - 1 downto 2), 					not PCi(1)) or
			scalarprod(std_logic_vector(unsigned(PCi(PcLenght - 1 downto 2)) + 1), 	    PCi(1));

 Rom1Addresstmp <=	PCi(PcLenght - 1 downto 2);

 Rom0Address	<=	Rom0Addresstmp(Rom0Address'high downto 0);
 Rom1Address	<=	Rom0Addresstmp(Rom0Address'high downto 0);
 Rom2Address	<=	Rom1Addresstmp(Rom1Address'high downto 0);
 Rom3Address	<=	Rom1Addresstmp(Rom1Address'high downto 0);

 Rom0Clk	<= 	RomClk;
 Rom1Clk	<= 	RomClk;
 Rom0Me		<= 	RomEn;
 Rom1Me		<= 	RomEn; 
 Rom2Clk	<= 	RomClk;
 Rom3Clk	<= 	RomClk;
 Rom2Me		<= 	RomEn;
 Rom3Me		<= 	RomEn; 

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--
-- Words distribution
--
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
		
 M0 <= Rom0Out(RomDataBusLenght - 1 downto 0);
 M1 <= Rom1Out(RomDataBusLenght - 1 downto 0);
 M2 <= Rom2Out(RomDataBusLenght - 1 downto 0);
 M3 <= Rom3Out(RomDataBusLenght - 1 downto 0);   

 process(RomClk)
 begin
  if RomClk'event and RomClk = '1' then
   if NotIdleMode = '1' then
     WORDDECODE <= PCi(1) & PCi(0);
    end if;
  end if;
 end process;

 RomData <=	scalarprod(M0 & M1 & M2, not WORDDECODE(1) and not WORDDECODE(0)) or
		scalarprod(M1 & M2 & M3, not WORDDECODE(1) and     WORDDECODE(0)) or
		scalarprod(M2 & M3 & M0,     WORDDECODE(1) and not WORDDECODE(0)) or
		scalarprod(M3 & M0 & M1,     WORDDECODE(1) and     WORDDECODE(0));

end rtl;
