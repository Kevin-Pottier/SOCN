
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibS51Cpu;
 use LibS51Cpu.PkgDAX.all;
 use LibS51Cpu.PkgPsw.all;
 use LibS51Cpu.PkgALU.all; 
Library LibPkg;
 use LibPkg.MyUtils.all;

entity Sequencer is
Port(
 RstB			: in    std_logic;  
 GatedCk		: in    std_logic;
 Ck			: in    std_logic;
 NotIdleMode		: in    std_logic;
 
 RstBQ			: out   std_logic; 
 HardCallRq		: in    std_logic;
 HardCallAck		: out   std_logic; 
 HardCallPC		: in    std_logic_vector(PcLenght - 1 downto 0);
-- TESTMODE S51EXECCODE
 TMLpc_S51ExecCodeEn	: in    std_logic;
 TMLpc_AddH		: in	std_logic_vector(7 downto 0);
 TMLpc_AddL		: in	std_logic_vector(7 downto 0);
-- PC
 DisOpcodeFetch		: in	std_logic;
 PC			: out	std_logic_vector(PcLenght - 1 downto 0);
 PCi			: in	std_logic_vector(PcLenght - 1 downto 0); 
-- SP
 StackPointer		: out	std_logic_vector(StackAddSize - 1 downto 0);
 StackPointerI		: in	std_logic_vector(StackAddSize - 1 downto 0);
-- ACCU
 Accu			: out	std_logic_vector(AccuRegSize - 1 downto 0);
 AccuI			: in	std_logic_vector(AccuRegSize - 1 downto 0); 
-- DPTR
 Dptr			: out	std_logic_vector(15 downto 0);
 DptrI			: in	std_logic_vector(15 downto 0); 
-- BREG
 Breg			: out	std_logic_vector(AccuRegSize - 1 downto 0);
 BregI			: in	std_logic_vector(AccuRegSize - 1 downto 0); 
-- PSWREG
 PswReg			: out	std_logic_vector(PswRegSize - 1 downto 0);
 PswRegI		: in	std_logic_vector(PswRegSize - 1 downto 0); 
-- VINSTR
 RomData		: in	std_logic_vector(3 * OpWord - 1 downto 0);
 Opcode			: out	std_logic_vector(OpWord - 1 downto 0);			
 Data1			: out	std_logic_vector(OpWord - 1 downto 0);
 Data2			: out	std_logic_vector(OpWord - 1 downto 0);
 MovcData		: out	std_logic_vector(OpWord - 1 downto 0);
-- STATE 
 State			: out	std_logic;
 StateI			: in	std_logic;
 ClearOpNb		: out	std_logic;
-- SFR
 SfrDin			: in	std_logic_vector(PeriphDataBusSize -1 downto 0);
 WriteSfr		: in	std_logic;

 BWen   		: in	std_logic;
 AccWen 		: in	std_logic;
 PswWen 		: in	std_logic;
 SpWen  		: in	std_logic;
 DplWen 		: in	std_logic;
 DphWen 		: in	std_logic

);
End Sequencer;

Architecture rtl of Sequencer is
 signal RstBqI		: std_logic;
 signal RstBqq		: std_logic;
 signal HardCallPCNorm	: std_logic_vector(15 downto 0);
 signal Data2I		: std_logic_vector(OpWord - 1 downto 0);
 signal HardCallAckI	: std_logic;  

 signal RunCpu		: std_logic;
 signal State_int       : std_logic;
 signal HardCallRqFilt  : std_logic;
 signal DisOpcodeFetchReg: std_logic;

--------
-- PC --
--------
 signal PCDataCV	: std_logic_vector(3 downto 0);
 type T_PCDataEV is array(3 downto 0) of std_logic_vector(PcLenght - 1 downto 0);
 signal PCDataEV 	: T_PCDataEV;
-- signal PCReg		: std_logic_vector(PcLenght - 1 downto 0);
 signal PCData		: std_logic_vector(PcLenght - 1 downto 0);

--------
-- SP --
--------
 signal SPDataCV	: std_logic_vector(2 downto 0);
 type T_SPDataEV is array(2 downto 0) of std_logic_vector(StackAddSize - 1 downto 0);
 signal SPDataEV	: T_SPDataEV;
 signal SPData		: std_logic_vector(StackAddSize - 1 downto 0);
 signal StackPointerReg	: std_logic_vector(StackAddSize - 1 downto 0);

---------
-- ACC --
---------
 signal ACCDataCV	: std_logic_vector(2 downto 0);
 type T_ACCDataEV is array(2 downto 0) of std_logic_vector(AccuRegSize - 1 downto 0);
 signal ACCDataEV	: T_ACCDataEV;
 signal ACCData		: std_logic_vector(AccuRegSize - 1 downto 0);
 signal AccuReg		: std_logic_vector(AccuRegSize - 1 downto 0);

-----------
-- DPTRH --
-----------
 signal DPTRHDataCV	: std_logic_vector(2 downto 0);
 type T_DPTRHDataEV is array(2 downto 0) of std_logic_vector(7 downto 0);
 signal DPTRHDataEV	: T_DPTRHDataEV;
 signal DPTRHData	: std_logic_vector(7 downto 0);
 signal DPTRH		: std_logic_vector(7 downto 0);
-- signal DPTRHReg	: std_logic_vector(7 downto 0);

-----------
-- DPTRL --
-----------
 signal DPTRLDataCV	: std_logic_vector(2 downto 0);
 type T_DPTRLDataEV is array(2 downto 0) of std_logic_vector(7 downto 0);
 signal DPTRLDataEV	: T_DPTRLDataEV;
 signal DPTRLData	: std_logic_vector(7 downto 0);
 signal DPTRL		: std_logic_vector(7 downto 0);
-- signal DPTRLReg	: std_logic_vector(7 downto 0);

----------
-- BREG --
----------
 signal BDataCV		: std_logic_vector(2 downto 0);
 type T_BDataEV is array(2 downto 0) of std_logic_vector(AccuRegSize - 1 downto 0);
 signal BDataEV		: T_BDataEV;
 signal BData		: std_logic_vector(AccuRegSize - 1 downto 0);
-- signal BRegReg		: std_logic_vector(AccuRegSize - 1 downto 0);

---------
-- PSW --
---------
 signal PSWDataCV	: std_logic_vector(2 downto 0);
 type T_PSWDataEV is array(2 downto 0) of std_logic_vector(PswRegSize - 1 downto 0);
 signal PSWDataEV	: T_PSWDataEV;
 signal PSWData		: std_logic_vector(PswRegSize - 1 downto 0);
 signal PSWRegReg		: std_logic_vector(PswRegSize - 1 downto 1);

------------
-- Opcode --
------------
 signal RIDataCV	: std_logic_vector(3 downto 0);
 type T_RIDataEV is array(3 downto 0) of std_logic_vector(OpWord - 1 downto 0);
 signal RIDataEV	: T_RIDataEV;
 signal RIData		: std_logic_vector(OpWord - 1 downto 0);
 signal OpcodeReg	: std_logic_vector(OpWord - 1 downto 0);

-----------
-- Data1 --
-----------
 signal D1DataCV	: std_logic_vector(3 downto 0);
 type T_D1DataEV is array(3 downto 0) of std_logic_vector(OpWord - 1 downto 0);
 signal D1DataEV	: T_D1DataEV;
 signal D1Data		: std_logic_vector(OpWord - 1 downto 0);
-- signal Data1Reg	: std_logic_vector(OpWord - 1 downto 0);

-----------
-- Data2 --
-----------
 signal D2DataCV	: std_logic_vector(4 downto 0);
 type T_D2DataEV is array(4 downto 0) of std_logic_vector(OpWord - 1 downto 0);
 signal D2DataEV	: T_D2DataEV;
 signal D2Data		: std_logic_vector(OpWord - 1 downto 0);
-- signal Data2IReg	: std_logic_vector(OpWord - 1 downto 0);
 
begin

 process(HardCallPC)
 begin
  HardCallPCNorm <= (others => '0');
  HardCallPCNorm(HardCallPC'range) <= HardCallPC;
 end process;

 ---------------------------------------------------------
 -- WAIT 1 AND 2 CLOCK CYCLES AFTER THE END OF RESET TO --
 -- ENABLE INTERNAL REGS TO BE WRITTEN                  --
 ---------------------------------------------------------

 process(RstB, GatedCk)
 begin
  if RstB = '0' then
   RstBqI <= '0';
  elsif (GatedCk'event and GatedCk = '1') then
   if NotIdleMode = '1' then
    RstBqI <= '1';
   end if;
  end if;
 end process;
 RstBq <= RstBqI;

 process(RstB, GatedCk)
 begin
  if RstB = '0' then
   RstBqq <= '0';
  elsif (GatedCk'event and GatedCk = '1') then
   if NotIdleMode = '1' then
    RstBqq <= RstBqI;
   end if;
  end if;
 end process;

 ClearOpNb <= not RstBqI;

---------------------------------------------------------
--
-- REMOVED ASYNC RESET DFFs :
--
-- reset is now handled synchronously => better timings +
-- less power consumption
--
---------------------------------------------------------

-- RunCpu <= RstBqI	and	    NotIdleMode	and	RstBqq and not HardCallAckI;
RunCpu <= RstBqI	and	    NotIdleMode	and not HardCallAckI;

PCDataCV(0)	<= 	not RstBqI	and	not TMLpc_S51ExecCodeEn;
PCDataCV(1)	<= 	not RstBqI	and	    TMLpc_S51ExecCodeEn;
PCDataCV(2)	<= 	    RstBqI	and 	not DisOpcodeFetch;
PCDataCV(3)     <=	'0';

PCDataEV(0) <=	(others => '0');
PCDataEV(1) <=	TMLpc_AddH & TMLpc_AddL;
PCDataEV(2) <=	PCi;

PCData <= 	scalarprod(PCDataEV(0), PCDataCV(0)) or
		scalarprod(PCDataEV(1), PCDataCV(1)) or
		scalarprod(PCDataEV(2), PCDataCV(2));

 PCDriver : process(GatedCk)  -- No asynch reset => less consumption + better timing
 begin
  if (GatedCk'event and GatedCk = '1') then
   if NotIdleMode = '1' then
    if or_reduce(PCDataCV) = '1' then
     PC <= PCData;
    end if;
   end if;
  end if;
 end process;

SPDataCV(0) <= not RstBqI;
SPDataCV(1) <=     RunCpu and WriteSfr and SpWen;
SPDataCV(2) <=     RunCpu and not(WriteSfr and SpWen);

SPDataEV(0) <=  SPInitValue;
SPDataEV(1) <=  SfrDin;
SPDataEV(2) <=  StackPointerI;

SPData <= 	scalarprod(SPDataEV(0), SPDataCV(0)) or
		scalarprod(SPDataEV(1), SPDataCV(1)) or
		scalarprod(SPDataEV(2), SPDataCV(2));-- or


 SP_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if or_reduce(SPDataCV) = '1' then
     StackPointerReg <= SPData;
    end if;
   end if;
  end if;
 end process;
 StackPointer <= StackPointerReg;

ACCDataCV(0) <= not RstBqI;
ACCDataCV(1) <=     RunCpu and WriteSfr and AccWen;
ACCDataCV(2) <=     RunCpu and not(WriteSfr and AccWen);

ACCDataEV(0) <= AccuInitValue;
ACCDataEV(1) <= SfrDin;
ACCDataEV(2) <= AccuI;

ACCData <= 	scalarprod(ACCDataEV(0), ACCDataCV(0)) or
		scalarprod(ACCDataEV(1), ACCDataCV(1)) or
		scalarprod(ACCDataEV(2), ACCDataCV(2));-- or

 ACCU_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if or_reduce(ACCDataCV) = '1' then
      AccuReg <= ACCData;
    end if;
   end if;
  end if;
 end process;

Accu <= AccuReg;

DPTRHDataCV(0) <= not RstBqI;
DPTRHDataCV(1) <=     RunCpu and WriteSfr and DphWen;
DPTRHDataCV(2) <=     RunCpu and not(WriteSfr and DphWen);

DPTRHDataEV(0) <= (others => '0');
DPTRHDataEV(1) <= SfrDin;
DPTRHDataEV(2) <= DptrI(15 downto 8);

DPTRHData <= 	scalarprod(DPTRHDataEV(0), DPTRHDataCV(0)) or
		scalarprod(DPTRHDataEV(1), DPTRHDataCV(1)) or
		scalarprod(DPTRHDataEV(2), DPTRHDataCV(2));-- or

 DPTRH_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if or_reduce(DPTRLDataCV) = '1' then
     DPTRH <= DPTRHData;
    end if;
   end if;
  end if;
 end process;

DPTRLDataCV(0) <= not RstBqI;
DPTRLDataCV(1) <=     RunCpu and WriteSfr and DplWen;
DPTRLDataCV(2) <=     RunCpu and not(WriteSfr and DplWen);

DPTRLDataEV(0) <= (others => '0');
DPTRLDataEV(1) <= SfrDin;
DPTRLDataEV(2) <= DptrI(7 downto 0);

DPTRLData <= 	scalarprod(DPTRLDataEV(0), DPTRLDataCV(0)) or
		scalarprod(DPTRLDataEV(1), DPTRLDataCV(1)) or
		scalarprod(DPTRLDataEV(2), DPTRLDataCV(2));-- or

 DPTRL_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if or_reduce(DPTRLDataCV) = '1' then
     DPTRL <= DPTRLData;
    end if;
   end if;
  end if;
 end process;

 DPTR <= DPTRH & DPTRL;

BDataCV(0) <= not RstBqI;
BDataCV(1) <= RunCpu and WriteSfr and BWen;
BDataCV(2) <= RunCpu and not(WriteSfr and BWen);

BDataEV(0) <= BregInitValue;
BDataEV(1) <= SfrDin;
BDataEV(2) <= BregI;

BData <= 	scalarprod(BDataEV(0), BDataCV(0)) or
		scalarprod(BDataEV(1), BDataCV(1)) or
		scalarprod(BDataEV(2), BDataCV(2));-- or
		

 BREG_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if or_reduce(BDataCV) = '1' then
     Breg <= BData;
    end if;   
   end if;
  end if;
 end process;

PSWDataCV(0) <= not RstBqI;
PSWDataCV(1) <= RunCpu and WriteSfr and PswWen;
PSWDataCV(2) <= RunCpu and not(WriteSfr and PswWen);

PSWDataEV(0) <= PswRegInitValue;
PSWDataEV(1) <= SfrDin;
PSWDataEV(2) <= PswRegI;

PSWData <= 	scalarprod(PSWDataEV(0), PSWDataCV(0)) or
		scalarprod(PSWDataEV(1), PSWDataCV(1)) or
		scalarprod(PSWDataEV(2), PSWDataCV(2));-- or

 PSW_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if or_reduce(PSWDataCV) = '1' then
     PswRegReg(PswRegSize - 1 downto 1) <= PSWData(PswRegSize - 1 downto 1);
    end if;      
   end if;
  end if;
 end process; 
 PswReg(PswRegSize - 1 downto 1) <= PswRegReg(PswRegSize - 1 downto 1);
 PswReg(P) <= Xor_Reduce(AccuReg);

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- OCD MODIF
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

 HardCallAck_process : process(RstB, GatedCk)
 begin
  if (RstB = '0') then
   HardCallAckI <= '0';   
  elsif (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if RstBqI = '1' then
     HardCallAckI <= HardCallRq and not DisOpcodeFetch;
    end if;
   end if;
  end if;
 end process;

HardCallRqFilt <= HardCallRq and not HardCallAckI;

RIDataCV(0) <= not RstBqI;
RIDataCV(1) <=     RstBqI and NotIdleMode and not HardCallRqFilt;
RIDataCV(2) <=     RstBqI and NotIdleMode and     HardCallRqFilt;
RIDataCV(3) <=	   '0';

RIDataEV(0) <= to_stdlogicvector(NOP);
RIDataEV(1) <= RomData(3 * OpWord - 1 downto 2 * OpWord);
RIDataEV(2) <= to_stdlogicvector(LCALL);

RIData <= 	scalarprod(RIDataEV(0), RIDataCV(0)) or
		scalarprod(RIDataEV(1), RIDataCV(1)) or
		scalarprod(RIDataEV(2), RIDataCV(2));

Opcode <= RIData when DisOpcodeFetchReg = '0' else
          OpcodeReg;

 RI_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if DisOpcodeFetch = '1' then
     OpcodeReg <= RIData;
    end if;   
   end if;
  end if;
 end process;


D1DataCV(0) <= not RstBqI;
D1DataCV(1) <=     RstBqI and NotIdleMode and not HardCallRqFilt;
D1DataCV(2) <=     RstBqI and NotIdleMode and	   HardCallRqFilt;
D1DataCV(3) <=	   '0';

D1DataEV(0) <= (others => '0');
D1DataEV(1) <= RomData(2 * OpWord - 1 downto     OpWord);
D1DataEV(2) <= HardCallPCNorm(15 downto 8);

D1Data <= 	scalarprod(D1DataEV(0), D1DataCV(0)) or
		scalarprod(D1DataEV(1), D1DataCV(1)) or
		scalarprod(D1DataEV(2), D1DataCV(2));


Data1 <= D1Data;

-- D1_process : process(GatedCk)
-- begin
--  if (GatedCk'event and GatedCk = '1') then 
--   if NotIdleMode = '1' then
--    if DisOpcodeFetch = '1' then
--     Data1reg <= D1Data;
--    end if;   
--   end if;
--  end if;
-- end process;
 

D2DataCV(0) <= not RstBqI;
D2DataCV(1) <=     RstBqI and NotIdleMode and not HardCallRqFilt;
D2DataCV(2) <=     RstBqI and NotIdleMode and	  HardCallRqFilt;
D2DataCV(3) <=     '0'; -- RstBqI and NotIdleMode ;
D2DataCV(4) <=	   '0';

D2DataEV(0) <= (others => '0');
D2DataEV(1) <= RomData(    OpWord - 1 downto          0);
D2DataEV(2) <= HardCallPCNorm(7 downto 0);
-- D2DataEV(3) <= RomData(3 * OpWord - 1 downto 2 * OpWord);

D2Data <= 	scalarprod(D2DataEV(0), D2DataCV(0)) or
		scalarprod(D2DataEV(1), D2DataCV(1)) or
		scalarprod(D2DataEV(2), D2DataCV(2)) or
		scalarprod(D2DataEV(3), D2DataCV(3));

Data2I <= D2Data;

-- D2_process : process(GatedCk)
-- begin
--  if (GatedCk'event and GatedCk = '1') then 
--   if NotIdleMode = '1' then
--    if DisOpcodeFetch = '1' then
--     Data2IReg <= RomData(    OpWord - 1 downto          0);
--    end if;   
--   end if;
--  end if;
-- end process;

 HardCallAck <= HardCallAckI;
 MovcData <= RomData(3 * OpWord - 1 downto 2 * OpWord); -- Data2I;
 Data2 <= Data2I;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- END OF OCD MODIF
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

 STATE_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if (RstBqI = '0') then
     State_int <= '0';   
    elsif RstBqq = '1' then	-- If reset got high for at least 2 clock cycles
     State_int <= StateI;
    end if;
   end if;
  end if;
 end process;
 
 State <= State_int;

 FDC_process : process(GatedCk)
 begin
  if (GatedCk'event and GatedCk = '1') then 
   if NotIdleMode = '1' then
    if (RstBqI = '0') then
     DisOpcodeFetchReg <= '0';   
    elsif RstBqq = '1' then	-- If reset got high for at least 2 clock cycles
     DisOpcodeFetchReg <= DisOpcodeFetch;
    end if;
   end if;
  end if;
 end process;

end rtl;
