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

-- Components Declaration

package PkgCompDAX is

Component DAX
Port(
 Ck			: in    std_logic;
 RstBQ			: in    std_logic;
 
 ClearOpNb		: in    std_logic;
 HardCallRq		: in    std_logic;
 HardCallAck		: in    std_logic;
 S51XRetI		: out	std_logic;

-- OCDStopCpu		: in    std_logic;
 
-- SEQUENCER
 PCi			: out	std_logic_vector(PcLenght - 1 downto 0);
 PC			: in	std_logic_vector(PcLenght - 1 downto 0);
 StackPointer		: in	std_logic_vector(StackAddSize - 1 downto 0);
 StackPointerI		: out	std_logic_vector(StackAddSize - 1 downto 0);
 Accu			: in	std_logic_vector(AccuRegSize - 1 downto 0);
 AccuI			: out	std_logic_vector(AccuRegSize - 1 downto 0);
 Dptr			: in	std_logic_vector(15 downto 0);
 DptrI			: out	std_logic_vector(15 downto 0); 
 Breg			: in	std_logic_vector(AccuRegSize - 1 downto 0);
 BregI			: out	std_logic_vector(AccuRegSize - 1 downto 0);
 State			: in	std_logic;
 StateI			: out	std_logic; 
-- OPCODE READER
 Opcode			: in	std_logic_vector(OpWord - 1 downto 0);			
 Data1			: in	std_logic_vector(OpWord - 1 downto 0);
 Data2			: in	std_logic_vector(OpWord - 1 downto 0);
 MovcData		: in	std_logic_vector(OpWord - 1 downto 0);
 DisOpcodeFetch		: out	std_logic;
-- PSW 
 SetPsw			: out	std_logic_vector(PswRegSize - 1 downto 0);
 ClrPsw			: out	std_logic_vector(PswRegSize - 1 downto 0);
 PswReg			: in	std_logic_vector(PswRegSize - 1 downto 0);
-- ALU 
 Op1			: out	std_logic_vector(OpSize - 1 downto 0);
 Op2			: out	std_logic_vector(OpSize - 1 downto 0);
 --Op3			: out	std_logic_vector(OpSize - 1 downto 0);
 Op5			: out	std_logic_vector(OpSize - 1 downto 0);
 Op6			: out	std_logic_vector(OpSize - 1 downto 0); 
 S1			: in	std_logic_vector(OpSize - 1 downto 0);
 S1_DIV 	: in	std_logic_vector(OpSize - 1 downto 0);
 S2			: in	std_logic_vector(OpSize - 1 downto 0);
 S2_DIV		: in	std_logic_vector(OpSize - 1 downto 0);
 S4			: in	std_logic_vector(OpSize - 1 downto 0); 
 C1			: in	std_logic;	
 AUXCARRY1		: in	std_logic;
 LT			: in	std_logic;
 Ov1			: in	std_logic;
 CmdAlu			: out	AluCmd;
-- REGISTER FILE
 AddPortA		: out	std_logic_vector(RegFileAddSize - 1 downto 0);	
 RdEnPortA		: out	std_logic;
 DoutPortA		: in	std_logic_vector(7 downto 0);
 AddPortB		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortB		: in	std_logic_vector(7 downto 0);
 RdEnPortB		: out	std_logic; 
 AddPortC		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortC		: out	std_logic_vector(7 downto 0);
 WePortC		: out	std_logic;
 AddPortD		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortD		: out	std_logic_vector(7 downto 0);
 WePortD		: out	std_logic; 	

-- CACHE for R0, R1 to unconstrain the design : cjne ri, data, rel is the only instruction modifying
-- PCi which path goes through the internal stack PortA and PortB

-- CacheR0Valid		: in	std_logic;
-- CacheR1Valid		: in	std_logic;
-- CacheR0update  	: out	std_logic;
-- CacheR1update  	: out	std_logic;
-- CacheR0Din		: out	std_logic_vector(7 downto 0);
-- CacheR1Din		: out	std_logic_vector(7 downto 0);
-- CacheR0ptr  		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
-- CacheR1ptr	  	: out	std_logic_vector(RegFileAddSize - 1 downto 0);
-- CacheR0read  		: out	std_logic;
-- CacheR1read	  	: out	std_logic;
-- CacheR0		: in	std_logic_vector(7 downto 0);
-- CacheR1		: in	std_logic_vector(7 downto 0);

-- PERIPHERAL BUS
 SrcSfrAddress		: out	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DstSfrAddress  	: out	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 SfrDin			: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout		: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
 WriteSfr		: out	std_logic;
 ReadSfr		: out	std_logic;
-- XRAM BUS  
 PDataHigh		: in	std_logic_vector(7 downto 0);			-- when using mox @rn ... instrs, XRAM high order bits are given by P2 SFR on standard C51
 XRamAddress		: out 	std_logic_vector(XRamAddBusSize - 1 downto 0);
 XRamDOut		: in	std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamDIn		: out	std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamME			: out	std_logic;
 XRamWE			: out	std_logic;
 
 
 OROpNb			: out	integer range 0 to 3


);
End Component ;
End PkgCompDAX ;

