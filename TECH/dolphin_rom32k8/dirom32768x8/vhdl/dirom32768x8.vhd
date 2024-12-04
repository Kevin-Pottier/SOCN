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



-----------------------------------------
-- Diffusion ROM generator V4.1
--
-- DIROM VHDL model V4.1
-- Author : DOLPHIN INTEGRATION
-- Last modification : 03-09-99
-----------------------------------------



library ieee,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
-- exclude VITAL library
-- synopsys synthesize_off
use IEEE.VITAL_TIMING.all;
-- synopsys synthesize_on
use work.dirom_pkg.all;



Entity dirom32768x8 is

-- exclude generics
-- synopsys synthesize_off

generic (
     DATA_FILE      : STRING   := "";   -- file contains datum to program
     ADDRESSBITS    : POSITIVE := 15;      
     DATABITS       : POSITIVE := 8;     
     NB_WORDS       : POSITIVE := 32768;  
     INSTANCE_NAME  : STRING   := "dirom32768x8";
 
     --delays for inputs signals
     tipd_CS        : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
     tipd_NRST      : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
     tipd_EN        : VitalDelayType01 := (tr01 => 0 ns, tr10 => 0 ns);
     tipd_AD        : VitalDelayArrayType01(14 downto 0) := (others => (tr01 => 0 ns, tr10 => 0 ns));  
 
    
    -------------------------
    -- path delays for inputs 
    -------------------------

    --- ADDRESS setup/hold

    tsetup_ad_cs_noedge_posedge : VitalDelayArrayType(14 downto 0) := (others => 0.63 ns);   
    thold_ad_cs_noedge_posedge  : VitalDelayArrayType(14 downto 0) := (others => 1.30 ns);   

    --- control signals setup/hold
    tsetup_nrst_cs_noedge_posedge : VitalDelayType :=  0.43 ns;
    thold_nrst_cs_noedge_posedge  : VitalDelayType :=  2.56 ns;  

    --- pulse width checks
    tpw_cs_negedge     : VitalDelayType :=  0.96 ns;
    tpw_cs_posedge     : VitalDelayType :=  0.81 ns;
    tperiod_cs         : VitalDelayType :=  7.25 ns;
    tperiod_cs_posedge : VitalDelayType :=  7.25 ns;
    tperiod_cs_negedge : VitalDelayType :=  7.25 ns;

    --- delays 
    tpd_cs_do : VitalDelayArrayType01(7 downto 0) := (others => (4.55 ns, 4.55 ns));    
    tpd_en_do : VitalDelayArrayType01Z(7 downto 0) := (others => (tr01 => 1.55 ns, tr10 => 1.55 ns, 
                                                                   trz0 => 1.55 ns, trz1 => 1.55 ns, 
                                                                   tr0z =>  1.40 ns, tr1z =>  1.40 ns));

     DefCombSpikeMsg : BOOLEAN := False;
     DefCombSpikeXOn : BOOLEAN := True;
     DefSeqMsgOn     : BOOLEAN := True;
     DefSeqXOn       : BOOLEAN := True;
     TimingChecksOn  : BOOLEAN := True;
     InstancePath    : STRING := ""
        );


-- synopsys synthesize_on
port (
     NRST  : in std_logic; 
     CS    : in std_logic;
     EN    : in std_logic;
     AD    : in std_logic_VECTOR(14 downto 0);     
     DO    : out std_logic_VECTOR(7 downto 0)    
      );

ATTRIBUTE VITAL_LEVEL0 of dirom32768x8 : entity is TRUE;


end dirom32768x8;



-- exclude architecture to get a black-box model
-- synopsys synthesize_off
                                                    
architecture VITAL_MEM of dirom32768x8 is

  signal ad_ipd         : std_logic_vector(ADDRESSBITS-1 downto 0) := (others => 'X');

  signal cs_ipd         : std_ulogic := 'X';
  signal cs_ipd_del     : std_ulogic;
  signal nrst_ipd       : std_ulogic := 'X';
  signal en_ipd         : std_ulogic := 'X';

  subtype DATA_VECTOR is std_logic_VECTOR (DATABITS-1 downto 0);
  signal INTERNAL_DOUT  : DATA_VECTOR := (others => 'X');
  signal DOUT_tmp       : DATA_VECTOR := (others => 'X');
  signal DOUT_intern    : DATA_VECTOR := (others => 'X');

  signal rom_viol_rd    : std_logic := '0';
  signal rom_viol_rd1   : std_logic := '0';
  signal add_viol       : std_logic := '0';
  signal nrst_viol      : std_logic := '0';
  
  signal temp_sig       : std_logic;
       
  signal memorytoXevent : std_logic := '0';


  
begin
     
    

WireDelay : Block
begin
    VitalWireDelay (cs_ipd, CS, tipd_cs);
    VitalWireDelay (nrst_ipd, NRST, tipd_nrst);
    VitalWireDelay (EN_ipd, EN, tipd_en);
    address_gen : for I in 0 to (ADDRESSBITS - 1) generate
        VitalWireDelay (ad_ipd(i), AD(i),tipd_ad(i));
    end generate address_gen;
end Block;



Timing_check_proc : process(cs_ipd, cs_ipd_del, nrst_ipd)
    
    -- variable for CS width test
    variable Pviol_cs : std_logic := '0';
    variable PeriodCheckInfo_cs : VitalPeriodDataType := VitalPeriodDataInit;

	-- variable for CS width low test
    variable Tviol_cs_low : std_logic := '0';
    variable Tmkr_cs_low : VitalPeriodDataType := VitalPeriodDataInit;
 
    -- variable for nrst_setupHold_time
    variable Tviol_nrst_setupHold : std_logic := '0';
    variable Tmkr_nrst_setupHold  : VitalTimingDataType := VitalTimingDataInit;

begin   
    if TimingChecksOn then
      
      -- checks CS period, width high/low period
    VitalPeriodPulseCheck (
        TestSignal      => cs_ipd,
        TestSignalName  => "CS, period",
        Period          => tperiod_cs,
        PulseWidthHigh  => tpw_cs_posedge,
        PulseWidthLow   => tpw_cs_negedge,
        CheckEnabled    => TRUE,
        HeaderMsg       => InstancePath & INSTANCE_NAME,
        XOn             => DefSeqXon,
        MsgOn           => DefSeqMsgOn,
        MsgSeverity     => Warning,
        PeriodData      => PeriodCheckInfo_cs,
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

    rom_viol_rd1 <= Tviol_cs_low or Pviol_cs or Tviol_nrst_setupHold;
    nrst_viol    <= Tviol_nrst_setupHold;

  end process timing_check_proc;



  addr_vio : for i in 0 to (ADDRESSBITS-1) generate
 
    ad_check_generate : process(cs_ipd, ad_ipd(i))
    
      variable Tviol_cs_ad : std_logic := '0';
      variable Tmkr_cs_ad : VitalTimingDataType := VitalTimingDataInit;

    begin    
      if TimingChecksOn then
        -- checks CS and address during read
        VitalSetupHoldCheck (
          TestSignal      => ad_ipd(i),
          TestSignalName  => "AD",
          RefSignal       => cs_ipd,
          RefSignalName   => "CS",
          SetupHigh       => tsetup_ad_cs_noedge_posedge(i),
          SetupLow        => tsetup_ad_cs_noedge_posedge(i),
          HoldHigh        => thold_ad_cs_noedge_posedge(i),
          HoldLow         => thold_ad_cs_noedge_posedge(i),
          CheckEnabled    => true,    
          RefTransition   => 'p',
          HeaderMsg       => InstancePath & INSTANCE_NAME,
          Xon             => DefSeqXon,
          MsgOn           => DefSeqMsgOn,
          MsgSeverity     => Warning,
          TimingData      => Tmkr_cs_ad,
          Violation       => Tviol_cs_ad);
      end if;
      
      add_viol <= Tviol_cs_ad; 

    end process ad_check_generate;
    
  end generate addr_vio;


  
  rom_viol_rd <= rom_viol_rd1 or add_viol;

  

  SIMULTANE_NRST : process
    variable Tcs, Tnr : TIME := 0 ns;
  begin
    wait on CS_ipd, NRST_ipd until CS='1' and TimingChecksOn;
    if CS_ipd'EVENT then
      Tcs := NOW;
    end if;
    if NRST_ipd'EVENT then
      Tnr := NOW;
    end if;
    assert (Tnr /= Tcs) and NOW /= 0 ns
      report "NRST and CS of " & InstancePath & INSTANCE_NAME & " are simultaneous."
      severity WARNING;
  end process SIMULTANE_NRST;


  
  cs_ipd_del <= cs_ipd after 1 ps;



--------------------------------------------------------------------------
-- OPERATION : process
--------------------------------------------------------------------------

  OPERATION : process

    variable I, K : integer := 0;
    variable INTERNAL_RD : std_logic := 'X';
    variable INTERNAL_AD : std_logic_vector(ADDRESSBITS-1 downto 0):= (others => 'X');
    variable ad_old      : std_logic_vector(ADDRESSBITS-1 downto 0); -- old address
    variable INTERDIT                : boolean := True;
    variable TEST_ad                 : boolean := False;
    variable testAllProgrammingFile  : boolean := False;
    variable set_X                   : boolean := False;
    variable INTERNAL_DOUT_tmp       : DATA_VECTOR;
    variable INTERNAL_DOUT_prepare   : DATA_VECTOR;
    variable Tcs, Tnrst : TIME := 0 ns;

    variable CONTENTS : BIT_MATRIX (0 to NB_WORDS-1, DATABITS-1 downto 0);



    procedure allOutputtoX is
    begin
      INTERNAL_DOUT_tmp := (others => 'X'); -- output is set to X
      memorytoXevent <= not(memorytoXevent);
    end;



  begin

    if not (testAllProgrammingFile)  then
      CONTENTS := READ_CONTENU(DATA_FILE, NB_WORDS, DATABITS);
      testAllProgrammingFile := True;
    end if;

    if NRST_ipd'event then
      case NRST_ipd is
        when '0' => INTERNAL_RD := '0';
                    INTERDIT := FALSE;
        when '1' => null;
        when others => INTERNAL_RD := 'X';
                       INTERDIT := TRUE;
                       assert ((NRST='1' or NRST='0') and (Now = 0 ns))
                         report "NRST is unspecified."
                         severity WARNING;
      end case;

    elsif (CS_ipd'event and  NRST_ipd='1') then
      case CS_ipd is
        when '1' =>
          INTERNAL_RD := '1';
          INTERNAL_AD := ad_ipd;
          INTERDIT := FALSE;
        when '0' =>
          null; 
        when others =>
          INTERNAL_RD :='X';
          INTERDIT := TRUE;
          assert false
            report "CS unspecified, all memory is set to X."
            severity WARNING;
          allOutputtoX;
      end case;
    end if;

    if CS_ipd ='1' and CS_ipd'last_value ='0' and not set_X and rom_viol_rd = '0' and nrst_viol = '0' then 

      if (CS_ipd'event) then
         assert not INTERDIT
          report "Configuration not defined or forbidden." 
          severity WARNING;
      end if;

-- READ OPERATION
      if (CS_ipd'event and INTERNAL_RD = '1' and not INTERDIT) then
        -- adresses are unspecified
        TEST_ad := Is_X(ad_ipd);
        assert not TEST_ad 
          report "One bit adresses bus is not defined during read operation, output is set to X."
          severity WARNING;
        if TEST_ad then 
          INTERNAL_DOUT_tmp := (others => 'X'); 
        else 
          if (not TEST_ad) then
            K := VEC_TO_INT(ad_ipd);
            if (K < NB_WORDS) then
              for I in INTERNAL_DOUT'range loop
                INTERNAL_DOUT_prepare(I) := CONTENTS(K,I);
              end loop;
              INTERNAL_DOUT_tmp := INTERNAL_DOUT_prepare;
            else
              INTERNAL_DOUT_tmp := (others => 'X');
              assert false
                report "Overflow on address during read, output is set to X." 
                severity WARNING;
            end if;
          end if;
        end if;

-- UNDEFINED OR FORBIDDEN CONFIGURATIONS
      elsif (INTERNAL_RD = 'X' or INTERNAL_RD = 'Z') then
        INTERNAL_DOUT_tmp := (others => 'X');
        INTERDIT := TRUE;
        assert false
          report "Configuration not defined or forbiden, output is set to X." 
          severity WARNING;       
      end if;

    elsif nrst_viol /= '0' then    
      allOutputtoX;
      assert not nrst_viol'event
        report "Timing violation on nrst during write, all memory and output are set to X."
        severity WARNING;
      set_X := true;

    elsif rom_viol_rd /= '0' then 
      --INTERNAL_DOUT_tmp := (others => 'X');
      allOutputtoX;
      assert not rom_viol_rd'event
        report "Timing violation on signals, output is set to X."
        severity warning;
      set_X := true;

    elsif (set_X and cs_ipd = '0' and cs_ipd'last_value /= '0') or nrst_ipd = '0' then
      set_X := false;
    end if;


    if INTERNAL_RD = '0' and CS_ipd = '1' and ad_old /= ad_ipd then
      -- If address change when no read operation or write operation, Output is set to X
      INTERNAL_DOUT_tmp :=  (others => 'X');
    end if;

    
    INTERNAL_DOUT <= INTERNAL_DOUT_tmp;

    if CS_ipd = '1' then
      ad_old := ad_ipd;
    end if;    

    wait on CS_ipd, NRST_ipd, rom_viol_rd, add_viol, nrst_viol;
  end process OPERATION;

  FINAL_ACTION : process(en_ipd,  INTERNAL_DOUT)
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
    end if;    
  end process FINAL_ACTION;



  OUT_DEL : process( CS_ipd, EN_ipd, DOUT_tmp, rom_viol_rd)
    TYPE VitalGlitchDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalGlitchDataType;
    variable GlitchDataArray  : VitalGlitchDataArrayType(DATABITS-1 downto 0);
  begin
    -- delay for tristate enable


    for i in DATABITS-1 downto 0 loop
      ARRAYVitalPathDelay01Z (
        OutBus          => DOUT_intern,
        OutBusIndex     => i,
        OutSignalName   => "DATA(i)",
        OutTemp         => dout_tmp(i),
        Paths           => (
          0 => (EN_ipd'LAST_EVENT, -- tristate path EN
                VitalExtendToFillDelay(tpd_en_do(i)),TRUE),
          1 => (cs_ipd'LAST_EVENT, -- rising CS
                VitalExtendToFillDelay(tpd_cs_do(i)),
                to_X01(cs_ipd) /= '0' and rom_viol_rd = '0')),
        GlitchData      => GlitchDataArray(i),
        Mode            => OnEvent,
        XOn             => DefCombSpikeXOn,
        MsgOn           => DefCombSpikeMsg,
        MsgSeverity     => Warning,
        temp_sig        => temp_sig);    
    end loop;

  end process OUT_DEL;



  DO <= DOUT_intern;



end VITAL_MEM;

-- synopsys synthesize_on

