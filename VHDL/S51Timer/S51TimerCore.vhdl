
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Timer;
 use LibS51Timer.PkgS51Timer.all;
-- synopsys translate_off
library std;
 use std.textio.all;
-- synopsys translate_on

Entity S51TimerCore is
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;

  start			: in	std_logic;
  stop			: in	std_logic;
  cnt			: in	std_logic_vector(15 downto 0);
  reload		: out	std_logic
 );
End S51TimerCore;

Architecture rtl of S51TimerCore is
 signal TIMERSM		: T_TIMERSM;
 signal TIMERSM_I	: T_TIMERSM;
 signal int_cnt		: std_logic_vector(15 downto 0);
 signal int_cnt_i       : std_logic_vector(15 downto 0);
begin

-- process (TIMERSM, start, stop, int_cnt, cnt) -- STATE_DECODER process
-- begin
--
--  case TIMERSM is
--
--   when TM_IDLE =>
--
--   when TM_DECR =>
--
---- dec example: next_x <= std_logic_vector(unsigned(current_x) - 1);
--
--    if x = "0000000000000000" then
--    end if;
--
--   when TM_RELOAD =>
--
--   when OTHERS =>
--
--  end case;
-- end process;
--
-- process(RstB, Ck) -- TIMERSM_R process
-- begin
--  if RstB = '0' then
--
--  elsif Ck'event and Ck = '1' then
--  end if;  
--
-- end process;
--
-- process(Ck) -- INT_CNT_R process
-- begin
--  if Ck'event and Ck = '1' then
--  end if;  
-- end process;
--
-- reload <= bool2_stdlogic(TIMERSM = TM_RELOAD);

End rtl;

