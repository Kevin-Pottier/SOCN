
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Timer;
 use LibS51Timer.PkgS51Timer.all;
 use LibS51Timer.PkgCompS51TimerCore.all;

Entity S51Timer is
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;

  -- SFR INTERFACE
  SfrDin		: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
  WriteSfr		: in	std_logic;
--  SfrDout		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_TSTAT		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_H		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_L		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);

--  ReadSfr		: in	std_logic;
  
  TCTRLWen 		: in	std_logic;
  CNT_HWen		: in	std_logic;
  CNT_LWen		: in	std_logic;

--  CNT_HRen		: in	std_logic;
--  CNT_LRen		: in	std_logic;
--  TSTATRen		: in	std_logic;
  
-- PERIPHERALS
  Time_out_IT		: out	std_logic;
  timer_auto_idle	: out	std_logic
 );
End S51Timer;

Architecture rtl of S51Timer is

-- Interface regs
 signal CNT_H			: std_logic_vector(7 downto 0);
 signal CNT_L			: std_logic_vector(7 downto 0);
 signal ROLLV			: std_logic;
 signal TAI			: std_logic;
 signal autoidle		: std_logic;

-- Internal control/cfg
 signal start			: std_logic;
 signal stop			: std_logic;
 signal clrstat			: std_logic;
 signal cnt			: std_logic_vector(15 downto 0);
 signal reload			: std_logic;

begin

-- process(RstB, Ck)
-- begin
--  if RstB = '0' then
--   CNT_H <= 
--   CNT_L <= 
--  elsif Ck'event and Ck = '1' then
--
--
--
--  end if;  
-- end process;
--
-- process(RstB, Ck)
-- begin
--  if RstB = '0' then
--   ROLLV <= 
--  elsif Ck'event and Ck = '1' then
--
--  end if;  
-- end process;
--
-- process(RstB, Ck)
-- begin
--  if RstB = '0' then
--   TAI <= 
--  elsif Ck'event and Ck = '1' then
--
--  end if;  
-- end process;
--
--

SfrDout_TSTAT <= "0000000"&ROLLV;
SfrDout_CNT_H <= CNT_H;
SfrDout_CNT_L <= CNT_L;

--   SfrDout <= 	"0000000"&ROLLV	when ReadSfr = '1' and TSTATRen = '1' else
--    		CNT_H		when ReadSfr = '1' and CNT_HREn = '1' else
--     		CNT_L		when ReadSfr = '1' and CNT_LREn = '1' else
--		(others => 'Z');
--
-- cnt <= CNT_H & CNT_L;
-- start <= WriteSfr and TCTRLWen and SfrDin(0);
-- stop <= 
-- clrstat <= 
-- autoidle <= 
--
-- S51TimerCore_I : S51TimerCore
-- Port map(
--  RstB			=> RstB,        
--  Ck			=> Ck,
--  
--  start			=> start,
--  stop			=> stop,
--  cnt			=> cnt,
--  reload		=> reload
-- );
-- 

 timer_auto_idle <= '0';
 Time_out_IT <= '0';
 
End rtl;

