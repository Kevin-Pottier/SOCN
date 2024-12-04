
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
-- synopsys translate_off 
Library c35_corelib;
 use c35_corelib.all;
-- synopsys translate_on

entity S51ClockGen is
Port(
 RstB			: in	std_logic;
 Ck			: in	std_logic;
 GatedCk		: out	std_logic;

 RstBQ			: in	std_logic;
 CpuIdleRq		: in	std_logic;
 CpuIdleAck		: out   std_logic;
 NotIdleMode		: out   std_logic;
 DisOpcodeFetch		: in	std_logic;

 XRamClk		: out	std_logic;
 XRamEn			: out	std_logic;
 StackClk		: out	std_logic;
 StackEn		: out	std_logic;
 RomClk			: out	std_logic;
 RomEn			: out	std_logic
);
End S51ClockGen;

Architecture rtl of S51ClockGen is
 signal GatedCkI	: std_logic;
 signal VCC		: std_logic;
 signal VSS		: std_logic;

 signal enable          : std_logic;

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
 GatedCk <= GatedCkI;
 
 CpuIdleAck <= CpuIdleRq; -- Immediate IDLE request acknowledge => ack=req

-- process(RstB, Ck)
-- begin
--  if RstB = '0' then
--   CpuIdleAckQFE <= '0';
--  elsif Ck'event and Ck = '0' then
--   CpuIdleAckQFE <= CpuIdleRq;
--  end if;  
-- end process; 
 
 IdleModeImplentationFPGA : if SYNTHESISFORFPGA = true generate
  NotIdleMode <= not CpuIdleRq;
  GatedCkI <= Ck;			-- Gated are deported to DFFs enable entries
  XRamClk <= not Ck;
  RomClk <= Ck;
  RomEn <= (not CpuIdleRq);
  XRamEn <= (not CpuIdleRq) and RstBq;
  StackEn <= (not CpuIdleRq) and RstBq;
  StackClk <= Ck;
 end generate;

 IdleModeImplentationNOTFPGA : if SYNTHESISFORFPGA = false generate


  enable <= (not CpuIdleRq);

  S51CKG_I: DLSG1 
  Port map (E   => enable,
            C   => Ck,
            SE  => VSS,
            GCK => GatedCkI
           ); -- AMS clock gater cell
                   
--  GatedCkI <= Ck and not CpuIdleAckQFE;
  NotIdleMode <= VCC;			-- Do not use DFFs enable entries to manage IDLE mode
--  XRamClk <= not GatedCkI;		-- ClockTree no consumption
  XRamClk <= not Ck;                    -- FIXME
  RomClk <= GatedCkI;		 
  RomEn <=  '1';
  XRamEn <= RstBq;
  StackEn <= RstBq;
  StackClk <= GatedCkI;
 end generate;

end rtl;

----
---- Architecture below main purpose is to build propery the clock tree
----
--
--Architecture ntl of S51ClockGen is
-- signal GatedCkI	: std_logic;
-- signal VCC		: std_logic;
--
-- signal CpuIdleAckQFE	: std_logic;
-- signal Ck_inv          : std_logic;
--
--   component DFC3 is
--      port (
--         C: in std_logic;
--         D: in std_logic;
--         RN: in std_logic;
--         Q: out std_logic;
--         QN: out std_logic);
--   end component DFC3;
--
--begin
--
-- VCC <= '1';
-- GatedCk <= GatedCkI;
-- 
-- CpuIdleAck <= CpuIdleAckQFE;
-- 
-- Ck_inv <= not Ck;
--
-- CpuIdleAckQFE_reg : DFC3
--    port map (C => Ck_inv, D => CpuIdleRq, RN => RstB, Q => CpuIdleAckQFE, QN => open);
-- 
-- IdleModeImplentationFPGA : if SYNTHESISFORFPGA = true generate
--  NotIdleMode <= not CpuIdleRq;
--  GatedCkI <= Ck;			-- Gated are deported to DFFs enable entries
--  XRamClk <= not Ck;
--  RomClk <= not Ck;
--  RomEn <= (not CpuIdleRq) and RstBq;	-- !!! CpuIdleRq must be generated on a Ck rising edge
--  XRamEn <= (not CpuIdleRq) and RstBq;
--  StackEn <= (not CpuIdleRq) and RstBq;
--  StackClk <= Ck;
-- end generate;
--
-- IdleModeImplentationNOTFPGA : if SYNTHESISFORFPGA = false generate
--  GatedCkI <= Ck and not CpuIdleAckQFE;
--  NotIdleMode <= VCC;			-- Do not use DFFs enable entries to manage IDLE mode
----  XRamClk <= not GatedCkI;		-- ClockTree no consumption
--  XRamClk <= not Ck; -- changed due to the new rom addressing mode
--  RomClk <= not Ck;			-- ClockTree no consumption
--  RomEn <= (not CpuIdleRq) and RstBq;	-- !!! CpuIdleRq must be generated on a Ck rising edge
--  					-- Enable is low under reset to avoid ROM lock (seen under simu with VIRAGE VITAL ROM model)
--  XRamEn <= RstBq;
--  StackEn <= RstBq;
--  StackClk <= GatedCkI;
-- end generate;
--   
--end ntl;
