#------------------------ TECH LIBRARY SETUP

set AMS_DIR ../TECH/AMS/lib
set_attribute lib_search_path $AMS_DIR /
set_attribute library {c35_CORELIB_WC.lib c35_IOLIB_4M.lib} /

#------------------------ RTL LIB SETUP
set RTL ../VHDL 

read_hdl -vhdl -library LibPkg $RTL/Pkg/MyUtils.vhdl $RTL/Pkg/Utils.vhdl
read_hdl -vhdl -library LibPkgS51Cpu $RTL/PkgS51Cpu/PkgS51Cpu.vhdl
read_hdl -vhdl -library LibPkgS51ItCtrl $RTL/PkgS51ItCtrl/PkgS51ItCtrl.vhdl
read_hdl -vhdl -library LibS51Timer $RTL/S51Timer/CompS51TimerCore.vhdl  $RTL/S51Timer/CompS51Timer.vhdl $RTL/S51Timer/PkgS51Timer.vhdl $RTL/S51Timer/S51TimerCore.vhdl  $RTL/S51Timer/S51Timer.vhdl 

#------------------------ SYNTHESIS

set_attribute use_scan_seqs_for_non_dft false
set_attribute auto_ungroup none
set_attribute hdl_error_on_latch true

set top_level S51Timer
elaborate $top_level

set_attribute wireload_selection none / 
set_attribute force_wireload 10k $top_level


# RTL Compiler uses picoseconds and femtofarads as units. It does not use nanoseconds and picofarads.
set clock_period 50000
set clock [define_clock -period $clock_period -name MyClock Ck]
check_design -unresolved
report timing -lint

synthesize -to_mapped -effort high

#------------------------ REPORTS

report timing > timer_synth_ams_timing_$clock_period.txt
report area > timer_synth_ams_area_$clock_period.txt
report gates > timer_synth_ams_gates_$clock_period.txt
report power > timer_synth_ams_power_$clock_period.txt

#------------------------ OUTPUTS

write_hdl > ../NTL/timer_synth_ams_$clock_period.v
write_sdf -delimiter / -interconn interconnect -precision 5 > ../NTL/timer_synth_ams_$clock_period.sdf

#exit

############ HELPER ############
###### ls /hdl_libraries          
################################

# TODO
#set_operating_condition -library c35_CORELIB TYPICAL   -pvt typ
#read_symbol $AMS_DIR/buildgates_tlf/c35_3.3V/c35_CORELIB.sym
#read_symbol $AMS_DIR/buildgates_tlf/c35_3.3V/c35_IOLIB_4M.sym


