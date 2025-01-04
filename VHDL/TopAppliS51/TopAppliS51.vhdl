
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
Library LibGpioCtrl;
 use LibGpioCtrl.PkgCompGpioCtrl.all;
Library LibSfrDecoder;
 use LibSfrDecoder.PkgCompSfrDecoder.all;
Library LibInternalRam;
 use LibInternalRam.PkgCompInternalRam.all;
Library LibPkgS51ItCtrl;
 use LibPkgS51ItCtrl.PkgS51ItCtrl.all;
Library LibS51ItCtrl;
 use LibS51ItCtrl.PkgCompS51ItCtrl.all;
Library LibRstCtl;
 use LibRstCtl.PkgCompRstCtl.all;
-- synopsys translate_off
Library c35_corelib;
 use c35_corelib.all;
-- synopsys translate_on
Library LibS51Timer;
 use LibS51Timer.PkgCompS51Timer.all;

Entity TopAppliS51 is
-- -- synopsys translate_off
-- Generic(
--  Rom0FileName         : string --;
-- -- Rom1FileName        : string
-- );
-- -- synopsys translate_on
Port(
 RstB                  : in    std_logic;
 Ck                    : in    std_logic;
 CpuIdleRq             : in    std_logic;

 P                     : out   std_logic_vector(7 downto 0);

 -- UART PADS
 RxD                   : in    std_logic;
 TxD                   : out   std_logic;

 -- TESTMODE
 TMLpc_S51ExecCodeEn   : in    std_logic;
 TMLpc_AddH            : in    std_logic_vector(7 downto 0);
 TMLpc_AddL            : in    std_logic_vector(7 downto 0);

 -- EXTRA INFO FOR EXTERNAL MONITORING (Now handled by testbench)
 DaxDplCpuIdleAck      : out   std_logic;                    -- IDLE mode
 DaxDplHardCallRq      : out   std_logic;                    -- Interruptions generate LCALL
 DaxDplHardCallAck     : out   std_logic;
 DaxDplHardCallPC      : out   std_logic_vector(PcLenght - 1 downto 0);
 DaxDplPC              : out   std_logic_vector(PcLenght - 1 downto 0);
 DaxDplStackPointer    : out   std_logic_vector(StackAddSize - 1 downto 0);
 DaxDplAccu            : out   std_logic_vector(AccuRegSize - 1 downto 0);
 DaxDplDptr            : out   std_logic_vector(15 downto 0);
 DaxDplBreg            : out   std_logic_vector(AccuRegSize - 1 downto 0);
 DaxDplPswReg          : out   std_logic_vector(PswRegSize - 1 downto 0);
 DaxDplSrcSfrAddress   : out   std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DaxDplDstSfrAddress   : out   std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DaxDplSfrDin          : out   std_logic_vector(PeriphDataBusSize -1 downto 0);
 DaxDplSfrDout         : out   std_logic_vector(PeriphDataBusSize -1 downto 0);
 DaxDplReadSfr         : out   std_logic;
 DaxDplWriteSfr        : out   std_logic;
 DaxDplAddPortA        : out   std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDoutPortA       : out   std_logic_vector(7 downto 0);
 DaxDplRdEnPortA       : out   std_logic;
 DaxDplAddPortB        : out   std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDoutPortB       : out   std_logic_vector(7 downto 0);
 DaxDplRdEnPortB       : out   std_logic;
 DaxDplAddPortC        : out   std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDinPortC        : out   std_logic_vector(7 downto 0);
 DaxDplWePortC         : out   std_logic;
 DaxDplAddPortD        : out   std_logic_vector(RegFileAddSize - 1 downto 0);
 DaxDplDinPortD        : out   std_logic_vector(7 downto 0);
 DaxDplWePortD         : out   std_logic;
 DaxDplXRamAddress     : out   std_logic_vector(XRamAddBusSize - 1 downto 0);
 DaxDplXRamDOut        : out   std_logic_vector(XRamDataBusSize - 1 downto 0);
 DaxDplXRamDIn         : out   std_logic_vector(XRamDataBusSize - 1 downto 0);
 DaxDplXRamClk         : out   std_logic;
 DaxDplXRamME          : out   std_logic;
 DaxDplXRamWE          : out   std_logic;
 DaxDplState           : out   std_logic;
 DaxDplDisOpcodeFetch  : out   std_logic;
 DaxDplOpcode          : out   std_logic_vector(OpWord - 1 downto 0);
 DaxDplData1           : out   std_logic_vector(OpWord - 1 downto 0);
 DaxDplData2           : out   std_logic_vector(OpWord - 1 downto 0);
 DaxDplBWen            : out   std_logic;
 DaxDplAccWen          : out   std_logic;
 DaxDplPswWen          : out   std_logic;
 DaxDplSpWen           : out   std_logic;
 DaxDplDplWen          : out   std_logic;
 DaxDplDphWen          : out   std_logic;
 DaxDpliRstB           : out   std_logic
);
End TopAppliS51;

Architecture Rtl of TopAppliS51 is
-- S51Cpu
-- signal CpuIdleRq        : std_logic;

 signal iRstB              : std_logic;

 signal HardCallRq         : std_logic;
 signal HardCallAck        : std_logic;
 signal HardCallPC         : std_logic_vector(PcLenght - 1 downto 0);
 signal S51XRetI           : std_logic;
 signal CpuIdleAck         : std_logic;
-- ROMs
 signal Rom0Clk, Rom1Clk    : std_logic;
 signal Rom0Me, Rom1Me      : std_logic;
 signal Rom0Address, Rom1Address: std_logic_vector(RomAddressBusLenght - 1 downto 0);
 signal Rom0Out, Rom1Out    : std_logic_vector(RomDataBusLenght - 1 downto 0);

 signal Rom2Clk, Rom3Clk    : std_logic;
 signal Rom2Me, Rom3Me      : std_logic;
 signal Rom2Address, Rom3Address: std_logic_vector(RomAddressBusLenght - 1 downto 0);
 signal Rom2Out, Rom3Out    : std_logic_vector(RomDataBusLenght - 1 downto 0);
-- REGISTER FILE 8
 signal StackClk            : std_logic;
 signal StackEn             : std_logic;
 signal AddPortA            : std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DoutPortA           : std_logic_vector(7 downto 0);
 signal RdEnPortA           : std_logic;
    
 signal AddPortB            : std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DoutPortB           : std_logic_vector(7 downto 0);
 signal RdEnPortB           : std_logic;
    
 signal AddPortC            : std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DinPortC            : std_logic_vector(7 downto 0);
 signal WePortC             : std_logic;
 signal AddPortD            : std_logic_vector(RegFileAddSize - 1 downto 0);
 signal DinPortD            : std_logic_vector(7 downto 0);
 signal WePortD             : std_logic;
-- SFR
 signal SrcSfrAddress       : std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal DstSfrAddress       : std_logic_vector(PeriphAddBusSize - 1 downto 0);
 signal SfrDin              : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout             : std_logic_vector(PeriphDataBusSize -1 downto 0);

 signal SfrDout_TSTAT       : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_CNT_H       : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_CNT_L       : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_IE0         : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_IE1         : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_IPH0        : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_IPH1        : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_IPL0        : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_IPL1        : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_ITCTLCON    : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_ITSRCL      : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_ITSRCH      : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_Breg        : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_Accu        : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_PswReg      : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_StackPointer: std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_Dpl         : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_Dph         : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal SfrDout_Dout0       : std_logic_vector(PeriphDataBusSize -1 downto 0);
 signal WriteSfr            : std_logic;
 signal ReadSfr             : std_logic;
-- XRAM
 signal XRamAddress         : std_logic_vector(XRamAddBusSize - 1 downto 0);
 signal XRamDOut            : std_logic_vector(XRamDataBusSize - 1 downto 0);
 signal XRamDIn             : std_logic_vector(XRamDataBusSize - 1 downto 0);
 signal XRamClk             : std_logic;
 signal XRamEn              : std_logic;
 signal XRamME, XRamWE      : std_logic;
-- SFR INTERNAL REGISTER ACCESS
 signal BWen                : std_logic;
 signal AccWen              : std_logic;
 signal PswWen              : std_logic;
 signal SpWen               : std_logic;
 signal DplWen              : std_logic;
 signal DphWen              : std_logic;

 signal VSS, VCC            : std_logic;
 signal VSS8                : std_logic_vector(7 downto 0);

-- FAKE PERIPHERAL

 signal Dout0REn, Dout0WEn  : std_logic;

 signal ITCTLCONWen         : std_logic;
 signal ITCTLCONRen         : std_logic;

 signal Ie0WEn              : std_logic;
 signal Ie1WEn              : std_logic;
 signal IPH0WEn             : std_logic;
 signal IPH1WEn             : std_logic;
 signal IPL0WEn             : std_logic;
 signal IPL1WEn             : std_logic;

 signal ItEntriesV          : std_logic_vector(ItNumberMax - 1 downto 0);

 signal OCDStopCpu          : std_logic;
 signal OCDWrRI             : std_logic;
 signal OCDDataRI           : std_logic_vector(OpWord - 1 downto 0);
 signal OCDWrD1             : std_logic;
 signal OCDDataD1           : std_logic_vector(OpWord - 1 downto 0);
 signal OCDWrD2             : std_logic;
 signal OCDDataD2           : std_logic_vector(OpWord - 1 downto 0);
 signal OCDWrPC             : std_logic;
 signal OCDDataPC           : std_logic_vector(PcLenght - 1 downto 0);

 signal TCTRLWen            : std_logic;
 signal CNT_HWen            : std_logic;
 signal CNT_LWen            : std_logic;
 
 signal Time_out_IT         : std_logic;
 signal timer_auto_idle     : std_logic;

 signal ReadSfrIdle         : std_logic;

-- signal pads_input          : std_logic_vector(7 downto 0);

 component BU12P
    port(
       A                    :  in    STD_ULOGIC;
       PAD                  :  out   STD_ULOGIC);
 end component;

begin

 VSS <= '0';
 VCC <= '1';

 OCDStopCpu <= VSS;
 OCDWrRI    <= VSS;
 OCDDataRI  <= (others => '0');
 OCDWrD1    <= VSS;
 OCDDataD1  <= (others => '0');
 OCDWrD2    <= VSS;
 OCDDataD2  <= (others => '0');
 OCDWrPC    <= VSS;
 OCDDataPC  <= (others => '0');
 VSS8       <= (others => '0');

 S51Cpu_I : S51Cpu
 Port map (
  RstB                 => iRstB,
  Ck                   => Ck,
  CpuIdleRq            => timer_auto_idle,
  CpuIdleAck           => CpuIdleAck,
  HardCallRq           => HardCallRq,
  HardCallAck          => HardCallAck,
  HardCallPC           => HardCallPC,
  S51XRetI             => S51XRetI,
-- TESTMODE_LPC
  TMLpc_S51ExecCodeEn  => TMLpc_S51ExecCodeEn,
  TMLpc_AddH           => TMLpc_AddH,
  TMLpc_AddL           => TMLpc_AddL,
-- OPCODE READER
  Rom0Clk              => Rom0Clk,
  Rom0Me               => Rom0Me,
  Rom0Address          => Rom0Address,
  Rom0Out              => Rom0Out,
  Rom1Clk              => Rom1Clk,
  Rom1Me               => Rom1Me,
  Rom1Address          => Rom1Address,
  Rom1Out              => Rom1Out,
  Rom2Clk              => Rom2Clk,
  Rom2Me               => Rom2Me,
  Rom2Address          => Rom2Address,
  Rom2Out              => Rom2Out,
  Rom3Clk              => Rom3Clk,
  Rom3Me               => Rom3Me,
  Rom3Address          => Rom3Address,
  Rom3Out              => Rom3Out,
-- PERIPHERAL BUS
  SrcSfrAddress        => SrcSfrAddress,
  DstSfrAddress        => DstSfrAddress,
  SfrDin               => SfrDin,
  SfrDout              => SfrDout,
  SfrDout_Breg         => SfrDout_Breg,
  SfrDout_Accu         => SfrDout_Accu,
  SfrDout_PswReg       => SfrDout_PswReg,
  SfrDout_StackPointer => SfrDout_StackPointer,
  SfrDout_Dpl          => SfrDout_Dpl,
  SfrDout_Dph          => SfrDout_Dph,

  WriteSfr             => WriteSfr,
  ReadSfr              => ReadSfr,
  WriteSfrIdle         => open,
  ReadSfrIdle          => ReadSfrIdle,
-- XRAM BUS
  PDataHigh            => VSS8,
  XRamAddress          => XRamAddress,
  XRamDOut             => XRamDOut,
  XRamDIn              => XRamDIn,
  XRamClk              => XRamClk,
  XRamEn               => XRamEn,
  XRamMe               => XRamMe,
  XRamWE               => XRamWE,
-- REGISTER FILE8
  StackClk             => StackClk,
  StackEn              => StackEn,
  AddPortA             => AddPortA,
  RdEnPortA            => RdEnPortA,
  DoutPortA            => DoutPortA,
  AddPortB             => AddPortB,
  RdEnPortB            => RdEnPortB,
  DoutPortB            => DoutPortB,
  AddPortC             => AddPortC,
  DinPortC             => DinPortC,
  WePortC              => WePortC,
  AddPortD             => AddPortD,
  DinPortD             => DinPortD,
  WePortD              => WePortD,

  BWen                 => BWen,
  AccWen               => AccWen,
  PswWen               => PswWen,
  SpWen                => SpWen,
  DplWen               => DplWen,
  DphWen               => DphWen,

  DaxDplState          => DaxDplState,
  DaxDplDisOpcodeFetch => DaxDplDisOpcodeFetch,
  DaxDplOpcode         => DaxDplOpcode,
  DaxDplData1          => DaxDplData1,
  DaxDplData2          => DaxDplData2,
  DaxDplPC             => DaxDplPC,
  DaxDplStackPointer   => DaxDplStackPointer,
  DaxDplAccu           => DaxDplAccu,
  DaxDplDptr           => DaxDplDptr,
  DaxDplBreg           => DaxDplBreg,
  DaxDplPswReg         => DaxDplPswReg
);

 DaxDplCpuIdleAck     <= CpuIdleAck;
 DaxDplHardCallRq     <= HardCallRq;
 DaxDplHardCallAck    <= HardCallAck;
 DaxDplHardCallPC     <= HardCallPC;
 DaxDplSrcSfrAddress  <= SrcSfrAddress;
 DaxDplDstSfrAddress  <= DstSfrAddress;
 DaxDplSfrDin         <= SfrDin;
 DaxDplSfrDout        <= SfrDout;
 DaxDplReadSfr        <= ReadSfr;
 DaxDplWriteSfr       <= WriteSfr;
 DaxDplAddPortA       <= AddPortA;
 DaxDplDoutPortA      <= DoutPortA;
 DaxDplRdEnPortA      <= RdEnPortA;
 DaxDplAddPortB       <= AddPortB;
 DaxDplDoutPortB      <= DoutPortB;
 DaxDplRdEnPortB      <= RdEnPortB;
 DaxDplAddPortC       <= AddPortC;
 DaxDplDinPortC       <= DinPortC;
 DaxDplWePortC        <= WePortC;
 DaxDplAddPortD       <= AddPortD;
 DaxDplDinPortD       <= DinPortD;
 DaxDplWePortD        <= WePortD;
 DaxDplXRamAddress    <= XRamAddress;
 DaxDplXRamDOut       <= XRamDOut;
 DaxDplXRamDIn        <= XRamDIn;
 DaxDplXRamClk        <= XRamClk;
 DaxDplXRamME         <= XRamME;
 DaxDplXRamWE         <= XRamWE;
 DaxDplBWen           <= BWen;
 DaxDplAccWen         <= AccWen;
 DaxDplPswWen         <= PswWen;
 DaxDplSpWen          <= SpWen;
 DaxDplDplWen         <= DplWen;
 DaxDplDphWen         <= DphWen;
 DaxDpliRstB          <= iRstB;

 rom0 : InternalRom16
-- synopsys translate_off
 Generic map(
   RomFileName => "rom0_i.txt"
 )
-- synopsys translate_on
 Port map(
  RomClk    => Rom0Clk,
  RomMe     => Rom0Me,
  PRaddress => Rom0Address,
  DataOut   => Rom0Out
 );

  rom1 : InternalRom16
-- synopsys translate_off
  Generic map(
   RomFileName => "rom1_i.txt"
  )
-- synopsys translate_on
  Port map(
   RomClk    => Rom1Clk,
   RomMe     => Rom1Me,
   PRaddress => Rom1Address,
   DataOut   => Rom1Out
  );

  rom2 : InternalRom16
-- synopsys translate_off
  Generic map(
   RomFileName => "rom2_i.txt"
  )
-- synopsys translate_on
  Port map(
   RomClk    => Rom2Clk,
   RomMe     => Rom2Me,
   PRaddress => Rom2Address,
   DataOut   => Rom2Out
  );

  rom3 : InternalRom16
-- synopsys translate_off
  Generic map(
   RomFileName => "rom3_i.txt"
  )
-- synopsys translate_on
  Port map(
   RomClk    => Rom3Clk,
   RomMe     => Rom3Me,
   PRaddress => Rom3Address,
   DataOut   => Rom3Out
  );

 STACK_I :  RegisterFile8
 Port map (
  Ck            => StackClk,
  AddPortA      => AddPortA,
  DoutPortA     => DoutPortA,
  AddPortB      => AddPortB,
  DoutPortB     => DoutPortB,
  AddPortC      => AddPortC,
  DinPortC      => DinPortC,
  WePortC       => WePortC,
  AddPortD      => AddPortD,
  DinPortD      => DinPortD,
  WePortD       => WePortD
 );

 GpioCtrl_I : GpioCtrl
 Port map (
  RstB             => iRstB,
  Ck               => Ck,
  SrcSfrAddress    => SrcSfrAddress,
  DstSfrAddress    => DstSfrAddress,
  SfrDin           => SfrDin,
  SfrDout_Dout0    => SfrDout_Dout0,

  WriteSfr         => WriteSfr,
  Dout0WEn         => Dout0WEn
--  Dout0            => pads_input
 );

 P_0 : BU12P
 Port map (
 A   => SfrDout_Dout0(0),
 PAD => P(0)
 );
 P_1 : BU12P
 Port map (
 A   => SfrDout_Dout0(1),
 PAD => P(1)
 );
 P_2 : BU12P
 Port map (
 A   => SfrDout_Dout0(2),
 PAD => P(2)
 );
 P_3 : BU12P
 Port map (
 A   => SfrDout_Dout0(3),
 PAD => P(3)
 );
 P_4 : BU12P
 Port map (
 A   => SfrDout_Dout0(4),
 PAD => P(4)
 );
 P_5 : BU12P
 Port map (
 A   => SfrDout_Dout0(5),
 PAD => P(5)
 );
 P_6 : BU12P
 Port map (
 A   => SfrDout_Dout0(6),
 PAD => P(6)
 );
 P_7 : BU12P
 Port map (
 A   => SfrDout_Dout0(7),
 PAD => P(7)
 );

-- CPU XRAM
 XRAM_I : InternalRam
 port map (
  XRamAddress    => XRamAddress,
  XRamDOut       => XRamDOut,
  XRamDIn        => XRamDIn,
  XRamClk        => XRamClk,
  XRamEn         => XRamEn,
  XRamMe         => XRamMe,
  XRamWE         => XRamWE
 );

 SRCSFRDECODER_I : SfrDecoder
 port map (
  AddSfr                    => SrcSfrAddress,

  Ben                       => open,
  ACCen                     => open,
  PSWen                     => open,
  SPen                      => open,
  DPLen                     => open,
  DPHen                     => open,
  Dout0En                   => open,
  IE0En                     => open,
  IE1En                     => open,
  IPH0En                    => open,
  IPH1En                    => open,
  IPL0En                    => open,
  IPL1En                    => open,
  ITCTLCONen                => open,
  TCTRLEn                   => open,
  CNT_HEn                   => open,
  CNT_LEn                   => open,
  TSTATEn                   => open,

  SfrDout_TSTAT             => SfrDout_TSTAT,
  SfrDout_CNT_H             => SfrDout_CNT_H,
  SfrDout_CNT_L             => SfrDout_CNT_L,
  SfrDout_IE0               => SfrDout_IE0,
  SfrDout_IE1               => SfrDout_IE1,
  SfrDout_IPH0              => SfrDout_IPH0,
  SfrDout_IPH1              => SfrDout_IPH1,
  SfrDout_IPL0              => SfrDout_IPL0,
  SfrDout_IPL1              => SfrDout_IPL1,
  SfrDout_ITCTLCON          => SfrDout_ITCTLCON,
  SfrDout_ITSRCL            => SfrDout_ITSRCL,
  SfrDout_ITSRCH            => SfrDout_ITSRCH,
  SfrDout_Breg              => SfrDout_Breg,
  SfrDout_Accu              => SfrDout_Accu,
  SfrDout_PswReg            => SfrDout_PswReg,
  SfrDout_StackPointer      => SfrDout_StackPointer,
  SfrDout_Dpl               => SfrDout_Dpl,
  SfrDout_Dph               => SfrDout_Dph,
  SfrDout_Dout0             => SfrDout_Dout0,
  SfrDout                   => SfrDout
 );

 DSTSFRDECODER_I : SfrDecoder
 port map (
  AddSfr               => DstSfrAddress,

  Ben                  => BWen,
  ACCen                => AccWen,
  PSWen                => PswWen,
  SPen                 => SpWen,
  DPLen                => DplWen,
  DPHen                => DphWen,
  Dout0En              => Dout0WEn,
  IE0En                => IE0Wen,
  IE1En                => IE1Wen,
  IPH0En               => IPH0Wen,
  IPH1En               => IPH1Wen,
  IPL0En               => IPL0Wen,
  IPL1En               => IPL1Wen,
  ITCTLCONEn           => ITCTLCONWen,
  TCTRLEn              => TCTRLWEn,
  CNT_HEn              => CNT_HWEn,
  CNT_LEn              => CNT_LWEn,
  TSTATEn              => open,

  SfrDout_TSTAT        => (others => '0'),
  SfrDout_CNT_H        => (others => '0'),
  SfrDout_CNT_L        => (others => '0'),
  SfrDout_IE0          => (others => '0'),
  SfrDout_IE1          => (others => '0'),
  SfrDout_IPH0         => (others => '0'),
  SfrDout_IPH1         => (others => '0'),
  SfrDout_IPL0         => (others => '0'),
  SfrDout_IPL1         => (others => '0'),
  SfrDout_ITCTLCON     => (others => '0'),
  SfrDout_ITSRCL       => (others => '0'),
  SfrDout_ITSRCH       => (others => '0'),
  SfrDout_Breg         => (others => '0'),
  SfrDout_Accu         => (others => '0'),
  SfrDout_PswReg       => (others => '0'),
  SfrDout_StackPointer => (others => '0'),
  SfrDout_Dpl          => (others => '0'),
  SfrDout_Dph          => (others => '0'),
  SfrDout_Dout0        => (others => '0'),
  SfrDout              => open
 );

 S51ITCTRL_I : S51ItCtrl
 port map (
  RstB             => iRstB,
  Ck               => Ck,
  CpuIdleRq        => timer_auto_idle,
  OCDMonitorMode   => VSS,
  OCDStopCpu       => VSS,
  SfrDin           => SfrDin,
  WriteSfr         => WriteSfr,

  SfrDout_IE0      => SfrDout_IE0,
  SfrDout_IE1      => SfrDout_IE1,
  SfrDout_IPH0     => SfrDout_IPH0,
  SfrDout_IPH1     => SfrDout_IPH1,
  SfrDout_IPL0     => SfrDout_IPL0,
  SfrDout_IPL1     => SfrDout_IPL1,
  SfrDout_ITCTLCON => SfrDout_ITCTLCON,
  SfrDout_ITSRCL   => SfrDout_ITSRCL,
  SfrDout_ITSRCH   => SfrDout_ITSRCH,

  ITCTLCONWen      => ITCTLCONWen,
  Ie0WEn           => Ie0WEn,
  Ie1WEn           => Ie1WEn,
  IPH0WEn          => IPH0WEn,
  IPH1WEn          => IPH1WEn,
  IPL0WEn          => IPL0WEn,
  IPL1WEn          => IPL1WEn,
  S51XRetI         => S51XRetI,
  HardCallRq       => HardCallRq,
  HardCallAck      => HardCallAck,
  HardCallPC       => HardCallPC,
  ItEntriesV       => ItEntriesV
 );

-- process
-- begin
--  for i in 0 to 15 loop
--   ItEntriesV(i) <= '1';
--   wait for 300 ns;
--   ItEntriesV <= (others => '0');
--  end loop;
-- end process;

 ItEntriesV(15 downto 1) <= (others => '0');
 ItEntriesV(0)           <= Time_out_IT;
 timer_auto_idle         <= '0';

 S51Timer_I : S51Timer
 Port map(
  RstB                  => iRstB,
  Ck                    => Ck,

  SfrDin                => (others => '0'),
  WriteSfr              => '0',

  SfrDout_TSTAT         => SfrDout_TSTAT,
  SfrDout_CNT_H         => SfrDout_CNT_H,
  SfrDout_CNT_L         => SfrDout_CNT_L,

  TCTRLWen              => '0',
  CNT_HWen              => '0',
  CNT_LWen              => '0',

  Time_out_IT           => Time_out_IT,
  timer_auto_idle       => timer_auto_idle
 );

 RstCtl_I : RstCtl
 Port map(
  RstB             => RstB,
  Ck               => Ck,
  iRstB            => iRstB
 );

end Rtl;
