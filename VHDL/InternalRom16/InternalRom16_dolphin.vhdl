library IEEE;
 use IEEE.std_logic_1164.all;
-- synopsys translate_off
 use IEEE.std_logic_textio.all;
 use IEEE.vital_timing.all;
 use IEEE.vital_primitives.all;
 use STD.TEXTIO.ALL;
-- synopsys translate_on 
Library LibInternalRom16;
 use LibInternalRom16.DIROM_COMPONENT.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
-- synopsys translate_off 
Library c35_corelib;
 use c35_corelib.all;
-- synopsys translate_on

Entity InternalRom16 is
-- synopsys translate_off
 Generic(
  RomFileName	: in 	string := ""
 );
-- synopsys translate_on
 Port(
  RomClk       	: in  	std_logic;
  RomMe       	: in  	std_logic;
  PRaddress 	: in  	std_logic_vector(RomAddressBusLenght - 1 downto 0);
  DataOut   	: out 	std_logic_vector(RomDataBusLenght - 1 downto 0)
 );
End InternalRom16;

Architecture rtl of InternalRom16 is
 
 signal VCC	: std_logic;
 signal VSS	: std_logic;
 signal CS	: std_logic;
 
 signal PRaddressI : std_logic_vector(14 downto 0); -- Sizeof dirom32768x8 address bus

 component DLSG1
   port(
      C                              :	in    STD_ULOGIC;
      E                              :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      GCK                            :	out   STD_ULOGIC);
 end component;

begin
 VCC <= '1';
 VSS <= '0';
 
 
 PRaddressI <= "0" & PRaddress(13 downto 0);
 
-- IdleModeImplentationFPGA : if SYNTHESISFORFPGA = true generate

  S51CKG_I: DLSG1 
  Port map (E   => RomMe,
            C   => RomClk,
            SE  => VSS,
            GCK => CS
           ); -- AMS clock gater cell

-- end generate;

-- IdleModeImplentationNOTFPGA : if SYNTHESISFORFPGA = false generate

--   CS <= RomClk;

-- end generate;
 
 rom_i : dirom32768x8 -- 16KB ROM model does not exists, using 32KB instead
-- synopsys translate_off 
 Generic Map(
  DATA_FILE      => RomFileName,
  TimingChecksOn => false, -- must be disabled in 0-delay simulations
  tpd_cs_do      => (others => (0 ns, 0 ns))
 )
-- synopsys translate_on 
 Port map (
  NRST => VCC, -- Stops or disables memory operations 
  CS   => CS,
  EN   => VSS, --   impedance signal - Active high
  AD   => PRaddressI(14 downto 0),
  DO   => DataOut
 );
end rtl;
