
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgALU.all;
-- use LibS51Cpu.PkgStack.all;
package PkgDAX is

 type T_MASK8 is array (7 downto 0) of std_logic_vector(7 downto 0);
 type T_PCiMUX is (PM_NOOP, PM_CALL, PM_LCALL, PM_RET, PM_JMP, PM_JMPATAPLUSDPTR, PM_JMPATAPLUSPC);
 type T_CmdStack is (STACK_NOOP, ReadRn, DecRn, XchRn, ReadIndRi, DecIndRi, StoreAccuToIndRi, StoreDataToIndRi,
 			XchIndRi, XchdIndRi, Load8, Load16, StoreDirectToIndirectRi, StoreDirectToRn, StoreDataToRn,
			StoreAccuToRn, Store8, Store16,
			ReadRi -- OCD mode : indirect addressing on SFRs
			);
 type T_DAMCMD is (DAM_NOOP, DIRECT_LOAD_PORTA, DIRECT_READ_MODIFY_WRITE_PORTAC, DIRECT_STORE_PORTC, DIRECT_COPY,
 			ClrBit, SetBit, CplBit, ReadBit, StoreCarryToBit, 
			WriteDirectDintoIndRi, ReadSfrIndRi -- OCD mode : indirect addressing on SFRs
			);
 
 type T_CMDOP1SEL is (OP1_NONE, OP1ACCU, OP1DIRDOUT, OP1DOUTPORTA, OP1DOUTPORTB, OP1STACKPOINTER);
 --type T_CMDOP2SEL is (OP2_NONE, OP2DIRDOUT, OP2BREG, OP2DOUTPORTA, OP2DOUTPORTB, OP2DATA1, OP2TWO, OP2TWOHUNDREDFIFTYFOUR, OP2SIXTY, OP2SIX, OP2SIXTYSIX);
 type T_CMDOP2SEL is (OP2_NONE, OP2DIRDOUT, OP2DOUTPORTA, OP2DOUTPORTB, OP2DATA1, OP2SIXTY, OP2SIX, OP2SIXTYSIX);
 type T_CMDACCUISEL is (ACCUI_NONE, ACCUIS1, ACCUIS1DIV, ACCUIEQDIRECTDOUT, ACCUIEQDOUTPORTA, ACCUIEQDOUTPORTB,
 			ACCUIEQACCUANDDIRECTDOUT, ACCUIEQACCUANDDOUTPORTA, ACCUIEQACCUANDDATA1,
			ACCUIEQACCUORDIRECTDOUT, ACCUIEQACCUORDOUTPORTA, ACCUIEQACCUORDOUTPORTB,
			ACCUIEQACCUORDATA1, ACCUIEQACCUXORDIRECTDOUT, ACCUIEQACCUXORDOUTPORTA,
			ACCUIEQACCUXORDATA1, ACCUIEQACCUXORDOUTPORTB, ACCUIRL, ACCUIRLC, ACCUIRR,
			ACCUIRRC, ACCUISWAP, ACCUIXCH, ACCUIEQCPL, ACCUIEQNULL, ACCUIEQMOVCDATA,
			ACCUIEQXRAMDOUT, ACCUIEQACCUANDDOUTPORTB, ACCUIEQDATA1);
 type T_CMDDIRECTDINSEL is (DIRECTDIN_NONE, DIRECTDINEQDIRECTDOUTANDACCU, DIRECTDINEQDIRECTDOUTORACCU,
 			DIRECTDINEQDIRECTDOUTORDATA2, DIRECTDINEQDIRECTDOUTXORDATA2, DIRECTDINEQDIRECTDOUTANDDATA2, DIRECTDINEQDIRECTDOUTXORACCU,
			DIRECTDINACCU, DIRECTDINDECDIRECTDOUT, DIRECTDINDIRECTDOUT, DIRECTDININCDIRECTDOUT,
			DIRECTDINDOUTPORTA, DIRECTDINDOUTPORTB, DIRECTDINDATA2);
 
 --type T_CMDOP3SEL is (OP3_NONE, OP3ACCU, OP3DIRECTDOUT, OP3DOUTPORTA, OP3DOUTPORTB, OP3STACKPOINTER);
 -- type T_CMDOP3SEL is (OP3_NONE, OP3ACCU, OP3DOUTPORTB);
 type T_CMDSTACKDINSEL is (STACKDIN_NONE, STACKDINDECDOUTPORTA, STACKDINDECDOUTPORTB, STACKDININCDOUTPORTA, STACKDININCDOUTPORTB);
 type T_CMDSTACKPOINTERSEL is (CMDSTACKPOINTER_NONE, CMDSTACKPOINTERPLUSONE, CMDSTACKPOINTERPLUSTWO, CMDSTACKPOINTERMINUSONE, CMDSTACKPOINTERMINUSTWO);
 type T_CMDOP5SEL is (OP5ACCU_NONE, OP5ACCU, OP5DOUTPORTA, OP5DOUTPORTB);
 type T_CMDOP6SEL is (OP6_NONE, OP6DIRECTDOUT, OP6DATA1);
-- type T_CMDOP7SEL is (OP7_NONE, OP7ACCU);
 type T_CMDDPTRISEL is (CMDDPTRI_NONE, CMDDPTRIINC, CMDDPTRIDATA16);
 type T_CMDXRAMDINSEL is (CMDXRAMDIN_NONE, CMDXRAMDINEQACCU, CMDDPTRIDATA16);
-- type T_CMDXRAMADDRESS is (XRAMADDRESS_NONE, CMDXRDPTR, CMDXRDOUTPORTA);
 type T_CMDXRAMADDRESS is (CMDXRDPTR, CMDXRDOUTPORTA);
 type T_CMDBREGISEL is (BREGI_NONE, BREGIS2,BREGIS2DIV);
-- type T_CMDOP8SEL is (OP8_NONE, OP8BREG);
 
 type T_PMSelOffsetSrc is (PMSELOFFSETNONE, PMSELOFFSETDATA1, PMSELOFFSETDATA2);
 
 constant MaxNbCycles	: integer := 1;

 constant GenMask 	: T_MASK8 := 	(
 					   "10000000",
 					   "01000000",
 					   "00100000",
 					   "00010000",
 					   "00001000",
 					   "00000100",
 					   "00000010",
 					   "00000001"
					);																																			

 type T_PMCONDSEL is (	PMC_NULL, PMC_NOTACCUEQDIRECTDOUT, PMC_NOTACCUEQDATA1,
			PMC_NOTDOUTPORTAEQDATA1, PMC_NOTDOUTPORTBEQDATA1, PMC_DECDIRECTDOUTNOTNULL,
			PMC_DECDOUTPORTANOTNULL, PMC_TMPDAMBIT, PMC_PSWREGCY, PMC_NOTTMPDAMBIT,
			PMC_NOTCARRY, PMC_NOTACCUNULL, PMC_ACCUNULL, PMC_VCC);

 type T_OPNBSEL is (OPNB_NULL, OPNB_ONEBYTE, OPNB_TWOBYTES, OPNB_THREEBYTES);
 
-- procedure CallAlu2 	( 
--			  signal AluOp1:  out std_logic_vector(OpSize - 1 downto 0);
--			  signal DataOp1: in  std_logic_vector(OpSize - 1 downto 0);
--
--			  signal AluOp2:  out std_logic_vector(OpSize - 1 downto 0);
--			  signal DataOp2: in  std_logic_vector(OpSize - 1 downto 0);
--
--			  signal Cmd:     out AluCmd;
--			  constant DataCmd:   AluCmd;
--
--			  signal AluRes:  out std_logic_vector(OpSize - 1 downto 0);			  			  
--			  signal DataRes: in  std_logic_vector(OpSize - 1 downto 0)
--			);
--
-- procedure CallAlu1 	( 
--			  signal AluOp1:  out std_logic_vector(OpSize - 1 downto 0);
--			  signal DataOp1: in  std_logic_vector(OpSize - 1 downto 0);
--
--			  signal Cmd:     out AluCmd;
--			  constant DataCmd:   AluCmd;
--
--			  signal AluRes:  out std_logic_vector(OpSize - 1 downto 0);			  			  
--			  signal DataRes: in  std_logic_vector(OpSize - 1 downto 0)
--			);
--
--
-- procedure ComputeNextAddress	(
--					signal CmdPCiMUX : out T_PCiMUX;
--					constant PCIMUXCMD : T_PCiMUX;
-- 					signal Op1 : out std_logic_vector(OpSize - 1 downto 0);
--					signal Op2 : out std_logic_vector(OpSize - 1 downto 0);
--					signal CmdAlu : out AluCmd;
--					constant Commande : AluCmd;
--					signal PC : in std_logic_vector(PcLenght - 1 downto 0);
--					signal Offset : in std_logic_vector(OpSize - 1 downto 0);
--					signal OffsetPlusNbBytes : in std_logic_vector(OpSize - 1 downto 0);
--					constant NbBytes : integer;
--					signal OffsetPlusNbBytesCarry : in std_logic;		
--					signal NegativeJumpOut : out std_logic;
--					signal ConditionIn : in std_logic;
--					signal ConditionOut : out std_logic					
--				);
--
-- procedure ComputeNextAddress2	(
--					signal CmdPCiMUX : out T_PCiMUX;
--					constant PCIMUXCMD : T_PCiMUX;
--					signal PC : in std_logic_vector(PcLenght - 1 downto 0);
--					signal OffsetPlusNbBytes : in std_logic_vector(OpSize - 1 downto 0);
--					signal OffsetPlusNbBytesCarry : in std_logic;
--					signal NegativeJumpIn : in std_logic;
--					signal NegativeJumpOut : out std_logic;
--					signal ConditionIn : in std_logic;
--					signal ConditionOut : out std_logic					
--				);
--
-- procedure DirectAddressMux	(
--					constant CmdDamIn	: T_DAMCMD;
--					signal CmdDamOut	: out	T_DAMCMD
--				);
--
-- procedure ComputeOffsetPlusNbBytes 	(
-- 						signal OPNBop1 : out std_logic_vector(OpSize downto 0);
-- 						signal valueop1: in  std_logic_vector(OpSize - 1 downto 0);
-- 						signal OPNBop2 : out std_logic_vector(1 downto 0);
---- 						signal valueop2: in  std_logic_vector(OpSize - 1 downto 0)
-- 						constant valueop2: integer range 0 to 3
--					);
								
end PkgDAX;

package body PkgDAX is

-- procedure CallAlu2 	( 
--			  signal AluOp1:  out std_logic_vector(OpSize - 1 downto 0);
--			  signal DataOp1: in  std_logic_vector(OpSize - 1 downto 0);
--
--			  signal AluOp2:  out std_logic_vector(OpSize - 1 downto 0);
--			  signal DataOp2: in  std_logic_vector(OpSize - 1 downto 0);
--
--			  signal Cmd:     out AluCmd;
--			  constant DataCmd:   AluCmd;
--
--			  signal AluRes:  out std_logic_vector(OpSize - 1 downto 0);			  			  
--			  signal DataRes: in  std_logic_vector(OpSize - 1 downto 0)
--			) is
-- begin
--  AluOp1 <= DataOp1;
--  AluOp2 <= DataOp2;
--  
--  Cmd <= DataCmd;
--  AluRes <= DataRes;   
-- end CallAlu2;
--
-- procedure CallAlu1 	( 
--			  signal AluOp1:  out std_logic_vector(OpSize - 1 downto 0);
--			  signal DataOp1: in  std_logic_vector(OpSize - 1 downto 0);
--
--			  signal Cmd:     out AluCmd;
--			  constant DataCmd:   AluCmd;
--
--			  signal AluRes:  out std_logic_vector(OpSize - 1 downto 0);			  			  
--			  signal DataRes: in  std_logic_vector(OpSize - 1 downto 0)
--			) is
-- begin
--  AluOp1 <= DataOp1;
--  
--  Cmd <= DataCmd;
--  AluRes <= DataRes;   
-- end CallAlu1;
--
-- procedure ComputeNextAddress	(
--					signal CmdPCiMUX : out T_PCiMUX;
--					constant PCIMUXCMD : T_PCiMUX;
-- 					signal Op1 : out std_logic_vector(OpSize - 1 downto 0);
--					signal Op2 : out std_logic_vector(OpSize - 1 downto 0);
--					signal CmdAlu : out AluCmd;
--					constant Commande : AluCmd;
--					signal PC : in std_logic_vector(PcLenght - 1 downto 0);
--					signal Offset : in std_logic_vector(OpSize - 1 downto 0);
--					signal OffsetPlusNbBytes : in std_logic_vector(OpSize - 1 downto 0);
--					constant NbBytes : integer;
--					signal OffsetPlusNbBytesCarry : in std_logic;		
--					signal NegativeJumpOut : out std_logic;
--					signal ConditionIn : in std_logic;
--					signal ConditionOut : out std_logic					
--				) is
-- begin
--   Op1 <= Offset;
--   Op2 <= std_logic_vector(to_unsigned(NbBytes, OpWord));
--   CmdAlu <= Commande;   
--
--   ComputeNextAddress2(CmdPCiMUX, PCIMUXCMD, PC, OffsetPlusNbBytes, OffsetPlusNbBytesCarry, Offset(7), NegativeJumpOut, ConditionIn, ConditionOut);
--
--      
-- end ComputeNextAddress;
--
---- Best results with AMBIT when MUX instanciated in each DAX subsection
-- procedure ComputeNextAddress2	(
--					signal CmdPCiMUX : out T_PCiMUX;
--					constant PCIMUXCMD : T_PCiMUX;
--					signal PC : in std_logic_vector(PcLenght - 1 downto 0);
--					signal OffsetPlusNbBytes : in std_logic_vector(OpSize - 1 downto 0);
--					signal OffsetPlusNbBytesCarry : in std_logic;		
--					signal NegativeJumpIn : in std_logic;
--					signal NegativeJumpOut : out std_logic;
--					signal ConditionIn : in std_logic;
--					signal ConditionOut : out std_logic					
--				) is
-- begin
--   CmdPCiMUX <= PCIMUXCMD;
--   NegativeJumpOut <= NegativeJumpIn;
--   ConditionOut <= ConditionIn;   
-- end ComputeNextAddress2;
-- 
---- Best results with AMBIT when explicit logic share with direct addressing mux
-- procedure DirectAddressMux	(
--					constant CmdDamIn	: T_DAMCMD;
--					signal CmdDamOut	: out	T_DAMCMD
--				) is
-- begin
--
--  CmdDamOut <= CmdDamIn;
--  
-- end DirectAddressMux;  
--
-- procedure ComputeOffsetPlusNbBytes 	(
-- 						signal OPNBop1 : out std_logic_vector(OpSize downto 0);
-- 						signal valueop1: in  std_logic_vector(OpSize - 1 downto 0);
-- 						signal OPNBop2 : out std_logic_vector(1 downto 0);
-- 						constant valueop2 : integer range 0 to 3
--					) is
-- begin
--  OPNBop1 <= '0'&valueop1;
--  OPNBop2 <= std_logic_vector(to_unsigned(valueop2, 2));
-- end ComputeOffsetPlusNbBytes;
    
end;

