
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
-- GDS SRAM V4.1
--
-- SRAM VHDL model package
-- Version 4.2
-- Author : DOLPHIN INTEGRATION
-- Last modification : 12-07-99
----------------------------------------------------



library ieee;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_TIMING.all;
use std.textio.all;



Package SRAM_PKG is


-- std_logic_vector -> integer conversion    
function VEC_TO_INT(B: in std_logic_VECTOR) return INTEGER;
    
function vectorContainsXZ (vectorTest : std_logic_vector) return boolean;

PROCEDURE ARRAYVitalPathDelay01Z (
        SIGNAL   OutBus        : INOUT std_logic_vector;      -- output signal
        CONSTANT OutBusIndex   : IN    integer;       
        CONSTANT OutSignalName : IN    string;          -- name of the output signal
        CONSTANT OutTemp       : IN    std_logic;      -- 0-delay output
        CONSTANT Paths         : IN    VitalPathArray01ZType;
        VARIABLE GlitchData    : INOUT VitalGlitchDataType;
        CONSTANT Mode          : IN    VitalGlitchKindType;
        CONSTANT XOn           : IN    BOOLEAN;
        CONSTANT MsgOn         : IN    BOOLEAN;
        CONSTANT MsgSeverity   : IN    SEVERITY_LEVEL;
        signal   temp_sig      : INOUT std_logic    
        );
end  SRAM_PKG;




Package body SRAM_PKG is

        
PROCEDURE ARRAYVitalPathDelay01Z (
        SIGNAL   OutBus        : INOUT std_logic_vector;      -- output signal
        CONSTANT OutBusIndex   : IN    integer;       
        CONSTANT OutSignalName : IN    string;          -- name of the output signal
        CONSTANT OutTemp       : IN    std_logic;      -- 0-delay output
        CONSTANT Paths         : IN    VitalPathArray01ZType;
        VARIABLE GlitchData    : INOUT VitalGlitchDataType;
        CONSTANT Mode          : IN    VitalGlitchKindType;
        CONSTANT XOn           : IN    BOOLEAN;
        CONSTANT MsgOn         : IN    BOOLEAN;
        CONSTANT MsgSeverity   : IN    SEVERITY_LEVEL;
        signal   temp_sig      : INOUT std_logic            
        ) IS

        variable LocalGlitchData : VitalGlitchDataType; 

    BEGIN
        LocalGlitchData.SchedValue := OutBus(OutBusIndex);
        
        VitalPathDelay01Z (
         OutSignal       => temp_sig,
        OutSignalName   => OutSignalName,
        OutTemp         => OutTemp,
        Paths           => Paths,
        GlitchData        => LocalGlitchData,
        Mode            => OnEvent,
        XOn             => TRUE,
        MsgOn           => TRUE,
        MsgSeverity     => Warning);
        
        if (LocalGlitchData.SchedTime >= NOW) then
            OutBus(OutBusIndex) <= OutTemp after (LocalGlitchData.SchedTime - NOW);
        end if;
        
END ARRAYVitalPathDelay01Z;



function VEC_TO_INT(B: in std_logic_VECTOR) return INTEGER is
  variable SUM : NATURAL := 0 ;
begin
  for I in B'range loop
    SUM := SUM * 2 ;
    if B(I) = '1' then SUM := SUM + 1 ;
    elsif B(I) = '0' then null ;
    else SUM :=999999999 ; -- error
    end if ;
  end loop ;
  return SUM ;
end VEC_TO_INT ;  



function vectorContainsXZ (vectorTest : std_logic_vector) return boolean is 
begin
  for i in vectorTest'range loop
    if (vectorTest(i) /= '1' and vectorTest(i) /= '0') then
      return true;
    end if;
  end loop;
  return false;
end vectorContainsXZ;



end SRAM_PKG ;








