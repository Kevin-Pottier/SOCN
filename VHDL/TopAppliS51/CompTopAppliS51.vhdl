-- Library Declaration

Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgCompS51Cpu.all;
 use LibS51Cpu.PkgPsw.all;  
 use LibS51Cpu.PkgDAX.all;
-- use LibS51Cpu.PkgStack.all;
Library LibRegisterFile8;
 use LibRegisterFile8.PkgCompRegisterFile8.all;
Library LibInternalRom16;
 use LibInternalRom16.PkgCompInternalRom16.all;
-- synopsys translate_off
Library LibGpioCtrl;
 use LibGpioCtrl.PkgCompGpioCtrl.all;
-- synopsys translate_on 
Library LibSfrDecoder;
 use LibSfrDecoder.PkgCompSfrDecoder.all;
Library LibInternalRam;
 use LibInternalRam.PkgCompInternalRam.all;
-- synopsys translate_off
--Library LibS51Uart;
-- use LibS51Uart.PkgCompS51Uart.all;
Library LibPkgS51ItCtrl;
 use LibPkgS51ItCtrl.PkgS51ItCtrl.all;
Library LibS51ItCtrl;
 use LibS51ItCtrl.PkgCompS51ItCtrl.all;
-- synopsys translate_on

-- Components Declaration

package PkgCompTopAppliS51 is

Component TopAppliS51
-- -- synopsys translate_off 
-- Generic(
--  Rom0FileName 		: string -- ;
-- -- Rom1FileName		: string
-- );
-- -- synopsys translate_on 
Port(
 RstB			: in    std_logic;  
 Ck			: in    std_logic;
 CpuIdleRq		: in    std_logic;

 P			: out	std_logic_vector(7 downto 0);

 -- UART PADS 
 RxD			: in	std_logic;
 TxD			: out	std_logic;

 -- TESTMODE
 TMLpc_S51ExecCodeEn	: in	std_logic;
 TMLpc_AddH		: in	std_logic_vector(7 downto 0);
 TMLpc_AddL		: in	std_logic_vector(7 downto 0);

 -- EXTRA INFO FOR EXTERNAL MONITORING (Now handled by testbench)
 DaxDplState		: out	std_logic;
 DaxDplCpuIdleAck	: out   std_logic;					-- IDLE mode
 DaxDplHardCallRq	: out   std_logic;					-- Interruptions generate LCALL
 DaxDplHardCallAck	: out   std_logic;
 DaxDplHardCallPC	: out   std_logic_vector(PcLenght - 1 downto 0);
 DaxDplPC		: out	std_logic_vector(PcLenght - 1 downto 0); 
 DaxDplStackPointer	: out	std_logic_vector(StackAddSize - 1 downto 0);
 DaxDplAccu		: out	std_logic_vector(AccuRegSize - 1 downto 0);
 DaxDplDptr		: out	std_logic_vector(15 downto 0); 
 DaxDplBreg		: out	std_logic_vector(AccuRegSize - 1 downto 0);
 DaxDplPswReg		: out	std_logic_vector(PswRegSize - 1 downto 0);
 DaxDplSrcSfrAddress	: out	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DaxDplDstSfrAddress	: out	std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DaxDplSfrDin		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 DaxDplSfrDout		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
 DaxDplReadSfr		: out	std_logic;
 DaxDplWriteSfr		: out	std_logic;
 DaxDplAddPortA		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDoutPortA	: out	std_logic_vector(7 downto 0);
 DaxDplRdEnPortA	: out   std_logic; 
 DaxDplAddPortB		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDoutPortB	: out	std_logic_vector(7 downto 0);
 DaxDplRdEnPortB	: out   std_logic;  
 DaxDplAddPortC		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDinPortC		: out	std_logic_vector(7 downto 0);
 DaxDplWePortC		: out   std_logic;  
 DaxDplAddPortD		: out	std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDinPortD		: out	std_logic_vector(7 downto 0);
 DaxDplWePortD		: out   std_logic; 
 DaxDplXRamAddress	: out	std_logic_vector(XRamAddBusSize - 1 downto 0);
 DaxDplXRamDOut		: out	std_logic_vector(XRamDataBusSize - 1 downto 0);
 DaxDplXRamDIn		: out	std_logic_vector(XRamDataBusSize - 1 downto 0);
 DaxDplXRamClk		: out	std_logic;
 DaxDplXRamME		: out	std_logic;
 DaxDplXRamWE		: out	std_logic; 
 DaxDplDisOpcodeFetch	: out   std_logic;
 DaxDplOpcode		: out	std_logic_vector(OpWord - 1 downto 0);
 DaxDplData1		: out	std_logic_vector(OpWord - 1 downto 0);
 DaxDplData2		: out	std_logic_vector(OpWord - 1 downto 0);
 DaxDplBWen		: out   std_logic;
 DaxDplAccWen		: out   std_logic;
 DaxDplPswWen		: out   std_logic;
 DaxDplSpWen		: out   std_logic;
 DaxDplDplWen		: out   std_logic;
 DaxDplDphWen		: out   std_logic;
 DaxDpliRstB        : out   std_logic
-- DaxDplCacheR0ptr  	: out	std_logic_vector(RegFileAddSize - 1 downto 0);
-- DaxDplCacheR1ptr	: out	std_logic_vector(RegFileAddSize - 1 downto 0);
-- DaxDplCacheR0read  	: out	std_logic;
-- DaxDplCacheR1read	: out	std_logic;
-- DaxDplCacheR0		: out	std_logic_vector(7 downto 0);
-- DaxDplCacheR1		: out	std_logic_vector(7 downto 0)
);
End Component ;
End PkgCompTopAppliS51 ;

