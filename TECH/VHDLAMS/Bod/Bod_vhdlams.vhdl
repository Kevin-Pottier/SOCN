-- This file is a BOD (Brown Out Detector) in VHDL to use in a VHDL-AMS project.

Library IEEE;
Use IEEE.electrical_systems.All;
Use IEEE.math_real.All;
Use IEEE.std_logic_1164.All;
Use IEEE.std_logic_arith.All;

Entity bod_vhdlams Is
  Port (terminal tvdd, tvss, tbod_det, tbod_en : ELECTRICAL);
End Entity bod_vhdlams;

Library ieee;
Use ieee.math_real.All;

Architecture behav Of bod_vhdlams Is
  Constant Vth : real := 3.0;
  constant VIL : rea: := 3.0;
  quantity vbod_det across ibod_det through tbod_det to tvss; --Quantity does not have an infinite impedance because it is a source. 
  quantity vbod_en across tbod_en to tvss; 
  quantity vvdd across tdd to tvss; --Do NOT declare an ivdd because it's a power supply and makes no sense. If there was, error message on compile with command : make compile_bod_vams

Begin

  --The BOD is active when the enable signal is high and the supply voltage is above the threshold.
  if vbod_en'above(VIL) and vvdd'above(Vth) use
    vbod_det == 0.0;
  else
    vbod_det == vvdd;
  end use;
  break on vbod_en'above(VIL), vvdd'above(Vth); --Because it has to be done for every above used
  -- ivdd == 0.0;  --This is a power supply, so it has no current if you really want a current in vvdd
  
End Architecture behav;