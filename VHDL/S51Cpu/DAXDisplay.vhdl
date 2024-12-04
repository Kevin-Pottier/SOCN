
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgPsw.all;
 use LibS51Cpu.PkgALU.all; 
-- use LibS51Cpu.PkgStack.all; 
 use LibS51Cpu.PkgDAX.all; 
library std;
 use std.textio.all;
Library LibPkg;
 use LibPkg.utils.all; 
Library modelsim_lib;
 use modelsim_lib.util.all;

entity DAXDisplay is
Port(
 RstB            : in    std_logic;  
 Ck            : in    std_logic;
 CpuIdleAck        : in    std_logic;                    -- IDLE mode
 HardCallRq        : in    std_logic;                    -- Interruptions generate LCALL
 HardCallAck        : in    std_logic;
 HardCallPC        : in    std_logic_vector(PcLenght - 1 downto 0);

-- OCD
 OCDStopCpu        : in    std_logic;
 OCDHMJB        : in    std_logic;
 OCDWrRI        : in    std_logic;
 OCDDataRI        : in    std_logic_vector(OpWord - 1 downto 0);

-- Opcode Reader
 PC            : in    std_logic_vector(PcLenght - 1 downto 0); 
 StackPointer        : in    std_logic_vector(StackAddSize - 1 downto 0);
 Accu            : in    std_logic_vector(AccuRegSize - 1 downto 0);
 Dptr            : in    std_logic_vector(15 downto 0); 
 Breg            : in    std_logic_vector(AccuRegSize - 1 downto 0);
 PswReg            : in    std_logic_vector(PswRegSize - 1 downto 0);
-- Peripheral bus  
 SrcSfrAddress        : in    std_logic_vector(PeriphAddBusSize - 1 downto 0);
 DstSfrAddress        : in    std_logic_vector(PeriphAddBusSize - 1 downto 0);
 SfrDin            : in    std_logic_vector(PeriphDataBusSize -1 downto 0);
 SfrDout        : in    std_logic_vector(PeriphDataBusSize -1 downto 0);
 ReadSfr        : in    std_logic;
 WriteSfr        : in    std_logic;
-- STACK bus 
 AddPortA        : in    std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortA        : in    std_logic_vector(7 downto 0);
 RdEnPortA        : in    std_logic; 
 AddPortB        : in    std_logic_vector(RegFileAddSize - 1 downto 0);
 DoutPortB        : in    std_logic_vector(7 downto 0);
 RdEnPortB        : in    std_logic;  
 AddPortC        : in    std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortC        : in    std_logic_vector(7 downto 0);
 WePortC        : in    std_logic;  
 AddPortD        : in    std_logic_vector(RegFileAddSize - 1 downto 0);
 DinPortD        : in    std_logic_vector(7 downto 0);
 WePortD        : in    std_logic; 
-- XRam bus
 XRamAddress        : in    std_logic_vector(XRamAddBusSize - 1 downto 0);
 XRamDOut        : in    std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamDIn        : in    std_logic_vector(XRamDataBusSize - 1 downto 0);
 XRamClk        : in    std_logic;
 XRamME            : in    std_logic;
 XRamWE            : in    std_logic; 
-- ROM bus
 DisOpcodeFetch        : in    std_logic;
 Opcode            : in    std_logic_vector(OpWord - 1 downto 0);
 Data1            : in    std_logic_vector(OpWord - 1 downto 0);
 Data2            : in    std_logic_vector(OpWord - 1 downto 0);
 State            : in    std_logic;
-- INTERNAL SFR ACCESS
 BWen            : in    std_logic;
 AccWen            : in    std_logic;
 PswWen            : in    std_logic;
 SpWen            : in    std_logic;
 DplWen            : in    std_logic;
 DphWen            : in    std_logic
);
End DAXDisplay;

Architecture rtl of DAXDisplay is
-- signal PC        :    std_logic_vector(PcLenght - 1 downto 0);
 type T_OBS is (NOT_FETCHED, ADD_A_direct, 
 ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6, ADD_A_R7,
 ADD_A_data, 
 ADD_A_At_R0, ADD_A_At_R1,
 ADDC_A_direct, ADDC_A_data,
 ADDC_A_At_R0, ADDC_A_At_R1,
 ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5, ADDC_A_R6, ADDC_A_R7,
 ANL_A_direct,
 ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6, ANL_A_R7,
 ANL_A_data,
 ANL_A_At_R0, ANL_A_At_R1,
 ANL_direct_A, CLR_A, CLR_bit, CLR_C, CPL_A, CPL_bit, CPL_C, DA_A, DEC_A, DEC_direct,
 DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7,
 DEC_At_R0, DEC_At_R1,
 INC_A,
 INC_direct,
 INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7,
 INC_At_R0, INC_At_R1,
 MOV_A_direct,
 MOV_A_R0, MOV_A_R1, MOV_A_R2, MOV_A_R3, MOV_A_R4, MOV_A_R5, MOV_A_R6, MOV_A_R7,
 MOV_A_data,
 MOV_A_At_R0, MOV_A_At_R1,
 ESCAPE_Op, MOV_C_bit, MOV_direct_A,
 MOV_R0_A, MOV_R1_A, MOV_R2_A, MOV_R3_A, MOV_R4_A, MOV_R5_A, MOV_R6_A, MOV_R7_A,
 MOV_R0_data, MOV_R1_data, MOV_R2_data, MOV_R3_data, MOV_R4_data, MOV_R5_data, MOV_R6_data, MOV_R7_data,
 MOV_At_R0_A, MOV_At_R1_A,
 MOV_At_R0_data, MOV_At_R1_data,
 NOOP, ORL_A_direct,
 ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6, ORL_A_R7,
 ORL_A_data,
 ORL_A_At_R0, ORL_A_At_R1,
 ORL_direct_A, RL_A, RLC_A, RR_A, RRC_A, SETB_bit, SETB_C, SUBB_A_direct,
 SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5, SUBB_A_R6, SUBB_A_R7,
 SUBB_A_data,
 SUBB_A_At_R0, SUBB_A_At_R1,
 SWAP_A, XCH_A_direct,
 XCH_A_R0, XCH_A_R1, XCH_A_R2, XCH_A_R3, XCH_A_R4, XCH_A_R5, XCH_A_R6, XCH_A_R7,
 XCH_A_At_R0,  XCH_A_At_R1,
 XCHD_A_At_R0, XCHD_A_At_R1, 
 XRL_A_direct,
 XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6, XRL_A_R7,
 XRL_A_data,
 XRL_A_At_R0, XRL_A_At_R1,
 XRL_direct_A, ACALL_addr11, AJMP_addr11, ANL_C_bit, ANL_C_not_bit, ANL_direct_data, CJNE_A_direct_rel, CJNE_A_data_rel,
 CJNE_R0_data_rel, CJNE_R1_data_rel, CJNE_R2_data_rel, CJNE_R3_data_rel, CJNE_R4_data_rel, CJNE_R5_data_rel, CJNE_R6_data_rel, CJNE_R7_data_rel,
 CJNE_At_R0_data_rel, CJNE_At_R1_data_rel, 
 DJNZ_direct_rel,
 DJNZ_R0_rel, DJNZ_R1_rel, DJNZ_R2_rel, DJNZ_R3_rel, DJNZ_R4_rel, DJNZ_R5_rel, DJNZ_R6_rel, DJNZ_R7_rel, 
 INC_DPTR, JB_bit_rel, JBC_bit_rel, JC_rel, JMP_At_A_PLUS_DPTR,
 JNB_bit_rel, JNC_rel, JNZ_rel, JZ_rel, LCALL_addr16, LJMP_addr16, MOV_bit_C, MOV_direct1_direct2,
 MOV_direct_R0, MOV_direct_R1, MOV_direct_R2, MOV_direct_R3, MOV_direct_R4, MOV_direct_R5, MOV_direct_R6, MOV_direct_R7, 
 MOV_direct_data,
 MOV_direct_At_R0, MOV_direct_At_R1,
 MOV_DPTR_data16,
 MOV_R0_direct, MOV_R1_direct, MOV_R2_direct, MOV_R3_direct, MOV_R4_direct, MOV_R5_direct, MOV_R6_direct, MOV_R7_direct, 
 MOV_At_R0_direct, MOV_At_R1_direct,
 MOVC_A_At_A_PLUS_DPTR, MOVC_A_At_A_PLUS_PC, MOVX_A_At_DPTR,
 MOVX_A_At_R0, MOVX_A_At_R1, 
 MOVX_At_DPTR_A,
 MOVX_At_R0_A, MOVX_At_R1_A,
 ORL_C_bit, ORL_C_not_bit, ORL_direct_data, POP_direct, PUSH_direct, RET_Op, RETI_Op, SJMP_rel,
 XRL_direct_data, DIV_AB, MUL_AB);
 
 signal RI              :    T_OBS;
 signal OCDDataRIq    :    std_logic_vector(OpWord - 1 downto 0);
 signal RstBq        :    std_logic;
 signal RstBqq        :    std_logic;
 signal CpuIdleAckq    :    std_logic;

 signal XRamAddressNorm    :    std_logic_vector(15 downto 0);    -- To normalize cpu.log format
 signal LogToFileEn    :    boolean;
-- signal Opcode_bitvector: bit_vector(OpWord - 1 downto 0);

 signal CkDelayed          :    std_logic;
 signal CkDelayedRi    :    std_logic;

 signal TCk              :    time := 1 ns;

 constant DEBUG        :    boolean := false;
                                       
 begin
 
       process
       begin
         init_signal_spy("/testbench/MyLog2FileEn", "LogToFileEn", 1);
       wait;
       end process;

 process(XRamAddress)
 begin
  XRamAddressNorm <= (others => '0');
  XRamAddressNorm(XRamAddress'high downto 0) <= XRamAddress;
 end process;

 process(Ck)
 begin
  if Ck'event and Ck = '1' then
   RstBq <= RstB;
  end if;
 end process;
 
-- Opcode_bitvector <= to_bitvector(Opcode, '0');

 process(Ck)
 begin
 if Ck'event and Ck = '1' then
  if OCDWrRI = '1' then
   OCDDataRIq <= OCDDataRI;
  end if;
 end if;
 end process;

 CkDelayed <= transport Ck after (Tck - 1 ns);
-- CkDelayed  <= transport Ck after (5 ns);
 CkDelayedRi <= transport Ck after (1 ps); -- Delay must be higher than ROM dout
   
 process(RstBq, Opcode, XRamClk, XRamAddressNorm, XRamDOut, XRamDIn, CpuIdleAck, OCDStopCpu, Ck, DisOpcodeFetch) -- , CkDelayedRi, CkDelayed)
  variable OutLine : line;
  File FileOutPut : TEXT is out "cpu.log";
  variable Opcode_bitvector : bit_vector(OpWord - 1 downto 0);
 begin

  if OCDStopCpu /= '1' and DisOpcodeFetch /= '1' then

   if RstBq /= '1' then

    RI <= NOT_FETCHED;

--   elsif CkDelayedRi'event and CkDelayedRi = '1' then
--   elsif Ck'event and Ck = '1' then      
   else

   if (CpuIdleAck /= '1') then

      if Ck'event and Ck = '1' then
            if LogToFileEn = true then
                  writeline(FileOutPut, OutLine);
            end if;
      end if;

     if OCDHMJB = '1' then
      Opcode_bitvector := to_bitvector(OCDDataRIq, '0');
     elsif HardCallRq = '1' then
      Opcode_bitvector := "00010010";
     else
      Opcode_bitvector := to_bitvector(Opcode, '0');
     end if;

     case Opcode_bitvector is
     when ADD =>            -- ADD A,direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADD A,direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;      
      RI <= ADD_A_direct;

     when ADD1R0 =>
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADD A,R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ADD_A_R0;
      when ADD1R1 =>
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_R1;
      when ADD1R2 =>
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_R2;
      when ADD1R3 =>
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_R3;
      when ADD1R4 =>
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_R4;
      when ADD1R5 =>
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_R5;
      when ADD1R6 =>
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_R6;
      when ADD1R7 =>
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_R7;
     when ADD2 =>            -- ADD A,#data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADD A,#data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ADD_A_data;

     when ADD3R0 =>            -- ADD A,@R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADD A,@R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ADD_A_At_R0;
      when ADD3R1 =>            -- ADD A,@R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADD A,@R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADD_A_At_R1;

     when ADDC =>                -- ADDC A, direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADDC A, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ADDC_A_direct;

     when ADDC1 =>            -- ADDC A, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADDC A, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ADDC_A_data;

     when ADDC2R0 =>            -- ADDC A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADDC A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ADDC_A_At_R0;
      when ADDC2R1 =>            -- ADDC A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_At_R1;


     when ADDC3R0 =>            -- ADDC A,R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ADDC A,R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ADDC_A_R0;
      when ADDC3R1 =>            -- ADDC A,R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A,R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_R1;
      when ADDC3R2 =>            -- ADDC A,R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A,R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_R2;
      when ADDC3R3 =>            -- ADDC A,R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A,R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_R3;
      when ADDC3R4 =>            -- ADDC A,R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A,R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_R4;
      when ADDC3R5 =>            -- ADDC A,R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A,R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_R5;
      when ADDC3R6 =>            -- ADDC A,R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A,R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_R6;
      when ADDC3R7 =>            -- ADDC A,R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ADDC A,R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ADDC_A_R7;

     when ANL =>                 -- ANL A, direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL A, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_A_direct;

     when ANL1R0 =>                 -- ANL A, R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL A, R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_A_R0;
      when ANL1R1 =>                 -- ANL A, R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_R1;
      when ANL1R2 =>                 -- ANL A, R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_R2;
      when ANL1R3 =>                 -- ANL A, R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_R3;
      when ANL1R4 =>                 -- ANL A, R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_R4;
      when ANL1R5 =>                 -- ANL A, R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_R5;
      when ANL1R6 =>                 -- ANL A, R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_R6;
      when ANL1R7 =>                 -- ANL A, R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_R7;    

     when ANL2 =>                     -- ANL A, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL A, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_A_data;

     when ANL3R0 =>                -- ANL A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_A_At_R0;
      when ANL3R1 =>                -- ANL A, @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ANL A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ANL_A_At_R1;

     when ANL4 =>                    -- ANL direct, A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL direct, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_direct_A;

     when CLR =>                    -- CLR A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CLR A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CLR_A;

     when CLR1 =>                     -- CLR bit (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CLR bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CLR_bit;

     when CLR2 =>                    -- CLR C (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CLR C>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CLR_C;

     when CPL =>                    -- CPL A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CPL A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CPL_A;

     when CPL1 =>                    -- CPL bit (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CPL bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CPL_bit;

     when CPL2 =>                    -- CPL C (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CPL C>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CPL_C;

     when DA =>                    -- DA A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DA A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DA_A;

     when DEC =>                    -- DEC A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DEC A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DEC_A;

     when DEC1 =>                    -- DEC direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DEC direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DEC_direct;

     when DEC2R0 =>                -- DEC R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DEC R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DEC_R0;
      when DEC2R1 =>                -- DEC R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DEC R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DEC_R1;
      when DEC2R2 =>                -- DEC R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
        if(LogToFileEn = true) then
         write(OutLine, string'(">>>>>> Instr : <DEC R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
         writeline(FileOutPut, OutLine);
        end if;
end if;
       RI <= DEC_R2;
      when DEC2R3 =>                -- DEC R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DEC R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DEC_R3;
      when DEC2R4 =>                -- DEC R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DEC R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DEC_R4;
      when DEC2R5 =>                -- DEC R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DEC R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DEC_R5;
      when DEC2R6 =>                -- DEC R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DEC R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DEC_R6;
      when DEC2R7 =>                -- DEC R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DEC R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DEC_R7;

     when DEC3R0 =>                -- DEC @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DEC @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DEC_At_R0;
      when DEC3R1 =>                -- DEC @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DEC @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DEC_At_R1;

     when INC =>                    -- INC A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <INC A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= INC_A;

     when INC1 =>                    -- INC direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <INC direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= INC_direct;

     when INC2R0 =>                -- INC R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <INC R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= INC_R0;
      when INC2R1 =>                -- INC R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_R1;
      when INC2R2 =>                -- INC R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_R2;
      when INC2R3 =>                -- INC R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_R3;
      when INC2R4 =>                -- INC R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_R4;
      when INC2R5 =>                -- INC R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_R5;
      when INC2R6 =>                -- INC R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_R6;
      when INC2R7 =>                -- INC R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_R7;

     when INC3R0 =>                 -- INC @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <INC @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= INC_At_R0;
      when INC3R1 =>                 -- INC @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <INC @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= INC_At_R1;    

     when MOV =>                    -- MOV A, direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV A, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_A_direct;

     when MOV1R0 =>                 -- MOV A, R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV A, R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_A_R0;
      when MOV1R1 =>                 -- MOV A, R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_R1;
      when MOV1R2 =>                 -- MOV A, R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_R2;
      when MOV1R3 =>                 -- MOV A, R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_R3;
      when MOV1R4 =>                 -- MOV A, R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_R4;
      when MOV1R5 =>                 -- MOV A, R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_R5;
      when MOV1R6 =>                 -- MOV A, R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_R6;
      when MOV1R7 =>                 -- MOV A, R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_R7;

     when MOV2 =>                    -- MOV A, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV A, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_A_data;

     when MOV3R0 =>                -- MOV A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_A_At_R0;
      when MOV3R1 =>                -- MOV A, @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_A_At_R1;

     when ESCAPE =>                -- ESCAPE
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : ESCAPE      "));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ESCAPE_Op;

     when MOV5 =>                    -- MOV C, bit (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV C, bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_C_bit;

     when MOV6 =>                    -- MOV direct, A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV direct, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_direct_A;

     when MOV7R0 =>                    -- MOV R0, A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV R0, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_R0_A;
      when MOV7R1 =>                    -- MOV R1, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R1, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R1_A;
      when MOV7R2 =>                    -- MOV R2, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R2, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R2_A;
      when MOV7R3 =>                    -- MOV R3, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R3, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R3_A;
      when MOV7R4 =>                    -- MOV R4, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R4, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R4_A;
      when MOV7R5 =>                    -- MOV R5, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R5, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R5_A;
      when MOV7R6 =>                    -- MOV R6, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R6, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R6_A;
      when MOV7R7 =>                    -- MOV R7, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R7, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R7_A;

     when MOV8R0 =>                    -- MOV R0, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV R0, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_R0_data;
      when MOV8R1 =>                    -- MOV R1, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R1, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R1_data;
      when MOV8R2 =>                    -- MOV R2, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R0, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R2_data;
      when MOV8R3 =>                    -- MOV R3, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R3, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R3_data;
      when MOV8R4 =>                    -- MOV R4, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R4, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R4_data;
      when MOV8R5 =>                    -- MOV R5, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R5, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R5_data;
      when MOV8R6 =>                    -- MOV R6, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R6, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R6_data;
      when MOV8R7 =>                    -- MOV R7, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R7, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R7_data;

     when MOV9R0 =>                    -- MOV @R0, A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV @R0, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_At_R0_A;
      when MOV9R1 =>                    -- MOV @R1, A (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV @R1, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_At_R1_A;

     when MOV10R0 =>                    -- MOV @R0, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV @R0, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_At_R0_data;
      when MOV10R1 =>                    -- MOV @R1, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV @R1, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_At_R1_data;

     when NOP =>                        -- NOP (1 c51 cycles)    
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <NOP>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= NOOP;

     when ORL =>                        -- ORL A, direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL A, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_A_direct;

     when ORL1R0 =>                        -- ORL A, R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL A, R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_A_R0;
      when ORL1R1 =>                        -- ORL A, R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_R1;
      when ORL1R2 =>                        -- ORL A, R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_R2;
      when ORL1R3 =>                        -- ORL A, R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_R3;
      when ORL1R4 =>                        -- ORL A, R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_R4;
      when ORL1R5 =>                        -- ORL A, R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_R5;
      when ORL1R6 =>                        -- ORL A, R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_R6;
      when ORL1R7 =>                        -- ORL A, R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_R7;

     when ORL2 =>                        -- ORL A, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL A, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_A_data;

     when ORL3R0 =>                    -- ORL A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_A_At_R0;
      when ORL3R1 =>                    -- ORL A, @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <ORL A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= ORL_A_At_R1;

     when ORL4 =>                        -- ORL direct, A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL direct, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_direct_A;

     when RL =>                        -- RL A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <RL A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= RL_A;

     when RLC =>                        -- RLC A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <RLC A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= RLC_A;

     when RR =>                        -- RR A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <RR A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= RR_A;

     when RRC =>                        -- RRC A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <RRC A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= RRC_A;

     when SETB =>                        -- SETB bit (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SETB bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SETB_bit;

     when SETB1 =>                    -- SETB C (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SETB C>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SETB_C;

     when SUBB =>                        -- SUBB A, direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SUBB A, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SUBB_A_direct;

     when SUBB1R0 =>                    -- SUBB A, R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SUBB A, R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SUBB_A_R0;
      when SUBB1R1 =>                    -- SUBB A, R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_R1;
      when SUBB1R2 =>                    -- SUBB A, R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_R2;
      when SUBB1R3 =>                    -- SUBB A, R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_R3;
      when SUBB1R4 =>                    -- SUBB A, R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_R4;
      when SUBB1R5 =>                    -- SUBB A, R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_R5;
      when SUBB1R6 =>                    -- SUBB A, R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_R6;
      when SUBB1R7 =>                    -- SUBB A, R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_R7;

     when SUBB2 =>                     -- SUBB A, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SUBB A, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SUBB_A_data;

     when SUBB3R0 =>                    -- SUBB A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SUBB A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SUBB_A_At_R0;
      when SUBB3R1 =>                    -- SUBB A, @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <SUBB A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= SUBB_A_At_R1;

     when SWAP =>                        -- SWAP A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SWAP A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SWAP_A;

     when XCH =>                        -- XCH A, direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XCH A, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XCH_A_direct;

     when XCH1R0 =>                    -- XCH A, R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XCH A, R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XCH_A_R0;
      when XCH1R1 =>                    -- XCH A, R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_R1;
      when XCH1R2 =>                    -- XCH A, R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_R2;
      when XCH1R3 =>                    -- XCH A, R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_R3;
      when XCH1R4 =>                    -- XCH A, R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_R4;
      when XCH1R5 =>                    -- XCH A, R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_R5;
      when XCH1R6 =>                    -- XCH A, R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_R6;
      when XCH1R7 =>                    -- XCH A, R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_R7;

     when XCH2R0 =>                    -- XCH A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XCH A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XCH_A_At_R0;
      when XCH2R1 =>                    -- XCH A, @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCH A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCH_A_At_R1;

     when XCHDR0 =>                    -- XCHD A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XCHD A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XCHD_A_At_R0;
      when XCHDR1 =>                    -- XCHD A, @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XCHD A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XCHD_A_At_R1;

     when XRL =>                        -- XRL A, direct (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XRL A, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XRL_A_direct;

     when XRL1R0 =>                    -- XRL A, R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XRL A, R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XRL_A_R0;
      when XRL1R1 =>                    -- XRL A, R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_R1;
      when XRL1R2 =>                    -- XRL A, R2 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_R2;
      when XRL1R3 =>                    -- XRL A, R3 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_R3;
      when XRL1R4 =>                    -- XRL A, R4 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_R4;
      when XRL1R5 =>                    -- XRL A, R5 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_R5;
      when XRL1R6 =>                    -- XRL A, R6 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_R6;
      when XRL1R7 =>                    -- XRL A, R7 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_R7;

     when XRL2 =>                        -- XRL A, #data (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XRL A, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XRL_A_data;

     when XRL3R0 =>                    -- XRL A, @R0 (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XRL A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XRL_A_At_R0;
      when XRL3R1 =>                    -- XRL A, @R1 (1 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <XRL A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= XRL_A_At_R1;

     when XRL4 =>                        -- XRL direct, A (1 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XRL direct, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XRL_direct_A;

     when    ACALL0 | ACALL1 | ACALL2 | ACALL3 |
          ACALL4 | ACALL5 | ACALL6 | ACALL7 =>        -- ACALL addr11 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ACALL addr11>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ACALL_addr11;

     when  AJMP0 | AJMP1 | AJMP2 | AJMP3 |
       AJMP4 | AJMP5 | AJMP6 | AJMP7 =>        -- AJMP addr11 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <AJMP addr11>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= AJMP_addr11;

     when ANL5 =>                        -- ANL C, bit (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL C, bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_C_bit;

     when ANL6 =>                        -- ANL C, /bit (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL C, /bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_C_not_bit;

     when ANL7 =>                        -- ANL direct, #data (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ANL direct, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ANL_direct_data;

     when CJNE =>                        -- CJNE A, direct, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CJNE A, direct, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CJNE_A_direct_rel;

     when CJNE1 =>                    -- CJNE A, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CJNE A, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CJNE_A_data_rel;

     when CJNE2R0 =>                    -- CJNE R0, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CJNE R0, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CJNE_R0_data_rel;
      when CJNE2R1 =>                    -- CJNE R1, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE R1, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_R1_data_rel;
      when CJNE2R2 =>                    -- CJNE R2, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE R2, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_R2_data_rel;
      when CJNE2R3 =>                    -- CJNE R3, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE R3, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_R3_data_rel;
      when CJNE2R4 =>                    -- CJNE R4, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE R4, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_R4_data_rel;
      when CJNE2R5 =>                    -- CJNE R5, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE R5, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_R5_data_rel;
      when CJNE2R6 =>                    -- CJNE R6, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE R6, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_R6_data_rel;
      when CJNE2R7 =>                    -- CJNE R7, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE R7, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_R7_data_rel;

     when CJNE3R0 =>                    -- CJNE @R0, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <CJNE @R0, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= CJNE_At_R0_data_rel;
      when CJNE3R1 =>                    -- CJNE @R1, #data, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <CJNE @R1, #data, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= CJNE_At_R1_data_rel;

     when DJNZ =>                        -- DJNZ direct, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DJNZ direct, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DJNZ_direct_rel;

     when DJNZ1R0 =>                    -- DJNZ R0, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DJNZ R0, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DJNZ_R0_rel;
      when DJNZ1R1 =>                    -- DJNZ R1, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DJNZ R1, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DJNZ_R1_rel;
      when DJNZ1R2 =>                    -- DJNZ R2, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DJNZ R2, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DJNZ_R2_rel;
      when DJNZ1R3 =>                    -- DJNZ R3, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DJNZ R3, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DJNZ_R3_rel;
      when DJNZ1R4 =>                    -- DJNZ R4, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DJNZ R4, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DJNZ_R4_rel;
      when DJNZ1R5 =>                    -- DJNZ R5, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DJNZ R5, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DJNZ_R5_rel;
      when DJNZ1R6 =>                    -- DJNZ R6, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DJNZ R6, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DJNZ_R6_rel;
      when DJNZ1R7 =>                    -- DJNZ R7, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <DJNZ R7, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= DJNZ_R7_rel;

     when INC4 =>                        -- INC DPTR (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <INC DPTR>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= INC_DPTR;

     when JB =>                        -- JB bit,rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JB bit,rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JB_bit_rel;

     when JBC =>                        -- JBC bit,rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JBC bit,rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JBC_bit_rel;

     when JC =>                        -- JC rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JC rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JC_rel;

     when JMP =>                        -- JMP @A+DPTR (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JMP @A+DPTR>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JMP_At_A_PLUS_DPTR;

     when JNB =>                        -- JNB bit, rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JNB bit, rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JNB_bit_rel;

     when JNC =>                        -- JNC rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JNC rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JNC_rel;

     when JNZ =>                        -- JNZ rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JNZ rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JNZ_rel;

     when JZ =>                        -- JZ rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <JZ rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= JZ_rel;

     when LCALL =>                    -- LCALL addr16 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <LCALL addr16>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= LCALL_addr16;

     when LJMP =>                        -- LJMP addr16 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <LJMP addr16>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= LJMP_addr16;

     when MOV11=>                        -- MOV bit, C (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV bit, C>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_bit_C;

     when MOV12 =>                    -- MOV direct1, direct2 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV direct1, direct2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_direct1_direct2;

     when MOV13R0 =>                    -- MOV direct, R0 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV direct, R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_direct_R0;
      when MOV13R1 =>                    -- MOV direct, R1 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_R1;
      when MOV13R2 =>                    -- MOV direct, R2 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, R2>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_R2;
      when MOV13R3 =>                    -- MOV direct, R3 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, R3>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_R3;
      when MOV13R4 =>                    -- MOV direct, R4 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, R4>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_R4;
      when MOV13R5 =>                    -- MOV direct, R5 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, R5>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_R5;
      when MOV13R6 =>                    -- MOV direct, R6 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, R6>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_R6;
      when MOV13R7 =>                    -- MOV direct, R7 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, R7>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_R7;

     when MOV14 =>                    -- MOV direct, #data (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV direct, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_direct_data;

     when MOV15R0 =>                    -- MOV direct, @R0 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV direct, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_direct_At_R0;
      when MOV15R1 =>                    -- MOV direct, @R1 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV direct, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_direct_At_R1;

     when MOV16 =>                    -- MOV DPTR, #data16 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV DPTR, #data16>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_DPTR_data16;

     when MOV17R0 =>                    -- MOV R0, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV R0, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_R0_direct;
      when MOV17R1 =>                    -- MOV R1, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R1, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R1_direct;
      when MOV17R2 =>                    -- MOV R2, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R2, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R2_direct;
      when MOV17R3 =>                    -- MOV R3, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R3, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R3_direct;
      when MOV17R4 =>                    -- MOV R4, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R4, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R4_direct;
      when MOV17R5 =>                    -- MOV R5, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R5, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R5_direct;
      when MOV17R6 =>                    -- MOV R6, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R6, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R6_direct;
      when MOV17R7 =>                    -- MOV R7, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV R7, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_R7_direct;

     when MOV18R0 =>                    -- MOV @R0, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOV @R0, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOV_At_R0_direct;
      when MOV18R1 =>                    -- MOV @R1, direct (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOV @R1, direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOV_At_R1_direct;

     when MOVC =>                        -- MOVC A, @A+DPTR (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOVC A, @A+DPTR>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOVC_A_At_A_PLUS_DPTR;

     when MOVC1 =>                    -- MOVC A, @A+PC (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOVC A, @A+PC>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOVC_A_At_A_PLUS_PC;

     when MOVX =>                        -- MOVX A, @DPTR (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOVX A, @DPTR>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOVX_A_At_DPTR;

     when MOVX1R0 =>                    -- MOVX A, @R0 (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOVX A, @R0>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOVX_A_At_R0;
      when MOVX1R1 =>                    -- MOVX A, @R1 (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOVX A, @R1>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOVX_A_At_R1;

     when MOVX2 =>                    -- MOVX @DPTR, A (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOVX @DPTR, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOVX_At_DPTR_A;

     when MOVX3R0 =>                    -- MOVX @R0, A (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MOVX @R0, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MOVX_At_R0_A;
      when MOVX3R1 =>                    -- MOVX @R1, A (2 c51 cycles)
if Ck'event and Ck = '1' then
       if(LogToFileEn = true) then
        write(OutLine, string'(">>>>>> Instr : <MOVX @R1, A>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
        writeline(FileOutPut, OutLine);
       end if;
end if;
       RI <= MOVX_At_R1_A;

     when ORL5 =>                        -- ORL C, bit (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL C, bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_C_bit;

     when ORL6 =>                        -- ORL C, /bit (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL C, /bit>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_C_not_bit;

     when ORL7 =>                        -- ORL direct, #data (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <ORL direct, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= ORL_direct_data;

     when POP =>                        -- POP direct (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <POP direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= POP_direct;

     when PUSH =>                        -- PUSH direct (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <PUSH direct>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= PUSH_direct;

     when RET =>                        -- RET (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <RET>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= RET_Op;

     when RETI =>                        -- RETI (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <RETI>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= RETI_Op;

     when SJMP =>                        -- SJMP rel (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <SJMP rel>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= SJMP_rel;

     when XRL5 =>                        -- XRL direct, #data (2 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <XRL direct, #data>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= XRL_direct_data;

     when DIV =>                        -- DIV AB (4 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <DIV AB>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= DIV_AB;

     when MUL =>                        -- MUL AB (4 c51 cycles)
if Ck'event and Ck = '1' then
      if(LogToFileEn = true) then
       write(OutLine, string'(">>>>>> Instr : <MUL AB>"));   write(OutLine, string'(" at PCi="));   write(OutLine, to_hstring(PC));   if DEBUG then write(OutLine, string'(" at "));   write(OutLine, now); end if;
       writeline(FileOutPut, OutLine);
      end if;
end if;
      RI <= MUL_AB;    
     when OTHERS => NULL;
     end case;
    end if;

if Ck'event and Ck = '1' then
    if(LogToFileEn = true) then
     if (CpuIdleAck /= '1') then
      write(OutLine, string'("         -------------")); writeline(FileOutPut, OutLine);
      write(OutLine, string'("        | REGISTERS:  |")); writeline(FileOutPut, OutLine);
      write(OutLine, string'("         --------------------------------------------------------------------------------------"));
      writeline(FileOutPut, OutLine);    
      write(OutLine, string'("        | StackPointer: <#"));  write(OutLine, to_hstring(StackPointer));

--      if (WriteSfr = '1' and AccWen = '1') then
--       write(OutLine, string'("h> | Accu: <#"));  write(OutLine, to_hstring(SfrDin));
--      else    
       write(OutLine, string'("h> | Accu: <#"));  write(OutLine, to_hstring(Accu));
--      end if;

--      if (WriteSfr = '1' and DphWen = '1') then
--       write(OutLine, string'("h> | Dptr: <#"));  write(OutLine, to_hstring(SfrDin));
--      else    
       write(OutLine, string'("h> | Dptr: <#"));  write(OutLine, to_hstring(Dptr(15 downto 8)));
--      end if;

--      if (WriteSfr = '1' and DplWen = '1') then
--       write(OutLine, to_hstring(SfrDin));
--      else    
       write(OutLine, to_hstring(Dptr(7 downto 0)));
--      end if;

--      if (WriteSfr = '1' and BWen = '1') then
--       write(OutLine, string'("h> | Breg: <#"));  write(OutLine, to_hstring(SfrDin));
--      else    
       write(OutLine, string'("h> | Breg: <#"));  write(OutLine, to_hstring(Breg));
--      end if;

--      if (WriteSfr = '1' and PswWen = '1') then
--       write(OutLine, string'("h> | PswReg: <#"));  write(OutLine, to_hstring(SfrDin));
--      else    
       write(OutLine, string'("h> | PswReg: <#"));  write(OutLine, to_hstring(PswReg));
--      end if;

      write(OutLine, string'("h> |"));
      writeline(FileOutPut, OutLine);
      write(OutLine, string'("         --------------------------------------------------------------------------------------"));
      writeline(FileOutPut, OutLine);
     end if;
end if;

  --    write(OutLine, string'("| BUSES: |")); writeline(FileOutPut, OutLine);
  --
  --
  --    write(OutLine, string'(" ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"));
  --    writeline(FileOutPut, OutLine);
  --    
  --    write(OutLine, string'("| @SrcSfr: <#"));  write(OutLine, to_hstring(SrcSfrAddress));
  --    write(OutLine, string'("h> | @DstSfr: <#"));  write(OutLine, to_hstring(DstSfrAddress));
  --    write(OutLine, string'("h> | SfrDin: <#"));  write(OutLine, to_hstring(SfrDin));
  --    write(OutLine, string'("h> | SfrDout: <#"));  write(OutLine, to_hstring(SfrDout));
  --    write(OutLine, string'("h> | @PortA: <#"));  write(OutLine, to_hstring(AddPortA));
  --    write(OutLine, string'("h> | DoutPortA: <#"));  write(OutLine, to_hstring(DoutPortA));
  --    write(OutLine, string'("h> | @PortB: <#"));  write(OutLine, to_hstring(AddPortB));
  --    write(OutLine, string'("h> | DoutPortB: <#"));  write(OutLine, to_hstring(DoutPortB));
  --    write(OutLine, string'("h> | @PortC: <#"));  write(OutLine, to_hstring(AddPortC));
  --    write(OutLine, string'("h> | DinPortC: <#"));  write(OutLine, to_hstring(DinPortC));
  --    write(OutLine, string'("h> | @PortD: <#"));  write(OutLine, to_hstring(AddPortD));
  --    write(OutLine, string'("h> | DinPortD: <#"));  write(OutLine, to_hstring(DinPortD));
  --
  --    write(OutLine, string'("h> |"));
  --    writeline(FileOutPut, OutLine);
  --
  --    write(OutLine, string'(" ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"));
  --    writeline(FileOutPut, OutLine);
  --    writeline(FileOutPut, OutLine);    

    end if;
   end if;

   if Ck'event and Ck = '1' then
--   if CkDelayed'event and CkDelayed = '1' then
    if(LogToFileEn = true) then
     if XRamME = '1' then
      if XRamWE = '1' then
       write(OutLine, string'("        XRAM: Write value <#")); write(OutLine, to_hstring(XRamDIn)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(XRamAddressNorm)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      else
       write(OutLine, string'("        XRAM: Read value <#")); write(OutLine, to_hstring(XRamDOut)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(XRamAddressNorm)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      end if;
     end if;
    end if;
   end if;

   if Ck'event and Ck = '1' then
--   if CkDelayed'event and CkDelayed = '1' then
    if(LogToFileEn = true) then
     if DisOpcodeFetch = '0' then

      if RdEnPortA = '1' then
       write(OutLine, string'("        STACK(PortA): Read value <#")); write(OutLine, to_hstring(DoutPortA)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(AddPortA)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      end if;

      if RdEnPortB = '1' then
       write(OutLine, string'("        STACK(PortB): Read value <#")); write(OutLine, to_hstring(DoutPortB)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(AddPortB)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      end if;

      if WePortC = '1' then
       write(OutLine, string'("        STACK(PortC): Write value <#")); write(OutLine, to_hstring(DinPortC)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(AddPortC)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      end if;

      if WePortD = '1' then
       write(OutLine, string'("        STACK(PortD): Write value <#")); write(OutLine, to_hstring(DinPortD)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(AddPortD)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      end if;

      if ReadSfr = '1' then
   --    XRamDOut <= (others => 'X'), RamContents(To_integer(XRamAddressNorm)) after 5 ns;
       write(OutLine, string'("        PERIPHERAL: Read value <#")); write(OutLine, to_hstring(SfrDout)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(SrcSfrAddress)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      end if;

      if WriteSfr = '1' then
   --    XRamDOut <= XRamDIn;
       write(OutLine, string'("        PERIPHERAL: Write value <#")); write(OutLine, to_hstring(SfrDin)); write(OutLine, string'("h> at <@")); write(OutLine, to_hstring(DstSfrAddress)); write(OutLine, string'("h>"));
       writeline(FileOutPut, OutLine);
      end if;
     end if;
    end if;
  --   write(OutLine, string'("<<<<<<")); writeline(FileOutPut, OutLine);

   end if;    
  end if;
 end process;

-- process(Ck)
--  variable cs : integer := 0;
--  variable t1 : time := 0 ns;
--  variable t2 : time := 0 ns;  
-- begin
--  if Ck'event and Ck = '1' and cs /= 2 then
--   if cs = 0 then
--    t1 := now;
--   else
--    t2 := now;
--    Tck <= t2 - t1;
--   end if;
--   cs := cs + 1;
--  end if;
-- end process;

 process(Ck)
  variable cs : integer := 0;
  variable t1 : time := 0 ns;
  variable t2 : time := 0 ns;  
 begin

  if Ck'event and Ck = '1' and cs = 0 then
   t1 := now;
   cs := 1;
  end if; 

  if Ck'event and Ck = '0' and cs = 1 then
   t2 := now;
   Tck <= 2*(t2 - t1);
   cs := 2;
  end if;   
      
 end process;

end Rtl;
