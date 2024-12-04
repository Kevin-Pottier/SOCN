
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkgS51ItCtrl;
 use LibPkgS51ItCtrl.PkgS51ItCtrl.all;
Library LibS51ItCtrl;
 use LibS51ItCtrl.PkgCompS51ItCtrlCore.all;

Entity S51ItCtrl is
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;
  CpuIdleRq		: in    std_logic;
  
  OCDMonitorMode	: in	std_logic;
  OCDStopCpu		: in	std_logic;

  -- SFR INTERFACE
  SfrDin		: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
  WriteSfr		: in	std_logic;
--  SfrDout		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);

  SfrDout_IE0     	: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IE1	      : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPH0	    : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPH1	    : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPL0     	: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPL1	    : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITCTLCON	: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITSRCL	  : out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITSRCH	  : out	std_logic_vector(PeriphDataBusSize -1 downto 0);

--  ReadSfr		: in	std_logic;
  
  ITCTLCONWen 		  : in	std_logic;
  Ie0WEn		        : in	std_logic;
  Ie1WEn		        : in	std_logic;
  IPH0WEn		        : in	std_logic;
  IPH1WEn		        : in	std_logic;
  IPL0WEn		        : in	std_logic;
  IPL1WEn		        : in	std_logic;
  
--  ITCTLCONRen		: in	std_logic;
--  Ie0REn		: in	std_logic;
--  Ie1REn		: in	std_logic;
--  IPH0REn		: in	std_logic;
--  IPH1REn		: in	std_logic;
--  IPL0REn		: in	std_logic;
--  IPL1REn		: in	std_logic;
--  ITSRCLREn		: in	std_logic;
--  ITSRCHREn		: in	std_logic;

-- S51 DAX
  S51XRetI		  : in	std_logic;
  HardCallRq		: out	std_logic;
  HardCallAck		: in	std_logic;  
  HardCallPC		: out	std_logic_vector(PcLenght - 1 downto 0);
  
-- PERIPHERALS
  ItEntriesV		: in	std_logic_vector(ItNumberMax - 1 downto 0)

 );
End S51ItCtrl;
 
Architecture rtl of S51ItCtrl is
 signal ItPriorityReg		: T_PRIORITYV;
 signal ItCtrlReg		: std_logic_vector(0 downto 0);
 signal EA			: std_logic;
 signal SfrDinBV		: bit_vector(7 downto 0);
 signal NMIIdentifierV		: bit_vector(ItNumberMax - 1 downto 0);
 signal AddressLUTV		: T_ADDRESSLUTV;
 signal ItfAccessSecure		: std_logic;
 signal ItEntriesPriorityV	: T_PRIORITYV;

 -- Internal clockgen 
 signal GatedCk			: std_logic;
 signal NotIdleMode		: std_logic;
begin

 IdleModeFPGA : if SYNTHESISFORFPGA = true generate
  GatedCk <= Ck;		-- Gated are deported to DFFs enable entries
  NotIdleMode <= not CpuIdleRq;
 end generate;

 IdleModeNOTFPGA : if SYNTHESISFORFPGA = false generate
  GatedCk <= Ck and not CpuIdleRq;
  NotIdleMode <= '1';		-- Do not use DFFs enable entries to manage IDLE mode
 end generate;
 
 SfrDinBV <= to_bitvector(SfrDin, '0');
 
 process(RstB, GatedCk)
 begin
  if RstB = '0' then
   ItPriorityReg <= (others => (others => '0'));
   ItCtrlReg <= (others => '0');
  elsif GatedCk'event and GatedCk = '1' then
   if NotIdleMode = '1' then
    if WriteSfr = '1' then
     if Ie0WEn = '1' then
      for i in 0 to 7 loop
       ItPriorityReg(i)(2) <= SfrDinBV(i);
      end loop;
     end if;
     if Ie1WEn = '1' then
      for i in 0 to 7 loop
       ItPriorityReg(i+8)(2) <= SfrDinBV(i);
      end loop;
     end if;
     if IPH0WEn = '1' then
      for i in 0 to 7 loop
       ItPriorityReg(i)(1) <= SfrDinBV(i);
      end loop;
     end if;
     if IPH1WEn = '1' then
      for i in 0 to 7 loop
       ItPriorityReg(i+8)(1) <= SfrDinBV(i);
      end loop;
     end if;
     if IPL0WEn = '1' then
      for i in 0 to 7 loop
       ItPriorityReg(i)(0) <= SfrDinBV(i);
      end loop;
     end if;
     if IPL1WEn = '1' then
      for i in 0 to 7 loop
       ItPriorityReg(i+8)(0) <= SfrDinBV(i);
      end loop;
     end if;
     if ITCTLCONWen = '1' then
      ItCtrlReg(0) <= SfrDin(0);
     end if;
    end if;
   end if;
  end if;  
 end process;
 
 GEN_IE0SFRRD : for i in 0 to 7 generate
  SfrDout_IE0(i) <= to_stdulogic(ItPriorityReg(i)(2));
 end generate;
 
 GEN_IE1SFRRD : for i in 0 to 7 generate
  SfrDout_IE1(i) <= to_stdulogic(ItPriorityReg(i+8)(2));
 end generate;
 
 GEN_IPH0SFRRD : for i in 0 to 7 generate
  SfrDout_IPH0(i) <= to_stdulogic(ItPriorityReg(i)(1));
 end generate;
 
 GEN_IPH1SFRRD : for i in 0 to 7 generate
  SfrDout_IPH1(i) <= to_stdulogic(ItPriorityReg(i+8)(1));
 end generate;
 
 GEN_IPL0SFRRD : for i in 0 to 7 generate
  SfrDout_IPL0(i) <= to_stdulogic(ItPriorityReg(i)(0));
 end generate;
 
 GEN_IPL1SFRRD : for i in 0 to 7 generate
  SfrDout_IPL1(i) <= to_stdulogic(ItPriorityReg(i+8)(0));
 end generate;

 SfrDout_ITCTLCON <= 	"0000000"&ItCtrlReg;
 SfrDout_ITSRCL <= ItEntriesV(7 downto 0);
 SfrDout_ITSRCH <= ItEntriesV(ItNumberMax - 1 downto 8);

-- SfrDout <= 	"0000000"&ItCtrlReg	when ReadSfr = '1' and ITCTLCONRen = '1' else
-- 		ItEntriesV(7 downto 0)	when ReadSfr = '1' and ITSRCLREn = '1' else
----		GenNullVector(16-ItNumberMax) &  FIXME, THIS CAUSES BG TO FAIL
--		ItEntriesV(ItNumberMax - 1 downto 8) when ReadSfr = '1' and ITSRCHREn = '1' else
-- 		(others => 'Z');

 EA			<= ItCtrlReg(0) and not OCDMonitorMode and not OCDStopCpu;
 NMIIdentifierV		<= (others => '0');
 AddressLUTV		<= C_AddressLUTV;
 ItfAccessSecure	<= not (WriteSfr and (Ie0WEn or Ie1WEn or IPH0WEn or IPH1WEn or IPL0WEn or IPL1WEn));

 GEN_ITENTRIESPRIORITYV : for i in 0 to ItNumberMax - 1 generate
  ItEntriesPriorityV(i)(2)		<= ItPriorityReg(i)(2) and to_bit(ItEntriesV(i), '0') and to_bit(EA, '0');
  ItEntriesPriorityV(i)(1 downto 0)	<= ItPriorityReg(i)(1 downto 0);
 end generate;

 S51ItCtrlCore_I : S51ItCtrlCore
 Port map(
  RstB			=> RstB,        
  Ck			=> GatedCk,
  En			=> NotIdleMode,
  ItEntriesPriorityV	=> ItEntriesPriorityV,
  NMIIdentifierV	=> NMIIdentifierV,
  AddressLUTV		=> AddressLUTV,
  ItfAccessSecure	=> ItfAccessSecure,
  S51XRetI		=> S51XRetI,
  HardCallRq		=> HardCallRq,
  HardCallAck		=> HardCallAck,
  HardCallPC		=> HardCallPC
 );
 
End rtl;

