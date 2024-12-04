
Library IEEE;
 Use IEEE.std_logic_1164.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgPsw.all;
 use LibS51Cpu.PkgCompDAXDisplay.all; 
 use LibS51Cpu.PkgDAX.all;
Library LibTopAppliS51;
 Use LibTopAppliS51.PkgCompTopAppliS51.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkg;
 use LibPkg.utils.all; 
Library LibNetlist;
Library LibTestBench;
  use LibTestBench.PkgCompRDac.all; 
  
Entity TestBench is
Generic(
 Period     : time := 50000 ps; -- default frequency 20 MHz
 EndSimu    : time := 200 ms;
 LogToFileEn: boolean := true;
 MonitorEn  : boolean := true
);
End TestBench;

Architecture simulation of TestBench is
 ---------------
 -- Component --
 ---------------

 Component Driver
 Generic(
  Period	: time
 );
 Port(
  RstB		: inout std_logic;
  Ck		: in    std_logic;
  CpuIdleRq	: out   std_logic;
  RxD		: out	std_logic;
  TxD		: in	std_logic
 );
 End component;
 
 -------------
 -- Signals --
 -------------

-- Driver
 signal Ck			: std_logic := '0';
 signal RstB			: std_logic;
 signal CpuIdleRq		: std_logic; 
-- constant Rom0FileName		: string := "rom0_i.txt";
-- constant Rom1FileName		: string := "rom1_i.txt";

-- UART
 signal RxD			: std_logic;
 signal TxD			: std_logic;

 signal MyLog2FileEn		: boolean;

-- S51 MONITORING
 signal DaxDplCpuIdleAck	: std_logic;					-- IDLE mode
 signal DaxDplHardCallRq	: std_logic;					-- Interruptions generate LCALL
 signal DaxDplHardCallAck	: std_logic;
 signal DaxDplHardCallPC	: std_logic_vector(PcLenght - 1 downto 0);
 signal DaxDplPC		: std_logic_vector(PcLenght - 1 downto 0); 
 signal DaxDplStackPointer	: std_logic_vector(StackAddSize - 1 downto 0);
 signal DaxDplAccu		: std_logic_vector(AccuRegSize - 1 downto 0);
 signal DaxDplDptr		: std_logic_vector(15 downto 0); 
 signal DaxDplBreg		: std_logic_vector(AccuRegSize - 1 downto 0);
 signal DaxDplPswReg		: std_logic_vector(PswRegSize - 1 downto 0);
 signal DaxDplSrcSfrAddress	: std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal DaxDplDstSfrAddress	: std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal DaxDplSfrDin		: std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal DaxDplSfrDout		: std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal DaxDplReadSfr		: std_logic;
 signal DaxDplWriteSfr		: std_logic;
 signal DaxDplAddPortA		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DaxDplDoutPortA		: std_logic_vector(7 downto 0);
 signal DaxDplRdEnPortA		: std_logic; 
 signal DaxDplAddPortB		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DaxDplDoutPortB		: std_logic_vector(7 downto 0);
 signal DaxDplRdEnPortB		: std_logic;  
 signal DaxDplAddPortC		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DaxDplDinPortC		: std_logic_vector(7 downto 0);
 signal DaxDplWePortC		: std_logic;  
 signal DaxDplAddPortD		: std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DaxDplDinPortD		: std_logic_vector(7 downto 0);
 signal DaxDplWePortD		: std_logic; 
 signal DaxDplXRamAddress	: std_logic_vector(XRamAddBusSize - 1 downto 0);
 signal DaxDplXRamDOut		: std_logic_vector(XRamDataBusSize - 1 downto 0);
 signal DaxDplXRamDIn		: std_logic_vector(XRamDataBusSize - 1 downto 0);
 signal DaxDplXRamClk		: std_logic;
 signal DaxDplXRamME		: std_logic;
 signal DaxDplXRamWE		: std_logic; 
 signal DaxDplState		: std_logic;
 signal DaxDplDisOpcodeFetch	: std_logic;
 signal DaxDplOpcode		: std_logic_vector(OpWord - 1 downto 0);
 signal DaxDplData1		: std_logic_vector(OpWord - 1 downto 0);
 signal DaxDplData2		: std_logic_vector(OpWord - 1 downto 0);
 signal DaxDplBWen		: std_logic;
 signal DaxDplAccWen		: std_logic;
 signal DaxDplPswWen		: std_logic;
 signal DaxDplSpWen		: std_logic;
 signal DaxDplDplWen		: std_logic;
 signal DaxDplDphWen		: std_logic;
-- signal DaxDplCacheR0ptr  	: std_logic_vector(RegFileAddSize - 1 downto 0);
-- signal DaxDplCacheR1ptr	: std_logic_vector(RegFileAddSize - 1 downto 0);
-- signal DaxDplCacheR0read  	: std_logic;
-- signal DaxDplCacheR1read	: std_logic;
-- signal DaxDplCacheR0		: std_logic_vector(7 downto 0);
-- signal DaxDplCacheR1		: std_logic_vector(7 downto 0);
 
 signal OCDStopCpu		: std_logic;
 signal OCDHMJB			: std_logic;
 signal OCDWrRI			: std_logic;
 signal OCDDataRI		: std_logic_vector(OpWord - 1 downto 0);

 signal TMLpc_S51ExecCodeEn	: std_logic;
 signal TMLpc_AddH		: std_logic_vector(7 downto 0);
 signal TMLpc_AddL		: std_logic_vector(7 downto 0);

 signal RDacIn			: std_logic_vector(7 downto 0);
 signal dac_out			: std_logic;
 signal DaxDpliRstB : std_logic;

begin

-- TMLpc_S51ExecCodeEn	<= '1';
-- TMLpc_AddH		<= "01010101";
-- TMLpc_AddL		<= "10101010";

 TMLpc_S51ExecCodeEn	<= '0';
 TMLpc_AddH		<= (others => '0');
 TMLpc_AddL		<= (others => '0');

 MyLog2FileEn <= LogToFileEn;

 TopAppliS51_I : TopAppliS51
--  Generic Map(
--   Rom0FileName => Rom0FileName -- ,
-- --  Rom1FileName => Rom1FileName  
--  )
 Port map (
  RstB			=> RstB,
  Ck			=> Ck,
  CpuIdleRq		=> CpuIdleRq,
  
  P			=> RDacIn,
  
  RxD			=> RxD,
  TxD			=> TxD,

 -- TESTMODE
  TMLpc_S51ExecCodeEn	=> TMLpc_S51ExecCodeEn,
  TMLpc_AddH		=> TMLpc_AddH,
  TMLpc_AddL		=> TMLpc_AddL,

  DaxDplCpuIdleAck	=> DaxDplCpuIdleAck,
  DaxDplHardCallRq	=> DaxDplHardCallRq,
  DaxDplHardCallAck	=> DaxDplHardCallAck,
  DaxDplHardCallPC	=> DaxDplHardCallPC,
  DaxDplPC		=> DaxDplPC,
  DaxDplStackPointer	=> DaxDplStackPointer,
  DaxDplAccu		=> DaxDplAccu,
  DaxDplDptr		=> DaxDplDptr,
  DaxDplBreg		=> DaxDplBreg,
  DaxDplPswReg		=> DaxDplPswReg,
  DaxDplSrcSfrAddress	=> DaxDplSrcSfrAddress,
  DaxDplDstSfrAddress	=> DaxDplDstSfrAddress,
  DaxDplSfrDin		=> DaxDplSfrDin,
  DaxDplSfrDout		=> DaxDplSfrDout,
  DaxDplReadSfr		=> DaxDplReadSfr,
  DaxDplWriteSfr	=> DaxDplWriteSfr,
  DaxDplAddPortA	=> DaxDplAddPortA,
  DaxDplDoutPortA	=> DaxDplDoutPortA,
  DaxDplRdEnPortA	=> DaxDplRdEnPortA,
  DaxDplAddPortB	=> DaxDplAddPortB,
  DaxDplDoutPortB	=> DaxDplDoutPortB,
  DaxDplRdEnPortB	=> DaxDplRdEnPortB,
  DaxDplAddPortC	=> DaxDplAddPortC,
  DaxDplDinPortC	=> DaxDplDinPortC,
  DaxDplWePortC 	=> DaxDplWePortC,
  DaxDplAddPortD	=> DaxDplAddPortD,
  DaxDplDinPortD	=> DaxDplDinPortD,
  DaxDplWePortD 	=> DaxDplWePortD,
  DaxDplXRamAddress	=> DaxDplXRamAddress,
  DaxDplXRamDOut	=> DaxDplXRamDOut,
  DaxDplXRamDIn 	=> DaxDplXRamDIn,
  DaxDplXRamClk 	=> DaxDplXRamClk,
  DaxDplXRamME  	=> DaxDplXRamME,
  DaxDplXRamWE  	=> DaxDplXRamWE,
  DaxDplState	        => DaxDplState,
  DaxDplDisOpcodeFetch	=> DaxDplDisOpcodeFetch,
  DaxDplOpcode		=> DaxDplOpcode,
  DaxDplData1 		=> DaxDplData1,
  DaxDplData2 		=> DaxDplData2,
  DaxDplBWen  		=> DaxDplBWen,
  DaxDplAccWen		=> DaxDplAccWen,
  DaxDplPswWen		=> DaxDplPswWen,
  DaxDplSpWen 		=> DaxDplSpWen,
  DaxDplDplWen		=> DaxDplDplWen,
  DaxDplDphWen		=> DaxDplDphWen,
  DaxDpliRstB     => DaxDpliRstB
--  DaxDplCacheR0ptr   	=> DaxDplCacheR0ptr,
--  DaxDplCacheR1ptr   	=> DaxDplCacheR1ptr,
--  DaxDplCacheR0read  	=> DaxDplCacheR0read,
--  DaxDplCacheR1read  	=> DaxDplCacheR1read,
--  DaxDplCacheR0      	=> DaxDplCacheR0,
--  DaxDplCacheR1      	=> DaxDplCacheR1
 );
 
 OCDStopCpu	<= '0';
 OCDHMJB	<= '0';
 OCDWrRI	<= '0';
 OCDDataRI	<= (others => '0');
 
 gendaxdisplay : if MonitorEn = true generate
  DAXDisplay_I : DAXDisplay	      -- RTL Observability module
  Port map (
   RstB  	      => DaxDpliRstB,
   Ck		      => Ck,
   CpuIdleAck	      => DaxDplCpuIdleAck,
   HardCallRq	      => DaxDplHardCallRq,
   HardCallAck	      => DaxDplHardCallAck,
   HardCallPC	      => DaxDplHardCallPC,

   OCDStopCpu	      => OCDStopCpu,
   OCDHMJB	      => OCDHMJB,	
   OCDWrRI	      => OCDWrRI,	
   OCDDataRI	      => OCDDataRI,

   PC		      => DaxDplPC,
   StackPointer        => DaxDplStackPointer,
   Accu  	      => DaxDplAccu,
   Dptr  	      => DaxDplDptr,
   Breg  	      => DaxDplBreg,
   PswReg	      => DaxDplPswReg,

 -- Peripheral bus  
   SrcSfrAddress       => DaxDplSrcSfrAddress,
   DstSfrAddress       => DaxDplDstSfrAddress,
   SfrDin	      => DaxDplSfrDin,
   SfrDout	      => DaxDplSfrDout,
   ReadSfr	      => DaxDplReadSfr,
   WriteSfr	      => DaxDplWriteSfr,
 -- Register file bus  
   AddPortA	      => DaxDplAddPortA,
   DoutPortA	      => DaxDplDoutPortA,
   RdEnPortA	      => DaxDplRdEnPortA,
   AddPortB	      => DaxDplAddPortB,
   DoutPortB	      => DaxDplDoutPortB,
   RdEnPortB	      => DaxDplRdEnPortB,
   AddPortC	      => DaxDplAddPortC,
   DinPortC	      => DaxDplDinPortC,
   WePortC	      => DaxDplWePortC,
   AddPortD	      => DaxDplAddPortD,
   DinPortD	      => DaxDplDinPortD,
   WePortD	      => DaxDplWePortD,
 -- XRam bus
   XRamAddress	      => DaxDplXRamAddress,
   XRamDout	      => DaxDplXRamDOut,
   XRamDIn	      => DaxDplXRamDIn,
   XRamClk	      => DaxDplXRamClk,
   XRamMe	      => DaxDplXRamME,
   XRamWE	      => DaxDplXRamWE,
 -- ROM bus  
   State	      => DaxDplState,
   DisOpcodeFetch     => DaxDplDisOpcodeFetch,
   Opcode	      => DaxDplOpcode,
   Data1 	      => DaxDplData1,
   Data2 	      => DaxDplData2,
 -- INTERNAL REGISTER ACCES
   BWen  	      => DaxDplBWen,
   AccWen	      => DaxDplAccWen,
   PswWen	      => DaxDplPswWen,
   SpWen 	      => DaxDplSpWen,
   DplWen	      => DaxDplDplWen,
   DphWen	      => DaxDplDphWen
-- CACHE for R0, R1 to unconstrain the design : cjne ri, data, rel is the only instruction modifying
-- PCi which path goes through the internal stack PortA and PortB
--   CacheR0ptr	      => DaxDplCacheR0ptr,
--   CacheR1ptr	      => DaxDplCacheR1ptr,
--   CacheR0read        => DaxDplCacheR0read,
--   CacheR1read        => DaxDplCacheR1read,
--   CacheR0	      => DaxDplCacheR0,
--   CacheR1	      => DaxDplCacheR1
  );
 end generate;


 RDacI : RDac
 Port Map (
  b0 => RDacIn(0),
  b1 => RDacIn(1),
  b2 => RDacIn(2),
  b3 => RDacIn(3),
  b4 => RDacIn(4),
  b5 => RDacIn(5),
  b6 => RDacIn(6),
  b7 => RDacIn(7),
  dac_out => dac_out
 );

  scenario : Driver
 Generic Map(
  Period	=> Period
 )
 Port Map (
  RstB		=> RstB,
  Ck		=> Ck,
  CpuIdleRq	=> CpuIdleRq,
  RxD		=> RxD,
  TxD		=> TxD  
 );

-------------------------------------------------
--                   CLOCKS                    --
-------------------------------------------------

 process
 begin
  wait for 1 ns;
  loop
   Ck <= '1';
   wait for Period/2;
   Ck <= '0';
   wait for Period/2;
  end loop;
 end process;

 process
 begin
  wait for EndSimu;
  assert false report " Normal End of Simulation " severity FAILURE;
 end process;

 process (DaxDplPC)
 begin
  if (DaxDplPC = "0111111111110000") then
  assert false report " PC reached @0x7FF0 => end of simulation " severity FAILURE;
  end if;
 end process;
 
end simulation;
