
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibBod;
 use LibBod.PkgCompBod.all;

Entity RstCtl is
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;
  iRstB			: out	std_logic
 );
End RstCtl;
 
Architecture rtl of RstCtl is
 signal bod_det	        :       std_logic;
 signal bod_det_m       :       std_logic;
 signal bod_det_q       :       std_logic;
 signal bod_det_qq      :       std_logic;
 signal bod_det_qqq     :       std_logic;
 
 signal bod_en		:       std_logic;
begin

 process(Ck, RstB)
  begin
   if RstB = '0' then
    bod_det_m   <= '0';
    bod_det_q   <= '0';
  
    bod_det_qq  <= '0';
    bod_det_qqq <= '0';
   
   elsif Ck'event and Ck = '1' then
    bod_det_m   <= not bod_det;   -- Synchronizer
    bod_det_q   <= bod_det_m;     --      //
  
    bod_det_qq  <= bod_det_q;
    bod_det_qqq <= bod_det_qq;
   end if;  
 end process;

 iRstB <= bod_det_q and bod_det_qq and bod_det_qqq and RstB;

 bod_en <= RstB;
 
 Bod_I : bod
 Port map(
  bod_det		=> bod_det,
  bod_en		=> bod_en
 );

End rtl;

