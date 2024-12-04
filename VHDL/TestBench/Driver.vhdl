Library IEEE;
 Use IEEE.std_logic_1164.all;
Library LibPkg;
 Use LibPkg.Utils.all;
--Library LibS51Uart;
-- use LibS51Uart.PkgS51Uart.all;
library std;
 use std.textio.all;
library modelsim_lib;
 use modelsim_lib.util.all;


Entity Driver is
 Generic(
  Period	: time := 20 ns
 );
 Port(
  RstB		: inout std_logic;
  Ck		: in    std_logic;
  CpuIdleRq	: out	std_logic;
  RxD		: out	std_logic;
  TxD		: in	std_logic  
 );
end Driver;


Architecture rtl of Driver is

-- UART

 signal RB8			: std_logic := '1'; 
 signal TB8			: std_logic := '1'; 
 signal FE			: std_logic := '0'; 
 signal RCV_BUSY		: std_logic := '0'; 
 signal TI			: std_logic := 'U';
 signal TI2			: std_logic := 'U'; 
 signal MODE			: integer := 2;
 signal MODERCV			: integer := 0; 
 signal RCV_TimeBit		: real	:= 3200.0;
 signal SND_TimeBit		: real	:= 3200.0;
 signal PAYLOAD_RXD		: std_logic_vector(7 downto 0) := "01010101";
 signal PAYLOAD_TXD		: std_logic_vector(7 downto 0) := "01010101";
 signal Sstart			: std_logic := '0';
 signal Sstart2			: std_logic := '0';
 signal FSstart			: std_logic := '0';

-- SPY

 signal UartSTA			: std_logic_vector(7 downto 0);

 signal CpuIdleRq_t		: std_logic;
 signal CpuIdleRqCmd		: std_logic;

 signal RstBq, RstBi : std_logic;

begin

-----------------------------------------------
------------------ SYSTEM ---------------------
-----------------------------------------------

 RstBi <= '0' , '1' after 1500 ns;
 RstB  <= RstBq;

 RxD <= '0';

 process(RstBi, Ck)
 begin
  if RstBi = '0' then
   RstBq <= '0';
  elsif Ck'event and Ck = '0' then
   RstBq <= RstBi;
  end if;
 end process;


-- process(RstB, Ck)
--  variable i : integer := 0;
-- begin
--  if RstB = '0' then
--   CpuIdleRq_t <= '0';
--  elsif Ck'event and Ck = '1' then
--   i := i  + 1;
--   if i = 4 then
--    CpuIdleRq_t <= '1';
--    i := 0;
--   else
--    CpuIdleRq_t <= '0';
--   end if;
--  
--  end if;
-- end process;
-- 
-- CpuIdleRqCmd <= '0' , '1' after 2000 ns;
--
-- CpuIdleRq <= 	'0' when CpuIdleRqCmd = '0' else
-- 		CpuIdleRq_t;

 CpuIdleRq <= '0';
 
-----------------------------------------------
-------------------- SPY ----------------------
-----------------------------------------------

---- process
----  begin
----   init_signal_spy("/testbench/topapplis51_i/uart_i/uartitf_i/uartsta", "UartSTA", 1);
----  wait;
---- end process;
----
---- process(UartSTA)
----  variable OutLine : line;
---- begin
----  -- CLR SECTION
----  if UartSTA(OverRun_STAposbit)'event and UartSTA(OverRun_STAposbit) = '0' then
----   write(OutLine, string'(">>>>>>>>>> Driver : OVERRUN 1->0 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(FalseStart_STAposbit)'event and UartSTA(FalseStart_STAposbit) = '0' then
----   write(OutLine, string'(">>>>>>>>>> Driver : FALSESTART 1->0 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(RxOk_STAposbit)'event and UartSTA(RxOk_STAposbit) = '0' then
----   write(OutLine, string'(">>>>>>>>>> Driver : RXOK 1->0 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(TxOk_STAposbit)'event and UartSTA(TxOk_STAposbit) = '0' then
----   write(OutLine, string'(">>>>>>>>>> Driver : TXOK 1->0 at ")); write(OutLine, now); writeline(OutPut, OutLine); 
----  end if;
----  if UartSTA(ParityERR_STAposbit)'event and UartSTA(ParityERR_STAposbit) = '0' then
----   write(OutLine, string'(">>>>>>>>>> Driver : PARITYERR 1->0 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(RXDParity_STAposbit)'event and UartSTA(RXDParity_STAposbit) = '0' then
----   write(OutLine, string'(">>>>>>>>>> Driver : RXDPARITY 1->0 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(FramingERR_STAposbit)'event and UartSTA(FramingERR_STAposbit) = '0' then
----   write(OutLine, string'(">>>>>>>>>> Driver : FRAMINGERR 1->0 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  -- SET SECTION
----  if UartSTA(OverRun_STAposbit)'event and UartSTA(OverRun_STAposbit) = '1' then
----   write(OutLine, string'(">>>>>>>>>> Driver : OVERRUN 0->1 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(FalseStart_STAposbit)'event and UartSTA(FalseStart_STAposbit) = '1' then
----   write(OutLine, string'(">>>>>>>>>> Driver : FALSESTART 0->1 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(RxOk_STAposbit)'event and UartSTA(RxOk_STAposbit) = '1' then
----   write(OutLine, string'(">>>>>>>>>> Driver : RXOK 0->1 at ")); write(OutLine, now); writeline(OutPut, OutLine);
----  end if;
----  if UartSTA(TxOk_STAposbit)'event and UartSTA(TxOk_STAposbit) = '1' then
----   write(OutLine, string'(">>>>>>>>>> Driver : TXOK 0->1 at ")); write(OutLine, now); writeline(OutPut, OutLine); 
----  end if;
----  if UartSTA(ParityERR_STAposbit)'event and UartSTA(ParityERR_STAposbit) = '1' then
----   write(OutLine, string'(">>>>>>>>>> Driver : PARITYERR 0->1 at ")); write(OutLine, now); writeline(OutPut, OutLine);  
----  end if;
----  if UartSTA(RXDParity_STAposbit)'event and UartSTA(RXDParity_STAposbit) = '1' then
----   write(OutLine, string'(">>>>>>>>>> Driver : RXDPARITY 0->1 at ")); write(OutLine, now); writeline(OutPut, OutLine);  
----  end if;
----  if UartSTA(FramingERR_STAposbit)'event and UartSTA(FramingERR_STAposbit) = '1' then
----   write(OutLine, string'(">>>>>>>>>> Driver : FRAMINGERR 0->1 at ")); write(OutLine, now); writeline(OutPut, OutLine); 
----  end if;
----  write(OutLine, string'(">>>>>>>>>> -----------------------------------------------")); writeline(OutPut, OutLine);
---- end process;
----
---------------------------------------------------
------                   UART                    --
---------------------------------------------------
----
---- Receive: process
---- begin
----   read_uart(PAYLOAD_RXD, RB8, MODERCV, RCV_TimeBit, TXD, FE, RCV_BUSY);  
---- end process;
----
---- Sendfe: process
---- begin  
----  RXD <= 'H';
----  wait until (Sstart'event);		-- Wait for start transaction signal
----  write_uartfe(PAYLOAD_TXD, TB8, MODE, SND_TimeBit, RXD, TI);
---- end process;
----
---- Send: process
---- begin  
----  RXD <= 'H';
----  wait until (Sstart2'event);		-- Wait for start transaction signal
----  write_uart(PAYLOAD_TXD, TB8, MODE, SND_TimeBit, RXD, TI2);
---- end process;
----
---- SendFalseStart: process
---- begin  
----  RXD <= 'H';
----  wait until (FSstart'event);		-- Wait for start transaction signal
----  false_start(RXD);
---- end process;
----
---- sequencer: process
----  variable OutLine : line;
---- begin
----  wait for 2303 ns;
----  
----  FSstart <= not FSstart after 1 ns;
----  
----  wait for 40 us;
----    
----  PAYLOAD_TXD <= "01010101";
----  MODE <= 2;
----  Sstart <= not Sstart after 1 ns;
----
----  wait until TI/='H';
----  wait until TI='H';
----
----  write(OutLine, string'(">>>>>>>>>> Driver : Sent <")); write(OutLine, to_hstring(PAYLOAD_TXD)); write(OutLine, string'("> to UART"));
----  writeline(OutPut, OutLine);
----  
----  wait for 3200 ns;
----  
----  PAYLOAD_TXD <= "10101010";
----  MODE <= 0;  
----  Sstart2 <= not Sstart2 after 1 ns;
----  wait until TI2/='H';
----  wait until TI2='H';
---- 
----  write(OutLine, string'(">>>>>>>>>> Driver : Sent <")); write(OutLine, to_hstring(PAYLOAD_TXD)); write(OutLine, string'("> to UART"));
----  writeline(OutPut, OutLine);
----  
---- end process;
---- 

end rtl;
