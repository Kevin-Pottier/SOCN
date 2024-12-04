-- Library Declaration

Library IEEE;
  Use IEEE.std_logic_1164.all;
-- synopsys translate_off
  Use IEEE.vital_primitives.all;
  Use IEEE.vital_timing.all;

-- synopsys translate_on

-- Components Declaration

package PkgCompv2ss1_16384x16cm32 is

Component v2ss1_16384x16cm32

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


End Component ;
End PkgCompv2ss1_16384x16cm32 ;

