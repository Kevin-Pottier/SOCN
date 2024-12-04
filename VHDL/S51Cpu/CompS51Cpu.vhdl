-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgCompOpcodeReader.all;
 use LibS51Cpu.PkgCompDAX.all;
-- synopsys translate_off
 use LibS51Cpu.PkgCompDAXDisplay.all; 
-- synopsys translate_on
 use LibS51Cpu.PkgCompSequencer.all;
 use LibS51Cpu.PkgDAX.all;
 use LibS51Cpu.PkgAlu.all;  
 use LibS51Cpu.PkgCompALU.all;  
 use LibS51Cpu.PkgPsw.all;  
 use LibS51Cpu.PkgCompPSW.all;
-- use LibS51Cpu.PkgStack.all;
-- use LibS51Cpu.PkgCompRegisterFile8.all;

-- Components Declaration

package PkgCompS51Cpu is

Component S51Cpu
Port(
 RstB			: in    std_logic;  
 Ck			: in    std_logic;
 CpuIdleRq		: in    std_logic; -- IDLE mode (must be generated on a Ck rising edge)
 CpuIdleAck		: out   std_logic;
 
 HardCallRq		: in    std_logic; -- Interruptions generate LCALL
 HardCallAck		: out   std_logic;
 HardCallPC		: in    std_logic_vector(PcLenght - 1 downto 0);
 S51XRetI		: out	std_logic;

-- TESTMODE_LPC
 TMLpc_S51ExecCodeEn	: in	std_logic;
 TMLpc_AddH		: in	std_logic_vector(7 downto 0);
 TMLpc_AddL		: in	std_logic_vector(7 downto 0);

-- OPCODE READER
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

-- PERIPHERAL BUS
 SrcSfrAddress		: out	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DstSfrAddress  	: out	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 SfrDin			: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout		: in	std_logic_vector(PeriphDataBusSize -1 downto 0);

 SfrDout_Breg         : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout_Accu         : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout_PswReg       : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout_StackPointer : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout_Dpl          : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout_Dph          : out	std_logic_vector(PeriphDataBusSize -1 downto 0);

 WriteSfr		: out	std_logic;
 ReadSfr		: out	std_logic;
 WriteSfrIdle		: out	std_logic;	-- WriteSfr not gated by IDLE nor by OCDMONITOR signals
 						-- => high even if S51 in IDLE mode and is decoding a SFR writing opcode
 ReadSfrIdle		: out	std_logic;
-- XRAM BUS
 PDataHigh		: in	std_logic_vector(7 downto 0);			-- when using mox @rn ... instrs, XRAM high order bits are given by P2 SFR on standard C51
 XRamAddress		: out 	std_logic_vector(XRamAddBusSize - 1 downto 0);
 XRamDOut		: in	std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamDIn		: out	std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamClk		: out	std_logic;
 XRamEn			: out	std_logic; 
 XRamME			: out	std_logic;
 XRamMEIdle		: out	std_logic;
 XRamWE			: out	std_logic;
-- REGISTER FILE
 StackClk		: out	std_logic;
 StackEn		: out	std_logic;
 AddPortA		: out	std_logic_vector(RegFileAddSize - 1 downto 0);	
 DoutPortA		: in	std_logic_vector(7 downto 0);
 RdEnPortA		: out	std_logic;
 AddPortB		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortB		: in	std_logic_vector(7 downto 0);
 RdEnPortB		: out	std_logic; 
 AddPortC		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortC		: out	std_logic_vector(7 downto 0);
 WePortC		: out	std_logic;
 AddPortD		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortD		: out	std_logic_vector(7 downto 0);
 WePortD		: out	std_logic;
-- S51CPU SFR     
-- BRen			: in	std_logic;
-- AccRen 		: in	std_logic;
-- PswRen 		: in	std_logic;
-- SpRen  		: in	std_logic;
-- DplRen 		: in	std_logic;
-- DphRen 		: in	std_logic;
 BWen			: in	std_logic;
 AccWen 		: in	std_logic;
 PswWen 		: in	std_logic;
 SpWen  		: in	std_logic;
 DplWen 		: in	std_logic;
 DphWen 		: in	std_logic;
-- EXTRA INFO FOR EXTERNAL MONITORING
 DaxDplState		: out	std_logic;
 DaxDplDisOpcodeFetch	: out	std_logic;		
 DaxDplOpcode		: out	std_logic_vector(OpWord - 1 downto 0);
 DaxDplData1		: out	std_logic_vector(OpWord - 1 downto 0);
 DaxDplData2		: out	std_logic_vector(OpWord - 1 downto 0);

 DaxDplPC		: out	std_logic_vector(PcLenght - 1 downto 0); 
 DaxDplStackPointer	: out	std_logic_vector(StackAddSize - 1 downto 0);
 DaxDplAccu		: out	std_logic_vector(AccuRegSize - 1 downto 0);
 DaxDplDptr		: out	std_logic_vector(15 downto 0); 
 DaxDplBreg		: out	std_logic_vector(AccuRegSize - 1 downto 0);
 DaxDplPswReg		: out	std_logic_vector(PswRegSize - 1 downto 0);
 
-- DaxDplCacheR0ptr  	: out	std_logic_vector(RegFileAddSize - 1 downto 0);
-- DaxDplCacheR1ptr	: out	std_logic_vector(RegFileAddSize - 1 downto 0);
-- DaxDplCacheR0read  	: out	std_logic;
-- DaxDplCacheR1read	: out	std_logic;
-- DaxDplCacheR0		: out	std_logic_vector(7 downto 0);
-- DaxDplCacheR1		: out	std_logic_vector(7 downto 0);
 
----------------------------------------------------------------------
-- OCD (ON CHIP DEBUG ENTRY TO SET RI, D1, D2 WHEN IN MONITOR MODE) --
----------------------------------------------------------------------

-- OCDCk			: out	std_logic;
-- OCDStopCpu		: in	std_logic;
--
-- OCDWrRI		: in	std_logic;
-- OCDDataRI		: in	std_logic_vector(OpWord - 1 downto 0);
-- OCDWrD1		: in	std_logic;
-- OCDDataD1		: in	std_logic_vector(OpWord - 1 downto 0);
-- OCDWrD2		: in	std_logic;
-- OCDDataD2	 	: in	std_logic_vector(OpWord - 1 downto 0);
-- OCDWrPC	 	: in	std_logic;
-- OCDDataPC	 	: in	std_logic_vector(PcLenght - 1 downto 0);
--
-- OCDPCi			: out	std_logic_vector(PcLenght - 1 downto 0);
-- OCDPC			: out	std_logic_vector(PcLenght - 1 downto 0);
-- OCDEOI			: out	std_logic;			-- End Of Instruction flag
-- OCDUnCdtJmp		: out	std_logic;			-- High when unconditional jump
-- OCDCdtJmp		: out	std_logic;			-- High when conditional jump
-- OCDJmpCdt		: out	std_logic;			-- conditional jump issue
-- OCDTrap		: out	std_logic;			-- High when the Trap instruction (A5) is being executed
-- OCDOpSize		: out	std_logic_vector(1 downto 0);	-- Number of the current instruction bytes (1, 2 or 3)
-- OCDHWMonitor		: in	std_logic;
-- OCDStackPointer	: out	std_logic_vector(StackAddSize - 1 downto 0);
-- OCDSPOV		: out	std_logic;
-- OCDSfrAccess		: in	std_logic;			-- 0 : Standard 51 indirect addressing
 								-- 1 : OCD mode : SFR accessible indirectly using mov a, @ri
								--     and mov @ri, a

----------------------------------------------------------------------
----------- SUPER MOV 16 (Activated by PkgS51Cpu) --------------------
----------------------------------------------------------------------

-- SMov16En		: in	std_logic;
-- SMov16Run 		: out	std_logic;
-- SMOV16Id		: out	std_logic_vector(2 downto 0);
-- SMOV16Data1		: out	std_logic_vector(7 downto 0);
-- SMOV16Data2		: out	std_logic_vector(7 downto 0);

----------------------------------------------------------------------
--------------------------- CDEWR ------------------------------------
----------------------------------------------------------------------

 S51DPTR 		: out	std_logic_vector(15 downto 0)

);
End Component ;
End PkgCompS51Cpu ;

