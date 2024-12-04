--*********************************************************************
--*
--*  DOLPHIN
--*       INTEGRATION
--*
--*********************************************************************
--*               ______         *
--*              /      \ ___    *
--*            /     . _-_-_-    *
--*      ____/          /        *  Dolphin Integration
--*   #_/   /          /    #    *  B.P. 65- ZIRST - 39, av. du Granier
--*   /              _/          *  38242 MEYLAN CEDEX - FRANCE
--*  |____          /       #    *
--*      \         /             *
--*   #   |       /         #    *  Tel : (33)/(0)4 76 41 10 96
--*       |      /               *
--*   #   |     /           #    *  Fax : (33)/(0)4 76 90 29 65
--*      /     /                 *
--* _ # /    /              #    *  Email : gds2@dolphin.fr
--*| \_/   /                     *
--* \ #  /                  #    *
--* |  / #   #   #   #   #       *
--* |/                           *
--*                              *
--*********************************************************************



----------------------------------------------------
--
-- GDS SRAM V4.1
--
-- SRAM definition as package
-- version 4.2 unidirectional
-- Author : DOLPHIN INTEGRATION
-- Last modification : 12-07-99
----------------------------------------------------



library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

---------------------------------------------------------------------------

Package MEMORY_COMPONENTS is

component sram32768x8
         
port (CS      : in  std_logic ;  -- operation on rising edge
      EN      : in  std_logic ;  -- READY and DO are Z when EN high 
      RD      : in  std_logic ;  -- read operation on CS rising edge
      WR      : in  std_logic ;  -- write operation on CS rising edge
      NRST    : in  std_logic ;  -- reset, active low :  NOP in the SRAM
      -- address bus
      AD      : in  std_logic_VECTOR(14 downto 0); 
      -- seperated data busses
      DI      : in  std_logic_VECTOR(7 downto 0);
      DO      : out std_logic_VECTOR(7 downto 0) 
      );
end component  ;

end MEMORY_COMPONENTS ;

