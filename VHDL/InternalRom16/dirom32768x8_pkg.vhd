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
-- DIROM VHDL package V4.1
-- Author : DOLPHIN INTEGRATION
-- Last modification : 08-07-99
-----------------------------------------



library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.VITAL_TIMING.all;
use std.textio.all;


Package DIROM_PKG is

  type BIT_MATRIX is array(natural range<>, natural range <>) of std_logic;

---------------------------------------
-- Syntax of file :  .PROG
-- In datum, MSB is at left
---------------------------------------
--
--0000
--0001
--0010
--0100
--1000
--0011
--0110
--1100
---------------------------------------


-- synopsys translate_off

-- read datum from the program file :
  Function READ_CONTENU (ROM_PATT: STRING; NB_WORDS: POSITIVE; NB_BIT: POSITIVE) return BIT_MATRIX ;

-- VEC_TO_INT : conversion vecteur --> integer
  Function VEC_TO_INT(B: in std_logic_VECTOR) return INTEGER ;
  

  PROCEDURE ARRAYVitalPathDelay01Z (
    SIGNAL   OutBus        : INOUT std_logic_vector;    -- output signal
    CONSTANT OutBusIndex   : IN    integer;
    CONSTANT OutSignalName : IN    string;      -- name of the output signal
    CONSTANT OutTemp       : IN    std_logic;     -- 0-delay output
    CONSTANT Paths         : IN    VitalPathArray01ZType;
    VARIABLE GlitchData    : INOUT VitalGlitchDataType;
    CONSTANT Mode          : IN    VitalGlitchKindType;
    CONSTANT XOn           : IN    BOOLEAN;
    CONSTANT MsgOn         : IN    BOOLEAN;
    CONSTANT MsgSeverity   : IN    SEVERITY_LEVEL;
    signal   temp_sig      : INOUT std_logic
    );


-- synopsys translate_on


end DIROM_PKG ;



Package body DIROM_PKG is

-- synopsys translate_off 
  

  Function READ_CONTENU (ROM_PATT: STRING; NB_WORDS: POSITIVE; NB_BIT: POSITIVE) return BIT_MATRIX is

    file     F : TEXT is in ROM_PATT;

    variable L        : line;
    variable buf      : line;
    variable n        : integer := 0; -- bit
    variable m        : integer := 1; -- word
    variable bv       : bit_vector (NB_BIT-1 downto 0);
    variable good     : boolean;
    variable CONTENU  : BIT_MATRIX (0 to NB_WORDS-1, NB_BIT-1 downto 0);

  begin

    -- to read line to line the content of memory
    LIGNE : loop
      if not ENDFILE(F) then
        READLINE(F, L);
        READ(L,bv,GOOD);
        
        if not GOOD then 
          write(buf,string' ("Bad character  >> ligne : "));
          write(buf,m);
          writeline(output,buf);
          assert FALSE
            report "Stop simulation"
            severity Failure;
          exit LIGNE;
        end if;
        
        
        if m > NB_WORDS then
--          assert False
--            report "Number of words in pattern file > NB_WORDS, end of simulation : check " & ROM_PATT
--            severity Failure;
exit LIGNE;
        end if;

        for n in  0 to (NB_BIT-1) loop
          CONTENU (m-1, n) := to_uX01(bv(n));
        end loop;
        
        m := m + 1;
        
      else
        exit LIGNE;
      end if;
    end loop;


    
--    assert not(m < NB_WORDS)
--      report "Number of words in pattern file < NB_WORDS, end of simulation : check " & ROM_PATT
--      severity Failure;

    assert not(m = NB_WORDS)
      report "End in reading file : " & ROM_PATT
      severity Note;
    
    deallocate(L);
    deallocate(buf);
    return CONTENU;
  end READ_CONTENU;


  
  Function VEC_TO_INT(B: in std_logic_VECTOR) return INTEGER is
    variable SUM : NATURAL := 0 ;
  begin
    for I in B'range loop
      SUM := SUM * 2 ;
      if B(I) = '1' then 
        SUM := SUM + 1 ;
      elsif B(I) = '0' then 
        null ;
      else 
        SUM :=0 ; -- error
      end if ;
    end loop ;
    return SUM ;
  end VEC_TO_INT ; 
 


  PROCEDURE ARRAYVitalPathDelay01Z (
    SIGNAL   OutBus        : INOUT std_logic_vector;    -- output signal
    CONSTANT OutBusIndex   : IN    integer;
    CONSTANT OutSignalName : IN    string;     -- name of the output signal
    CONSTANT OutTemp       : IN    std_logic;     -- 0-delay output
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
      GlitchData      => LocalGlitchData,
      Mode            => OnEvent,
      XOn             => TRUE,
      MsgOn           => TRUE,
      MsgSeverity     => Warning);

    if (LocalGlitchData.SchedTime >= NOW) then
      OutBus(OutBusIndex) <= OutTemp after (LocalGlitchData.SchedTime - NOW);
    end if;

  END ARRAYVitalPathDelay01Z;

-- synopsys translate_on
  

end DIROM_PKG;


