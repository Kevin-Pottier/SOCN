
Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;
Library LibPkg;
 use LibPkg.MyUtils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;
Library LibPkgS51ItCtrl;
 use LibPkgS51ItCtrl.PkgS51ItCtrl.all;
-- synopsys translate_off
library std;
 use std.textio.all;
-- synopsys translate_on

Entity S51ItCtrlCore is
 Port(
  RstB	        	: in    std_logic;
  Ck            	: in    std_logic;
  En			: in    std_logic;

  ItEntriesPriorityV	: in	T_PRIORITYV;
  NMIIdentifierV	: in	bit_vector(ItNumberMax - 1 downto 0);
  
  AddressLUTV		: in	T_ADDRESSLUTV;
    
  ItfAccessSecure	: in	std_logic;
  S51XRetI		: in	std_logic;
  HardCallRq		: out	std_logic;
  HardCallAck		: in	std_logic;  
  HardCallPC		: out	std_logic_vector(PcLenght - 1 downto 0)
 );
End S51ItCtrlCore;
 

Architecture rtl of S51ItCtrlCore is
 signal	RunningIt3		: std_logic;
 signal	RunningIt2		: std_logic;
 signal	RunningIt1		: std_logic;
 signal	RunningIt0		: std_logic;
 signal	HardCallI		: std_logic;
 signal winner			: T_PRIORITYV;
 signal ItNum			: T_SORT;
 
 signal ItNumberSelect		: integer range 0 to ItNumberMax;
 signal WinnerItNbI		: integer range 0 to ItNumberMax;
 signal priority		: bit_vector(1 downto 0);
begin

 Winner(0) <= ItEntriesPriorityV(0);
 
 GenWin:for i in 1 to ItNumberMax - 1 generate
  Winner(i) <= 	Winner((i-1)) when Winner((i-1)) >= ItEntriesPriorityV(i) else
		ItEntriesPriorityV(i);
  ItNum(i)  <=	i when NMIIdentifierV(i) = '1' or Winner((i-1)) < ItEntriesPriorityV(i) else
		ItNum((i-1));
 end generate;
 
 ItNum(0) <= 0;
 
 ItNumberSelect <= ItNum(ItNumberMax-1)	when (
 						(Winner(ItNumberMax-1) = "111" and RunningIt3 = '0') or  
                                 		(Winner(ItNumberMax-1) = "110" and RunningIt3 = '0' and RunningIt2 = '0') or 
                                 		(Winner(ItNumberMax-1) = "101" and RunningIt3 = '0' and RunningIt2 = '0' and RunningIt1 = '0') or  
                                 		(Winner(ItNumberMax-1) = "100" and RunningIt3 = '0' and RunningIt2 = '0' and RunningIt1 = '0' and RunningIt0 = '0')  
					     )
                           		else
                   ItNumberMax;  

 Priority <= Winner(ItNumberMax-1)(1 downto 0);

 --------------------
 -- Hard Long Call --
 --------------------
 process(RstB, Ck)
  -- synopsys translate_off
  variable OutLine : line; 
  -- synopsys translate_on
 begin
  if (RstB='0') then
   HardCallI   <= '0';
   RunningIt3  <= '0';
   RunningIt2  <= '0';
   RunningIt1  <= '0';
   RunningIt0  <= '0';
   WinnerItNbI <=  0;
  elsif (Ck'event and Ck='1') then
   if En = '1' then

    if HardCallAck = '1' then
     HardCallI <= '0';
    end if;

    if (S51XRetI = '1') then
     if (RunningIt3 ='1') then
      RunningIt3 <= '0';
     elsif (RunningIt2 ='1') then
      RunningIt2 <= '0';
     elsif (RunningIt1 ='1') then
      RunningIt1 <= '0';
     else
      RunningIt0 <= '0';
     end if;
    end if;

    if (ItNumberSelect /= ItNumberMax and S51XRetI='0' and ItfAccessSecure='1') then
     HardCallI <= '1';
     WinnerItNbI <= ItNumberSelect;

		-- synopsys translate_off
		write(OutLine, string'("S51ItCtrl : IT entry ")); write(OutLine, to_string(ItNumberSelect));
		write(OutLine, string'(" active at ")); write(OutLine, now);
		-- synopsys translate_on
     
     case Priority is
      when "11"   => RunningIt3 <= '1';
		-- synopsys translate_off
		write(OutLine, string'(", entering IT level 3"));
		-- synopsys translate_on
      when "10"   => RunningIt2 <= '1';
		-- synopsys translate_off
		write(OutLine, string'(", entering IT level 2"));      
		-- synopsys translate_on
      when "01"   => RunningIt1 <= '1';
		-- synopsys translate_off
		write(OutLine, string'(", entering IT level 1"));      
		-- synopsys translate_on
      when others => RunningIt0 <= '1';
		-- synopsys translate_off
		write(OutLine, string'(", entering IT level 0"));      
		-- synopsys translate_on
     end case;
		-- synopsys translate_off
		writeline(Output, OutLine);
		-- synopsys translate_on
    end if;
   end if;    
  end if;
 end process;

 HardCallRq <= HardCallI;
 HardCallPC <= AddressLUTV(WinnerItNbI);
 
 
 
 		 		 

		 -- Behavioural: print a warning on simulator command shell
		 -- synopsys translate_off
		 process(S51XRetI)
		  variable OutLine : line; 
		 begin
		  if (S51XRetI'event and S51XRetI = '1') then
		   write(OutLine, string'("S51ItCtrl : reti detected at ")); write(OutLine, now); write(OutLine, string'(", leaving IT level "));
		   if (RunningIt3 ='1') then
		    write(OutLine, string'("3"));
		   elsif (RunningIt2 ='1') then
		    write(OutLine, string'("2"));
		   elsif (RunningIt1 ='1') then
		    write(OutLine, string'("1"));
		   else
		    write(OutLine, string'("0"));
		   end if;
		   writeline(Output, OutLine);
		  end if;
		 end process;		 
		-- synopsys translate_on
		
		
		
		

End rtl;

