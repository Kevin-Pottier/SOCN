shell rm -f rc.log*
shell rm -f rc.cmd*

set PSEUDO_CLOCK_TREE 0
set FORCE_WIRELOAD 0

set RTL ../VHDL
#set hdl_vhdl_preferred_architecture ntl

read_hdl -vhdl -library  LibBod    ../TECH/VHDL/Bod/CompBod.vhdl
read_hdl -vhdl -library  LibRstCtl $RTL/RstCtl/CompRstCtl.vhdl $RTL/RstCtl/RstCtl.vhdl
read_hdl -vhdl -library  LibPkg $RTL/Pkg/MyUtils.vhdl $RTL/Pkg/Utils.vhdl
read_hdl -vhdl -library  LibPkgS51Cpu $RTL/PkgS51Cpu/PkgS51Cpu.vhdl
read_hdl -vhdl -library  LibPkgS51ItCtrl $RTL/PkgS51ItCtrl/PkgS51ItCtrl.vhdl
read_hdl -vhdl -library  LibInternalRom16 $RTL/InternalRom16/CompInternalRom16.vhdl $RTL/InternalRom16/dirom32768x8_pkg.vhd $RTL/InternalRom16/dirom32768x8_comp.vhd $RTL/InternalRom16/InternalRom16_dolphin.vhdl 
read_hdl -vhdl -library  LibRegisterFile8 $RTL/RegisterFile8/CompRegisterFile8.vhdl $RTL/RegisterFile8/RegisterFile8.vhdl
read_hdl -vhdl -library  LibGpioCtrl $RTL/GpioCtrl/CompGpioCtrl.vhdl $RTL/GpioCtrl/GpioCtrl.vhdl
read_hdl -vhdl -library  LibInternalRam $RTL/InternalRam/CompInternalRam.vhdl $RTL/InternalRam/InternalRam.vhdl
read_hdl -vhdl -library  LibS51Cpu  $RTL/S51Cpu/PkgAlu.vhdl $RTL/S51Cpu/PkgPsw.vhdl $RTL/S51Cpu/CompOpcodeReader.vhdl $RTL/S51Cpu/PkgDAX.vhdl $RTL/S51Cpu/CompDAX.vhdl $RTL/S51Cpu/CompSequencer.vhdl $RTL/S51Cpu/CompALUARITH.vhdl $RTL/S51Cpu/CompS51ClockGen.vhdl $RTL/S51Cpu/CompALU.vhdl $RTL/S51Cpu/CompPSW.vhdl  $RTL/S51Cpu/CompS51Cpu.vhdl $RTL/S51Cpu/Sequencer.vhdl $RTL/S51Cpu/ALU.vhdl $RTL/S51Cpu/PSW.vhdl $RTL/S51Cpu/S51Cpu.vhdl $RTL/S51Cpu/DAX.vhdl $RTL/S51Cpu/S51ClockGen.vhdl $RTL/S51Cpu/OpcodeReader.vhdl $RTL/S51Cpu/ALUARITH.vhdl
read_hdl -vhdl -library  LibSfrDecoder $RTL/SfrDecoder/CompSfrDecoder.vhdl $RTL/SfrDecoder/SfrDecoder.vhdl
read_hdl -vhdl -library  LibInternalRam $RTL/InternalRam/CompInternalRam.vhdl
read_hdl -vhdl -library  LibS51ItCtrl $RTL/S51ItCtrl/CompS51ItCtrlCore.vhdl $RTL/S51ItCtrl/S51ItCtrlCore.vhdl $RTL/S51ItCtrl/CompS51ItCtrl.vhdl $RTL/S51ItCtrl/S51ItCtrl.vhdl
read_hdl -vhdl -library  LibS51Timer $RTL/S51Timer/CompS51TimerCore.vhdl  $RTL/S51Timer/CompS51Timer.vhdl $RTL/S51Timer/PkgS51Timer.vhdl $RTL/S51Timer/S51TimerCore.vhdl  $RTL/S51Timer/S51Timer.vhdl 
read_hdl -vhdl -library  LibTopAppliS51 $RTL/TopAppliS51/CompTopAppliS51.vhdl $RTL/TopAppliS51/TopAppliS51.vhdl

# ---------------------------------------------------------------------------------------------
# LIB SETUP (FROM AMS, REFER TO ../TECH/AMS/buildgates_tlf/c35_3.3V/read_libs.tcl)
# ---------------------------------------------------------------------------------------------

set AMS_DIR ../TECH/AMS
set DOLPHIN_DIR ../TECH/dolphin_rom32k8/dirom32768x8
eval "set_attribute library {$AMS_DIR/lib/c35_CORELIB_WC.lib $AMS_DIR/lib/c35_IOLIB_4M.lib $DOLPHIN_DIR/synopsys/dirom32768x8.lib} /"
eval "set_attr hdl_search_path {$AMS_DIR/verilog/c35b4 $DOLPHIN_DIR/vhdl}"


# ---------------------------------------------------------------------------------------------
# ELAB+COMPILE
# ---------------------------------------------------------------------------------------------

set_attribute use_scan_seqs_for_non_dft false
set_attribute auto_ungroup none
set_attribute hdl_error_on_latch true
#set_attribute lp_insert_clock_gating true

set top_level TopAppliS51
elaborate $top_level

# Defines that all nets in the hierarchy will inherit the same wire load model as the top level block. Use it if when the plan is to flatten the design later for layout.
if { $FORCE_WIRELOAD == 1 } {
  set_attribute wireload_selection none / 
  set_attribute force_wireload 100k $top_level
} 

source IpS51_exceptions.tcl

 set clock_period    50000
#set clock_period  1000000
#set clock_period    31250

set clock [define_clock -period $clock_period -name Clock Ck]

#set_attribute clock_network_early_latency 0 Clock
#set_attribute clock_network_late_latency 15000 Clock
#set_attribute clock_setup_uncertainty {0 3000} Clock
#set_attribute slew {0 0 3000 3000} Clock
#
#set_attribute lp_clock_tree_buffers {CLKBU2 CLKBU4 CLKBU6 CLKBU8 CLKBU12 CLKBU15 CLKIN0 CLKIN1 CLKIN2 CLKIN3 CLKIN4 CLKIN6 CLKIN8 CLKIN10 CLKIN12 CLKIN15} $top_level
#set_attribute lp_clock_tree_leaf_max_fanout 15

check_design -unresolved
report timing -lint


synthesize -to_gen -effort high
#ungroup -flatten /TopAppliS51/S51Cpu_I/ALU_I/ADD8_I  
#ungroup -flatten /TopAppliS51/S51Cpu_I/ALU_I/INC8_I
#ungroup -flatten /TopAppliS51/S51Cpu_I/ALU_I/DEC8_I

define_cost_group  -name ALU_DIV
path_group -through S51Cpu_I/ALU_I/*_DIV* -group ALU_DIV

synthesize -to_mapped -effort high

write_hdl > ../NTL/top_synth_ams.v
write_sdf -delimiter / -interconn interconnect -precision 5 -setuphold split -recrem split > ../NTL/top_synth_ams.sdf
write_db -to_file ../NTL/top_synth_ams.db -all_root_attributes

report timing          > report_timing.txt
report area            > report_area.txt
report power           > report_power.txt
report clock_gating    > report_clock_gating.txt
report timing -worst 1 > report_timing_worst.txt

 set SYNTFILES SYNTFILES/clock_period_$clock_period

 set systemTime [clock seconds]
 set mytime [clock format $systemTime -format %H:%M:%S]

 if { [file exists SYNTFILES] == 1} {               
  append SYNTFILES "_" $mytime
 }

shell mkdir $SYNTFILES
shell cp rc.log report_timing.txt report_area.txt report_power.txt report_clock_gating.txt report_timing_worst.txt synth.tcl $SYNTFILES
shell cp ../NTL/top_synth_ams.v ../NTL/top_synth_ams.sdf ../NTL/top_synth_ams.db $SYNTFILES

#exit
