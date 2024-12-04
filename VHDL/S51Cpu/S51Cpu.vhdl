
Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgCompS51ClockGen.all;
 use LibS51Cpu.PkgCompOpcodeReader.all;
 use LibS51Cpu.PkgCompDAX.all;
 use LibS51Cpu.PkgCompSequencer.all;
 use LibS51Cpu.PkgDAX.all;
 use LibS51Cpu.PkgAlu.all;  
 use LibS51Cpu.PkgCompALU.all;  
 use LibS51Cpu.PkgPsw.all;  
 use LibS51Cpu.PkgCompPSW.all;
 
entity S51Cpu is
Port(
 RstB			: in    std_logic;  
 Ck			: in    std_logic;
 CpuIdleRq		: in    std_logic; -- IDLE mode (must be generated on a Ck rising edge)
 CpuIdleAck		: out   std_logic;
 
 HardCallRq		: in    std_logic; -- Interruptions generates LCALL
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
 SfrDin			      : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout		      : in	std_logic_vector(PeriphDataBusSize -1 downto 0);

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
 
 S51DPTR 		: out	std_logic_vector(15 downto 0)

);
End S51Cpu;

Architecture rtl of S51Cpu is

-- S51CPU
 signal HardCallAckI	: std_logic;
 signal S51CPUSfrDOut	: std_logic_vector(PeriphDataBusSize -1 downto 0);

-- OPCODE READER
 signal RomData		: std_logic_vector(3 * OpWord - 1 downto 0);	
 signal RomClk		: std_logic;
 signal RomEn		: std_logic;

-- SEQUENCER
 signal PC		: std_logic_vector(PcLenght - 1 downto 0);
 signal PCi		: std_logic_vector(PcLenght - 1 downto 0);
 signal StackPointer	: std_logic_vector(StackAddSize - 1 downto 0);
 signal StackPointerI	: std_logic_vector(StackAddSize - 1 downto 0);
 signal Accu		: std_logic_vector(AccuRegSize - 1 downto 0);
 signal AccuI		: std_logic_vector(AccuRegSize - 1 downto 0);
 signal Dptr		: std_logic_vector(15 downto 0);
 signal DptrI		: std_logic_vector(15 downto 0); 
 signal Breg		: std_logic_vector(AccuRegSize - 1 downto 0);
 signal BregI		: std_logic_vector(AccuRegSize - 1 downto 0);
 signal PswReg		: std_logic_vector(PswRegSize - 1 downto 0);
 signal PswRegI		: std_logic_vector(PswRegSize - 1 downto 0); 
 signal State		: std_logic;
 signal StateI		: std_logic; 
 signal DisOpcodeFetch	: std_logic;
 signal Opcode		: std_logic_vector(OpWord - 1 downto 0);
 signal Data1 		: std_logic_vector(OpWord - 1 downto 0);
 signal Data2 		: std_logic_vector(OpWord - 1 downto 0);
 signal MovcData	: std_logic_vector(OpWord - 1 downto 0);
 signal CpuIdleAckI	: std_logic;
 
-- DAX
 signal ClearOpNb	: std_logic;

-- S51ClockGen
 signal GatedCk		: std_logic;
 signal NotIdleMode	: std_logic;
 signal RstBQ		: std_logic;

-- DAX DISPLAY (observability RTL)
 signal SrcSfrAddressI	: std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal DstSfrAddressI	: std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal SfrDinI		: std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal WriteSfrI	: std_logic;
 signal ReadSfrI	: std_logic;
 signal WriteSfrII	: std_logic;
 signal ReadSfrII	: std_logic;

 signal XRamAddressI	: std_logic_vector(XRamAddBusSize - 1 downto 0);
 signal XRamDInI	: std_logic_vector(XRamDataBusSize - 1 downto 0);
 signal XRamClkI	: std_logic;
 signal XRamMEI		: std_logic;
 signal XRamMEII	: std_logic; 
 signal XRamWEI		: std_logic;
 signal XRamWEII	: std_logic;

-- ALU
 signal Op1, Op2	: std_logic_vector(OpSize - 1 downto 0);
 signal Op5, Op6	: std_logic_vector(OpSize - 1 downto 0);
 signal S1, S2, S1_DIV, S2_DIV : std_logic_vector(OpSize - 1 downto 0);
 signal S4		: std_logic_vector(OpSize - 1 downto 0);  
 signal C1		: std_logic;
 signal AUXCARRY1	: std_logic;
 signal LT,EQ		: std_logic;
 signal Ov1		: std_logic;
 signal CmdAlu		: AluCmd;

-- PSW
 signal SetPsw		: std_logic_vector(PswRegSize - 1 downto 0);
 signal ClrPsw		: std_logic_vector(PswRegSize - 1 downto 0);

-- REGISTER FILE 8
 signal AddPortAI	: std_logic_vector(RegFileAddSize - 1 downto 0);	
 signal RdEnPortAI	: std_logic;
 signal RdEnPortAII	: std_logic;
 signal AddPortBI	: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal RdEnPortBI	: std_logic; 
 signal RdEnPortBII	: std_logic;  
 signal AddPortCI	: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DinPortCI	: std_logic_vector(7 downto 0);
 signal WePortCI	: std_logic;
 signal WePortCII	: std_logic;
 signal AddPortDI	: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DinPortDI	: std_logic_vector(7 downto 0);
 signal WePortDI	: std_logic;
 signal WePortDII	: std_logic;

 signal OROpNb		: integer range 0 to 3;
 signal CpuIdleRqI	: std_logic;
 signal CpuIdleRqFromOpcodeReader: std_logic;
 
begin

 HardCallAck	<= HardCallAckI;
		   
 CpuIdleAck	<= CpuIdleAckI;		-- Idle mode ack

 
 SfrDout_Breg         <= Breg;
 SfrDout_Accu         <= Accu;
 SfrDout_PswReg       <= PswReg;
 SfrDout_StackPointer <= StackPointer;
 SfrDout_Dpl          <= Dptr(7 downto 0);
 SfrDout_Dph          <= Dptr(15 downto 8);

-- S51CPUSfrDOut	<=	scalarprod(Breg, BRen) or
-- 			scalarprod(Accu, AccRen) or
--			scalarprod(PswReg, PswRen) or
--			scalarprod(StackPointer, SpRen) or
--			scalarprod(Dptr(7 downto 0), DplRen) or
--			scalarprod(Dptr(15 downto 8), DphRen);
--
--  SfrDOut	<=	S51CPUSfrDOut when (ReadSfrII and (BRen or AccRen or PswRen or SpRen or DplRen or DphRen)) = '1' else
-- 			 (others => 'Z');
 					
 S51DPTR	<= Dptr;
 CpuIdleRqI	<= CpuIdleRq;

 OpcodeReader_I : OpcodeReader
 Port map (
  RomClk		=> RomClk,
  RomEn			=> RomEn,
  
  NotIdleMode           => NotIdleMode,
  OROpNb		=> OROpNb,
  DisOpcodeFetch        => DisOpcodeFetch,

  Ck			=> Ck,
  RstB			=> RstB,
 
 -- ROMS
  Rom0Clk		=> Rom0Clk,
  Rom0Me		=> Rom0Me,
  Rom0Address		=> Rom0Address,
  Rom0Out		=> Rom0Out,
  Rom1Clk		=> Rom1Clk,
  Rom1Me		=> Rom1Me,
  Rom1Address		=> Rom1Address,
  Rom1Out		=> Rom1Out,
  Rom2Clk		=> Rom2Clk,
  Rom2Me		=> Rom2Me,
  Rom2Address		=> Rom2Address,
  Rom2Out		=> Rom2Out,
  Rom3Clk		=> Rom3Clk,
  Rom3Me		=> Rom3Me,
  Rom3Address		=> Rom3Address,
  Rom3Out		=> Rom3Out,
  RomData		=> RomData,
  PCi			=> PCi
 );
 
 XRamAddress	<= XRamAddressI;
 XRamDIn	<= XRamDInI;
 XRamClk	<= XRamClkI;
 XRamMe		<= XRamMeI;
 XRamWE		<= XRamWEI;
 
 DAX_I : DAX
 Port map (
  RstBQ			=> RstBQ,
  Ck			=> Ck,

  ClearOpNb		=> ClearOpNb,
  HardCallRq		=> HardCallRq,
  HardCallAck		=> HardCallAckI,
  S51XRetI		=> S51XRetI,
  PCi			=> PCi,
  PC			=> PC,
  StackPointer		=> StackPointer,
  StackPointerI		=> StackPointerI,
  Accu			=> Accu,
  AccuI			=> AccuI,
  Dptr			=> Dptr,
  DptrI			=> DptrI,
  Breg			=> Breg,
  BregI			=> BregI,
  State			=> State,
  StateI		=> StateI,	
  Opcode		=> Opcode,	   	   
  Data1			=> Data1,
  Data2			=> Data2,
  MovcData		=> MovcData,
  DisOpcodeFetch	=> DisOpcodeFetch,
  SetPsw		=> SetPsw,
  ClrPsw		=> ClrPsw,
  PswReg		=> PswReg,
  Op1			=> Op1,
  Op2			=> Op2,
  Op5			=> Op5,
  Op6			=> Op6,
  --Op3			=> Op3,
  S1			=> S1,
  S1_DIV  => S1_DIV,
  S2			=> S2,
  S2_DIV  => S2_DIV,
  S4			=> S4,
  C1			=> C1,
  AUXCARRY1		=> AUXCARRY1,
  LT			=> LT,
  Ov1			=> Ov1,
  CmdAlu		=> CmdAlu,	
  AddPortA		=> AddPortAI,
  DoutPortA		=> DoutPortA,
  RdEnPortA		=> RdEnPortAII,
  AddPortB		=> AddPortBI,
  DoutPortB		=> DoutPortB,
  RdEnPortB		=> RdEnPortBII,  
  AddPortC		=> AddPortCI,
  DinPortC		=> DinPortCI,
  WePortC		=> WePortCII,
  AddPortD		=> AddPortDI,
  DinPortD		=> DinPortDI,
  WePortD		=> WePortDII,
  SrcSfrAddress		=> SrcSfrAddressI,
  DstSfrAddress		=> DstSfrAddressI,
  SfrDin		=> SfrDinI,
  SfrDout		=> SfrDout,
  WriteSfr		=> WriteSfrII,
  ReadSfr		=> ReadSfrII,
  PDataHigh		=> PDataHigh,
  XRamAddress		=> XRamAddressI,
  XRamDOut		=> XRamDOut,
  XRamDIn		=> XRamDInI,
  XRamMe		=> XRamMeII,
  XRamWE		=> XRamWEII,
  OROpNb		=> OROpNb
 );

 WriteSfrI	<= WriteSfrII and not CpuIdleAckI;	-- Gate WriteSfr not to increment write pointer in FIFO
 WriteSfrIdle	<= WriteSfrII and RstBQ;
 ReadSfrI	<= ReadSfrII and not CpuIdleAckI;	-- Gate ReadSfr not to increment read pointer in FIFO
 ReadSfrIdle	<= ReadSfrII and RstBQ;

 RdEnPortAI	<= RdEnPortAII and not CpuIdleAckI;
 RdEnPortBI	<= RdEnPortBII and not CpuIdleAckI;
 WePortCI	<= WePortCII and not CpuIdleAckI;	-- Gate WePortCI not to write into stack through port C
 WePortDI	<= WePortDII and not CpuIdleAckI;	-- Gate WePortDI not to write into stack through port D

 XRamWEI	<= XRamWEII and not CpuIdleRqI;	-- Gate XRamWEI not to write into XRAM
 XRamMeI	<= XRamMeII and not CpuIdleRqI;
 XRamMeIdle	<= XRamMeII and RstBQ;
 
 SrcSfrAddress	<= SrcSfrAddressI;
 DstSfrAddress	<= DstSfrAddressI;
 SfrDin		<= SfrDinI;
 WriteSfr	<= WriteSfrI;
 ReadSfr	<= ReadSfrI;
 
 AddPortA	<= AddPortAI;
 RdEnPortA	<= RdEnPortAI;
 AddPortB	<= AddPortBI;
 RdEnPortB	<= RdEnPortBI;
 AddPortC	<= AddPortCI;
 DinPortC	<= DinPortCI;
 WePortC	<= WePortCI;  
 AddPortD	<= AddPortDI;
 DinPortD	<= DinPortDI;
 WePortD	<= WePortDI;

---------------------------------------------
----------- DAX DISPLAY ---------------------
---------------------------------------------

 DaxDplDisOpcodeFetch	<= DisOpcodeFetch;
 DaxDplState            <= StateI;
 DaxDplOpcode		<= Opcode;
 DaxDplData1		<= RomData(2 * OpWord - 1 downto     OpWord);  
 DaxDplData2  		<= RomData(    OpWord - 1 downto          0); 

-- DaxDplPC     		<= PC;
-- DaxDplStackPointer	<= StackPointerI;
-- DaxDplAccu     	<= AccuI;
-- DaxDplDptr     	<= DptrI;
-- DaxDplBreg     	<= BregI;
-- DaxDplPswReg   	<= PswRegI;

-- DaxDplDisOpcodeFetch	<= DisOpcodeFetch;
-- DaxDplState            <= State;
-- DaxDplOpcode		<= Opcode; -- RomData(3 * OpWord - 1 downto 2 * OpWord);
-- DaxDplData1		<= Data1; -- RomData(2 * OpWord - 1 downto     OpWord);  
-- DaxDplData2  		<= Data2; -- RomData(    OpWord - 1 downto          0); 
--
 DaxDplPC     		<= PC;
 DaxDplStackPointer	<= StackPointer;
 DaxDplAccu     	<= Accu;
 DaxDplDptr     	<= Dptr;
 DaxDplBreg     	<= Breg;
 DaxDplPswReg   	<= PswReg;

---------------------------------------------
---------- S51ClockGen ----------------------
---------------------------------------------
   
 S51ClockGen_I : S51ClockGen
 Port map (
  RstB			=> RstB,
  Ck			=> Ck,
  GatedCk		=> GatedCk,
  
  RstBQ			=> RstBQ,
  CpuIdleRq		=> CpuIdleRqI,
  CpuIdleAck		=> CpuIdleAckI,
  NotIdleMode		=> NotIdleMode,
  DisOpcodeFetch	=> DisOpcodeFetch,
  
  XRamClk		=> XRamClkI,
  XRamEn		=> XRamEn,
  StackClk		=> StackClk,
  StackEn		=> StackEn,
  RomClk		=> RomClk,
  RomEn			=> RomEn
 );
  
 Sequencer_I : Sequencer		-- Sequencer contains all S51 DFFs
 Port map (
  RstB			=> RstB,
  GatedCk		=> GatedCk,
  Ck			=> Ck,
  NotIdleMode		=> NotIdleMode,
  RstBQ			=> RstBQ,
  HardCallRq		=> HardCallRq,	-- Interruptions generate LCALL  
  HardCallAck		=> HardCallAckI,
  HardCallPC		=> HardCallPC,
-- TESTMODE_LPC
  TMLpc_S51ExecCodeEn	=> TMLpc_S51ExecCodeEn,
  TMLpc_AddH		=> TMLpc_AddH,
  TMLpc_AddL		=> TMLpc_AddL,

  DisOpcodeFetch	=> DisOpcodeFetch,
  PC			=> PC,
  PCi			=> PCi,
  StackPointer		=> StackPointer,
  StackPointerI		=> StackPointerI,
  Accu			=> Accu,
  AccuI			=> AccuI,
  Dptr			=> Dptr,
  DptrI			=> DptrI,
  Breg			=> Breg,
  BregI			=> BregI,
  PswReg		=> PswReg,
  PswRegI		=> PswRegI,
  State			=> State,
  StateI		=> StateI,
  
  RomData		=> RomData,
  Opcode		=> Opcode,
  Data1			=> Data1,
  Data2			=> Data2,
  MovcData		=> MovcData,
  ClearOpNb		=> ClearOpNb,
  SfrDin		=> SfrDinI,
  WriteSfr		=> WriteSfrI,
  BWen			=> BWen,
  AccWen		=> AccWen,
  PswWen		=> PswWen,
  SpWen 		=> SpWen ,
  DplWen		=> DplWen,
  DphWen		=> DphWen
);
 
 ALU_I : ALU
 Port map (
  Accu    => Accu,
  Breg    => Breg,
  Op1			=> Op1,
  Op2			=> Op2,
  S1			=> S1,
  S1_DIV	=> S1_DIV,
  S2			=> S2,
  S2_DIV  => S2_DIV,
  Op5			=> Op5,
  Op6			=> Op6,
  C1			=> C1,
  AUXCARRY1		=> AUXCARRY1,
  LT			=> LT,
  Ov1			=> Ov1,
  CmdAlu		=> CmdAlu,
--  Op3			=> Op3,
  S4			=> S4
 );

 PSW_I : PSW
 Port map (
  SetPsw		=> SetPsw,
  ClrPsw		=> ClrPsw,
  PswReg		=> PswReg,
  AccuI			=> AccuI,
  PswRegI		=> PswRegI
 );
   
end rtl;
