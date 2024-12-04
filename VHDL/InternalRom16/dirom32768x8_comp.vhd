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



-----------------------------------------
-- Diffusion ROM generator V4.1
--
-- DIROM VHDL component V4.1
-- Author : DOLPHIN INTEGRATION
-- Last modification : 08-07-99
-----------------------------------------



library ieee,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.VITAL_TIMING.all;
use work.dirom_pkg.all;


Package DIROM_COMPONENT is

component  dirom32768x8
-- synopsys translate_off 
 Generic(
  DATA_FILE	  : string;
  TimingChecksOn  : BOOLEAN;
  tpd_cs_do       : VitalDelayArrayType01(7 downto 0)
 );
-- synopsys translate_on
 port (
     CS         : in std_logic;
     EN         : in std_logic;
     NRST       : in std_logic; 
     AD         : in std_logic_VECTOR(14 downto 0);
     DO         : out std_logic_VECTOR(7 downto 0)); 
end component;

end DIROM_COMPONENT;


