
Library IEEE;
 Use IEEE.std_logic_1164.all;
 Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
 
Entity SfrDecoder is
 Port(
  AddSfr	: in  std_logic_vector(7 downto 0);
--  BitAddressable: in  std_logic;

  Ben   	             : out std_logic;
  ACCen		             : out std_logic;
  PSWen		             : out std_logic;
  SPen		             : out std_logic;
  DPLen		             : out std_logic;
  DPHen		             : out std_logic;
  UartConEn	           : out std_logic;
  UartStaEn	           : out std_logic;
  UartBuffEn	         : out std_logic;
  PrescalHEn	         : out std_logic;
  PrescalLEn	         : out std_logic;
  Dout0En	             : out std_logic;
  TCTRLEn	             : out std_logic;
  CNT_HEn	             : out std_logic;
  CNT_LEn	             : out std_logic;
  TSTATEn	             : out std_logic;
  IE0En		             : out std_logic;
  IE1En		             : out std_logic;
  IPH0En	             : out std_logic;
  IPH1En	             : out std_logic;
  IPL0En	             : out std_logic;
  IPL1En	             : out std_logic;
  ITCTLCONEn	         : out std_logic;
  ITSRCHEn             : out std_logic;
  ITSRCLEn             : out std_logic;
  
  SfrDout_TSTAT		     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_H		     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_CNT_L		     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
     
  SfrDout_IE0     	   : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IE1	         : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPH0	       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPH1	       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPL0     	   : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_IPL1	       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITCTLCON	   : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITSRCL	     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_ITSRCH	     : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  
  SfrDout_Breg         : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_Accu         : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_PswReg       : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_StackPointer : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_Dpl          : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  SfrDout_Dph          : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  
  SfrDout_Dout0        : in std_logic_vector(PeriphDataBusSize -1 downto 0);
  
  SfrDout		           : out std_logic_vector(PeriphDataBusSize -1 downto 0)

 );
End SfrDecoder;

Architecture rtl of SfrDecoder is
 signal WORDTODECODE						: std_logic_vector(7 downto 0);
 -- System
 Signal BenI, ACCenI, PSWenI, SPenI, DPLenI, DPHenI 		: std_logic;
 Signal Dout0EnI						: std_logic;
 Signal IE0EnI, IE1EnI, IPH0EnI, IPH1EnI, IPL0EnI, IPL1EnI, ITSRCHEnI, ITSRCLEnI : std_logic;
 Signal ITCTLCONEnI						: std_logic;
 Signal TCTRLEnI, CNT_HEnI, CNT_LEnI, TSTATEnI			: std_logic;
begin

WORDTODECODE <= AddSfr;

-----------------------------
-- DIRECT ADDRESS DECODING --
-----------------------------
process (WORDTODECODE,
SfrDout_TSTAT,
SfrDout_CNT_H,
SfrDout_CNT_L,

SfrDout_IE0,
SfrDout_IE1,
SfrDout_IPH0,
SfrDout_IPH1,
SfrDout_IPL0,
SfrDout_IPL1,
SfrDout_ITCTLCON,
SfrDout_ITSRCL,
SfrDout_ITSRCH,

SfrDout_Breg,
SfrDout_Accu,
SfrDout_PswReg,
SfrDout_StackPointer,
SfrDout_Dpl,
SfrDout_Dph,
SfrDout_Dout0
)
begin
 -- Default value
------------------------------------------
-- System
------------------------------------------ 
   BenI			   <= '0';
   ACCenI 		 <= '0';
   PSWenI 		 <= '0';
   SPenI 		   <= '0'; 
   DPLenI 		 <= '0';
   DPHenI 		 <= '0';
   Dout0EnI		 <= '0';
   IE0EnI	  	 <= '0';
   IE1EnI		   <= '0';
   IPH0EnI		 <= '0';
   IPH1EnI		 <= '0';
   IPL0EnI		 <= '0';
   IPL1EnI		 <= '0';
   ITCTLCONEnI <= '0';
   TCTRLEnI		 <= '0';
   CNT_HEnI		 <= '0';
   CNT_LEnI		 <= '0';
   TSTATEnI		 <= '0';
   ITSRCHEnI 	 <= '0';
   ITSRCLEnI 	 <= '0';
   SfrDout     <= (others => '0');
   
 case WORDTODECODE is
------------------------------------------
-- System
------------------------------------------ 
  when 	x"F0" =>
	BenI <= '1';
	SfrDout <= SfrDout_Breg;

  when 	x"E0" =>
	ACCenI <= '1';
	SfrDout <= SfrDout_Accu;

  when 	x"D0" =>
	PSWenI <= '1';
	SfrDout <= SfrDout_PswReg;
  
  when 	x"81" =>
	SPenI <= '1';
	SfrDout <= SfrDout_StackPointer;

  when 	x"82" =>
	DPLenI <= '1';
	SfrDout <= SfrDout_Dpl;

  when	x"83" =>
	DPHenI <= '1';
	SfrDout <= SfrDout_Dph;

  when 	x"84" =>
	Dout0EnI <= '1';
	SfrDout <= SfrDout_Dout0;

	                                                        -- #85

                                                                -- #86

                                                                -- #87

                                                                -- #8F

  when 	x"FA" =>
	IE1EnI <= '1';  
	SfrDout <= SfrDout_IE1;

  when 	x"F1" =>
	IPH0EnI <= '1';  
	SfrDout <= SfrDout_IPH0;

  when 	x"F2" =>
	IPH1EnI <= '1';  
	SfrDout <= SfrDout_IPH1;

  when 	x"E9" =>
	IPL0EnI <= '1';  
	SfrDout <= SfrDout_IPL0;

  when 	x"EA" =>
	IPL1EnI <= '1';  
	SfrDout <= SfrDout_IPL1;

  when 	x"FB" =>
	ITCTLCONEnI <= '1';  
	SfrDout <= SfrDout_ITCTLCON;

  when others =>
  NULL;

 end case;
end process;

   Ben		      <= BenI;
   ACCen 	      <= ACCenI;
   PSWen 	      <= PSWenI;
   SPen 	      <= SPenI;
   DPLen 	      <= DPLenI;
   DPHen 	      <= DPHenI;
   Dout0En     	<= Dout0EnI;
   IE0En	      <= IE0EnI;
   IE1En	      <= IE1EnI;
   IPH0En	      <= IPH0EnI;
   IPH1En	      <= IPH1EnI;
   IPL0En	      <= IPL0EnI;
   IPL1En	      <= IPL1EnI;
   ITCTLCONEn	  <= ITCTLCONEnI;
   TCTRLEn      <= TCTRLEnI;
   CNT_HEn      <= CNT_HEnI;
   CNT_LEn      <= CNT_LEnI;
   TSTATEn      <= TSTATEnI;
   
End rtl;
