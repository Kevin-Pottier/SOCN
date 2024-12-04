-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgPsw.all;
 use LibS51Cpu.PkgALU.all; 
-- use LibS51Cpu.PkgStack.all; 
 use LibS51Cpu.PkgDAX.all; 
library std;
 use std.textio.all;
Library LibPkg;
 use LibPkg.utils.all;

-- Components Declaration

package PkgCompDAXDisplay is

Component DAXDisplay
Port(
 RstB			: in    std_logic;  
 Ck			: in    std_logic;
 CpuIdleAck		: in    std_logic;					-- IDLE mode
 HardCallRq		: in    std_logic;					-- Interruptions generate LCALL
 HardCallAck		: in    std_logic;
 HardCallPC		: in    std_logic_vector(PcLenght - 1 downto 0);

-- OCD
 OCDStopCpu		: in	std_logic;
 OCDHMJB		: in    std_logic;
 OCDWrRI		: in    std_logic;
 OCDDataRI		: in    std_logic_vector(OpWord - 1 downto 0);

-- Opcode Reader
 PC			: in	std_logic_vector(PcLenght - 1 downto 0); 
 StackPointer		: in	std_logic_vector(StackAddSize - 1 downto 0);
 Accu			: in	std_logic_vector(AccuRegSize - 1 downto 0);
 Dptr			: in	std_logic_vector(15 downto 0); 
 Breg			: in	std_logic_vector(AccuRegSize - 1 downto 0);
 PswReg			: in	std_logic_vector(PswRegSize - 1 downto 0);
-- Peripheral bus  
 SrcSfrAddress		: in	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DstSfrAddress		: in	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 SfrDin			: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout		: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
 ReadSfr		: in	std_logic;
 WriteSfr		: in	std_logic;
-- STACK bus 
 AddPortA		: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortA		: in	std_logic_vector(7 downto 0);
 RdEnPortA		: in    std_logic; 
 AddPortB		: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortB		: in	std_logic_vector(7 downto 0);
 RdEnPortB		: in    std_logic;  
 AddPortC		: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortC		: in	std_logic_vector(7 downto 0);
 WePortC		: in    std_logic;  
 AddPortD		: in	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortD		: in	std_logic_vector(7 downto 0);
 WePortD		: in    std_logic; 
-- XRam bus
 XRamAddress		: in	std_logic_vector(XRamAddBusSize - 1 downto 0);
 XRamDOut		: in	std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamDIn		: in	std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamClk		: in	std_logic;
 XRamME			: in	std_logic;
 XRamWE			: in	std_logic; 
-- ROM bus
 DisOpcodeFetch		: in    std_logic;
 Opcode			: in	std_logic_vector(OpWord - 1 downto 0);
 Data1			: in	std_logic_vector(OpWord - 1 downto 0);
 Data2			: in	std_logic_vector(OpWord - 1 downto 0);
 State			: in	std_logic;
-- INTERNAL SFR ACCESS
 BWen			: in    std_logic;
 AccWen			: in    std_logic;
 PswWen			: in    std_logic;
 SpWen			: in    std_logic;
 DplWen			: in    std_logic;
 DphWen			: in    std_logic
-- CACHE for R0, R1 to unconstrain the design : cjne ri, data, rel is the only instruction modifying
-- PCi which path goes through the internal stack PortA and PortB

-- CacheR0ptr  		: in	std_logic_vector(RegFileAddSize - 1 downto 0);
-- CacheR1ptr	  	: in	std_logic_vector(RegFileAddSize - 1 downto 0);
-- CacheR0read  		: in	std_logic;
-- CacheR1read	  	: in	std_logic;
-- CacheR0		: in	std_logic_vector(7 downto 0);
-- CacheR1		: in	std_logic_vector(7 downto 0)
);
End Component ;
End PkgCompDAXDisplay ;

