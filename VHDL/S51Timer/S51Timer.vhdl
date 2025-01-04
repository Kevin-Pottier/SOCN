
Library IEEE;
Use IEEE.std_logic_1164.All;
Use IEEE.numeric_std.All;
Library LibPkg;
Use LibPkg.MyUtils.All;
Library LibPkgS51Cpu;
Use LibPkgS51Cpu.PkgS51Cpu.All;
Library LibS51Timer;
Use LibS51Timer.PkgS51Timer.All;
Use LibS51Timer.PkgCompS51TimerCore.All;

Entity S51Timer Is
  Port (
    RstB : In STD_LOGIC;
    Ck : In STD_LOGIC;

    -- SFR INTERFACE
    SfrDin : In STD_LOGIC_VECTOR(PeriphDataBusSize - 1 Downto 0);
    WriteSfr : In STD_LOGIC;
    --  SfrDout		: out	std_logic_vector(PeriphDataBusSize -1 downto 0);
    SfrDout_TSTAT : Out STD_LOGIC_VECTOR(PeriphDataBusSize - 1 Downto 0);
    SfrDout_CNT_H : Out STD_LOGIC_VECTOR(PeriphDataBusSize - 1 Downto 0);
    SfrDout_CNT_L : Out STD_LOGIC_VECTOR(PeriphDataBusSize - 1 Downto 0);

    --  ReadSfr		: in	std_logic;

    TCTRLWen : In STD_LOGIC;
    CNT_HWen : In STD_LOGIC;
    CNT_LWen : In STD_LOGIC;

    --  CNT_HRen		: in	std_logic;
    --  CNT_LRen		: in	std_logic;
    --  TSTATRen		: in	std_logic;

    -- PERIPHERALS
    Time_out_IT : Out STD_LOGIC;
    timer_auto_idle : Out STD_LOGIC
  );
End S51Timer;

Architecture rtl Of S51Timer Is

  -- Interface regs
  Signal CNT_H : STD_LOGIC_VECTOR(7 Downto 0);
  Signal CNT_L : STD_LOGIC_VECTOR(7 Downto 0);
  Signal ROLLV : STD_LOGIC;
  Signal TAI : STD_LOGIC;
  Signal autoidle : STD_LOGIC;

  -- Internal control/cfg
  Signal start : STD_LOGIC;
  Signal stop : STD_LOGIC;
  Signal clrstat : STD_LOGIC;
  Signal cnt : STD_LOGIC_VECTOR(15 Downto 0);
  Signal reload : STD_LOGIC;

Begin

  Process (RstB, Ck)
  Begin
    If RstB = '0' Then
      CNT_H <= (Others => '0'); -- reset init
      CNT_L <= (Others => '0'); -- reset init
    Elsif Ck'event And Ck = '1' Then
      If CNT_HWen = '1' Then
        CNT_H <= SfrDin(7 Downto 0); -- Write in CNT_H
      End If;
      If CNT_LWen = '1' Then
        CNT_L <= SfrDin(7 Downto 0); -- Write in CNT_L
      End If;
    End If;
  End Process;

  Process (RstB, Ck)
  Begin
    If RstB = '0' Then
      ROLLV <= '0'; -- Reset
    Elsif Ck'event And Ck = '1' Then
      If reload = '1' Then
        ROLLV <= '1'; -- Timer reached its end
      Elsif clrstat = '1' Then
        ROLLV <= '0'; -- Manual reset
      End If;
    End If;
  End Process;

  -- process(RstB, Ck)
  -- begin
  --  if RstB = '0' then
  --   TAI <= 
  --  elsif Ck'event and Ck = '1' then
  --
  --  end if;  
  -- end process;

  SfrDout_TSTAT <= "0000000" & ROLLV;
  SfrDout_CNT_H <= CNT_H;
  SfrDout_CNT_L <= CNT_L;

  --   SfrDout <= 	"0000000"&ROLLV	when ReadSfr = '1' and TSTATRen = '1' else
  --    		CNT_H		when ReadSfr = '1' and CNT_HREn = '1' else
  --     		CNT_L		when ReadSfr = '1' and CNT_LREn = '1' else
  --		(others => 'Z');

  cnt <= CNT_H & CNT_L;
  start <= WriteSfr And TCTRLWen And SfrDin(0);
  stop <= WriteSfr And TCTRLWen And SfrDin(1);
  clrstat <= WriteSfr And TCTRLWen And SfrDin(2);
  -- autoidle <= WriteSfr and TCTRLWen and SfrDin(3);

  S51TimerCore_I : S51TimerCore
  Port Map(
    RstB => RstB,
    Ck => Ck,

    start => start,
    stop => stop,
    cnt => cnt,
    reload => reload
  );
  timer_auto_idle <= '0';
  Time_out_IT <= ROLLV;

End rtl;