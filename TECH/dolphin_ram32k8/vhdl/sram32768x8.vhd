--*********************************************************************
--*
--*  DOLPHIN
--*       INTEGRATION
--*
--*********************************************************************
--*               ______         *
--*              /      \ ___    *
--*            /     . _-_-_-    *
--*      ____/          /        *  Dolphin Integration
--*   #_/   /          /    #    *  B.P. 65- ZIRST - 39, av. du Granier
--*   /              _/          *  38242 MEYLAN CEDEX - FRANCE
--*  |____          /       #    *
--*      \         /             *
--*   #   |       /         #    *  Tel : (33)/(0)4 76 41 10 96
--*       |      /               *
--*   #   |     /           #    *  Fax : (33)/(0)4 76 90 29 65
--*      /     /                 *
--* _ # /    /              #    *  Email : gds2@dolphin.fr
--*| \_/   /                     *
--* \ #  /                  #    *
--* |  / #   #   #   #   #       *
--* |/                           *
--*                              *
--*********************************************************************


----------------------------------------------------
-- SRAM Generator V4.1
--
-- SRAM VHDL model V4.2, unidirectional
-- Author : DOLPHIN INTEGRATION
-- Last modification : 13-07-99
----------------------------------------------------


 
library ieee,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
-- exclude VITAL library
-- synopsys synthesize_off
use IEEE.VITAL_TIMING.all;
-- synopsys synthesize_on
use work.sram_pkg.all;


-------------------- Definition of SRAM entity

Entity sram32768x8 is
                        
-- exclude generics
-- synopsys synthesize_off
           
generic (ADDRESS_BIT   :  POSITIVE := 15;
         DATA_BIT      :  POSITIVE := 8; 
         NB_WORDS      :  POSITIVE := 32768;
         INSTANCE_NAME :  STRING   := "sram32768x8";


         --delays for inputs signals
         tipd_CS        : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
         tipd_RD        : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
         tipd_WR        : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
         tipd_NRST      : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
         tipd_EN        : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
         tipd_AD        : VitalDelayArrayType01(14 downto 0) := (others => (tr01 => 0 ns, tr10 => 0 ns));
         tipd_DI        : VitalDelayArraytype01(7 downto 0) := (others => (tr01 => 0 ns, tr10 => 0 ns));
  
    -------------------------
    -- path delays for inputs 
    -------------------------

    --- ADDRESS and DATA setup/hold

    tsetup_ad_cs_noedge_posedge : VitalDelayArrayType(14 downto 0) := (others =>  1.00 ns); 
    thold_ad_cs_noedge_posedge  : VitalDelayArrayType(14 downto 0) := (others =>  1.42 ns); 

    tsetup_di_cs_noedge_posedge : VitalDelayArrayType(7 downto 0) := (others =>  0.17 ns); 
    thold_di_cs_noedge_posedge  : VitalDelayArrayType(7 downto 0) := (others =>  1.36 ns); 

    --- control signals setup/hold

    tsetup_rd_cs_noedge_posedge : VitalDelayType :=   0.92 ns;
    thold_rd_cs_noedge_posedge  : VitalDelayType :=   0.20 ns;

    tsetup_wr_cs_noedge_posedge : VitalDelayType :=   0.90 ns;
    thold_wr_cs_noedge_posedge  : VitalDelayType :=   0.20 ns;

    tsetup_nrst_cs_noedge_posedge : VitalDelayType :=   0.42 ns;
    thold_nrst_cs_noedge_posedge  : VitalDelayType :=   4.36 ns;


    --- pulse width checks

    tpw_cs_negedge   : VitalDelayType :=   1.76 ns;
    tpw_cs_posedge   : VitalDelayType :=   0.80 ns;
    tperiod_cs       : VitalDelayType :=   6.70 ns;
    tperiod_cs_posedge : VitalDelayType :=   6.70 ns;
    tperiod_cs_negedge : VitalDelayType :=   6.70 ns;



    --- delays

    tpd_cs_do : VitalDelayArrayType01(7 downto 0)  := (others => (tr01 =>  5.11 ns,tr10 =>  5.11 ns)); 
    tpd_en_do : VitalDelayArrayType01Z(7 downto 0) := (others => (tr01 =>  1.47 ns, tr10 =>  1.47 ns, 
                                                                  tr0z =>  1.44 ns, tr1z =>  1.44 ns,
                                                                  trz1 =>  1.47 ns, trz0 =>  1.47 ns));      
    DefCombSpikeMsg : BOOLEAN := False;
    DefCombSpikeXOn : BOOLEAN := True;
    DefSeqMsgOn     : BOOLEAN := True;
    DefSeqXOn       : BOOLEAN := True;
    TimingChecksOn  : BOOLEAN := True;
    InstancePath    : STRING  := ""
        );

-- synopsys synthesize_on         
port (
      NRST    : in  std_logic;  -- reset, active low : NOP in SRAM
      CS      : in  std_logic;  -- operation on rising edge
      RD      : in  std_logic;  -- READ operation on CS rising edge
      WR      : in  std_logic;  -- write operation on CS rising edge
      EN      : in  std_logic;  -- DO are Z when EN high
      AD      : in  std_logic_VECTOR (14 downto 0); -- address bus
      DI      : in  std_logic_VECTOR (7 downto 0); -- input data bus
      DO      : out std_logic_VECTOR (7 downto 0)  -- output data bus

      );

     ATTRIBUTE VITAL_LEVEL0 of sram32768x8 : entity is TRUE;      
      
end sram32768x8;




-------------------------------------------------------------------------
------------------ Definition of comportemental architecture
-------------------------------------------------------------------------

-- exclude architecture to get a black-box model
-- synopsys synthesize_off

architecture vital_mem of sram32768x8 is

attribute VITAL_LEVEL0 of Vital_mem : architecture is TRUE;
     
signal  cs_ipd      : std_ulogic := 'X';
signal  rd_ipd      : std_ulogic := 'X';
signal  wr_ipd      : std_ulogic := 'X';
signal  nrst_ipd    : std_ulogic := 'X';
signal  en_ipd      : std_ulogic := 'X';
signal  ad_ipd      : std_logic_vector(ADDRESS_BIT-1 downto 0);
signal  di_ipd      : std_logic_vector(DATA_BIT-1 downto 0);
      
signal ram_viol_rd  : std_logic := '0';
signal add_viol_wr  : std_logic := '0';
signal ram_viol_wr  : std_logic := '0';
signal nrst_viol    : std_logic := '0';
signal ram_Pviol    : std_logic := '0';

signal ram_viol_rd1 : std_logic := '0';
signal ram_viol_wr1 : std_logic := '0';

signal ram_viol_rd2 : std_logic := '0';
signal ram_viol_wr2 : std_logic := '0';

signal ram_viol_onAdDuringnoOp : std_logic := '0';
signal ram_viol_All            : std_logic := '0';
signal memorytoXevent          : std_logic := '0';
 
signal temp_sig_a   : std_logic;
signal temp_sig_b   : std_logic;


subtype DATA_VECTOR is std_logic_VECTOR(DATA_BIT-1 downto 0);
subtype ADDRESS_NATURAL is natural range 0 to NB_WORDS-1;     
type BIT_MATRIX is array(ADDRESS_NATURAL) of DATA_VECTOR;
     
signal PLAN_MEM : BIT_MATRIX; 

-- datum in input of memory plan
signal INTERNAL_DIN  : DATA_VECTOR;

-- datum in output of memory plan
signal INTERNAL_DOUT : DATA_VECTOR;
signal DOUT_tmp      : DATA_VECTOR;
signal DOUT_intern   : DATA_VECTOR;



-------------------------------------------------------------------------
-- BEGIN of BODY
-------------------------------------------------------------------------

begin


WireDelay : Block
begin
    VitalWireDelay (cs_ipd, CS, tipd_cs);
    VitalWireDelay (rd_ipd, RD, tipd_rd);
    VitalWireDelay (wr_ipd, WR, tipd_wr);
    VitalWireDelay (nrst_ipd, NRST, tipd_nrst);
    VitalWireDelay (en_ipd, EN, tipd_en);

    address_gen : for I in 0 to (ADDRESS_BIT - 1) generate
        VitalWireDelay (ad_ipd(i), AD(i),tipd_ad(i));
    end generate address_gen;

    word_gen : for I in 0 to (DATA_BIT -1) generate
        VitalWireDelay (di_ipd(i), DI(i),tipd_di(i));
    end generate word_gen;
  
end Block;
    


timing_check_proc : process(cs_ipd, wr_ipd, rd_ipd, nrst_ipd, ad_ipd, di_ipd)
    
    -- variable for RD and CS setup and hold test
    variable Tviol_cs_rd : std_logic := '0';
    variable Tmkr_cs_rd : VitalTimingDataType := VitalTimingDataInit;

    -- variable for WR and CS setup and hold test
    variable Tviol_cs_wr : std_logic := '0';
    variable Tmkr_cs_wr : VitalTimingDataType := VitalTimingDataInit;

    -- variable for CS width test
    variable Pviol_cs : std_logic := '0';
    variable PeriodCheckInfo_cs : VitalPeriodDataType := VitalPeriodDataInit;

    -- variable for nrst_setupHold_time
    variable Tviol_nrst_setupHold : std_logic := '0';
    variable Tmkr_nrst_setupHold  : VitalTimingDataType := VitalTimingDataInit;

begin
    
if (TimingChecksON) then
    -- checks CS and RD signal
    VitalSetupHoldCheck (
       TestSignal      => rd_ipd,
       TestSignalName  => "RD",
       RefSignal       => cs_ipd,
       RefSignalName   => "CS",
       SetupHigh       => tsetup_rd_cs_noedge_posedge,
       SetupLow        => tsetup_rd_cs_noedge_posedge,
       HoldHigh        => thold_rd_cs_noedge_posedge,
       HoldLow         => thold_rd_cs_noedge_posedge,
       CheckEnabled    => true ,
       RefTransition   => 'p',
       HeaderMsg       => InstancePath & INSTANCE_NAME,
       Xon             => DefSeqXon,
       MsgOn           => DefSeqMsgOn,
       MsgSeverity     => Warning,
       TimingData      => Tmkr_cs_rd,
       Violation       => Tviol_cs_rd);

    -- checks CS and WR signal
    VitalSetupHoldCheck (
       TestSignal      => wr_ipd,
       TestSignalName  => "WR",
       RefSignal       => cs_ipd,
       RefSignalName   => "CS",
       SetupHigh       => tsetup_wr_cs_noedge_posedge,
       SetupLow        => tsetup_wr_cs_noedge_posedge,
       HoldHigh        => thold_wr_cs_noedge_posedge,
       HoldLow         => thold_wr_cs_noedge_posedge,
       CheckEnabled    => true,
       RefTransition   => 'p',
       HeaderMsg       => InstancePath & INSTANCE_NAME,
       Xon             => DefSeqXon,
       MsgOn           => DefSeqMsgOn,
       MsgSeverity     => Warning,
       TimingData      => Tmkr_cs_wr,
       Violation       => Tviol_cs_wr);

    -- checks CS width high/low period
    VitalPeriodPulseCheck (
       TestSignal      => cs_ipd,
       TestSignalName  => "CS",
       Period          => tperiod_cs,
       PulseWidthHigh  => tpw_cs_posedge,
       PulseWidthLow   => tpw_cs_negedge,
       CheckEnabled    => true,
       HeaderMsg       => InstancePath & INSTANCE_NAME,
       XOn             => DefSeqXon,
       MsgOn           => DefSeqMsgOn,
       MsgSeverity     => Warning,
       PeriodData      => PeriodCheckInfo_cs ,
       Violation       => Pviol_cs);

    -- checks NRST_SETUP_TIME, NRST_HOLD_TIME
    VitalSetupHoldCheck (
       TestSignal      => nrst_ipd,
       TestSignalName  => "NRST",
       RefSignal       => cs_ipd, 
       RefSignalName   => "CS",
       SetupHigh       => tsetup_nrst_cs_noedge_posedge,
       SetupLow        => tsetup_nrst_cs_noedge_posedge,
       HoldHigh        => thold_nrst_cs_noedge_posedge,
       HoldLow         => thold_nrst_cs_noedge_posedge,
       CheckEnabled    => true,
       RefTransition   => 'p',
       HeaderMsg       => InstancePath & INSTANCE_NAME,
       Xon             => DefSeqXon,
       MsgOn           => DefSeqMsgOn,
       MsgSeverity     => Warning,
       TimingData      => Tmkr_nrst_setupHold,
       Violation       => Tviol_nrst_setupHold);

end if;

-- define which violations put X into the selected cell during write cycle
ram_viol_wr1 <=  Tviol_cs_wr;

-- define which violation put X into the complete SRAM during write cycle
ram_Pviol <= Pviol_cs;  -- address violation

-- define nrst violation put X into the complete SRAM during write cycle
nrst_viol <= Tviol_nrst_setupHold;  -- nrst violation

-- define ram violation during read
ram_viol_rd1 <= tviol_cs_rd;

end process timing_check_proc;



addr_vio : for i in 0 to (ADDRESS_BIT - 1) generate
 
  process(cs_ipd, ad_ipd(i))
 
    -- variables for CS and address test during read 
    variable Tviol_cs_ad_lec : std_logic           := '0';
    variable Tmkr_cs_ad_lec  : VitalTimingDataType := VitalTimingDataInit;
    
    -- variables for CS and address test during write 
    variable Tviol_cs_ad_ecr : std_logic           := '0';
    variable Tmkr_cs_ad_ecr  : VitalTimingDataType := VitalTimingDataInit;
    
     -- variables for CS and address test during no Operation 
    variable Tviol_cs_ad_noOp : std_logic           := '0';
    variable Tmkr_cs_ad_noOp  : VitalTimingDataType := VitalTimingDataInit;
   
  begin    
    if (TimingChecksON) then     
      -- checks CS and address during read
      VitalSetupHoldCheck (
        TestSignal     => ad_ipd(i),
        TestSignalName => "AD",
        RefSignal      => cs_ipd,
        RefSignalName  => "CS during read",
        SetupHigh      => tsetup_ad_cs_noedge_posedge(i),
        SetupLow       => tsetup_ad_cs_noedge_posedge(i),
        HoldHigh       => thold_ad_cs_noedge_posedge(i),
        HoldLow        => thold_ad_cs_noedge_posedge(i),
        CheckEnabled   => (To_X01(rd_ipd) = '1'),     
        RefTransition  => 'p',
        HeaderMsg      => InstancePath & INSTANCE_NAME,
        Xon            => DefSeqXon,
        MsgOn          => DefSeqMsgOn,
        MsgSeverity    => Warning,
        TimingData     => Tmkr_cs_ad_lec,
        Violation      => Tviol_cs_ad_lec);
      
      -- checks CS and address during write
      VitalSetupHoldCheck (
        TestSignal     => ad_ipd(i),
        TestSignalName => "AD",
        RefSignal      => cs_ipd,
        RefSignalName  => "CS during write",
        SetupHigh      => tsetup_ad_cs_noedge_posedge(i),
        SetupLow       => tsetup_ad_cs_noedge_posedge(i),
        HoldHigh       => thold_ad_cs_noedge_posedge(i),
        HoldLow        => thold_ad_cs_noedge_posedge(i),
        CheckEnabled   => (To_X01(wr_ipd) = '1'), 
        RefTransition  => 'p',
        HeaderMsg      => InstancePath & INSTANCE_NAME,
        Xon            => DefSeqXon,
        MsgOn          => DefSeqMsgOn,
        MsgSeverity    => Warning,
        TimingData     => Tmkr_cs_ad_ecr,
        Violation      => tviol_cs_ad_ecr);

       -- checks CS and address during no operation
      VitalSetupHoldCheck (
        TestSignal     => ad_ipd(i),
        TestSignalName => "AD",
        RefSignal      => cs_ipd,
        RefSignalName  => "CS during no operation",
        SetupHigh      => tsetup_ad_cs_noedge_posedge(i),
        SetupLow       => tsetup_ad_cs_noedge_posedge(i),
        HoldHigh       => thold_ad_cs_noedge_posedge(i),
        HoldLow        => thold_ad_cs_noedge_posedge(i),
        CheckEnabled   => (To_X01(wr_ipd) = '0' and To_X01(rd_ipd) = '0'), 
        RefTransition  => 'p',
        HeaderMsg      => InstancePath & INSTANCE_NAME,
        Xon            => DefSeqXon,
        MsgOn          => DefSeqMsgOn,
        MsgSeverity    => Warning,
        TimingData     => Tmkr_cs_ad_noOp,
        Violation      => tviol_cs_ad_noOp);
     
    end if;
   
    -- define which violation put X into the complete SRAM during write cycle
    add_viol_wr <= tviol_cs_ad_ecr; 
 
    -- define ram violation during read
    ram_viol_rd2 <= tviol_cs_ad_lec;
 
    -- define ram violation during no operation
    ram_viol_onAdDuringnoOp <= tviol_cs_ad_noOp;
 

  end process ;
end generate addr_vio;



data_vio : for i in 0 to (DATA_BIT -1) generate 
  process(cs_ipd, di_ipd(i))
 
    -- variables for CS and input data test during write cycle
    variable Tviol_cs_di_uni : std_logic           := '0';                 -- unidirectional
    variable Tmkr_cs_di_uni  : VitalTimingDataType := VitalTimingDataInit; -- unidirectional
    
  begin
    
    if (TimingChecksON) then
      
      -- checks CS and data input during write for unidirectional
      VitalSetupHoldCheck (
        TestSignal     => di_ipd(i),
        TestSignalName => "DI",
        RefSignal      => cs_ipd,
        RefSignalName  => "CS during write",
        SetupHigh      => tsetup_di_cs_noedge_posedge(i),
        SetupLow       => tsetup_di_cs_noedge_posedge(i),
        HoldHigh       => thold_di_cs_noedge_posedge(i),
        HoldLow        => thold_di_cs_noedge_posedge(i),
        CheckEnabled   => (To_X01(wr_ipd) = '1'),
        RefTransition  => 'p',
        HeaderMsg      => InstancePath & INSTANCE_NAME,
        Xon            => DefSeqXon,
        MsgOn          => DefSeqMsgOn,
        MsgSeverity    => Warning,
        TimingData     => Tmkr_cs_di_uni,
        Violation      => Tviol_cs_di_uni);
      
    end if;
    
 
-- define which violations put X into the selected cell during write cycle
    ram_viol_wr2 <=  Tviol_cs_di_uni ;
 
  end process ;
end generate data_vio;


  
--- sum up a lot of X conditions
ram_viol_wr  <= ram_viol_wr1 or ram_viol_wr2;
ram_viol_rd  <= ram_viol_rd1 or ram_viol_rd2;
ram_viol_All <= nrst_viol or add_viol_wr or ram_viol_rd or ram_viol_wr or ram_Pviol or ram_viol_onAdDuringnoOp;



SIMULTANE_NRST : process
  variable Tcs, Tin : TIME := 0 ns;
begin
  wait on CS_ipd, NRST_ipd until CS_ipd = '1' and TimingChecksON;
  if CS_ipd'event then Tcs := NOW;
  end if;
  if NRST_ipd'event then Tin := NOW;
  end if;
  assert (Tcs-Tin/= 0 ns) and NOW/= 0 ns
    report "NRST and CS of " & INSTANCE_NAME & " are simultaneous."
    severity WARNING;
end process SIMULTANE_NRST;



INTERNAL_DIN <= di_ipd;

	  

--------------------------------------------------------------------------
-- OPERATION : process
--------------------------------------------------------------------------

OPERATION : process

variable I : integer := 0;
variable PLAN_tmp : BIT_MATRIX; 
variable TEST_ad, TEST_din : boolean := FALSE;
variable INTERNAL_RD : std_logic := 'X';
variable INTERNAL_WR : std_logic := 'X';
variable INTERNAL_AD : std_logic_vector(ADDRESS_BIT-1 downto 0):=(others=>'X');
variable ad_old      : std_logic_vector(ADDRESS_BIT-1 downto 0); -- old address
variable INTERDIT : boolean := true;
variable set_X    : boolean := false;
variable INTERNAL_DIN_tmp  : DATA_VECTOR;
variable INTERNAL_DOUT_tmp : DATA_VECTOR;
variable Tcs, Tnreset : TIME := 0 ns;



procedure allMemorytoX is
begin
  for i in 0 to NB_WORDS-1  loop
    PLAN_tmp(i) := (others => 'X');
  end loop;
  INTERNAL_DOUT_tmp := (others => 'X'); -- output set to X
  memorytoXevent <= not(memorytoXevent);
end;



begin

if NRST_ipd'event then
  case NRST_ipd is
    when '0' => INTERNAL_RD := '0';
                INTERNAL_WR := '0';
                INTERDIT := FALSE;
    when '1' => null ;
    when others => INTERNAL_RD :='X';
                   INTERNAL_WR :='X';
                   INTERDIT := TRUE;
                   assert ((NRST='1' or NRST='0') and (Now = 0 ns))
		     report "NRST is unspecified."
		     severity WARNING;
  end case ;

elsif (CS_ipd'event and  NRST_ipd='1') then
    case CS_ipd is
      when '1' => 
             INTERNAL_RD := RD_ipd;
             INTERNAL_WR := WR_ipd;
             INTERNAL_AD := ad_ipd;
             INTERDIT := FALSE ;
      when '0' =>
             null ; 
      when others =>
             INTERNAL_RD :='X';
             INTERNAL_WR :='X';
             INTERDIT := TRUE;
             assert false
	       report "CS unspecified, all memory set to X."
	       severity WARNING;
	     allMemorytoX;
    end case ;
end if ;

if CS_ipd ='1' and CS_ipd'last_value ='0' and not set_x and ram_viol_rd = '0' and add_viol_wr = '0' 
  and ram_viol_wr = '0' and ram_Pviol = '0' and nrst_viol = '0' and ram_viol_onAdDuringnoOp = '0' then 

  if (CS_ipd'event) then
    assert not INTERDIT
      report "Configuration not defined or forbidden." 
      severity WARNING;
  end if ;


-- WRITE OPERATION

  if (CS_ipd'event and INTERNAL_RD='0' and INTERNAL_WR='1' and not INTERDIT) then

    -- case : addresses are unspecified
    TEST_ad := vectorContainsXZ(ad_ipd);
    assert not TEST_ad 
      report "One bit of address is not defined when CS=1 during write, all memory is set to X."
      severity WARNING ;
 
    if TEST_ad then -- addresses are unspecified; all memory plan and ouput are set to X.
      allMemorytoX;
    else
      if (vec_to_int(ad_ipd) < NB_WORDS) then 
        TEST_din := vectorContainsXZ(internal_din);
        assert not TEST_din
	  report "One data bit contains X or Z during write "
	  severity warning ;
        -- write operation in memory plan
        if TEST_din then 
	  for i in 0 to (data_bit-1) loop
	    if (internal_din(i) /= '1' and internal_din(i) /= '0') then
	      internal_din_tmp(i) := 'X';
	    else
	      internal_din_tmp(i) := internal_din(i);
	    end if;
	  end loop; -- write in memory plan
	  PLAN_tmp(vec_to_int(ad_ipd)) := INTERNAL_DIN_tmp;
        else
          PLAN_tmp(vec_to_int(ad_ipd)) := INTERNAL_DIN;
        end if ;
      else
	allMemorytoX;
	assert false
	  report "Overflow on address during write, all memory set to X." 
	  severity WARNING;
      end if;
    end if ;

-- READ OPERATION
  elsif (CS_ipd'event and INTERNAL_RD='1' and INTERNAL_WR='0' and not INTERDIT) then
      -- adresses are unspecified
      TEST_ad := vectorContainsXZ(ad_ipd);
      assert not TEST_ad 
	report "One bit adresses bus is not defined during read operation, output is set to X."
	severity WARNING ;

      if TEST_ad then 
        INTERNAL_DOUT_tmp := (others => 'X') ; 
      else 
        if (vec_to_int(ad_ipd) < NB_WORDS) then
	  INTERNAL_DOUT_tmp := PLAN_tmp(vec_to_int(ad_ipd)) ;
        else
	  INTERNAL_DOUT_tmp := (others => 'X') ;
	  assert false
	    report "Overflow on address during read, output set to X." 
	    severity WARNING;
        end if;
      end if ;
      
-- UNDEFINED OR FORBIDDEN CONFIGURATIONS
  elsif ((INTERNAL_RD /= '0' and INTERNAL_WR = '1') or INTERNAL_WR = 'X' or INTERNAL_WR = 'Z') then
    allMemorytoX;
    INTERDIT := TRUE ;
    assert false
      report "Configuration not defined or forbiden, all memory set to X." 
      severity WARNING;       
  elsif (INTERNAL_RD = 'X' or INTERNAL_RD = 'Z') then
    INTERNAL_DOUT_tmp := (others => 'X');
    INTERDIT := TRUE ;
    assert false
      report "Configuration not defined or forbiden, all memory set to X." 
      severity WARNING;       
  end if ;


elsif nrst_viol /= '0' then    
  allMemorytoX;
  assert not nrst_viol'event
    report "Timing violation on nrst during write, all memory and output are set to X."
    severity WARNING;
  set_x := true;

elsif ram_Pviol /= '0' then    
  allMemorytoX;
  assert not ram_Pviol'event
    report "Timing violation on signal CS, all memory is set to X."
    severity WARNING;
  set_x := true;

elsif add_viol_wr /= '0' then    
  allMemorytoX;
  assert not add_viol_wr'event
    report "Timing violation during write, all memory is set to X."
    severity WARNING;
  set_x := true;

elsif ram_viol_wr /= '0' then
  allMemorytoX;
  TEST_ad := vectorContainsXZ(ad_ipd);
  if TEST_ad = true then
    assert not ram_viol_wr'event
      report "One bit address contains X during write, all memory is set to X."
      severity WARNING;
  else
     assert not ram_viol_wr'event
      report "Timing violation during write, all memory set to X."
      severity WARNING;
  end if;
  set_x := true;

elsif ram_viol_rd /= '0' then 
  INTERNAL_DOUT_tmp :=  (others => 'X');
  assert not ram_viol_rd'event
    report "Timing violation on signal RD or AD, output set to X."
    severity warning ;
  if (wr_ipd /= '0' and cs_ipd /= '0') then
    allMemorytoX;
    assert false
      report "Timing violation on signal RD during write operation, all memory is set to X."
      severity WARNING;
  end if;
  set_X := true;

elsif ram_viol_onAdDuringnoOp /= '0' then 
  INTERNAL_DOUT_tmp :=  (others => 'X');
  assert not ram_viol_onAdDuringnoOp'event
    report "Timing violation on address during no operation, Output set to X."
    severity warning ;
  set_X := true;

elsif (set_x and cs_ipd = '0' and cs_ipd'last_value /= '0') or nrst_ipd = '0' then
  set_x := false;
end if;


-- check timing
if CS_ipd'event and CS_ipd = '1' then 
  Tcs:= NOW ;
end if ;

if NRST_ipd'event then 
  Tnreset := NOW ;
end if ;


if INTERNAL_RD = '0' and CS_ipd = '1' and ad_old /= ad_ipd then
  -- If address change when no read operation or write operation, Output is set to X
  INTERNAL_DOUT_tmp :=  (others => 'X');
end if;


PLAN_MEM <= plan_tmp;
INTERNAL_DOUT <= INTERNAL_DOUT_tmp;

if CS_ipd ='1' then
  ad_old := ad_ipd;
end if;
                                
wait on CS_ipd, NRST_ipd, ram_viol_rd, add_viol_wr, ram_viol_wr, nrst_viol, ram_Pviol, ram_viol_onAdDuringnoOp;
end process OPERATION ;


FINAL_ACTION : process(en_ipd, INTERNAL_DOUT)
begin
  if en_ipd='1' then 
        DOUT_tmp  <= (others => 'Z');
    
  elsif en_ipd='0' then
        DOUT_tmp  <= INTERNAL_DOUT;
    
  elsif (en_ipd='X' or en_ipd='Z') then
        DOUT_tmp  <= (others => 'X');      
    
    assert not en_ipd'event
      report "EN not defined" 
      severity WARNING;
  end if ;    
end process FINAL_ACTION;



OUT_DEL : process(en_ipd, CS_ipd, DOUT_tmp, ram_viol_All)

  TYPE VitalGlitchDataArrayType IS ARRAY (NATURAL RANGE <>)
    OF VitalGlitchDataType;
  variable GlitchDataArray_a : VitalGlitchDataArrayType((DATA_BIT-1) downto 0);
  
begin


-- delay for tristate enable
  

  for i in DATA_BIT-1 downto 0 loop
    ARRAYVitalPathDelay01Z (
      OutBus           => DOUT_intern,
      OutBusIndex      => i,
      OutSignalName    => "DOUT_tmp(i)",
      OutTemp          => DOUT_tmp(i),
      Paths            => (
        0 => (en_ipd'LAST_EVENT,     -- tri-state path EN
              VitalExtendToFillDelay(tpd_en_do(i)),True),
        1 => (cs_ipd'LAST_EVENT,     -- rising CS
              VitalExtendToFillDelay(tpd_cs_do(i)),
              (to_X01(cs_ipd) /= '0' and ram_viol_All ='0'))),

      GlitchData       => GlitchDataArray_a(i),
      Mode             => OnEvent,
      XOn              => DefCombSpikeXOn,
      MsgOn            => DefCombSpikeMsg,
      MsgSeverity      => Warning,
      temp_sig         => temp_sig_a);    
  end loop; 

end process OUT_DEL;

DO <=  DOUT_intern;
  
end vital_mem ;

-- synopsys synthesize_on

