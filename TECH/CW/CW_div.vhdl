---------------------------------------------------------------------------
-- Copyright (c) 1997-2009 Cadence Design Systems, Inc.  All rights reserved.
-- This work may not be copied, modified, re-published, uploaded, executed,
-- or distributed in any way, in any medium, whether in whole or in part,
-- without prior written permission from Cadence Design Systems, Inc.
--------------------------------------------------------------------------

--------------------------------------------------------------------------
--  Abstract   : Simulation Architecture for CW_div
--  RC Release : v14.20-s067_1
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package COMPONENTS is

Component CW_div
  generic (
    a_width : integer range 2 to INTEGER'RIGHT := 8;
    b_width : integer range 2 to INTEGER'RIGHT := 8;
    tc_mode : integer range 0 to 1 := 0;
    rem_mode: integer range 0 to 1 := 1 
    );
   port (
     a           : in  std_logic_vector (a_width-1 downto 0);
     b           : in  std_logic_vector (b_width-1 downto 0);
     quotient    : out std_logic_vector (a_width-1 downto 0);
     remainder   : out std_logic_vector (b_width-1 downto 0);
     divide_by_0 : out std_logic);  
end Component;

End COMPONENTS;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CW_div is
  
  generic (
    a_width : integer range 2 to INTEGER'RIGHT := 8;
    b_width : integer range 2 to INTEGER'RIGHT := 8;
    tc_mode : integer range 0 to 1 := 0;
    rem_mode: integer range 0 to 1 := 1 
    );
   port (
     a           : in  std_logic_vector (a_width-1 downto 0);
     b           : in  std_logic_vector (b_width-1 downto 0);
     quotient    : out std_logic_vector (a_width-1 downto 0);
     remainder   : out std_logic_vector (b_width-1 downto 0);
     divide_by_0 : out std_logic);  
end CW_div;

architecture CW_div of CW_div is

begin  -- CW_div

  process (a,b)
    constant max_uns_pos : std_logic_vector(a_width-1 downto 0) := (others => '1');
    constant max_sgn_pos : std_logic_vector(a_width-1 downto 0) := '0' & (a_width-2 downto 0 => '1');
    constant max_sgn_neg : std_logic_vector(a_width-1 downto 0) := '1' & (a_width-2 downto 0 => '0');
    constant minus_one   : std_logic_vector(b_width-1 downto 0) := (others => '1');
    constant all_zero    : std_logic_vector(b_width-1 downto 0) := (others => '0');
  begin  -- process
    if (to_integer(signed (b)) = 0) then
      if (tc_mode = 0) then
        quotient <= max_uns_pos;
      elsif (tc_mode = 1 and signed(a) >= 0) then
        quotient <= max_sgn_pos;
      else
        quotient <= max_sgn_neg;
      end if;
 
      if (tc_mode = 0 or a_width >= b_width) then
	remainder <= std_logic_vector(resize(unsigned(a),b_width));
      else
	remainder <= std_logic_vector(resize(signed(a),b_width));
      end if;

      divide_by_0 <= '1';
    else
      if (tc_mode = 0) then
        quotient <= std_logic_vector (unsigned(a) / unsigned (b));
        remainder <= std_logic_vector (unsigned (a) rem unsigned (b));
      else
        if (a = max_sgn_neg and b = minus_one) then
          quotient <= max_sgn_neg;
          remainder <= all_zero;
        else
          quotient <= std_logic_vector (signed (a) / signed (b));
          if (rem_mode = 1) then
            remainder <= std_logic_vector (signed (a) rem signed (b));
          else
            remainder <= std_logic_vector (signed (a) mod signed (b));
          end if;          
        end if;
      end if;
      divide_by_0 <= '0';
    end if;
  end process;

end CW_div;
