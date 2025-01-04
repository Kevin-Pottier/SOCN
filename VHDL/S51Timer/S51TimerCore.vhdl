
Library IEEE;
Use IEEE.std_logic_1164.All;
Use IEEE.numeric_std.All;
Library LibPkg;
Use LibPkg.MyUtils.All;
Library LibPkgS51Cpu;
Use LibPkgS51Cpu.PkgS51Cpu.All;
Library LibS51Timer;
Use LibS51Timer.PkgS51Timer.All;
-- synopsys translate_off
Library std;
Use std.textio.All;
-- synopsys translate_on

Entity S51TimerCore Is
    Port (
        RstB : In STD_LOGIC;
        Ck : In STD_LOGIC;

        start : In STD_LOGIC;
        stop : In STD_LOGIC;
        cnt : In STD_LOGIC_VECTOR(15 Downto 0);
        reload : Out STD_LOGIC
    );
End S51TimerCore;

Architecture rtl Of S51TimerCore Is
    Signal TIMERSM : T_TIMERSM;
    Signal TIMERSM_I : T_TIMERSM;
    Signal int_cnt : STD_LOGIC_VECTOR(15 Downto 0);
    Signal int_cnt_i : STD_LOGIC_VECTOR(15 Downto 0);
Begin

    Process (TIMERSM, start, stop, int_cnt, cnt) -- STATE_DECODER process
    Begin
    TIMERSM_I <= TM_IDLE;
    int_cnt_i <= int_cnt;

        Case TIMERSM Is

            When TM_IDLE =>
                If start = '1' Then
                    TIMERSM <= TM_DECR;
                    int_cnt <= cnt;
                End If;

            When TM_DECR =>
                If stop = '1' Then
                    TIMERSM <= TM_IDLE;
                Elsif int_cnt = "0000000000000000" Then
                    TIMERSM <= TM_RELOAD;
                Else
                    int_cnt <= STD_LOGIC_VECTOR(unsigned(int_cnt) - 1);
                End If;

                -- dec example: next_x <= std_logic_vector(unsigned(current_x) - 1);
                --    if x = "0000000000000000" then
                --    end if;

            When TM_RELOAD =>
                TIMERSM <= TM_IDLE;

            When Others =>
                TIMERSM <= TM_IDLE;

        End Case;
    End Process;

    Process (RstB, Ck) -- TIMERSM_R process
    Begin
        If RstB = '0' Then
            TIMERSM <= TM_IDLE;
            int_cnt <= (Others => '0');

        Elsif Ck'event And Ck = '1' Then
            TIMERSM <= TIMERSM_I;
            int_cnt <= int_cnt_i;
        End If;

    End Process;

    Process (Ck) -- INT_CNT_R process
    Begin
        If Ck'event And Ck = '1' Then
            int_cnt_i <= int_cnt;
        End If;
    End Process;

    reload <= bool2_stdlogic(TIMERSM = TM_RELOAD);

End rtl;