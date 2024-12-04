-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgDAX.all;
 use LibS51Cpu.PkgPsw.all;
 use LibS51Cpu.PkgALU.all; 
-- use LibS51Cpu.PkgStack.all; 

-- Components Declaration

package PkgCompSequencer is

Component Sequencer
Port(
 RstB			: in    std_logic;  
 GatedCk		: in    std_logic;
 Ck			: in    std_logic;
 NotIdleMode		: in    std_logic;
 
 RstBQ			: out   std_logic; 
 HardCallRq		: in    std_logic;
 HardCallAck		: out   std_logic; 
 HardCallPC		: in    std_logic_vector(PcLenght - 1 downto 0);
-- TESTMODE S51EXECCODE
 TMLpc_S51ExecCodeEn	: in    std_logic;
 TMLpc_AddH		: in	std_logic_vector(7 downto 0);
 TMLpc_AddL		: in	std_logic_vector(7 downto 0);
-- PC
 DisOpcodeFetch		: in	std_logic;
 PC			: out	std_logic_vector(PcLenght - 1 downto 0);
 PCi			: in	std_logic_vector(PcLenght - 1 downto 0); 
-- SP
 StackPointer		: out	std_logic_vector(StackAddSize - 1 downto 0);
 StackPointerI		: in	std_logic_vector(StackAddSize - 1 downto 0);
-- ACCU
 Accu			: out	std_logic_vector(AccuRegSize - 1 downto 0);
 AccuI			: in	std_logic_vector(AccuRegSize - 1 downto 0); 
-- DPTR
 Dptr			: out	std_logic_vector(15 downto 0);
 DptrI			: in	std_logic_vector(15 downto 0); 
-- BREG
 Breg			: out	std_logic_vector(AccuRegSize - 1 downto 0);
 BregI			: in	std_logic_vector(AccuRegSize - 1 downto 0); 
-- PSWREG
 PswReg			: out	std_logic_vector(PswRegSize - 1 downto 0);
 PswRegI		: in	std_logic_vector(PswRegSize - 1 downto 0); 
-- VINSTR
 RomData		: in	std_logic_vector(3 * OpWord - 1 downto 0);
 Opcode			: out	std_logic_vector(OpWord - 1 downto 0);			
 Data1			: out	std_logic_vector(OpWord - 1 downto 0);
 Data2			: out	std_logic_vector(OpWord - 1 downto 0);
 MovcData		: out	std_logic_vector(OpWord - 1 downto 0);
-- STATE 
 State			: out	std_logic;
 StateI			: in	std_logic;
 ClearOpNb		: out	std_logic;
-- SFR
 SfrDin			: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
 WriteSfr		: in	std_logic;

 BWen   		: in	std_logic;
 AccWen 		: in	std_logic;
 PswWen 		: in	std_logic;
 SpWen  		: in	std_logic;
 DplWen 		: in	std_logic;
 DphWen 		: in	std_logic

);
End Component ;
End PkgCompSequencer ;

