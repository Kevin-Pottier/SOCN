---------------------------------------------------------------------------
-- File name : PkgS51ItCtrl.vhdl
-- Circuit Family :
-- Project : LIUDO
-- Function : 
-- Author : SG
-- History of releases :
--
-- Rev 1.0  - SG   - October 31, 2003    - creation
--------------------------------------------------------------------------

Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkg;
 use LibPkg.myutils.all;
Library LibPkgS51Cpu;
 use LibPkgS51Cpu.PkgS51Cpu.all;

package PkgS51ItCtrl is

--------------------------------------------------------------------------------------
---------------------------------- USER  ---------------------------------------------
--------------------------------------------------------------------------------------

 constant ItNumberMax		: integer := 16;

--------------------------------------------------------------------------------------
--------------------------------- SYSTEM  --------------------------------------------
--------------------------------------------------------------------------------------

 constant ItNumberMaxSize	: integer := usize(ItNumberMax);
 
 Type T_PRIORITYV is array (ItNumberMax - 1 downto 0) of bit_vector (2 downto 0);
 Type T_ADDRESSLUTV is array (ItNumberMax - 1 downto 0) of std_logic_vector(PcLenght - 1 downto 0);
 Type T_SORT is array (ItNumberMax - 1 downto 0) of integer range 0 to ItNumberMax - 1;

 Constant C_AddressLUTV : T_ADDRESSLUTV :=	(
 							"0000000001111011",
							"0000000001110011",
							"0000000001101011",
							"0000000001100011",
							"0000000001011011",
							"0000000001010011",
							"0000000001001011",
							"0000000001000011",
							"0000000000111011",
							"0000000000110011",
							"0000000000101011",
							"0000000000100011",
							"0000000000011011",
							"0000000000010011",
							"0000000000001011",
							"0000000000000011"
						);

end PkgS51ItCtrl;

package body PkgS51ItCtrl is

end;

