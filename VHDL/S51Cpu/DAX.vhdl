
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgPsw.all;
 use LibS51Cpu.PkgALU.all; 
 use LibS51Cpu.PkgDAX.all; 
 use LibS51Cpu.PkgCompDax.all;
 
entity DAX is
Port(
 Ck			: in    std_logic;
 RstBQ			: in    std_logic;
 
 ClearOpNb		: in    std_logic;
 HardCallAck		: in    std_logic;
 HardCallRq		: in    std_logic;
 S51XRetI		: out	std_logic;

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
 S1_DIV		: in	std_logic_vector(OpSize - 1 downto 0);
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
End DAX;

Architecture rtl of DAX is

-----------------------------------------------------------------------------------
-- GLOBAL
 signal vcc			: std_logic;

-----------------------------------------------------------------------------------
--
-- DAX
--
-----------------------------------------------------------------------------------

 -- ALU
 signal CmdAluI			: AluCmd;

 -- PC GMUX
 constant PCGMUXNbEntries	: integer := 7;
 constant PCGMUXEntryDepth	: integer := PcLenght; 

 signal PCCondV			: std_logic_vector(PCGMUXNbEntries - 1 downto 0);
 signal PCEMUX			: std_logic_vector(PcLenght * PCGMUXNbEntries - 1 downto 0);
 type T_PCEntryV is array(PCGMUXNbEntries - 1 downto 0) of std_logic_vector(PcLenght - 1 downto 0);
 signal PCEntryV		: T_PCEntryV;

 -- PC MUX
 signal OpNb			: integer range 0 to 3;
 signal PCiNext			: std_logic_vector(PcLenght - 1 downto 0); 
 signal CmdPCiMUX 		: T_PCiMUX;
 signal PMSelOffsetSrc		: T_PMSelOffsetSrc;
 signal PMCONDSEL		: T_PMCONDSEL;
 signal PMCondition		: std_logic;
 signal PCPLUSOPNBPLUSSIGNEDOFFSET: std_logic_vector(PcLenght downto 0);
 signal PCPLUS2			: std_logic_vector(PcLenght - 1 downto 0);
 signal PCPLUS3			: std_logic_vector(PcLenght - 1 downto 0);
 signal PCPLUSOPNB		: std_logic_vector(PcLenght - 1 downto 0);
 signal PCJMPOFFSET		: std_logic_vector(OpSize - 1 downto 0);

 -- OTHER
 alias DptrH 			: std_logic_vector(7 downto 0) is Dptr(15 downto 8);
 alias DptrL 			: std_logic_vector(7 downto 0) is Dptr(7 downto 0);

-- signal MyPtr8			: integer range 0 to 7;
 signal Data1BitMask		: std_logic_vector(7 downto 0);
 signal StackBitIsNull		: std_logic;
 signal directbitisnull		: std_logic;

 signal CmdStack		: T_CmdStack;
 signal stackdin		: std_logic_vector(OpSize - 1 downto 0);
 signal SrcSfrAddressI		: std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal DstSfrAddressI  	: std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal ReadSfrI		: std_logic;
 signal WriteSfrI		: std_logic;

 -- FOR CJNE 
 signal NotAccuEqDirectDout	: std_logic;
 signal NotAccuEqData1		: std_logic;
 signal NotDoutportAEqData1	: std_logic;
 signal NotDoutportBEqData1	: std_logic;

 -- ALU
-- signal noteq			: std_logic;
 signal DecResNotNull		: std_logic;
 signal notaccunull		: std_logic;
 signal accunull		: std_logic;

-- PORT A GMUX --
 constant PortAGMUXNbEntries	: integer := 5;
 constant PortAGMUXEntryDepth	: integer := RegFileAddSize; 
 
 signal AddPACondV		: std_logic_vector(PortAGMUXNbEntries - 1 downto 0);
-- signal ADDPAEMUX		: std_logic_vector(PortAGMUXEntryDepth * PortAGMUXNbEntries - 1 downto 0);
 type T_ADDPAEV is array(PortAGMUXNbEntries - 1 downto 0) of std_logic_vector(PortAGMUXEntryDepth - 1 downto 0);
 signal ADDPAEV			: T_ADDPAEV;
-- PORT B GMUX --
 constant PortBGMUXNbEntries	: integer := 3;
 constant PortBGMUXEntryDepth	: integer := RegFileAddSize; 
 
 signal AddPBCondV		: std_logic_vector(PortBGMUXNbEntries - 1 downto 0);
-- signal ADDPBEMUX		: std_logic_vector(PortBGMUXEntryDepth * PortBGMUXNbEntries - 1 downto 0);
 type T_ADDPBEV is array(PortBGMUXNbEntries - 1 downto 0) of std_logic_vector(PortBGMUXEntryDepth - 1 downto 0);
 signal ADDPBEV			: T_ADDPBEV;

-- PORT C ADD GMUX --
 constant PortCGMUXNbEntries	: integer := 8;
 constant PortCGMUXEntryDepth	: integer := RegFileAddSize; 
 
 signal AddPCCondV		: std_logic_vector(PortCGMUXNbEntries - 1 downto 0);
-- signal ADDPCEMUX		: std_logic_vector(PortCGMUXEntryDepth * PortCGMUXNbEntries - 1 downto 0);
 type T_ADDPCEV is array(PortCGMUXNbEntries - 1 downto 0) of std_logic_vector(PortCGMUXEntryDepth - 1 downto 0);
 signal ADDPCEV			: T_ADDPCEV;

-- PORT C DIN GMUX --
 constant PortCDINGMUXNbEntries	: integer := 9;
 constant PortCDINGMUXEntryDepth: integer := RegFileAddSize; 
 
 signal DINPCCondV		: std_logic_vector(PortCDINGMUXNbEntries - 1 downto 0);
-- signal DINPCEMUX		: std_logic_vector(PortCDINGMUXEntryDepth * PortCDINGMUXNbEntries - 1 downto 0);
 type T_DINPCEV is array(PortCDINGMUXNbEntries - 1 downto 0) of std_logic_vector(PortCDINGMUXEntryDepth - 1 downto 0);
 signal DINPCEV			: T_DINPCEV;

-- DSTSFRADD GMUX --
 constant DSTSFRADDGMUXNbEntries: integer := 4;
 constant DSTSFRADDGMUXEntryDepth:integer := OpSize;

 signal DstSfrAddCondV		: std_logic_vector(DSTSFRADDGMUXNbEntries - 1 downto 0);
-- signal DstSfrAddEMUX		: std_logic_vector(DSTSFRADDGMUXNbEntries * DSTSFRADDGMUXEntryDepth - 1 downto 0);
 type T_DstSfrAddEntryV is array(DSTSFRADDGMUXNbEntries - 1 downto 0) of std_logic_vector(DSTSFRADDGMUXEntryDepth - 1 downto 0);
 signal DstSfrAddEntryV		: T_DstSfrAddEntryV;

-- SFRDIN GMUX --
 constant SFRDINGMUXNbEntries: integer := 3;
 constant SFRDINGMUXEntryDepth:integer := PeriphDataBusSize;

 signal SfrDinCondV		: std_logic_vector(SFRDINGMUXNbEntries - 1 downto 0);
-- signal SfrDinEMUX		: std_logic_vector(SFRDINGMUXNbEntries * SFRDINGMUXEntryDepth - 1 downto 0);
 type T_SfrDinEntryV is array(SFRDINGMUXNbEntries - 1 downto 0) of std_logic_vector(SFRDINGMUXEntryDepth - 1 downto 0);
 signal SfrDinEntryV		: T_SfrDinEntryV;

-- SRCSFRADD GMUX --
 constant SRCSFRADDGMUXNbEntries: integer := 3;
 constant SRCSFRADDGMUXEntryDepth:integer := OpSize;

 signal SrcSfrAddCondV		: std_logic_vector(SRCSFRADDGMUXNbEntries - 1 downto 0);
-- signal SrcSfrAddEMUX		: std_logic_vector(SRCSFRADDGMUXNbEntries * SRCSFRADDGMUXEntryDepth - 1 downto 0);
 type T_SrcSfrAddEntryV is array(SRCSFRADDGMUXNbEntries - 1 downto 0) of std_logic_vector(SRCSFRADDGMUXEntryDepth - 1 downto 0);
 signal SrcSfrAddEntryV		: T_SrcSfrAddEntryV;

-- DIRDOUT GMUX --
 constant DIRDOUTGMUXNbEntries	: integer := 2;
 constant DIRDOUTGMUXEntryDepth	: integer := PeriphDataBusSize;

 signal DirDoutCondV		: std_logic_vector(DIRDOUTGMUXNbEntries - 1 downto 0);
-- signal DirDoutEMUX		: std_logic_vector(DIRDOUTGMUXNbEntries * DIRDOUTGMUXEntryDepth - 1 downto 0);
 type T_DirDoutEntryV is array(DIRDOUTGMUXNbEntries - 1 downto 0) of std_logic_vector(DIRDOUTGMUXEntryDepth - 1 downto 0);
 signal DirDoutEntryV		: T_DirDoutEntryV;

-- DECDIRDOUT GMUX --
 constant DECDIRDOUTGMUXNbEntries: integer := 2;
 constant DECDIRDOUTGMUXEntryDepth:integer := PeriphDataBusSize;

 signal DECDirDoutCondV		: std_logic_vector(DECDIRDOUTGMUXNbEntries - 1 downto 0);
-- signal DECDirDoutEMUX		: std_logic_vector(DECDIRDOUTGMUXNbEntries * DECDIRDOUTGMUXEntryDepth - 1 downto 0);
 type T_DECDirDoutEntryV is array(DECDIRDOUTGMUXNbEntries - 1 downto 0) of std_logic_vector(DECDIRDOUTGMUXEntryDepth - 1 downto 0);
 signal DECDirDoutEntryV	: T_DECDirDoutEntryV;

 ----------------------- DAX Timing optim -----------------------
 signal DECDirectDOut		   : std_logic_vector(7 downto 0);
 signal INCDirectDOut		   : std_logic_vector(7 downto 0);
 signal DECDirectDOutNotNull	: std_logic;
 signal DECDoutPortA          : std_logic_vector(7 downto 0);
 signal DECDoutPortB          : std_logic_vector(7 downto 0);
 signal INCDoutPortA          : std_logic_vector(7 downto 0);
 signal INCDoutPortB          : std_logic_vector(7 downto 0);
 signal DECSfrDout            : std_logic_vector(7 downto 0);
 signal DECSfrDoutNotNull     : std_logic;
 signal DECDoutPortANotNull   : std_logic;

 signal StackPointerPlusOne   : std_logic_vector(StackAddSize - 1 downto 0);
 signal StackPointerPlusTwo   : std_logic_vector(StackAddSize - 1 downto 0);
 signal StackPointerMinusOne  : std_logic_vector(StackAddSize - 1 downto 0);
 signal StackPointerMinusTwo  : std_logic_vector(StackAddSize - 1 downto 0);

 ----------------------------------------------------------------

-----------------------------------------------------------------------------------
-- PSW

 signal notcarry 		: std_logic;
 signal bisnull 		: std_logic;

-----------------------------------------------------------------------------------
-- STACK POINTER

 signal tmpdambit		: std_logic;
 signal nottmpdambit		: std_logic;
 signal anlCbit			: std_logic;
 signal orlCbit			: std_logic; 
 signal orlCnotbit		: std_logic;  
 signal anlCnotbit 		: std_logic;

-----------------------------------------------------------------------------------
-- DA instruction

  signal AccuHGT9		: std_logic;
  signal AccuLGT9		: std_logic;
  signal DAsetcarry		: std_logic;
 
-----------------------------------------------------------------------------------
-- XRAM BUS

 signal XramRdEn		: std_logic;
 signal XRamWEI 		: std_logic;
 signal CmdDam			: T_DAMCMD;
 
 signal DirectDOut		: std_logic_vector(7 downto 0);
 signal DirectDIn		: std_logic_vector(7 downto 0);

-- NEW MUX DEF
 signal CMDOP1SEL		: T_CMDOP1SEL;
 signal CMDOP2SEL		: T_CMDOP2SEL;

 signal CMDACCUISEL		: T_CMDACCUISEL;
 signal CMDDIRECTDINSEL		: T_CMDDIRECTDINSEL;
 --signal CMDOP3SEL		: T_CMDOP3SEL;
 signal CMDSTACKDINSEL		: T_CMDSTACKDINSEL;
 signal CMDSTACKPOINTERSEL	: T_CMDSTACKPOINTERSEL;
 signal CMDOP5SEL		: T_CMDOP5SEL;
 signal CMDOP6SEL		: T_CMDOP6SEL;
 signal CMDDPTRISEL		: T_CMDDPTRISEL;
 signal CMDXRAMDINSEL		: T_CMDXRAMDINSEL;
 signal CMDXRAMADDRESS		: T_CMDXRAMADDRESS;
 signal CMDBREGISEL		: T_CMDBREGISEL;

 signal Opcode_bitvector	: bit_vector(OpWord - 1 downto 0);

-----------------------------------------------------------------------------------
-- Latchs on AddPortAI, AddPortBI

 signal AddPortAI		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal AddPortBI		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal RdEnPortAI		: std_logic;
 signal RdEnPortBI		: std_logic;
 signal PartALEn		: std_logic;
 signal PartBLEn		: std_logic;

-----------------------------------------------------------------------------------
-- R0, R1 cache for cjne ri, data, rel

 signal AddPortCeqADDR0		: std_logic;
 signal AddPortCeqADDR1		: std_logic;
 signal AddPortDeqADDR0		: std_logic;
 signal AddPortDeqADDR1		: std_logic;
 signal AddPortCI		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal AddPortDI		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DinPortCI		: std_logic_vector(7 downto 0);
 signal DinPortDI		: std_logic_vector(7 downto 0);
 signal WePortCI		: std_logic;
 signal WePortDI		: std_logic;
 
-- signal DoutPortA		: std_logic_vector(7 downto 0);
 signal RiAccessOnPortA		: std_logic;
 signal RnAccessOnPortA		: std_logic;
 signal R0AccessFromPortA	: std_logic;
 signal R1AccessFromPortA	: std_logic;
-- signal DisableIStackFetchB	: std_logic;

 signal StackPointerII		: std_logic_vector(7 downto 0);


begin


 OROpNb <= OpNb;


 S51XRetI <= 	bool2_stdlogic(Opcode_bitvector = RETI);	-- Active when RETI is executed
								-- needed to dereference active IT entries in IT controller

 vcc <= '1';

 notcarry <= not PswReg(CY);
-- tmpdambit <= (DoutPortA(MyPtr8) and (not Data1(7))) or (SfrDout(MyPtr8) and Data1(7));
 tmpdambit <=	(
 			or_reduce(Data1BitMask and DoutPortA)		-- <=> DoutPortA(MyPtr8)
			and
			(not Data1(7))
		) or
 		(
			or_reduce(Data1BitMask and SfrDout)	-- <=> SfrDout(MyPtr8)
			and
			Data1(7)
		);
 
 anlCbit <= tmpdambit and PswReg(CY);
 anlCnotbit <= tmpdambit and (not PswReg(CY)); 
 orlCbit <= tmpdambit or PswReg(CY); 
 orlCnotbit <= tmpdambit or (not PswReg(CY)); 

 XRamME <= XramRdEn or XRamWEI;	-- Read on Clk + Level
 XRamWE <= XRamWEI;		-- Write on Clk + Level
 
-- OCDJmpCdt <= PMCondition;
 
 Opcode_bitvector <= to_bitvector(Opcode, '0');
-- OCDOpSize <= std_logic_vector(to_unsigned(OpNb, 2)) ;
 CmdAlu <= CmdAluI;

 bisnull <= bool2_stdlogic(or_reduce(Breg) = '0');

 ------------------------------------
 -- DA instruction
 ------------------------------------

 AccuHGT9 <= bool2_stdlogic(unsigned(Accu(7 downto 4)) > "1001");
 AccuLGT9 <= bool2_stdlogic(unsigned(Accu(3 downto 0)) > "1001");
 DAsetcarry <= PswReg(CY) or AccuHGT9 or AccuLGT9;
 
 DAX_I : process(Opcode_bitvector, C1, AUXCARRY1, Ov1,
 		 notcarry, tmpdambit, bisnull,	-- SetPswTo
		 Accu, Breg,
		 anlCbit,
		 anlCnotbit, LT, 
		 State, orlCbit, orlCnotbit,
		 S2, 
		 PswReg,	-- ADDC
		 AccuHGT9, AccuLGT9, DAsetcarry
		 )

  variable DAT		: std_logic_vector(1 downto 0);

 begin

  StateI <= '0';   		-- For multicycle instructions (MOVC and ADDON INSTRUCTION SET) 	

-- DAX
  OpNb <= 0;
  DisOpcodeFetch <= '0';	-- Enable opcode fetch (To OpcodeReader)

--PSW 
  RstVEn (SetPsw);		-- Clear all the SET PSW vector
  RstVEn (ClrPsw);      	-- Clear all the CLEAR PSW vector

--XRAM
  XramRdEn <= '0';
  XRamWEI <= '0';

   
-- Pc MUX
  CmdPCiMUX <= PM_NOOP;
--  PMNegativeJump <= Data2(7);
  PMSelOffsetSrc <= PMSELOFFSETNONE;
  -- PMCondition <= '0';
  PMCONDSEL <= PMC_NULL;


----------------------------------------------------------------
--
-- MUX COMMANDS
--
----------------------------------------------------------------

-- DIRECT ACCESS MEMORY MANAGEMENT
-- 			--> DIRECT ACCESS MEMORY MUX (#00h->#7Fh is stack | #80h->#FFh is SFR)
  CmdDam		<= DAM_NOOP;


-- STACK CMD (internal RAM)
  CmdStack <= STACK_NOOP;

-- ALU CMD
  CmdAluI 		<= ALUNOP;

-- ALU BUS

  CMDOP1SEL		<= OP1_NONE;
  CMDOP2SEL		<= OP2_NONE;
--  CMDOP3SEL		<= OP3_NONE;
  CMDOP5SEL		<= OP5ACCU_NONE;
  CMDOP6SEL		<= OP6_NONE;

-- INTERNAL S51 REGS
  CMDBREGISEL		<= BREGI_NONE;
  CMDACCUISEL		<= ACCUI_NONE;
  CMDSTACKPOINTERSEL	<= CMDSTACKPOINTER_NONE;
  CMDDPTRISEL		<= CMDDPTRI_NONE;

-- S51 EXTERNAL BUSES
  CMDDIRECTDINSEL	<= DIRECTDIN_NONE;
  CMDSTACKDINSEL	<= STACKDIN_NONE;
  CMDXRAMDINSEL		<= CMDXRAMDIN_NONE;
--  CMDXRAMADDRESS	<= XRAMADDRESS_NONE;
  CMDXRAMADDRESS	<= CMDXRDPTR;

--  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  ~~			 DECODE AND EXECUTE			  ~~
--  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  case Opcode_bitvector is

  when NOP =>					-- NOP (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   
  when ADD =>					-- ADD A,direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   -----------------------------------------------------
   -- A+=Rn (OP1=A, OP2=SfrDout(direct), S1 => OP1+OP2)
   -----------------------------------------------------

   CmdDam <= DIRECT_LOAD_PORTA;
   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DIRDOUT;
   CmdAluI <= ADD8;
   CMDACCUISEL <= ACCUIS1;
   
-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   
  when 	ADD1R0 | ADD1R1 | ADD1R2 | ADD1R3 |
  	ADD1R4 | ADD1R5 | ADD1R6 | ADD1R7 =>	-- ADD A,Rn (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadRn;

   -----------------------------------------------------
   -- A+=Rn (OP1=A, OP2=Rn, S1 => OP1+OP2)   
   -----------------------------------------------------

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DOUTPORTA;
   CmdAluI <= ADD8;
   CMDACCUISEL <= ACCUIS1;

-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
      
   
  when ADD2 =>					-- ADD A,#data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   -----------------------------------------------------
   -- A+=dir (OP1=A, OP2=direct, S1 => OP1+OP2)   
   -----------------------------------------------------

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DATA1;
   CmdAluI <= ADD8;
   CMDACCUISEL <= ACCUIS1;

-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
      
   
  when ADD3R0 | ADD3R1 =>			-- ADD A,@R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;

   -----------------------------------------------------
   -- A+=dir (OP1=A, OP2=@Rn, S1 => OP1+OP2)   
   -----------------------------------------------------

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DOUTPORTB;
   CmdAluI <= ADD8;
   CMDACCUISEL <= ACCUIS1;


-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   
   
  when ADDC =>					 -- ADDC A, direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
   OpNb <= 2;

   CmdDam <= DIRECT_LOAD_PORTA;
   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DIRDOUT;
   CMDACCUISEL <= ACCUIS1;
    
   if(PswReg(CY) = '1') then
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=direct, S1 => OP1+OP2+1)   
    -----------------------------------------------------

    CmdAluI <= ADDINC8;
   else
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=direct, S1 => OP1+OP2)   
    -----------------------------------------------------

    CmdAluI <= ADD8;
   end if;

   -- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         


-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   
   
  when ADDC1 =>					-- ADDC A, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;   

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DATA1;
   CMDACCUISEL <= ACCUIS1;

   if(PswReg(CY) = '1') then
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=direct, S1 => OP1+OP2)   
    -----------------------------------------------------
   
    CmdAluI <= ADDINC8;
   else
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=direct, S1 => OP1+OP2+1)   
    -----------------------------------------------------

    CmdAluI <= ADD8;
   end if;

   -- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         


-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				

   
  when ADDC2R0 | ADDC2R1 =>			-- ADDC A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DOUTPORTB;
   CMDACCUISEL <= ACCUIS1;

   if(PswReg(CY) = '1') then
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=@Ri, S1 => OP1+OP2)   
    -----------------------------------------------------
    CmdAluI <= ADDINC8;
    
   else
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=@Ri, S1 => OP1+OP2+1)   
    -----------------------------------------------------
    CmdAluI <= ADD8;
   end if;

   -- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         


-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   

  when	ADDC3R0 | ADDC3R1 | ADDC3R2 | ADDC3R3 |
	ADDC3R4 | ADDC3R5 | ADDC3R6 | ADDC3R7 =>-- ADDC A,R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadRn;

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DOUTPORTA;
   CMDACCUISEL <= ACCUIS1;

   if(PswReg(CY) = '1') then
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=Rn, S1 => OP1+OP2)   
    -----------------------------------------------------
    CmdAluI <= ADDINC8;
   else
    -----------------------------------------------------
    -- A+=dir (OP1=A, OP2=Rn, S1 => OP1+OP2+1)   
    -----------------------------------------------------
    CmdAluI <= ADD8;
   end if;   

   -- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         


-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   

  when ANL =>					-- ANL A, direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdDam <= DIRECT_LOAD_PORTA;
   CMDACCUISEL <= ACCUIEQACCUANDDIRECTDOUT;
   
  when	ANL1R0 | ANL1R1 | ANL1R2 | ANL1R3 |
   	ANL1R4 | ANL1R5 | ANL1R6 | ANL1R7 => 	-- ANL A, R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadRn;
--   AccuI <= Accu and DoutPortA;      
   CMDACCUISEL <= ACCUIEQACCUANDDOUTPORTA;
  when ANL2 =>					-- ANL A, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CMDACCUISEL <= ACCUIEQACCUANDDATA1;
   
  when ANL3R0 | ANL3R1 =>			-- ANL A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;   
   CMDACCUISEL <= ACCUIEQACCUANDDOUTPORTB;
   
  when ANL4 =>					-- ANL direct, A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CMDDIRECTDINSEL <= DIRECTDINEQDIRECTDOUTANDACCU;

  when CLR =>					-- CLR A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDACCUISEL <= ACCUIEQNULL;
   
  when CLR1 =>					-- CLR bit (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= ClrBit;   
   
   -- Here bit addressable part of STACK
   -- STACK range 20H to 2FH
   -- BITS address range is 00H to 7FH
   --    @byte        @bit
   -- 0010|xxxx	  |   xxx
   -- => @byte is "0010"&Data1(6 downto 3) and bit is at pos Data1(2 downto 0)
      
  when CLR2 =>					-- CLR C (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   PswClr(ClrPsw, CY);   

  when CPL =>					-- CPL A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
   OpNb <= 1;
   CMDACCUISEL <= ACCUIEQCPL;
   
  when CPL1 =>					-- CPL bit (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= CplBit;
      
  when CPL2 =>					-- CPL C (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   SetPswTo(ClrPsw, SetPsw, notcarry, CY);   
   
  when DA =>					-- DA A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   
   CMDOP1SEL <= OP1ACCU;
   CMDACCUISEL <= ACCUIS1;
   CmdAluI <= ADD8;

   DAT := AccuHGT9&AccuLGT9;
   case DAT is
    when "10" =>
     CMDOP2SEL <= OP2SIXTY;
    when "01" =>
     CMDOP2SEL <= OP2SIX;
    when "11" =>
     CMDOP2SEL <= OP2SIXTYSIX;
    when OTHERS =>
     CMDOP2SEL <= OP2_NONE;
   end case;

   SetPswTo(ClrPsw, SetPsw, DAsetcarry, CY);
   
  when DEC => 					-- DEC A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
--   CMDOP3SEL <= OP3ACCU;
   CmdAluI <= DEC8;
   CMDACCUISEL <= ACCUIS1;
   
  when DEC1 =>					-- DEC direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
--   CMDOP3SEL <= OP3DIRECTDOUT;
--   CmdAluI <= DEC8;
--   CMDDIRECTDINSEL <= DIRECTDINS1;
   CMDDIRECTDINSEL <= DIRECTDINDECDIRECTDOUT;

  when 	DEC2R0 | DEC2R1 | DEC2R2 | DEC2R3 |
  	DEC2R4 | DEC2R5 | DEC2R6 | DEC2R7 =>	-- DEC R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= DecRn;
--   CMDOP3SEL <= OP3DOUTPORTA;
--   CmdAluI <= DEC8;
   CMDSTACKDINSEL <= STACKDINDECDOUTPORTA;

  when DEC3R0 | DEC3R1 =>			-- DEC @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
--   CMDOP3SEL <= OP3DOUTPORTB;
--   CmdAluI <= DEC8;
   CMDSTACKDINSEL <= STACKDINDECDOUTPORTB;

   CmdStack <= DecIndRi;

  when INC =>					-- INC A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDOP1SEL <= OP1ACCU;
   CmdAluI <= INC8;
   CMDACCUISEL <= ACCUIS1;

  when INC1 =>					-- INC direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
--   CMDOP1SEL <= OP1DIRDOUT;
--   CmdAluI <= INC8;
--   CMDDIRECTDINSEL <= DIRECTDINS1;
   CMDDIRECTDINSEL <= DIRECTDININCDIRECTDOUT;

  when	INC2R0 | INC2R1  | INC2R2  | INC2R3 |
   	INC2R4 | INC2R5  | INC2R6  | INC2R7 =>	-- INC R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;

--   CMDOP1SEL <= OP1DOUTPORTA;
--   CmdAluI <= INC8;
   CMDSTACKDINSEL <= STACKDININCDOUTPORTA;
   
   CmdStack <= DecRn;

  when INC3R0 | INC3R1 =>			-- INC @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;

--   CMDOP1SEL <= OP1DOUTPORTB;
--   CmdAluI <= INC8;
   CMDSTACKDINSEL <= STACKDINDECDOUTPORTB;

   CmdStack <= DecIndRi;

  when MOV =>					-- MOV A, direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdDam <= DIRECT_LOAD_PORTA;
   CMDACCUISEL <= ACCUIEQDIRECTDOUT;

  when	MOV1R0 | MOV1R1 | MOV1R2 | MOV1R3 |
   	MOV1R4 | MOV1R5 | MOV1R6 | MOV1R7 =>	-- MOV A, R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadRn;
   CMDACCUISEL <= ACCUIEQDOUTPORTA;

   
  when MOV2 =>					-- MOV A, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CMDACCUISEL <= ACCUIEQDATA1;   

  when MOV3R0 | MOV3R1 =>			-- MOV A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;

--   if OCDSfrAccess = '0' then
    CmdStack <= ReadIndRi;
    CMDACCUISEL <= ACCUIEQDOUTPORTB;
--   else
--    CmdStack <= ReadRi;
--    CmdDam <= ReadSfrIndRi;
--    CMDACCUISEL <= ACCUIEQDIRECTDOUT;
--   end if;

  when ESCAPE =>				-- ESCAPE
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
--   OCDTrap <= '1';

  when MOV5 =>					-- MOV C, bit (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= ReadBit;
   SetPswTo(ClrPsw, SetPsw, tmpdambit, CY);
   
  when MOV6 =>					-- MOV direct, A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;   
   CmdDam <= DIRECT_STORE_PORTC;
   CMDDIRECTDINSEL <= DIRECTDINACCU;

  when	MOV7R0 | MOV7R1 | MOV7R2 | MOV7R3 |
   	MOV7R4 | MOV7R5 | MOV7R6 | MOV7R7 =>	-- MOV R0, A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= StoreAccuToRn;      

  when	MOV8R0 | MOV8R1 | MOV8R2 | MOV8R3 |
   	MOV8R4 | MOV8R5 | MOV8R6 | MOV8R7 =>	-- MOV R0, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdStack <= StoreDataToRn;      

  when MOV9R0 | MOV9R1 =>			-- MOV @R0, A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
--   if OCDSfrAccess = '0' then
    CmdStack <= StoreAccuToIndRi;
--   else
--    CmdStack <= ReadRi;
--    CmdDam <= WriteDirectDintoIndRi;
--    CMDDIRECTDINSEL <= DIRECTDINACCU;
--   end if;

  when MOV10R0 | MOV10R1 =>			-- MOV @R0, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdStack <= StoreDataToIndRi;

  when ORL =>					-- ORL A, direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
--   DirectAddressMux(DIRECT_LOAD_PORTA, CmdDam);
   CmdDam <= DIRECT_LOAD_PORTA;
   CMDACCUISEL <= ACCUIEQACCUORDIRECTDOUT;

  when	ORL1R0 | ORL1R1 | ORL1R2 | ORL1R3 |
   	ORL1R4 | ORL1R5 | ORL1R6 | ORL1R7 =>	-- ORL A, R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadRn;
   CMDACCUISEL <= ACCUIEQACCUORDOUTPORTA;
   

  when ORL2 =>					-- ORL A, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CMDACCUISEL <= ACCUIEQACCUORDATA1;

  when ORL3R0 | ORL3R1 =>			-- ORL A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;
   CMDACCUISEL <= ACCUIEQACCUORDOUTPORTB;

  when ORL4 =>					-- ORL direct, A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CMDDIRECTDINSEL <= DIRECTDINEQDIRECTDOUTORACCU;
   
  when RL =>					-- RL A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDACCUISEL <= ACCUIRL;

  when RLC =>					-- RLC A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDACCUISEL <= ACCUIRLC;
   SetPswTo(ClrPsw, SetPsw, Accu(7), CY);         

  when RR =>					-- RR A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDACCUISEL <= ACCUIRR;

  when RRC =>					-- RRC A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDACCUISEL <= ACCUIRRC;
   
   SetPswTo(ClrPsw, SetPsw, Accu(0), CY);            
   
  when SETB =>					-- SETB bit (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= SetBit; 

  when SETB1 =>					-- SETB C (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   PswSet(SetPsw, CY);      

  when SUBB =>					-- SUBB A, direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   
   -----------------------------------------------------
   -- LOW8(A-B-1)=LOW8(A+CPL(B))
   -----------------------------------------------------

   CmdDam <= DIRECT_LOAD_PORTA;

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DIRDOUT;
   CMDACCUISEL <= ACCUIS1;

   if(PswReg(CY) = '1') then
    CmdAluI <= SUB8;
   else
    CmdAluI <= SUBINC8;
   end if;   

-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   

  when	SUBB1R0 | SUBB1R1 | SUBB1R2 | SUBB1R3 |
   	SUBB1R4 | SUBB1R5 | SUBB1R6 | SUBB1R7 =>-- SUBB A, R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;

   -----------------------------------------------------
   -- LOW8(A-B-1)=LOW8(A+CPL(B))
   -----------------------------------------------------
   
   CmdStack <= ReadRn;   
   
   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DOUTPORTA;
   CMDACCUISEL <= ACCUIS1;    

   if(PswReg(CY) = '1') then
    CmdAluI <= SUB8;
   else
    CmdAluI <= SUBINC8;
   end if;   

-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   

  when SUBB2 =>					-- SUBB A, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   -----------------------------------------------------
   -- LOW8(A-B-1)=LOW8(A+CPL(B))
   -----------------------------------------------------

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DATA1;
   CMDACCUISEL <= ACCUIS1;        

   if(PswReg(CY) = '1') then
    CmdAluI <= SUB8;
   else
    CmdAluI <= SUBINC8;
   end if;

-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
   

  when SUBB3R0 | SUBB3R1 =>			-- SUBB A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;

   CMDOP1SEL <= OP1ACCU;
   CMDOP2SEL <= OP2DOUTPORTB;
   CMDACCUISEL <= ACCUIS1;        

   if(PswReg(CY) = '1') then
    CmdAluI <= SUB8;
   else
    CmdAluI <= SUBINC8;
   end if;

-- !!! RTL Compiler issue with the below !!!
-- AddPswDriver(ClrPsw, SetPsw, C1, AUXCARRY1, Ov1); -- PSW: CY, AC, OV driver         

-- Fix for RT compiler
   SetPswTo(ClrPsw, SetPsw, C1, CY);		-- drive Carry 
   SetPswTo(ClrPsw, SetPsw, AUXCARRY1, AC);   	-- drive Aux Carry if 
   SetPswTo(ClrPsw, SetPsw, Ov1, OV);		-- drive OV    				
         

  when SWAP =>					-- SWAP A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDACCUISEL <= ACCUISWAP;
   
  when XCH =>					-- XCH A, direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CMDACCUISEL <= ACCUIEQDIRECTDOUT;
   CMDDIRECTDINSEL <= DIRECTDINACCU;

  when	XCH1R0 | XCH1R1 | XCH1R2 | XCH1R3 |
   	XCH1R4 | XCH1R5 | XCH1R6 | XCH1R7 =>	-- XCH A, R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= XchRn;
   
   CMDACCUISEL <= ACCUIEQDOUTPORTA;

  when XCH2R0 | XCH2R1 =>			-- XCH A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= XchIndRi;   

   CMDACCUISEL <= ACCUIEQDOUTPORTB;

  when XCHDR0 | XCHDR1 =>			-- XCHD A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= XchdIndRi;   
   CMDACCUISEL <= ACCUIXCH;
      
  when XRL =>					-- XRL A, direct (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_LOAD_PORTA;
   CMDACCUISEL <= ACCUIEQACCUXORDIRECTDOUT;

  when	XRL1R0 | XRL1R1 | XRL1R2 | XRL1R3 |
   	XRL1R4 | XRL1R5 | XRL1R6 | XRL1R7 =>	-- XRL A, R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadRn;
   CMDACCUISEL <= ACCUIEQACCUXORDOUTPORTA;

  when XRL2 =>					-- XRL A, #data (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CMDACCUISEL <= ACCUIEQACCUXORDATA1;

  when XRL3R0 | XRL3R1 =>			-- XRL A, @R0 (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;
   CMDACCUISEL <= ACCUIEQACCUXORDOUTPORTB;

  when XRL4 =>					-- XRL direct, A (1 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CMDDIRECTDINSEL <= DIRECTDINEQDIRECTDOUTXORACCU;

  when	ACALL0 | ACALL1 | ACALL2 | ACALL3 |
   	ACALL4 | ACALL5 | ACALL6 | ACALL7 =>	-- ACALL addr11 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   
   --CMDOP1SEL <= OP1STACKPOINTER;
   --CMDOP3SEL <= OP3STACKPOINTER;
   --CMDOP2SEL <= OP2TWO;
   --CmdAluI <= ADD_AND_INC8;
   CmdStack <= Store16;
   CMDSTACKPOINTERSEL <= CMDSTACKPOINTERPLUSTWO;
   CmdPCiMUX <= PM_CALL;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '1';
--   OCDCdtJmp	<= '0';
--   -----------------------
      
  when	AJMP0 | AJMP1 | AJMP2 | AJMP3 |
   	AJMP4 | AJMP5 | AJMP6 | AJMP7 => -- AJMP addr11 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdPCiMUX <= PM_CALL;        

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '1';
--   OCDCdtJmp	<= '0';
--   -----------------------

  when ANL5 =>				-- ANL C, bit (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= ReadBit;
      
   SetPswTo(ClrPsw, SetPsw, anlCbit, CY);   
       
  when ANL6 =>				-- ANL C, /bit (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= ReadBit;
   SetPswTo(ClrPsw, SetPsw, anlCnotbit, CY);   
   
  when ANL7 =>				-- ANL direct, #data (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CMDDIRECTDINSEL <= DIRECTDINEQDIRECTDOUTANDDATA2;
   
  when CJNE =>				-- CJNE A, direct, rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;   
   CmdDam <= DIRECT_LOAD_PORTA;
   CMDOP5SEL <= OP5ACCU;
   CMDOP6SEL <= OP6DIRECTDOUT;

   SetPswTo(ClrPsw, SetPsw, LT, CY);      
   
   CmdPCiMUX <= PM_JMP;

   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   -- PMCondition <= NotAccuEqDirectDOut;
   PMCONDSEL <= PMC_NOTACCUEQDIRECTDOUT;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------
  
  when CJNE1 =>				-- CJNE A, #data, rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CMDOP5SEL <= OP5ACCU;
   CMDOP6SEL <= OP6DATA1;
   
   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   -- PMCondition <= NotAccuEqData1;
   PMCONDSEL <= PMC_NOTACCUEQDATA1;


   SetPswTo(ClrPsw, SetPsw, LT, CY);      

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when	CJNE2R0 | CJNE2R1 | CJNE2R2 | CJNE2R3 |
   	CJNE2R4 | CJNE2R5 | CJNE2R6 | CJNE2R7 =>-- CJNE R0, #data, rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdStack <= ReadRn;
   CMDOP5SEL <= OP5DOUTPORTA;
   CMDOP6SEL <= OP6DATA1;

   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   -- PMCondition <= NotDoutPortAEqData1;
   PMCONDSEL <= PMC_NOTDOUTPORTAEQDATA1;


   SetPswTo(ClrPsw, SetPsw, LT, CY);      

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when CJNE3R0 | CJNE3R1 =>		-- CJNE @R0, #data, rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;

   CmdStack <= ReadIndRi;
   CMDOP5SEL <= OP5DOUTPORTB;
   CMDOP6SEL <= OP6DATA1;
   
   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   -- PMCondition <= NotDoutPortBEqData1;
   PMCONDSEL <= PMC_NOTDOUTPORTBEQDATA1;
   
   SetPswTo(ClrPsw, SetPsw, LT, CY);      

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------
   
  when DJNZ =>				-- DJNZ direct, rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   
    CMDDIRECTDINSEL <= DIRECTDINDECDIRECTDOUT;
    -- PMCondition <= DECDirectDOutNotNull;
    PMCONDSEL <= PMC_DECDIRECTDOUTNOTNULL;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when	DJNZ1R0 | DJNZ1R1 | DJNZ1R2 | DJNZ1R3 |
   	DJNZ1R4 | DJNZ1R5 | DJNZ1R6 | DJNZ1R7 =>-- DJNZ R0, rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdStack <= DecRn;
   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA1;
      
    CMDSTACKDINSEL <= STACKDINDECDOUTPORTA;
    -- PMCondition <= DECDoutPortANotNull;
    PMCONDSEL <= PMC_DECDOUTPORTANOTNULL;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when INC4 =>					-- INC DPTR (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
 
   CMDDPTRISEL <= CMDDPTRIINC;
   
  when JB =>					-- JB bit,rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   -------------------------------------------------------------------------------
   -- Here bit addressable part of STACK
   -- STACK range 20H to 2FH
   -- BITS address range is 00H to 7FH
   --    @byte        @bit
   -- 0010|xxxx	  |   xxx
   -- => @byte is "0010"&Data1(6 downto 3) and bit is at pos Data1(2 downto 0)
   -------------------------------------------------------------------------------   

   CmdDam <= ReadBit;
   
   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   -- PMCondition <= tmpdambit;
   PMCONDSEL <= PMC_TMPDAMBIT;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------
      
  when JBC =>					-- JBC bit,rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   -------------------------------------------------------------------------------
   -- Here bit addressable part of STACK
   -- STACK range 20H to 2FH
   -- BITS address range is 00H to 7FH
   --    @byte        @bit
   -- 0010|xxxx	  |   xxx
   -- => @byte is "0010"&Data1(6 downto 3) and bit is at pos Data1(2 downto 0)
   -------------------------------------------------------------------------------
   
   CmdDam <= ClrBit;
  
   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   -- PMCondition <= tmpdambit;
   PMCONDSEL <= PMC_TMPDAMBIT;
   
--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when JC =>				-- JC rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA1;
   -- PMCondition <= PswReg(CY);
   PMCONDSEL <= PMC_PSWREGCY;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when JMP =>				-- JMP @A+DPTR (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdPCiMUX <= PM_JMPATAPLUSDPTR;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '1';
--   OCDCdtJmp	<= '0';
--   -----------------------

  when JNB =>				-- JNB bit, rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   -------------------------------------------------------------------------------
   -- Here bit addressable part of STACK
   -- STACK range 20H to 2FH
   -- BITS address range is 00H to 7FH
   --    @byte        @bit
   -- 0010|xxxx	  |   xxx
   -- => @byte is "0010"&Data1(6 downto 3) and bit is at pos Data1(2 downto 0)
   -------------------------------------------------------------------------------
   
   CmdDam <= ReadBit;

   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA2;
   -- PMCondition <= nottmpdambit;
   PMCONDSEL <= PMC_NOTTMPDAMBIT;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when JNC =>				-- JNC rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   
   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA1;
   -- PMCondition <= notcarry;
   PMCONDSEL <= PMC_NOTCARRY;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when JNZ =>				-- JNZ rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA1;   
   -- PMCondition <= notaccunull;
   PMCONDSEL <= PMC_NOTACCUNULL;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------

  when JZ =>				-- JZ rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA1;
   -- PMCondition <= accunull;
   PMCONDSEL <= PMC_ACCUNULL;

--   -----------------------
--   -- OCD ----------------
--	   OCDUnCdtJmp	<= '0';
--   OCDCdtJmp	<= '1';
--   -----------------------
   
  when LCALL =>			-- LCALL addr16 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;

--   CMDOP1SEL <= OP1STACKPOINTER;
--   CMDOP3SEL <= OP3STACKPOINTER;
--   CMDOP2SEL <= OP2TWO;
--   CmdAluI <= ADD_AND_INC8;
   CmdStack <= Store16;
   CMDSTACKPOINTERSEL <= CMDSTACKPOINTERPLUSTWO;
   CmdPCiMUX <= PM_LCALL;
--
--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '1';
--   OCDCdtJmp	<= '0';
--   -----------------------
   
  when LJMP =>				-- LJMP addr16 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdPCiMUX <= PM_LCALL;
   
--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '1';
--   OCDCdtJmp	<= '0';
--   -----------------------

  when MOV11 =>				-- MOV bit, C (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= StoreCarryToBit; 
   
  when MOV12 =>				-- MOV direct1, direct2 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdDam <= DIRECT_COPY;
   CMDDIRECTDINSEL <= DIRECTDINDIRECTDOUT;

  when	MOV13R0 | MOV13R1 | MOV13R2 | MOV13R3 |
   	MOV13R4 | MOV13R5 | MOV13R6 | MOV13R7 =>-- MOV direct, R0 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdStack <= ReadRn;
   CMDDIRECTDINSEL <= DIRECTDINDOUTPORTA;
   CmdDam <= DIRECT_STORE_PORTC;

  when MOV14 =>				-- MOV direct, #data (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdDam <= DIRECT_STORE_PORTC;
   CMDDIRECTDINSEL <= DIRECTDINDATA2;
   
  when MOV15R0 | MOV15R1 =>		-- MOV direct, @R0 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdStack <= ReadIndRi;
   CMDDIRECTDINSEL <= DIRECTDINDOUTPORTB;
   CmdDam <= DIRECT_STORE_PORTC;

  when MOV16 =>				-- MOV DPTR, #data16 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CMDDPTRISEL <= CMDDPTRIDATA16;

  when	MOV17R0 | MOV17R1 | MOV17R2 | MOV17R3 |
   	MOV17R4 | MOV17R5 | MOV17R6 | MOV17R7 =>-- MOV R0, direct (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OpNb <= 2;
    CmdStack <= StoreDirectToRn;
    CmdDam <= DIRECT_LOAD_PORTA;

  when MOV18R0 | MOV18R1 =>		-- MOV @R0, direct (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_LOAD_PORTA;
   CmdStack <= StoreDirectToIndirectRi;   

  when MOVC =>				-- MOVC A, @A+DPTR (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
    
   if State = '0' then
    DisOpcodeFetch <= '1';
    StateI <= '1';
    CmdPCiMUX <= PM_JMPATAPLUSDPTR;
--    OCDEOI <= '0';		-- Instruction will finish next clock cycle
   else				-- Refill pipeline
    StateI <= '0';     
    CMDACCUISEL <= ACCUIEQMOVCDATA;
--    OCDEOI <= '1';
   end if;

  when MOVC1 =>				-- MOVC A, @A+PC (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;

   if State = '0' then
    DisOpcodeFetch <= '1';
    StateI <= '1';
    CmdPCiMUX <= PM_JMPATAPLUSPC;
   else
    StateI <= '0';     
    CMDACCUISEL <= ACCUIEQMOVCDATA;    
   end if;

  when MOVX =>				-- MOVX A, @DPTR (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDXRAMADDRESS <= CMDXRDPTR;
   XramRdEn <= '1';
   CMDACCUISEL <= ACCUIEQXRAMDOUT;

  when MOVX1R0 | MOVX1R1  =>		-- MOVX A, @R0 (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;
   CMDXRAMADDRESS <= CMDXRDOUTPORTA;
   XramRdEn <= '1';
   CMDACCUISEL <= ACCUIEQXRAMDOUT;

  when MOVX2 =>				-- MOVX @DPTR, A (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CMDXRAMADDRESS <= CMDXRDPTR;
   XRamWEI <= '1';
   CMDXRAMDINSEL <= CMDXRAMDINEQACCU; 

  when MOVX3R0 | MOVX3R1 =>		-- MOVX @R0, A (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   CmdStack <= ReadIndRi;
   
   CMDXRAMADDRESS <= CMDXRDOUTPORTA;

   XRamWEI <= '1';
   CMDXRAMDINSEL <= CMDXRAMDINEQACCU;
   
  when ORL5 =>				-- ORL C, bit (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= ReadBit;   
   SetPswTo(ClrPsw, SetPsw, orlCbit, CY);      

  when ORL6 =>				-- ORL C, /bit (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= ReadBit;
   SetPswTo(ClrPsw, SetPsw, orlCnotbit, CY);   
 
  when ORL7 =>				-- ORL direct, #data (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CMDDIRECTDINSEL <= DIRECTDINEQDIRECTDOUTORDATA2;

  when POP =>				-- POP direct (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
   CmdDam <= DIRECT_STORE_PORTC;
--   CMDOP3SEL <= OP3STACKPOINTER;
--   CmdAluI <= DEC8;
   CMDSTACKPOINTERSEL <= CMDSTACKPOINTERMINUSONE;
   CmdStack <= Load8;
   CMDDIRECTDINSEL <= DIRECTDINDOUTPORTA;

  when PUSH =>				-- PUSH direct (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;
--   CMDOP1SEL <= OP1STACKPOINTER;
--   CmdAluI <= INC8;
   CMDSTACKPOINTERSEL <= CMDSTACKPOINTERPLUSONE;
   CmdDam <= DIRECT_LOAD_PORTA;
   CmdStack <= Store8;
      
  when RET | RETI =>			-- RET (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;

--   CMDOP1SEL <= OP1STACKPOINTER;
--   CMDOP2SEL <= OP2TWOHUNDREDFIFTYFOUR;
--   CMDOP3SEL <= OP3STACKPOINTER;
--   CmdAluI <= ADD8;   
   CmdStack <= Load16;
   CmdPCiMUX <= PM_RET;
   CMDSTACKPOINTERSEL <= CMDSTACKPOINTERMINUSTWO;   

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '1';
--   OCDCdtJmp	<= '0';
--   -----------------------

  when SJMP =>				-- SJMP rel (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 2;

   CmdPCiMUX <= PM_JMP;
   PMSelOffsetSrc <= PMSELOFFSETDATA1;
   -- PMCondition <= VCC;
   PMCONDSEL <= PMC_VCC;

--   -----------------------
--   -- OCD ----------------
--   OCDUnCdtJmp	<= '1';
--   OCDCdtJmp	<= '0';
--   -----------------------

  when XRL5 =>				-- XRL direct, #data (2 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 3;
   CmdDam <= DIRECT_READ_MODIFY_WRITE_PORTAC;
   CMDDIRECTDINSEL <= DIRECTDINEQDIRECTDOUTXORDATA2;

  when DIV =>				 -- DIV AB (4 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   OpNb <= 1;
   PswClr(ClrPsw, CY);
   SetPswTo(ClrPsw, SetPsw, bisnull, OV);		-- SET OV if B=0 otherwise clears it
   CmdAluI 	<= DIV8;
   CMDACCUISEL	<= ACCUIS1DIV;
   CMDBREGISEL	<= BREGIS2DIV;

  when MUL =>				-- MUL AB (4 c51 cycles)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   OpNb <= 1;
   PswClr(ClrPsw, CY);
   CMDACCUISEL	<= ACCUIS1;
--   CMDOP1SEL <= OP1ACCU;
--   CMDOP2SEL <= OP2BREG;
   CmdAluI <= MUL8;
   CMDBREGISEL <= BREGIS2;
   
   if (or_reduce(S2) = '1') then
    PswSet(SetPsw, OV);
   end if;
  end case;

 end process;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- DstSfrAddress
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

DstSfrAddEntryV(0) <= Data1(7 downto 3)&"000";
DstSfrAddEntryV(1) <= Data2;
DstSfrAddEntryV(2) <= Data1;
DstSfrAddEntryV(3) <= DoutPortA;	-- OCD mode : indirect addressing on SFRs

DstSfrAddCondV(0) <= bool2_stdlogic	(
						(
							(CmdDam = SetBit) or
							(CmdDam = ClrBit) or
							(CmdDam = CplBit) or
							(CmdDam = StoreCarryToBit)
						) and Data1(7) = '1'
					);

DstSfrAddCondV(1) <= bool2_stdlogic	(
						((CmdDam = DIRECT_COPY) and (Data2(7)  = '1'))
					);

DstSfrAddCondV(2) <= bool2_stdlogic	(
						((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '1')) or
						((CmdDam = DIRECT_STORE_PORTC) and (Data1(7)  = '1'))
					);
DstSfrAddCondV(3) <= bool2_stdlogic	(	-- OCD mode : indirect addressing on SFRs
						(CmdDam = WriteDirectDintoIndRi)
					);

DstSfrAddressI <= 	scalarprod(DstSfrAddEntryV(0), DstSfrAddCondV(0)) or
			scalarprod(DstSfrAddEntryV(1), DstSfrAddCondV(1)) or
			scalarprod(DstSfrAddEntryV(2), DstSfrAddCondV(2)) or
			scalarprod(DstSfrAddEntryV(3), DstSfrAddCondV(3));

 DstSfrAddress <= DstSfrAddressI;
			
WriteSfrI <=	bool2_stdlogic(
					((CmdDam = DIRECT_COPY) and (Data2(7)  = '1')) or
					((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '1')) or
					((CmdDam = DIRECT_STORE_PORTC) and (Data1(7)  = '1')) or					
					(	-- Bit addressable SFR
						(
							(CmdDam = SetBit) or
							(CmdDam = ClrBit) or
							(CmdDam = CplBit) or
							(CmdDam = StoreCarryToBit)
						) and (Data1(7) = '1')
					) or
					(CmdDam = WriteDirectDintoIndRi)	-- OCD mode : indirect addressing on SFRs
				);
WriteSfr <= WriteSfrI;

-- directbitisnull <= 	not SfrDout(MyPtr8);
directbitisnull <= 	not 	(
		                			or_reduce(Data1BitMask and SfrDout)	-- <=> SfrDout(MyPtr8)
				);


--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- SfrDinAddress
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

-- SfrDinEntryV(0) <= SfrDout and (not GenMask(MyPtr8));
SfrDinEntryV(0) <= SfrDout and (not Data1BitMask);
-- SfrDinEntryV(1) <= SfrDout or GenMask(MyPtr8);
SfrDinEntryV(1) <= SfrDout or Data1BitMask;
SfrDinEntryV(2) <= DirectDin;

SfrDinCondV(0) <= bool2_stdlogic	(
						(
							(CmdDam = ClrBit) or
							(CmdDam = CplBit and (directbitisnull = '0')) or
							(CmdDam = StoreCarryToBit and PswReg(CY) = '0')
						) and Data1(7) = '1'
					);

SfrDinCondV(1) <= bool2_stdlogic	(
						(
							(CmdDam = SetBit) or
							(CmdDam = CplBit and directbitisnull = '1') or
							(CmdDam = StoreCarryToBit and PswReg(CY) = '1')
						) and Data1(7) = '1'
					);

SfrDinCondV(2) <= bool2_stdlogic	(
						(		
							((CmdDam = DIRECT_COPY) and (Data2(7)  = '1')) or
							((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '1')) or
							((CmdDam = DIRECT_STORE_PORTC) and (Data1(7)  = '1')) or
							(CmdDam = WriteDirectDintoIndRi)
						)
					);
					

SfrDin <= 	scalarprod(SfrDinEntryV(0), SfrDinCondV(0)) or
		scalarprod(SfrDinEntryV(1), SfrDinCondV(1)) or
		scalarprod(SfrDinEntryV(2), SfrDinCondV(2));
		
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- SrcSfrAddress
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

SrcSfrAddEntryV(0) <= Data1;
SrcSfrAddEntryV(1) <= Data1(7 downto 3)&"000";
SrcSfrAddEntryV(2) <= DoutPortA;

SrcSfrAddCondV(0) <= bool2_stdlogic	(
						((CmdDam = DIRECT_LOAD_PORTA) and (Data1(7)  = '1')) or
						((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '1')) or
						((CmdDam = DIRECT_COPY) and (Data1(7)  = '1'))
					);

SrcSfrAddCondV(1) <= bool2_stdlogic	(
						(
							(CmdDam = SetBit) or
							(CmdDam = ClrBit) or
							(CmdDam = CplBit) or
							(CmdDam = ReadBit) or
							(CmdDam = StoreCarryToBit)
						) and Data1(7) = '1'
					);
SrcSfrAddCondV(2) <= bool2_stdlogic	(CmdDam = ReadSfrIndRi);

SrcSfrAddressI <= 	scalarprod(SrcSfrAddEntryV(0), SrcSfrAddCondV(0)) or
			scalarprod(SrcSfrAddEntryV(1), SrcSfrAddCondV(1)) or
			scalarprod(SrcSfrAddEntryV(2), SrcSfrAddCondV(2));

 SrcSfrAddress <= SrcSfrAddressI;
  			
ReadSfrI <= bool2_stdlogic	(
					((CmdDam = DIRECT_LOAD_PORTA) and (Data1(7)  = '1')) or
					((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '1')) or
					((CmdDam = DIRECT_COPY) and (Data1(7)  = '1')) or					
					(	-- Bit addressable SFR
						(
							(CmdDam = SetBit) or
							(CmdDam = ClrBit) or
							(CmdDam = CplBit) or
							(CmdDam = ReadBit) or
							(CmdDam = StoreCarryToBit)
						) and Data1(7) = '1'
					) or
					(CmdDam = ReadSfrIndRi)
				);
ReadSfr <= ReadSfrI;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- DirectDout
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

DirDoutEntryV(0) <= SfrDout;
DirDoutEntryV(1) <= DoutPortA;

DirDoutCondV(0) <= bool2_stdlogic	(
						((CmdDam = DIRECT_LOAD_PORTA) and (Data1(7)  = '1')) or
						((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '1')) or
						((CmdDam = DIRECT_COPY) and (Data1(7)  = '1')) or
						(CmdDam = ReadSfrIndRi)
					);

DirDoutCondV(1) <= bool2_stdlogic	(
						((CmdDam = DIRECT_LOAD_PORTA) and (Data1(7)  = '0')) or
						((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '0')) or
						((CmdDam = DIRECT_COPY) and (Data1(7)  = '0'))
					);

DirectDout	 <= 	scalarprod(DirDoutEntryV(0), DirDoutCondV(0)) or
			scalarprod(DirDoutEntryV(1), DirDoutCondV(1));

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- DecDirectDout
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

DECDoutPortA 		<= std_logic_vector(unsigned(DoutPortA) - 1);
DECSfrDout	<= std_logic_vector(unsigned(SfrDout) - 1);

DECDirDoutEntryV(0) 	<= DECSfrDout;
DECDirDoutEntryV(1) 	<= DECDoutPortA;

DECDirDoutCondV(0) 	<= DirDoutCondV(0);
DECDirDoutCondV(1) 	<= DirDoutCondV(1);


DECDirectDout	 <= 	scalarprod(DECDirDoutEntryV(0), DECDirDoutCondV(0)) or
                     scalarprod(DECDirDoutEntryV(1), DECDirDoutCondV(1));


INCDirectDout   <= std_logic_vector(unsigned(DirectDout) + 1);
DECDoutPortB 		<= std_logic_vector(unsigned(DoutPortB) - 1);
INCDoutPortA 		<= std_logic_vector(unsigned(DoutPortA) + 1);
INCDoutPortB 		<= std_logic_vector(unsigned(DoutPortB) + 1);

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--
-- PCi driver
--
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

 DECDirectDOutNotNull		<= (DirDoutCondV(0) and DECSfrDoutNotNull) or (DirDoutCondV(1) and DECDoutPortANotNull);
 DECSfrDoutNotNull	<= or_reduce(SfrDout(7 downto 1)&(not SfrDout(0)));
 DECDoutPortANotNull		<= or_reduce(DoutPortA(7 downto 1)&(not DoutPortA(0)));
 nottmpdambit			<= not tmpdambit; 
 accunull			<= not or_reduce(Accu);
 notaccunull			<= not accunull;
 NotAccuEqDirectDOut		<= or_reduce(Accu xor DirectDOut);
 NotAccuEqData1			<= or_reduce(Accu xor Data1);
 NotDoutPortAEqData1		<= or_reduce(DoutPortA xor Data1);
 NotDoutPortBEqData1		<= or_reduce(DoutPortB xor Data1);

 PMCondition <= ('0'			and	bool2_stdlogic(PMCONDSEL = PMC_NULL)			) or
 		(NotAccuEqDirectDOut	and	bool2_stdlogic(PMCONDSEL = PMC_NOTACCUEQDIRECTDOUT)	) or
 		(NotAccuEqData1		and	bool2_stdlogic(PMCONDSEL = PMC_NOTACCUEQDATA1)		) or
 		(NotDoutPortAEqData1	and	bool2_stdlogic(PMCONDSEL = PMC_NOTDOUTPORTAEQDATA1)	) or
 		(NotDoutPortBEqData1	and	bool2_stdlogic(PMCONDSEL = PMC_NOTDOUTPORTBEQDATA1)	) or
 		(DECDirectDOutNotNull	and	bool2_stdlogic(PMCONDSEL = PMC_DECDIRECTDOUTNOTNULL)	) or
 		(DECDoutPortANotNull	and	bool2_stdlogic(PMCONDSEL = PMC_DECDOUTPORTANOTNULL)	) or
 		(tmpdambit		and	bool2_stdlogic(PMCONDSEL = PMC_TMPDAMBIT)		) or
 		(PswReg(CY)		and	bool2_stdlogic(PMCONDSEL = PMC_PSWREGCY)		) or
 		(nottmpdambit		and	bool2_stdlogic(PMCONDSEL = PMC_NOTTMPDAMBIT)		) or
 		(notcarry		and	bool2_stdlogic(PMCONDSEL = PMC_NOTCARRY)		) or
 		(notaccunull		and	bool2_stdlogic(PMCONDSEL = PMC_NOTACCUNULL)		) or
 		(accunull		and	bool2_stdlogic(PMCONDSEL = PMC_ACCUNULL)		) or
 		(VCC			and	bool2_stdlogic(PMCONDSEL = PMC_VCC)			);

 PCCondV(0) <= bool2_stdlogic(CmdPCiMUX = PM_CALL)				;
 PCCondV(1) <= bool2_stdlogic(CmdPCiMUX = PM_LCALL)				;
 PCCondV(2) <= bool2_stdlogic(CmdPCiMUX = PM_RET)				;
 PCCondV(3) <= bool2_stdlogic(CmdPCiMUX = PM_JMPATAPLUSDPTR)			;
 PCCondV(4) <= bool2_stdlogic(CmdPCiMUX = PM_JMPATAPLUSPC)			;
 PCCondV(5) <= bool2_stdlogic(CmdPCiMUX = PM_JMP and PMCondition = '1')		;
 PCCondV(6) <= bool2_stdlogic(	
				 (CmdPCiMUX = PM_NOOP or 
					 (CmdPCiMUX = PM_JMP and 
						 (PMCondition = '0')
					 )
				 )
			     )							;

-- PCEntryV(0) <= "00000" & Opcode(7 downto 5) & Data1(7 downto 0);

-- 30/06/2004 ACALL+AJMP bug correction (2k page must be current PC 5
-- high-order bits after beeing incremented twice)
 PCEntryV(0) <= PCPLUS2(PcLenght - 1 downto 11) & Opcode(7 downto 5) & Data1(7 downto 0);
 PCEntryV(1) <= Data1 & Data2;
 PCEntryV(2) <= DoutPortA & DoutPortB;
 PCEntryV(3) <= std_logic_vector(unsigned(DPTR) + unsigned(Accu));
 PCEntryV(4) <= std_logic_vector(unsigned(PC) + unsigned(Accu));
 PCEntryV(5) <= PCPLUSOPNBPLUSSIGNEDOFFSET(PC'range);
 PCEntryV(6) <= PCiNext;

 PCi		<= 	scalarprod(PCEntryV(0), PCCondV(0)) or
			scalarprod(PCEntryV(1), PCCondV(1)) or
			scalarprod(PCEntryV(2), PCCondV(2)) or
			scalarprod(PCEntryV(3), PCCondV(3)) or
			scalarprod(PCEntryV(4), PCCondV(4)) or
			scalarprod(PCEntryV(5), PCCondV(5)) or
			scalarprod(PCEntryV(6), PCCondV(6));

-- !!!! PCiNext is read when a jump or a conditional jump with its condition not verified occurs
-- !!!! When an HARDCALL is acknowledged, the LCALL opcode is inserted in the OPCODE flow but its
-- !!!! lenght must not be added to the PC when it is pushed on stack. In that case when HardCallAck
-- !!!! occurs, then PCiNext = PC (the 2nd adder operand is 0), same for OCD when in monitor mode

 PCiNext <= 	std_logic_vector(
					unsigned(PC)
					    +
					unsigned(
							scalarprod(
									std_logic_vector(to_unsigned(OpNb, 2))
									, ((not HardCallRq and not HardCallAck)) and not ClearOpNb
								  )
						)
				);

 PCPLUS2 <= std_logic_vector(unsigned(PC) + 2);
 PCPLUS3 <= std_logic_vector(unsigned(PC) + 3);
 PCPLUSOPNB <= scalarprod(PCPLUS2, bool2_stdlogic(OpNb = 2)) or scalarprod(PCPLUS3, bool2_stdlogic(OpNb = 3));
 PCJMPOFFSET <= scalarprod(DATA1, bool2_stdlogic(PMSelOffsetSrc=PMSELOFFSETDATA1)) or scalarprod(DATA2, bool2_stdlogic(PMSelOffsetSrc=PMSELOFFSETDATA2));
 PCPLUSOPNBPLUSSIGNEDOFFSET <= std_logic_vector(signed('0'&PCPLUSOPNB) + signed(PCJMPOFFSET));

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- PortA
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------


RiAccessOnPortA <= bool2_stdlogic(
					 (CmdStack = ReadIndRi) or
					 (CmdStack = DecIndRi) or
					 (CmdStack = StoreAccuToIndRi) or
					 (CmdStack = ReadRi) or	-- OCD mode (indirect addressing on SFRs)
					 (CmdStack = StoreDataToIndRi) or
					 (CmdStack = XchIndRi) or
					 (CmdStack = XchdIndRi)
				 );

RnAccessOnPortA <= bool2_stdlogic(
					 (CmdStack = ReadRn) or
					 (CmdStack = DecRn) or
					 (CmdStack = XchRn)
				 );

AddPAEV(0) <= "000"&PswReg(RS1)&PswReg(RS0)&Opcode(2 downto 0);
AddPAEV(1) <= "000"&PswReg(RS1)&PswReg(RS0)&"00"&Opcode(0);
AddPAEV(2) <= "0010"&Data1(6 downto 3);
AddPAEV(3) <= StackPointer;
AddPAEV(4) <= Data1;

AddPACondV(0) <= RnAccessOnPortA;

AddPACondV(1) <= RiAccessOnPortA;

AddPACondV(2) <= bool2_stdlogic	(
					(
						(CmdDam = SetBit) or
						(CmdDam = ClrBit) or
						(CmdDam = CplBit) or
						(CmdDam = ReadBit) or
						(CmdDam = StoreCarryToBit)
						
					) and Data1(7) = '0'
				);

AddPACondV(3) <= bool2_stdlogic	(
					(CmdStack = Load8) or
					(CmdStack = Load16)
				);
	       
AddPACondV(4) <= bool2_stdlogic	(
					((CmdDam = DIRECT_LOAD_PORTA) and (Data1(7)  = '0')) or
					((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '0')) or
					((CmdDam = DIRECT_COPY) and (Data1(7)  = '0'))
				);
	       
AddPortAI	<= 	scalarprod(AddPAEV(0), AddPACondV(0)) or
			scalarprod(AddPAEV(1), AddPACondV(1)) or
			scalarprod(AddPAEV(2), AddPACondV(2)) or
			scalarprod(AddPAEV(3), AddPACondV(3)) or
			scalarprod(AddPAEV(4), AddPACondV(4));

 AddPortA <= AddPortAI;

RdEnPortAI <=	bool2_stdlogic (	
					(CmdStack = ReadRn) or
					(CmdStack = DecRn) or
					(CmdStack = XchRn) or
					(CmdStack = ReadIndRi) or 
					(CmdStack = DecIndRi) or
					(CmdStack = StoreAccuToIndRi) or
					(CmdStack = ReadRi) or
					(CmdStack = StoreDataToIndRi) or
					(CmdStack = XchIndRi) or
					(CmdStack = XchdIndRi) or
					(
						(
							(CmdDam = SetBit) or
							(CmdDam = ClrBit) or
							(CmdDam = CplBit) or
							(CmdDam = ReadBit) or
							(CmdDam = StoreCarryToBit)
						) and Data1(7) = '0'
					) or
					(CmdStack = Load8) or
					(CmdStack = Load16) or

					((CmdDam = DIRECT_LOAD_PORTA) and (Data1(7)  = '0')) or
					((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '0')) or
					((CmdDam = DIRECT_COPY) and (Data1(7)  = '0'))
				);
RdEnPortA <= RdEnPortAI;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- PortB
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

AddPBEV(0) <= DoutPortA;
AddPBEV(1) <= "000"&PswReg(RS1)&PswReg(RS0)&"00"&Opcode(0);
AddPBEV(2) <= StackPointerMinusOne;

AddPBCondV(0) <= bool2_stdlogic	(
					(CmdStack = ReadIndRi) or
					(CmdStack = DecIndRi) or
					(CmdStack = XchIndRi) or
					(CmdStack = XchdIndRi)
				);

AddPBCondV(1) <= bool2_stdlogic	(
					(CmdStack = StoreDirectToIndirectRi)
				);

AddPBCondV(2) <= bool2_stdlogic	(
					(CmdStack = Load16)							
				);

 AddPortBI	<=	 scalarprod(AddPBEV(0), AddPBCondV(0)) or
			 scalarprod(AddPBEV(1), AddPBCondV(1)) or
			 scalarprod(AddPBEV(2), AddPBCondV(2));

 AddPortB <= AddPortBI;

RdEnPortBI <= 	bool2_stdlogic	(
					(CmdStack = ReadIndRi) or
					(CmdStack = DecIndRi) or
					(CmdStack = XchIndRi) or
					(CmdStack = XchdIndRi) or
					(CmdStack = StoreDirectToIndirectRi) or
					(CmdStack = Load16)
				);
RdEnPortB <= RdEnPortBI;


--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- PortC
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

StackPointerPlusOne <= std_logic_vector(unsigned(StackPointer) + 1);
StackPointerPlusTwo <= std_logic_vector(unsigned(StackPointer) + 2);
StackPointerMinusOne <= std_logic_vector(unsigned(StackPointer) - 1);
StackPointerMinusTwo <= std_logic_vector(unsigned(StackPointer) - 2);

AddPCEV(0) <= "000"&PswReg(RS1)&PswReg(RS0)&Opcode(2 downto 0);
AddPCEV(1) <= "0010"&Data1(6 downto 3);
AddPCEV(2) <= DoutPortB;
AddPCEV(3) <= DoutPortA;
AddPCEV(4) <= StackPointerPlusOne; -- S4(StackAddSize - 1 downto 0);
-- AddPCEV(5) <= S1;
AddPCEV(6) <= Data2;
AddPCEV(7) <= Data1;

AddPCCondV(0) <= bool2_stdlogic	(
					(CmdStack = DecRn) or
					(CmdStack = StoreAccuToRn) or
					(CmdStack = StoreDataToRn) or
					(CmdStack = XchRn) or
					(CmdStack = StoreDirectToRn)
				);
		
AddPCCondV(1) <= bool2_stdlogic	(
					(
						(CmdDam = SetBit) or
						(CmdDam = ClrBit) or
						(CmdDam = CplBit) or
						(CmdDam = StoreCarryToBit)
					) and Data1(7) = '0'
				);

AddPCCondV(2) <= bool2_stdlogic (
					(CmdStack = StoreDirectToIndirectRi)
				);

AddPCCondV(3) <= bool2_stdlogic	(
					(CmdStack = DecIndRi) or
					(CmdStack = StoreAccuToIndRi) or
					(CmdStack = StoreDataToIndRi) or
					(CmdStack = XchIndRi) or
					(CmdStack = XchdIndRi)
				);

AddPCCondV(4) <= bool2_stdlogic	(
					(CmdStack = Store16) or
               (CmdStack = Store8)
				);

-- AddPCCondV(5) <= bool2_stdlogic (
--					(CmdStack = Store8)
--				);

AddPCCondV(6) <= bool2_stdlogic (
					(CmdDam = DIRECT_COPY) and (Data2(7)  = '0')
				);

AddPCCondV(7) <= bool2_stdlogic (
					((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '0')) or
					((CmdDam = DIRECT_STORE_PORTC) and (Data1(7)  = '0'))
				);

AddPortCI	<=	 scalarprod(AddPCEV(0), AddPCCondV(0)) or
			 scalarprod(AddPCEV(1), AddPCCondV(1)) or
			 scalarprod(AddPCEV(2), AddPCCondV(2)) or
			 scalarprod(AddPCEV(3), AddPCCondV(3)) or
			 scalarprod(AddPCEV(4), AddPCCondV(4)) or
--			 scalarprod(AddPCEV(5), AddPCCondV(5)) or
			 scalarprod(AddPCEV(6), AddPCCondV(6)) or
			 scalarprod(AddPCEV(7), AddPCCondV(7));

AddPortC <= AddPortCI;

Data1BitMask <= scalarprod("10000000",     Data1(2) and     Data1(1) and     Data1(0)) or
		scalarprod("01000000",     Data1(2) and     Data1(1) and not Data1(0)) or
		scalarprod("00100000",     Data1(2) and not Data1(1) and     Data1(0)) or
		scalarprod("00010000",     Data1(2) and not Data1(1) and not Data1(0)) or
		scalarprod("00001000", not Data1(2) and     Data1(1) and     Data1(0)) or
		scalarprod("00000100", not Data1(2) and     Data1(1) and not Data1(0)) or
		scalarprod("00000010", not Data1(2) and not Data1(1) and     Data1(0)) or
		scalarprod("00000001", not Data1(2) and not Data1(1) and not Data1(0));


-- stackbitisnull <= 	not DoutPortA(MyPtr8);
stackbitisnull <= 	not (or_reduce(Data1BitMask and DoutPortA));

--DINPCEV(0) <= DoutPortA and (not GenMask(MyPtr8));
DINPCEV(0) <= DoutPortA and (not Data1BitMask);
--DINPCEV(1) <= DoutPortA or GenMask(MyPtr8);
DINPCEV(1) <= DoutPortA or Data1BitMask;
DINPCEV(2) <= StackDin;
DINPCEV(3) <= Accu;
DINPCEV(4) <= Data1;
DINPCEV(5) <= DoutPortB(7 downto 4) & Accu(3 downto 0);
DINPCEV(6) <= PCiNext(7 downto 0);
DINPCEV(7) <= DirectDOut;
DINPCEV(8) <= DirectDin;

DINPCCondV(0) <= bool2_stdlogic	(
					(
						(CmdDam = ClrBit) or
						(CmdDam = CplBit and (stackbitisnull = '0')) or
						(CmdDam = StoreCarryToBit and PswReg(CY) = '0')
					) and Data1(7) = '0'
				);

DINPCCondV(1) <= bool2_stdlogic (
					 (
						 (CmdDam = SetBit) or
						 (CmdDam = CplBit and stackbitisnull = '1') or
						 (CmdDam = StoreCarryToBit and PswReg(CY) = '1')
					 ) and Data1(7) = '0'
				);

DINPCCondV(2) <= bool2_stdlogic (
					(CmdStack = DecRn) or
					(CmdStack = DecIndRi)
				);

DINPCCondV(3) <= bool2_stdlogic (
					(CmdStack = StoreAccuToRn) or
					(CmdStack = StoreAccuToIndRi) or
					(CmdStack = XchRn) or
					(CmdStack = XchIndRi)
				);

DINPCCondV(4) <= bool2_stdlogic (
					(CmdStack = StoreDataToRn) or
					(CmdStack = StoreDataToIndRi)
				);

DINPCCondV(5) <= bool2_stdlogic (
					(CmdStack = XchdIndRi)
				);

DINPCCondV(6) <= bool2_stdlogic (
					(CmdStack = Store16)
				);

DINPCCondV(7) <= bool2_stdlogic (
					(CmdStack = StoreDirectToRn) or
					(CmdStack = Store8) or
					(CmdStack = StoreDirectToIndirectRi)
				);

DINPCCondV(8) <= bool2_stdlogic (
					((CmdDam = DIRECT_COPY) and (Data2(7)  = '0')) or
					((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '0')) or
					((CmdDam = DIRECT_STORE_PORTC) and (Data1(7)  = '0'))
				);

DinPortCI	<=	 scalarprod(DINPCEV(0), DINPCCondV(0)) or
			 scalarprod(DINPCEV(1), DINPCCondV(1)) or
			 scalarprod(DINPCEV(2), DINPCCondV(2)) or
			 scalarprod(DINPCEV(3), DINPCCondV(3)) or
			 scalarprod(DINPCEV(4), DINPCCondV(4)) or
			 scalarprod(DINPCEV(5), DINPCCondV(5)) or
			 scalarprod(DINPCEV(6), DINPCCondV(6)) or
			 scalarprod(DINPCEV(7), DINPCCondV(7)) or
			 scalarprod(DINPCEV(8), DINPCCondV(8));

DinPortC <= DinPortCI;

WePortCI <=	bool2_stdlogic	(
					(
						(
							(CmdDam = SetBit) or
							(CmdDam = ClrBit) or
							(CmdDam = CplBit) or
							(CmdDam = StoreCarryToBit)
						) and Data1(7) = '0'
					) or
					(CmdStack = DecRn) or
					(CmdStack = DecIndRi) or
					(CmdStack = StoreAccuToRn) or
					(CmdStack = StoreAccuToIndRi) or
					(CmdStack = XchRn) or
					(CmdStack = XchIndRi) or
					(CmdStack = StoreDataToRn) or
					(CmdStack = StoreDataToIndRi) or 
					(CmdStack = XchdIndRi) or
					(CmdStack = Store16) or
					(CmdStack = StoreDirectToRn) or
					(CmdStack = Store8) or
					(CmdStack = StoreDirectToIndirectRi) or

					((CmdDam = DIRECT_COPY) and (Data2(7)  = '0')) or
					((CmdDam = DIRECT_READ_MODIFY_WRITE_PORTAC) and (Data1(7)  = '0')) or
					((CmdDam = DIRECT_STORE_PORTC) and (Data1(7)  = '0'))
				);
WePortC <= WePortCI;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- PortD
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

-- AddPortDI <=	scalarprod(StackPointerPlusTwo(StackAddSize - 1 downto 0), bool2_stdlogic(CmdStack = Store16));	-- @D <= SP+2  
AddPortDI <= StackPointerPlusTwo(StackAddSize - 1 downto 0);
AddPortD <= AddPortDI;
									

-- DinPortDI <=	scalarprod2(PCiNext(PcLenght - 1 downto 8), CmdStack = Store16);
DinPortDI <=	PCiNext(PcLenght - 1 downto 8);
DinPortD  <=    DinPortDI;

WePortDI <=	bool2_stdlogic	(
					(CmdStack = Store16)
				);
WePortD <= WePortDI;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--
-- ALU MUX
--
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
	

Op1 <=	scalarprod2(Accu,		CMDOP1SEL = OP1ACCU) or
--	scalarprod2(DirectDout,		CMDOP1SEL = OP1DIRDOUT) or
	scalarprod2(DoutPortA,	CMDOP1SEL = OP1DOUTPORTA) or
	scalarprod2(DoutPortB,		CMDOP1SEL = OP1DOUTPORTB);
--	scalarprod2(StackPointer,	CMDOP1SEL = OP1STACKPOINTER);
	
	
Op2 <=	scalarprod2(DirectDout,		CMDOP2SEL = OP2DIRDOUT) or
	scalarprod2(DoutPortA,	CMDOP2SEL = OP2DOUTPORTA) or
	scalarprod2(DoutPortB,		CMDOP2SEL = OP2DOUTPORTB) or
	scalarprod2(Data1,		CMDOP2SEL = OP2DATA1) or
--	scalarprod2("00000010",		CMDOP2SEL = OP2TWO) or
--	scalarprod2("11111110",		CMDOP2SEL = OP2TWOHUNDREDFIFTYFOUR) or
--	scalarprod2(Breg,		CMDOP2SEL = OP2BREG) or
	scalarprod2("01100110",		CMDOP2SEL = OP2SIXTYSIX) or
	scalarprod2("00000110",		CMDOP2SEL = OP2SIX) or
	scalarprod2("01100000",		CMDOP2SEL = OP2SIXTY);

AccuI <=	
      scalarprod2(S1_DIV,						CMDACCUISEL = ACCUIS1DIV) or
      scalarprod2(S1,						CMDACCUISEL = ACCUIS1) or
		scalarprod2(DirectDout,					CMDACCUISEL = ACCUIEQDIRECTDOUT) or
		scalarprod2(DoutPortA,				CMDACCUISEL = ACCUIEQDOUTPORTA) or
		scalarprod2(DoutPortB,					CMDACCUISEL = ACCUIEQDOUTPORTB) or
		scalarprod2(Data1,					CMDACCUISEL = ACCUIEQDATA1) or
		scalarprod2(Accu and DirectDout,			CMDACCUISEL = ACCUIEQACCUANDDIRECTDOUT) or
		scalarprod2(Accu and DoutPortA,			CMDACCUISEL = ACCUIEQACCUANDDOUTPORTA) or
		scalarprod2(Accu and DoutPortB,				CMDACCUISEL = ACCUIEQACCUANDDOUTPORTB) or
		scalarprod2(Accu and Data1,				CMDACCUISEL = ACCUIEQACCUANDDATA1) or
		scalarprod2(Accu or DirectDOut,				CMDACCUISEL = ACCUIEQACCUORDIRECTDOUT) or
		scalarprod2(Accu or DoutPortA,			CMDACCUISEL = ACCUIEQACCUORDOUTPORTA) or
		scalarprod2(Accu or DoutPortB,				CMDACCUISEL = ACCUIEQACCUORDOUTPORTB) or
		scalarprod2(Accu or Data1,				CMDACCUISEL = ACCUIEQACCUORDATA1) or
		scalarprod2(Accu xor DirectDOut,			CMDACCUISEL = ACCUIEQACCUXORDIRECTDOUT) or
		scalarprod2(Accu xor DoutPortA,			CMDACCUISEL = ACCUIEQACCUXORDOUTPORTA) or
		scalarprod2(Accu xor Data1,				CMDACCUISEL = ACCUIEQACCUXORDATA1) or
		scalarprod2(Accu xor DoutPortB,				CMDACCUISEL = ACCUIEQACCUXORDOUTPORTB) or
		scalarprod2(Accu(6 downto 0)&Accu(7),			CMDACCUISEL = ACCUIRL) or
		scalarprod2(Accu(6 downto 0) & PswReg(CY),		CMDACCUISEL = ACCUIRLC) or
		scalarprod2(Accu(0) & Accu(7 downto 1),			CMDACCUISEL = ACCUIRR) or
		scalarprod2(PswReg(CY) & Accu(7 downto 1),		CMDACCUISEL = ACCUIRRC) or
		scalarprod2(Accu(3 downto 0)&Accu(7 downto 4),		CMDACCUISEL = ACCUISWAP) or
		scalarprod2(Accu(7 downto 4)&DoutPortB(3 downto 0),	CMDACCUISEL = ACCUIXCH) or
		scalarprod2(not Accu,					CMDACCUISEL = ACCUIEQCPL) or
		scalarprod2("00000000",					CMDACCUISEL = ACCUIEQNULL) or
		scalarprod2(MovcData,					CMDACCUISEL = ACCUIEQMOVCDATA) or
		scalarprod2(XRamDOut,					CMDACCUISEL = ACCUIEQXRAMDOUT) or
		scalarprod2(Accu,					CMDACCUISEL = ACCUI_NONE);

DirectDIn <=	scalarprod2(DirectDOut and Accu, 	CMDDIRECTDINSEL = DIRECTDINEQDIRECTDOUTANDACCU) or
		scalarprod2(DirectDOut or Accu, 	CMDDIRECTDINSEL = DIRECTDINEQDIRECTDOUTORACCU) or
		scalarprod2(DirectDOut or Data2, 	CMDDIRECTDINSEL = DIRECTDINEQDIRECTDOUTORDATA2) or
		scalarprod2(DirectDOut and Data2, 	CMDDIRECTDINSEL = DIRECTDINEQDIRECTDOUTANDDATA2) or
		scalarprod2(DirectDOut xor Data2, 	CMDDIRECTDINSEL = DIRECTDINEQDIRECTDOUTXORDATA2) or
		scalarprod2(DirectDOut xor Accu, 	CMDDIRECTDINSEL = DIRECTDINEQDIRECTDOUTXORACCU) or
--		scalarprod2(S1, 			CMDDIRECTDINSEL = DIRECTDINS1) or
      scalarprod2(INCDirectDOut, 			CMDDIRECTDINSEL = DIRECTDININCDIRECTDOUT) or
		scalarprod2(Accu, 			CMDDIRECTDINSEL = DIRECTDINACCU) or
		scalarprod2(DECDirectDOut, 		CMDDIRECTDINSEL = DIRECTDINDECDIRECTDOUT) or
		scalarprod2(DirectDOut, 		CMDDIRECTDINSEL = DIRECTDINDIRECTDOUT) or
		scalarprod2(DoutPortA, 		CMDDIRECTDINSEL = DIRECTDINDOUTPORTA) or
		scalarprod2(DoutPortB, 			CMDDIRECTDINSEL = DIRECTDINDOUTPORTB) or
		scalarprod2(Data2, 			CMDDIRECTDINSEL = DIRECTDINDATA2);

 
--Op3 <=		scalarprod2(Accu, 		CMDOP3SEL = OP3ACCU) or
----		scalarprod2(DirectDOut, 	CMDOP3SEL = OP3DIRECTDOUT) or
----		scalarprod2(DoutPortA, 	CMDOP3SEL = OP3DOUTPORTA) or
--		scalarprod2(DoutPortB, 		CMDOP3SEL = OP3DOUTPORTB); -- or
----		scalarprod2(StackPointer, 	CMDOP3SEL = OP3STACKPOINTER);
				
StackDin <=	-- scalarprod2(S1, 		CMDSTACKDINSEL = STACKDINS1) or
      scalarprod2(INCDoutPortA, 	CMDSTACKDINSEL = STACKDININCDOUTPORTA) or
      scalarprod2(INCDoutPortB, 	CMDSTACKDINSEL = STACKDININCDOUTPORTB) or
      scalarprod2(DECDoutPortA, 	CMDSTACKDINSEL = STACKDINDECDOUTPORTA) or
      scalarprod2(DECDoutPortB, 	CMDSTACKDINSEL = STACKDINDECDOUTPORTB);
			
StackPointerII	<=    scalarprod2(StackPointerPlusOne(StackAddSize - 1 downto 0),     CMDSTACKPOINTERSEL = CMDSTACKPOINTERPLUSONE) or
                     scalarprod2(StackPointerPlusTwo(StackAddSize - 1 downto 0),     CMDSTACKPOINTERSEL = CMDSTACKPOINTERPLUSTWO) or
                     scalarprod2(StackPointerMinusOne(StackAddSize - 1 downto 0),    CMDSTACKPOINTERSEL = CMDSTACKPOINTERMINUSONE) or
                     scalarprod2(StackPointerMinusTwo(StackAddSize - 1 downto 0),    CMDSTACKPOINTERSEL = CMDSTACKPOINTERMINUSTWO) or
                     scalarprod2(StackPointer,                                       CMDSTACKPOINTERSEL = CMDSTACKPOINTER_NONE);
StackPointerI   <= 	StackPointerII;


Op5 <=		scalarprod2(Accu,		CMDOP5SEL = OP5ACCU) or
		scalarprod2(DoutPortA,	CMDOP5SEL = OP5DOUTPORTA) or
		scalarprod2(DoutPortB,		CMDOP5SEL = OP5DOUTPORTB);
	

Op6 <=		scalarprod2(DirectDOut,		CMDOP6SEL = OP6DIRECTDOUT) or
		scalarprod2(Data1,		CMDOP6SEL = OP6DATA1);

DPTRI <=	scalarprod2(std_logic_vector(unsigned(Dptr) + 1),	CMDDPTRISEL = CMDDPTRIINC) or
		scalarprod2(Data1 & Data2,				CMDDPTRISEL = CMDDPTRIDATA16) or
		scalarprod2(DPTR,					CMDDPTRISEL = CMDDPTRI_NONE);

XRamDIn <= Accu;

process(CMDXRAMADDRESS, Dptr, DoutPortA, PDataHigh)
begin
 case CMDXRAMADDRESS is
  when CMDXRDPTR => 
   XRamAddress <= Dptr(XRamAddress'high downto 0);
  when CMDXRDOUTPORTA => 
   XRamAddress(XRamAddress'high downto 8) <= PDataHigh(XRamAddBusSize - 9 downto 0);
   XRamAddress(7 downto 0) <= DoutPortA;
 end case;
end process;

BregI <=	scalarprod2(S2,         CMDBREGISEL = BREGIS2) or
         scalarprod2(S2_DIV,     CMDBREGISEL = BREGIS2DIV) or
	   	scalarprod2(Breg,	      CMDBREGISEL = BREGI_NONE);

end rtl;
