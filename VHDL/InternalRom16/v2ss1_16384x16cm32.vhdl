-----------------------------------------------------------------------
--               Copyright(c) Virage Logic Corporation.                
--     All Rights reserved - Unpublished -rights reserved under        
--     the Copyright laws of the United States of America.             
--                                                                     
--  This file includes the Confidential information of Virage Logic    
--  and UMC-FF                                                         
--  The receiver of this Confidential Information shall not disclose   
--  it to any third party and shall protect its confidentiality by     
--  using the same degree of care, but not less then a reasonable      
--  degree of care, as the receiver uses to protect receiver's own     
--  Confidential Information.                                          
--                                                                     
--                    Virage Logic Corporation.                        
--                    47100 Bayside Pkwy                               
--                    Fremont , California 94538.                      
--                                                                     
-----------------------------------------------------------------------
--                                                                     
--  Software           : Rev: 3.2.2 (build REL-3-2-2-2002-12-13)       
--  Library Format     : Rev: 1.05.00                                  
--  Compiler Name      : at18s1p10v2sb02                               
--  Date of Generation : Wed May 14 15:57:39 MEST 2003                 
--                                                                     
-----------------------------------------------------------------------
--   --------------------------------------------------------------     
--                       Template Revision : 1.1.2                      
--   --------------------------------------------------------------     
--  ************************************************************
--     *     Synchronous, 1-Port ROM               * 
--                   *      VHDL Model       * 
-- * WARNING: Ports with underscores not allowed in VITAL models  *
-- *************************************************************
--
-- THIS IS A SYNCHRONOUS 1-PORT MEMORY MODEL
-- WHICH TAKES BOTH TIMING CHECKS AND DELAY DATA FROM SDF ONLY
--
-- Memory Name:       v2ss1_16384x16cm32
-- Memory Size:       16384 words x 16 bits
--
--                 PORT NAME
--                 ---------
-- Input Ports:
--
--                 addr [13:0]
--                 oe
--                 me
--                 clk
-- Output Ports:
--
--                 do [15:0]
--
-- *************************************************************
 
library IEEE;
use IEEE.std_logic_1164.all;
-- synopsys translate_off 
use IEEE.std_logic_textio.all;
use IEEE.vital_timing.all;
use IEEE.vital_primitives.all;
use STD.TEXTIO.ALL;
-- synopsys translate_on 

entity v2ss1_16384x16cm32 is

-- synopsys translate_off 

    generic (
        PreloadFilename : string         :=  "auto.vh";
        TimingChecksOn : Boolean         := True;
        XGenerationOn  : Boolean         := True;

-- start interconnect
         tipd_clk  : VitalDelayType01         := (0.0 ns, 0.0 ns);
         tipd_me   : VitalDelayType01         := (0.0 ns, 0.0 ns);
         tipd_addr : VitalDelayArrayType01(13 downto 0) := (others => (0.0 ns, 0.0 ns));
         tipd_oe   : VitalDelayType01         := (0.0 ns, 0.0 ns);
-- end interconnect

-- start path delay

         tpd_clk_do_posedge  : VitalDelayArrayType01ZX (15 downto 0)
          := (15 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              14 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              13 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              12 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              11 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              10 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              9 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              8 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              7 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              6 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              5 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              4 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              3 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              2 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              1 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns),
              0 => (  5.752 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  5.752 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns,  1.611 ns));
         tpd_oe_do : VitalDelayArrayType01ZX(15 downto 0)
           := (15 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               14 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               13 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               12 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               11 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               10 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               9 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               8 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               7 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               6 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               5 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               4 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               3 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               2 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               1 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns),
               0 => ( 0.404 ns,  0.404 ns,  0.404 ns, 0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns,  0.404 ns));
-- end path delay

-- start constraints
           tsetup_addr_clk_posedge_posedge : VitalDelayArrayType (13 downto 0)
                 :=  (
                         13 =>  0.340 ns,
                         12 =>  0.340 ns,
                         11 =>  0.340 ns,
                         10 =>  0.340 ns,
                         9 =>  0.340 ns,
                         8 =>  0.340 ns,
                         7 =>  0.340 ns,
                         6 =>  0.340 ns,
                         5 =>  0.340 ns,
                         4 =>  0.340 ns,
                         3 =>  0.340 ns,
                         2 =>  0.340 ns,
                         1 =>  0.340 ns,
                         0 =>  0.340 ns);
           tsetup_addr_clk_negedge_posedge : VitalDelayArrayType (13 downto 0)
                 :=  (
                         13 =>  0.340 ns,
                         12 =>  0.340 ns,
                         11 =>  0.340 ns,
                         10 =>  0.340 ns,
                         9 =>  0.340 ns,
                         8 =>  0.340 ns,
                         7 =>  0.340 ns,
                         6 =>  0.340 ns,
                         5 =>  0.340 ns,
                         4 =>  0.340 ns,
                         3 =>  0.340 ns,
                         2 =>  0.340 ns,
                         1 =>  0.340 ns,
                         0 =>  0.340 ns);
 
           thold_addr_clk_posedge_posedge : VitalDelayArrayType (13 downto 0)
                   :=  (
                   13 =>  0.295 ns,
                   12 =>  0.295 ns,
                   11 =>  0.295 ns,
                   10 =>  0.295 ns,
                   9 =>  0.295 ns,
                   8 =>  0.295 ns,
                   7 =>  0.295 ns,
                   6 =>  0.295 ns,
                   5 =>  0.295 ns,
                   4 =>  0.295 ns,
                   3 =>  0.295 ns,
                   2 =>  0.295 ns,
                   1 =>  0.295 ns,
                   0 =>  0.295 ns);
           thold_addr_clk_negedge_posedge : VitalDelayArrayType (13 downto 0)
                   :=  (
                   13 =>  0.295 ns,
                   12 =>  0.295 ns,
                   11 =>  0.295 ns,
                   10 =>  0.295 ns,
                   9 =>  0.295 ns,
                   8 =>  0.295 ns,
                   7 =>  0.295 ns,
                   6 =>  0.295 ns,
                   5 =>  0.295 ns,
                   4 =>  0.295 ns,
                   3 =>  0.295 ns,
                   2 =>  0.295 ns,
                   1 =>  0.295 ns,
                   0 =>  0.295 ns);
           tsetup_me_clk_posedge_posedge : VitalDelayType :=  0.340 ns;
           tsetup_me_clk_negedge_posedge : VitalDelayType :=  0.340 ns;
           thold_me_clk_posedge_posedge : VitalDelayType :=  0.000 ns;
           thold_me_clk_negedge_posedge : VitalDelayType :=  0.000 ns;
           tpw_clk_negedge       : VitalDelayType :=  0.531 ns;
           tpw_clk_posedge       : VitalDelayType :=  0.271 ns;
           tperiod_clk_posedge            : VitalDelayType :=  8.593 ns;
           tperiod_clk_negedge            : VitalDelayType :=  8.593 ns
-- end constraint section
    );

-- synopsys translate_on 

    port (
        do : out std_logic_vector(15 downto 0);
        addr :in std_logic_vector(13 downto 0);
        oe : in std_logic;
        me : in std_logic;
        clk : in std_logic);

    attribute VITAL_Level0 of v2ss1_16384x16cm32 : ENTITY is True ;

end v2ss1_16384x16cm32;

architecture behaviour of v2ss1_16384x16cm32 is

-- synopsys translate_off

    TYPE  rom_array is ARRAY  (0 to 16383) of std_logic_vector(15 downto 0);
    SIGNAL int_do : std_logic_vector(15 downto 0);
    SIGNAL clk_ipd : std_ulogic;
    SIGNAL me_ipd  : std_ulogic;
    SIGNAL addr_ipd : std_logic_vector(13 downto 0);
    SIGNAL oe_ipd : std_ulogic;
    SIGNAL VIOLA_flag : std_ulogic := '0';
    SIGNAL oe_risetime : time := 0.0 ns;

-- synopsys translate_on

    begin

-- synopsys translate_off

    WIREDELAY : BLOCK BEGIN
   VitalWireDelay(clk_ipd,clk,tipd_clk);
   VitalWireDelay(me_ipd,me,tipd_me);
   VitalWireDelay(oe_ipd,oe,tipd_oe);
  addr_gen : for i in 0 to 13 generate
   VitalWireDelay(addr_ipd(i),addr(i),tipd_addr(i));
        end generate;
    END BLOCK;

VITALBehavior :  process( clk_ipd, me_ipd, addr_ipd)

-- timing check variables

    VARIABLE mem : rom_array;
   VARIABLE TimingDataInfo_addr0      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr1      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr2      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr3      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr4      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr5      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr6      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr7      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr8      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr9      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr10      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr11      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr12      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_addr13      : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE TimingDataInfo_me          : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE PeriodDataInfo_clk         : VitalPeriodDataType := VitalPeriodDataInit;

   VARIABLE clk_viol      : X01 := '0';
   VARIABLE me_viol      : X01 := '0';
   VARIABLE addr0_viol   : X01 := '0';
   VARIABLE addr1_viol   : X01 := '0';
   VARIABLE addr2_viol   : X01 := '0';
   VARIABLE addr3_viol   : X01 := '0';
   VARIABLE addr4_viol   : X01 := '0';
   VARIABLE addr5_viol   : X01 := '0';
   VARIABLE addr6_viol   : X01 := '0';
   VARIABLE addr7_viol   : X01 := '0';
   VARIABLE addr8_viol   : X01 := '0';
   VARIABLE addr9_viol   : X01 := '0';
   VARIABLE addr10_viol   : X01 := '0';
   VARIABLE addr11_viol   : X01 := '0';
   VARIABLE addr12_viol   : X01 := '0';
   VARIABLE addr13_viol   : X01 := '0';
    VARIABLE addrviolated : X01 := '0';
      
   VARIABLE addrlatched : std_logic_vector(13 downto 0);
   VARIABLE addr_chk : std_logic_vector(13 downto 0);
   VARIABLE melatched : std_ulogic;
   VARIABLE me_chk : std_ulogic;
   VARIABLE clk_time : time := 0.0 ns;
   VARIABLE timeA : time := 0.0 ns;

   VARIABLE addressx : Boolean := false;
   VARIABLE addressout_of_range : Boolean := false;
   VARIABLE address : integer;
   VARIABLE address_chk : integer;
   VARIABLE tmp_do : std_logic_vector(15 downto 0);
-- Extra variables to keep track of violations on ADR within the same cycle

    VARIABLE rom_init : BOOLEAN := FALSE;
    FILE rom_data_file : TEXT IS IN PreloadFilename;
    VARIABLE rom_rec : LINE;
    VARIABLE k : INTEGER := 0;
    VARIABLE a_addr : STRING( 1 to 4);
    VARIABLE a_space : STRING( 1 to 1);


-- to_integer function of IEEE Arithmetic package not used. This is due to the
-- implementation variations across VHDL simulators
  
function to_unsigned_integer (oper : STD_LOGIC_VECTOR) return INTEGER is
    variable value : INTEGER := 0;
    variable temp_no : INTEGER := 1;
    variable temp_oper : STD_LOGIC_VECTOR(oper'range) := oper;
    variable INDEX : INTEGER := 1;
    begin
        assert oper'length <= 31
            report "argument is too large in TO_INTEGER, only lower 31 bits will be taken"
            severity WARNING;
 
        if (not (Is_X(oper))) then
            for I in temp_oper'reverse_range loop
                case (temp_oper(I)) is
                    when '1' =>
                        value := value + temp_no;
                    when others =>
                        null;
                end case;
                INDEX := INDEX + 1;
                exit when INDEX > 31;
                temp_no := temp_no + temp_no;
            end loop;
        else
            assert FALSE report
            "WARNING: Illegal value detected in the conversion of TO_unsigned_INTEGER"
            severity WARNING;
            value := 0;
        end if;
        return (value);
end to_unsigned_integer;


    begin

        if (TimingChecksOn) then

 
    VitalSetupHoldCheck (
           Violation => addr0_viol,
           TimingData => TimingDataInfo_addr0,
           TestSignal => addr_ipd(0),
           TestSignalName => "addr(0)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(0),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(0),
           HoldHigh => thold_addr_clk_posedge_posedge(0),
           HoldLow => thold_addr_clk_negedge_posedge(0),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr1_viol,
           TimingData => TimingDataInfo_addr1,
           TestSignal => addr_ipd(1),
           TestSignalName => "addr(1)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(1),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(1),
           HoldHigh => thold_addr_clk_posedge_posedge(1),
           HoldLow => thold_addr_clk_negedge_posedge(1),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr2_viol,
           TimingData => TimingDataInfo_addr2,
           TestSignal => addr_ipd(2),
           TestSignalName => "addr(2)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(2),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(2),
           HoldHigh => thold_addr_clk_posedge_posedge(2),
           HoldLow => thold_addr_clk_negedge_posedge(2),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr3_viol,
           TimingData => TimingDataInfo_addr3,
           TestSignal => addr_ipd(3),
           TestSignalName => "addr(3)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(3),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(3),
           HoldHigh => thold_addr_clk_posedge_posedge(3),
           HoldLow => thold_addr_clk_negedge_posedge(3),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr4_viol,
           TimingData => TimingDataInfo_addr4,
           TestSignal => addr_ipd(4),
           TestSignalName => "addr(4)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(4),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(4),
           HoldHigh => thold_addr_clk_posedge_posedge(4),
           HoldLow => thold_addr_clk_negedge_posedge(4),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr5_viol,
           TimingData => TimingDataInfo_addr5,
           TestSignal => addr_ipd(5),
           TestSignalName => "addr(5)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(5),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(5),
           HoldHigh => thold_addr_clk_posedge_posedge(5),
           HoldLow => thold_addr_clk_negedge_posedge(5),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr6_viol,
           TimingData => TimingDataInfo_addr6,
           TestSignal => addr_ipd(6),
           TestSignalName => "addr(6)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(6),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(6),
           HoldHigh => thold_addr_clk_posedge_posedge(6),
           HoldLow => thold_addr_clk_negedge_posedge(6),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr7_viol,
           TimingData => TimingDataInfo_addr7,
           TestSignal => addr_ipd(7),
           TestSignalName => "addr(7)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(7),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(7),
           HoldHigh => thold_addr_clk_posedge_posedge(7),
           HoldLow => thold_addr_clk_negedge_posedge(7),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr8_viol,
           TimingData => TimingDataInfo_addr8,
           TestSignal => addr_ipd(8),
           TestSignalName => "addr(8)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(8),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(8),
           HoldHigh => thold_addr_clk_posedge_posedge(8),
           HoldLow => thold_addr_clk_negedge_posedge(8),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr9_viol,
           TimingData => TimingDataInfo_addr9,
           TestSignal => addr_ipd(9),
           TestSignalName => "addr(9)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(9),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(9),
           HoldHigh => thold_addr_clk_posedge_posedge(9),
           HoldLow => thold_addr_clk_negedge_posedge(9),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr10_viol,
           TimingData => TimingDataInfo_addr10,
           TestSignal => addr_ipd(10),
           TestSignalName => "addr(10)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(10),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(10),
           HoldHigh => thold_addr_clk_posedge_posedge(10),
           HoldLow => thold_addr_clk_negedge_posedge(10),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr11_viol,
           TimingData => TimingDataInfo_addr11,
           TestSignal => addr_ipd(11),
           TestSignalName => "addr(11)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(11),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(11),
           HoldHigh => thold_addr_clk_posedge_posedge(11),
           HoldLow => thold_addr_clk_negedge_posedge(11),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr12_viol,
           TimingData => TimingDataInfo_addr12,
           TestSignal => addr_ipd(12),
           TestSignalName => "addr(12)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(12),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(12),
           HoldHigh => thold_addr_clk_posedge_posedge(12),
           HoldLow => thold_addr_clk_negedge_posedge(12),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 
 
    VitalSetupHoldCheck (
           Violation => addr13_viol,
           TimingData => TimingDataInfo_addr13,
           TestSignal => addr_ipd(13),
           TestSignalName => "addr(13)",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_addr_clk_posedge_posedge(13),
           SetupLow =>  tsetup_addr_clk_negedge_posedge(13),
           HoldHigh => thold_addr_clk_posedge_posedge(13),
           HoldLow => thold_addr_clk_negedge_posedge(13),
           CheckEnabled => (me_ipd = '1' and NOW /= 0 ns),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
 

 VitalSetupHoldCheck (
           Violation => me_viol,
           TimingData => TimingDataInfo_me,
           TestSignal => me_ipd,
           TestSignalName => "me",
           TestDelay => 0.0 ns,
           RefSignal => clk_ipd,
           RefSignalName => "clk",
           RefDelay => 0.0 ns,
           SetupHigh => tsetup_me_clk_posedge_posedge,
           SetupLow =>  tsetup_me_clk_negedge_posedge,
           HoldHigh => thold_me_clk_posedge_posedge,
           HoldLow => thold_me_clk_negedge_posedge,
           CheckEnabled => ( NOW /= 0 ns and address_chk < 16384),
           RefTransition => '/',
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);


        VitalPeriodPulseCheck (
           Violation => clk_viol,
           PeriodData => PeriodDataInfo_clk,
           TestSignal => clk_ipd,
           TestSignalName => "clk",
           TestDelay => 0.0 ns,
           Period => tperiod_clk_posedge,
           PulseWidthHigh => tpw_clk_posedge,
           PulseWidthLow => tpw_clk_negedge,
           XOn => TRUE,
           MsgOn => TRUE,
           MsgSeverity => WARNING);
        end if;

        if (rom_init = false) then
            while not endfile(rom_data_file) and (k < 16384) loop
                readline(rom_data_file, rom_rec);
                hread( rom_rec, mem(k));
                k := k + 1;
            end loop;
            rom_init := true;
        end if;

if ( addr_ipd'event) then
     if ( NOW /= 0 ns) then
        addr_chk := TO_X01(addr_ipd);
        if ( not IS_X(addr_chk)) then
        address_chk := to_unsigned_integer(addr_chk);
        end if;
     end if;
end if;



-- Latch all signals

        if (clk_ipd'event and clk_ipd = '1' and clk_ipd'last_value = '0') then
           clk_time := NOW;
           if (VIOLA_flag = '1') then
            VIOLA_flag <= '0';
           end if;
           melatched := TO_X01(me_ipd);
           addrlatched := TO_X01(addr_ipd);
           addressx := IS_X(addrlatched);
           if ( not addressx) then
              address := to_unsigned_integer(addrlatched);
              if ((address > 16383) and ( melatched /= '0')) then
                  assert (FALSE)
                      report "WARNING:address is out of range" & LF & "RANGE:0 to 16383" & LF
                      severity WARNING;
                  addressx := true;
                  addressout_of_range := true;
              else
                  addressout_of_range := false;
              end if;
           end if;
 
        end if ; -- end clk pos edge
 
         if ( oe_ipd'event and oe_ipd = '1' and oe_ipd'last_value = '0') then
          oe_risetime <= NOW;
         end if;
-- read functionality
 
        if (clk_ipd'event and clk_ipd = '1' and clk_ipd'last_value = '0' and melatched /= '0' ) then
        if (clk_viol /= 'X' ) then
        timeA := NOW;
        end if;
           if (addressx) then
              int_do <= ( others => 'X' );
           elsif (melatched = 'X') THEN
              int_do <= ( others => 'X');
           else
              tmp_do := mem(address);
              int_do <= tmp_do(15 downto 0);
           end if;
        end if;
 
 
 
-- ADDR violation
 
     if ( (
                addr0_Viol = 'X' OR
                addr1_Viol = 'X' OR
                addr2_Viol = 'X' OR
                addr3_Viol = 'X' OR
                addr4_Viol = 'X' OR
                addr5_Viol = 'X' OR
                addr6_Viol = 'X' OR
                addr7_Viol = 'X' OR
                addr8_Viol = 'X' OR
                addr9_Viol = 'X' OR
                addr10_Viol = 'X' OR
                addr11_Viol = 'X' OR
                addr12_Viol = 'X' OR
                addr13_Viol = 'X' )) THEN
      if ( NOW = clk_time ) then
      me_chk := me_ipd;
      else
       me_chk := melatched;
      end if;
      if ( me_chk = '1' ) then
      if ( clk_viol /= 'X' ) then
        if ( NOW /= clk_time and ((NOW - clk_time) < tpd_clk_do_posedge(0) (tr0x) )) THEN
         VIOLA_flag <= '1';
         int_do <= (others => 'X') after (tpd_clk_do_posedge(0) (tr0x) - ( NOW - clk_time));
        elsif ( NOW /= clk_time ) THEN
         VIOLA_flag <= '1';
         int_do <= (others => 'X');
        else
         int_do <= (others => 'X');
        end if;
       end if;
 
       end if;
 
      end if;
 
-- ME violation
     if ( me_Viol = 'X' ) THEN
      if ( clk_viol /= 'X' ) then
       if ( NOW /= clk_time and ((NOW - clk_time) < tpd_clk_do_posedge(0) (tr0x) )) THEN
        VIOLA_flag <= '1';
        int_do <= (others => 'X') after (tpd_clk_do_posedge(0) (tr0x) - ( NOW - clk_time));
       elsif ( NOW /= clk_time ) THEN
        VIOLA_flag <= '1';
        int_do <= (others => 'X');
       else
        int_do <= (others => 'X');
       end if;
      end if;
      end if;
 
-- CLK violation
 
     if (  clk_viol = 'X' ) THEN
       if ( ( NOW - timeA ) > 0 ps and ( NOW - timeA ) < tpd_clk_do_posedge(0) (tr0x) ) THEN
        VIOLA_flag <= '1';
        int_do <= ( others => 'X') after ( tpd_clk_do_posedge(0) (tr0x) );
       else
        int_do <= ( others => 'X');
       end if;
      end if;
 
 
        if (clk_ipd'event and clk_ipd = '0' and clk_ipd'last_value = '1' ) then
           addrviolated := '0';
        end if;
 
       if (clk_ipd'event and clk_ipd = 'X') then
        if ( NOW - clk_time < tpd_clk_do_posedge(0) (tr0x) ) then
         VIOLA_flag <= '1';
         int_do <= ( others => 'X') after (tpd_clk_do_posedge(0) (tr0x) - (NOW - clk_time));
        else
         int_do <= ( others => 'X');
        end if;
       end if;
 
 
end process;
 
   VITALOUTPUT :  process( int_do'transaction, oe_ipd)
 
--  output timings depending on OE status
--  ============================================
 
   VARIABLE lastevent_A : TIME := 0 ns;
   BEGIN
 

 
 
        if (oe_ipd'event) then
             if (oe_ipd = '1' ) then
 
              do(0) <= transport int_do(0) after tpd_oe_do(0) (tr01);
              do(1) <= transport int_do(1) after tpd_oe_do(1) (tr01);
              do(2) <= transport int_do(2) after tpd_oe_do(2) (tr01);
              do(3) <= transport int_do(3) after tpd_oe_do(3) (tr01);
              do(4) <= transport int_do(4) after tpd_oe_do(4) (tr01);
              do(5) <= transport int_do(5) after tpd_oe_do(5) (tr01);
              do(6) <= transport int_do(6) after tpd_oe_do(6) (tr01);
              do(7) <= transport int_do(7) after tpd_oe_do(7) (tr01);
              do(8) <= transport int_do(8) after tpd_oe_do(8) (tr01);
              do(9) <= transport int_do(9) after tpd_oe_do(9) (tr01);
              do(10) <= transport int_do(10) after tpd_oe_do(10) (tr01);
              do(11) <= transport int_do(11) after tpd_oe_do(11) (tr01);
              do(12) <= transport int_do(12) after tpd_oe_do(12) (tr01);
              do(13) <= transport int_do(13) after tpd_oe_do(13) (tr01);
              do(14) <= transport int_do(14) after tpd_oe_do(14) (tr01);
              do(15) <= transport int_do(15) after tpd_oe_do(15) (tr01);
             elsif (oe_ipd = '0') then
            do(0) <= transport 'Z' after tpd_oe_do(0) (tr0z);
            do(1) <= transport 'Z' after tpd_oe_do(1) (tr0z);
            do(2) <= transport 'Z' after tpd_oe_do(2) (tr0z);
            do(3) <= transport 'Z' after tpd_oe_do(3) (tr0z);
            do(4) <= transport 'Z' after tpd_oe_do(4) (tr0z);
            do(5) <= transport 'Z' after tpd_oe_do(5) (tr0z);
            do(6) <= transport 'Z' after tpd_oe_do(6) (tr0z);
            do(7) <= transport 'Z' after tpd_oe_do(7) (tr0z);
            do(8) <= transport 'Z' after tpd_oe_do(8) (tr0z);
            do(9) <= transport 'Z' after tpd_oe_do(9) (tr0z);
            do(10) <= transport 'Z' after tpd_oe_do(10) (tr0z);
            do(11) <= transport 'Z' after tpd_oe_do(11) (tr0z);
            do(12) <= transport 'Z' after tpd_oe_do(12) (tr0z);
            do(13) <= transport 'Z' after tpd_oe_do(13) (tr0z);
            do(14) <= transport 'Z' after tpd_oe_do(14) (tr0z);
            do(15) <= transport 'Z' after tpd_oe_do(15) (tr0z);
             elsif (oe_ipd = 'X') then
             do(0) <= 'X' after tpd_oe_do(0) (tr0x);
             do(1) <= 'X' after tpd_oe_do(1) (tr0x);
             do(2) <= 'X' after tpd_oe_do(2) (tr0x);
             do(3) <= 'X' after tpd_oe_do(3) (tr0x);
             do(4) <= 'X' after tpd_oe_do(4) (tr0x);
             do(5) <= 'X' after tpd_oe_do(5) (tr0x);
             do(6) <= 'X' after tpd_oe_do(6) (tr0x);
             do(7) <= 'X' after tpd_oe_do(7) (tr0x);
             do(8) <= 'X' after tpd_oe_do(8) (tr0x);
             do(9) <= 'X' after tpd_oe_do(9) (tr0x);
             do(10) <= 'X' after tpd_oe_do(10) (tr0x);
             do(11) <= 'X' after tpd_oe_do(11) (tr0x);
             do(12) <= 'X' after tpd_oe_do(12) (tr0x);
             do(13) <= 'X' after tpd_oe_do(13) (tr0x);
             do(14) <= 'X' after tpd_oe_do(14) (tr0x);
             do(15) <= 'X' after tpd_oe_do(15) (tr0x);
             end if;
      elsif (int_do'active ) THEN
 
              if (oe_ipd = '1' and VIOLA_flag = '0') then
 if ( ((NOW - oe_risetime) >= tpd_oe_do(0) (tr01)) and ((NOW - lastevent_A) >= tpd_clk_do_posedge(0) (tr0x)) ) then
                do(0) <= 'X' after tpd_clk_do_posedge(0) (tr0x) , int_do(0) after tpd_clk_do_posedge(0) (tr01);
                do(1) <= 'X' after tpd_clk_do_posedge(1) (tr0x) , int_do(1) after tpd_clk_do_posedge(1) (tr01);
                do(2) <= 'X' after tpd_clk_do_posedge(2) (tr0x) , int_do(2) after tpd_clk_do_posedge(2) (tr01);
                do(3) <= 'X' after tpd_clk_do_posedge(3) (tr0x) , int_do(3) after tpd_clk_do_posedge(3) (tr01);
                do(4) <= 'X' after tpd_clk_do_posedge(4) (tr0x) , int_do(4) after tpd_clk_do_posedge(4) (tr01);
                do(5) <= 'X' after tpd_clk_do_posedge(5) (tr0x) , int_do(5) after tpd_clk_do_posedge(5) (tr01);
                do(6) <= 'X' after tpd_clk_do_posedge(6) (tr0x) , int_do(6) after tpd_clk_do_posedge(6) (tr01);
                do(7) <= 'X' after tpd_clk_do_posedge(7) (tr0x) , int_do(7) after tpd_clk_do_posedge(7) (tr01);
                do(8) <= 'X' after tpd_clk_do_posedge(8) (tr0x) , int_do(8) after tpd_clk_do_posedge(8) (tr01);
                do(9) <= 'X' after tpd_clk_do_posedge(9) (tr0x) , int_do(9) after tpd_clk_do_posedge(9) (tr01);
                do(10) <= 'X' after tpd_clk_do_posedge(10) (tr0x) , int_do(10) after tpd_clk_do_posedge(10) (tr01);
                do(11) <= 'X' after tpd_clk_do_posedge(11) (tr0x) , int_do(11) after tpd_clk_do_posedge(11) (tr01);
                do(12) <= 'X' after tpd_clk_do_posedge(12) (tr0x) , int_do(12) after tpd_clk_do_posedge(12) (tr01);
                do(13) <= 'X' after tpd_clk_do_posedge(13) (tr0x) , int_do(13) after tpd_clk_do_posedge(13) (tr01);
                do(14) <= 'X' after tpd_clk_do_posedge(14) (tr0x) , int_do(14) after tpd_clk_do_posedge(14) (tr01);
                do(15) <= 'X' after tpd_clk_do_posedge(15) (tr0x) , int_do(15) after tpd_clk_do_posedge(15) (tr01);
 
               lastevent_A := NOW;


           elsif ( ((NOW - oe_risetime) >= tpd_oe_do(0) (tr01)) and ((NOW - lastevent_A) < tpd_clk_do_posedge(0) (tr0x)) ) then
                do(0) <= 'X' after (tpd_clk_do_posedge(0) (tr0x) - (NOW - lastevent_A)), int_do(0) after tpd_clk_do_posedge(0) (tr01);
                do(1) <= 'X' after (tpd_clk_do_posedge(1) (tr0x) - (NOW - lastevent_A)), int_do(1) after tpd_clk_do_posedge(1) (tr01);
                do(2) <= 'X' after (tpd_clk_do_posedge(2) (tr0x) - (NOW - lastevent_A)), int_do(2) after tpd_clk_do_posedge(2) (tr01);
                do(3) <= 'X' after (tpd_clk_do_posedge(3) (tr0x) - (NOW - lastevent_A)), int_do(3) after tpd_clk_do_posedge(3) (tr01);
                do(4) <= 'X' after (tpd_clk_do_posedge(4) (tr0x) - (NOW - lastevent_A)), int_do(4) after tpd_clk_do_posedge(4) (tr01);
                do(5) <= 'X' after (tpd_clk_do_posedge(5) (tr0x) - (NOW - lastevent_A)), int_do(5) after tpd_clk_do_posedge(5) (tr01);
                do(6) <= 'X' after (tpd_clk_do_posedge(6) (tr0x) - (NOW - lastevent_A)), int_do(6) after tpd_clk_do_posedge(6) (tr01);
                do(7) <= 'X' after (tpd_clk_do_posedge(7) (tr0x) - (NOW - lastevent_A)), int_do(7) after tpd_clk_do_posedge(7) (tr01);
                do(8) <= 'X' after (tpd_clk_do_posedge(8) (tr0x) - (NOW - lastevent_A)), int_do(8) after tpd_clk_do_posedge(8) (tr01);
                do(9) <= 'X' after (tpd_clk_do_posedge(9) (tr0x) - (NOW - lastevent_A)), int_do(9) after tpd_clk_do_posedge(9) (tr01);
                do(10) <= 'X' after (tpd_clk_do_posedge(10) (tr0x) - (NOW - lastevent_A)), int_do(10) after tpd_clk_do_posedge(10) (tr01);
                do(11) <= 'X' after (tpd_clk_do_posedge(11) (tr0x) - (NOW - lastevent_A)), int_do(11) after tpd_clk_do_posedge(11) (tr01);
                do(12) <= 'X' after (tpd_clk_do_posedge(12) (tr0x) - (NOW - lastevent_A)), int_do(12) after tpd_clk_do_posedge(12) (tr01);
                do(13) <= 'X' after (tpd_clk_do_posedge(13) (tr0x) - (NOW - lastevent_A)), int_do(13) after tpd_clk_do_posedge(13) (tr01);
                do(14) <= 'X' after (tpd_clk_do_posedge(14) (tr0x) - (NOW - lastevent_A)), int_do(14) after tpd_clk_do_posedge(14) (tr01);
                do(15) <= 'X' after (tpd_clk_do_posedge(15) (tr0x) - (NOW - lastevent_A)), int_do(15) after tpd_clk_do_posedge(15) (tr01);
               lastevent_A := NOW;
 

          else

                do(0) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(0)
after tpd_clk_do_posedge(0) (tr01);
                do(1) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(1)
after tpd_clk_do_posedge(1) (tr01);
                do(2) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(2)
after tpd_clk_do_posedge(2) (tr01);
                do(3) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(3)
after tpd_clk_do_posedge(3) (tr01);
                do(4) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(4)
after tpd_clk_do_posedge(4) (tr01);
                do(5) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(5)
after tpd_clk_do_posedge(5) (tr01);
                do(6) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(6)
after tpd_clk_do_posedge(6) (tr01);
                do(7) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(7)
after tpd_clk_do_posedge(7) (tr01);
                do(8) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(8)
after tpd_clk_do_posedge(8) (tr01);
                do(9) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(9)
after tpd_clk_do_posedge(9) (tr01);
                do(10) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(10)
after tpd_clk_do_posedge(10) (tr01);
                do(11) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(11)
after tpd_clk_do_posedge(11) (tr01);
                do(12) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(12)
after tpd_clk_do_posedge(12) (tr01);
                do(13) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(13)
after tpd_clk_do_posedge(13) (tr01);
                do(14) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(14)
after tpd_clk_do_posedge(14) (tr01);
                do(15) <= 'X' after (tpd_oe_do(0) (tr01) - (NOW - oe_risetime)) , int_do(15)
after tpd_clk_do_posedge(15) (tr01);
        end if;
             elsif (oe_ipd = '1' and VIOLA_flag = '1') then
 
                do(0) <= int_do(0) ;
                do(1) <= int_do(1) ;
                do(2) <= int_do(2) ;
                do(3) <= int_do(3) ;
                do(4) <= int_do(4) ;
                do(5) <= int_do(5) ;
                do(6) <= int_do(6) ;
                do(7) <= int_do(7) ;
                do(8) <= int_do(8) ;
                do(9) <= int_do(9) ;
                do(10) <= int_do(10) ;
                do(11) <= int_do(11) ;
                do(12) <= int_do(12) ;
                do(13) <= int_do(13) ;
                do(14) <= int_do(14) ;
                do(15) <= int_do(15) ;
 
            end if ;
 
   end if ;
 
 
end process;

-- synopsys translate_on
 
end behaviour;
 
-- synopsys translate_off
 
configuration conf_v2ss1_16384x16cm32_behaviour of v2ss1_16384x16cm32 is
for behaviour
end for;

-- synopsys translate_on

end conf_v2ss1_16384x16cm32_behaviour;
