#SRCDIR       = VHDL_CMPLT
#TECHDIR      = TECH_CMPLT
SRCDIR       = VHDL
TECHDIR      = TECH

NTL_SRCDIR   = NTL
BODCIR       = Bod

RTL          = ../$(SRCDIR)
TECH         = ../$(TECHDIR)
NTLSF        = ../$(NTL_SRCDIR)
WORK_DIR     = ../WORK
WORK_DIR_NTL = ../WORK_NTL
WORK_AMS     = ../WORK_AMS
#AMS          = $(TECH)/AMS/vital/c35/
AMS_V        = $(TECH)/AMS/verilog/c35b4/
#AMS         = /opt/AMS_370/verilog/c35b4
#SYNTFILES    = SYNTFILES/$(shell date --iso=seconds)

prepare:
	mkdir -p $(WORK_DIR)
	rm -rf $(WORK_DIR)/Lib*
	rm -rf $(WORK_DIR)/c35_corelib
	vlib $(WORK_DIR)/LibPkg
	vlib $(WORK_DIR)/LibPkgS51Cpu
	vlib $(WORK_DIR)/LibPkgS51ItCtrl
	vlib $(WORK_DIR)/LibInternalRom16
	vlib $(WORK_DIR)/LibRegisterFile8
	vlib $(WORK_DIR)/LibGpioCtrl   
	vlib $(WORK_DIR)/LibInternalRam  
	vlib $(WORK_DIR)/LibS51Cpu       
	vlib $(WORK_DIR)/LibSfrDecoder   
	vlib $(WORK_DIR)/LibS51ItCtrl    
	vlib $(WORK_DIR)/LibTopAppliS51  
	vlib $(WORK_DIR)/LibTestBench
	vlib $(WORK_DIR)/LibNetlist
	vlib $(WORK_DIR)/LibS51Timer
	vlib $(WORK_DIR)/LibBod
	vlib $(WORK_DIR)/LibRstCtl
#	vlib $(WORK_DIR)/LibAWARITH
	vlib $(WORK_DIR)/LibCW
	vlib $(WORK_DIR)/c35_corelib	     
	
compile_tim:
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibS51Timer $(RTL)/S51Timer/CompS51TimerCore.vhdl  $(RTL)/S51Timer/CompS51Timer.vhdl $(RTL)/S51Timer/PkgS51Timer.vhdl $(RTL)/S51Timer/S51TimerCore.vhdl  $(RTL)/S51Timer/S51Timer.vhdl 

compile_msim: prepare
	vlog -modelsimini modelsim_rtl.ini -nologo -work $(WORK_DIR)/c35_corelib $(AMS_V)/c35_UDP.v $(AMS_V)/c35_CORELIB.v $(AMS_V)/c35_IOLIB_4M.v
#	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibAWARITH $(TECH)/AWARITH/AWARITH_DIV.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibCW $(TECH)/CW/CW_div.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibBod $(TECH)/VHDL/Bod/CompBod.vhdl $(TECH)/VHDL/Bod/Bod.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibRstCtl $(RTL)/RstCtl/CompRstCtl.vhdl $(RTL)/RstCtl/RstCtl.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibPkg $(RTL)/Pkg/MyUtils.vhdl $(RTL)/Pkg/Utils.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibPkgS51Cpu $(RTL)/PkgS51Cpu/PkgS51Cpu.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibPkgS51ItCtrl $(RTL)/PkgS51ItCtrl/PkgS51ItCtrl.vhdl
	vcom -modelsimini modelsim_rtl.ini -87 -nologo -explicit -work $(WORK_DIR)/LibInternalRom16 $(RTL)/InternalRom16/dirom32768x8_pkg.vhd $(RTL)/InternalRom16/dirom32768x8_comp.vhd $(RTL)/InternalRom16/dirom32768x8.vhd $(RTL)/InternalRom16/CompInternalRom16.vhdl $(RTL)/InternalRom16/InternalRom16_dolphin.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibRegisterFile8 $(RTL)/RegisterFile8/CompRegisterFile8.vhdl $(RTL)/RegisterFile8/RegisterFile8.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibGpioCtrl $(RTL)/GpioCtrl/CompGpioCtrl.vhdl $(RTL)/GpioCtrl/GpioCtrl.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibInternalRam $(RTL)/InternalRam/CompInternalRam.vhdl $(RTL)/InternalRam/InternalRam.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibS51Cpu  $(RTL)/S51Cpu/PkgAlu.vhdl $(RTL)/S51Cpu/PkgPsw.vhdl $(RTL)/S51Cpu/CompOpcodeReader.vhdl $(RTL)/S51Cpu/PkgDAX.vhdl $(RTL)/S51Cpu/CompDAX.vhdl $(RTL)/S51Cpu/CompSequencer.vhdl $(RTL)/S51Cpu/CompALUARITH.vhdl $(RTL)/S51Cpu/CompDAXDisplay.vhdl $(RTL)/S51Cpu/CompS51ClockGen.vhdl $(RTL)/S51Cpu/CompALU.vhdl $(RTL)/S51Cpu/CompPSW.vhdl  $(RTL)/S51Cpu/CompS51Cpu.vhdl $(RTL)/S51Cpu/Sequencer.vhdl $(RTL)/S51Cpu/PkgAlu.vhdl $(RTL)/S51Cpu/DAXDisplay.vhdl $(RTL)/S51Cpu/PkgPsw.vhdl $(RTL)/S51Cpu/PkgDAX.vhdl $(RTL)/S51Cpu/ALU.vhdl $(RTL)/S51Cpu/PSW.vhdl $(RTL)/S51Cpu/S51Cpu.vhdl $(RTL)/S51Cpu/DAX.vhdl $(RTL)/S51Cpu/S51ClockGen.vhdl $(RTL)/S51Cpu/OpcodeReader.vhdl $(RTL)/S51Cpu/ALUARITH.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibSfrDecoder $(RTL)/SfrDecoder/CompSfrDecoder.vhdl $(RTL)/SfrDecoder/SfrDecoder.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibInternalRam $(RTL)/InternalRam/CompInternalRam.vhdl $(RTL)/InternalRam/InternalRam.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibS51ItCtrl $(RTL)/S51ItCtrl/CompS51ItCtrlCore.vhdl $(RTL)/S51ItCtrl/S51ItCtrlCore.vhdl $(RTL)/S51ItCtrl/CompS51ItCtrl.vhdl $(RTL)/S51ItCtrl/S51ItCtrl.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibS51Timer $(RTL)/S51Timer/CompS51TimerCore.vhdl  $(RTL)/S51Timer/CompS51Timer.vhdl $(RTL)/S51Timer/PkgS51Timer.vhdl $(RTL)/S51Timer/S51TimerCore.vhdl  $(RTL)/S51Timer/S51Timer.vhdl 
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibTopAppliS51 $(RTL)/TopAppliS51/CompTopAppliS51.vhdl $(RTL)/TopAppliS51/TopAppliS51.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibTestBench $(TECH)/VHDL/RDac/CompRDac.vhdl $(TECH)/VHDL/RDac/RDac.vhdl $(RTL)/TestBench/CompDriver.vhdl $(RTL)/TestBench/Driver.vhdl $(RTL)/TestBench/TestBench.vhdl

compile_msim_simplerom: prepare
	vlog -modelsimini modelsim_ntl.ini -nologo -work $(WORK_DIR)/c35_corelib $(AMS_V)/c35_IOLIB_4M.v
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibAWARITH $(TECH)/AWARITH/AWARITH_DIV.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibBod $(TECH)/VHDL/Bod/CompBod.vhdl $(TECH)/VHDL/Bod/Bod.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibRstCtl $(RTL)/RstCtl/CompRstCtl.vhdl $(RTL)/RstCtl/RstCtl.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibPkg $(RTL)/Pkg/MyUtils.vhdl $(RTL)/Pkg/Utils.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibPkgS51Cpu $(RTL)/PkgS51Cpu/PkgS51Cpu.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibPkgS51ItCtrl $(RTL)/PkgS51ItCtrl/PkgS51ItCtrl.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibInternalRom16 $(RTL)/InternalRom16/CompInternalRom16.vhdl $(RTL)/InternalRom16/InternalRom16.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibRegisterFile8 $(RTL)/RegisterFile8/CompRegisterFile8.vhdl $(WORK_DIR)/LibRegisterFile8 $(RTL)/RegisterFile8/RegisterFile8.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibGpioCtrl $(RTL)/GpioCtrl/CompGpioCtrl.vhdl $(RTL)/GpioCtrl/GpioCtrl.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibInternalRam $(RTL)/InternalRam/CompInternalRam.vhdl $(RTL)/InternalRam/InternalRam.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibS51Cpu  $(RTL)/S51Cpu/PkgAlu.vhdl $(RTL)/S51Cpu/PkgPsw.vhdl $(RTL)/S51Cpu/CompOpcodeReader.vhdl $(RTL)/S51Cpu/PkgDAX.vhdl $(RTL)/S51Cpu/CompDAX.vhdl $(RTL)/S51Cpu/CompSequencer.vhdl $(RTL)/S51Cpu/CompALUARITH.vhdl $(RTL)/S51Cpu/CompDAXDisplay.vhdl $(RTL)/S51Cpu/CompS51ClockGen.vhdl $(RTL)/S51Cpu/CompALU.vhdl $(RTL)/S51Cpu/CompPSW.vhdl  $(RTL)/S51Cpu/CompS51Cpu.vhdl $(RTL)/S51Cpu/Sequencer.vhdl $(RTL)/S51Cpu/PkgAlu.vhdl $(RTL)/S51Cpu/DAXDisplay.vhdl $(RTL)/S51Cpu/PkgPsw.vhdl $(RTL)/S51Cpu/PkgDAX.vhdl $(RTL)/S51Cpu/ALU.vhdl $(RTL)/S51Cpu/PSW.vhdl $(RTL)/S51Cpu/S51Cpu.vhdl $(RTL)/S51Cpu/DAX.vhdl $(RTL)/S51Cpu/S51ClockGen.vhdl $(RTL)/S51Cpu/OpcodeReader.vhdl $(RTL)/S51Cpu/ALUARITH.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibSfrDecoder $(RTL)/SfrDecoder/CompSfrDecoder.vhdl $(RTL)/SfrDecoder/SfrDecoder.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibInternalRam $(RTL)/InternalRam/CompInternalRam.vhdl $(RTL)/InternalRam/InternalRam.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibS51ItCtrl $(RTL)/S51ItCtrl/CompS51ItCtrlCore.vhdl $(RTL)/S51ItCtrl/S51ItCtrlCore.vhdl $(RTL)/S51ItCtrl/CompS51ItCtrl.vhdl $(RTL)/S51ItCtrl/S51ItCtrl.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibS51Timer $(RTL)/S51Timer/CompS51TimerCore.vhdl  $(RTL)/S51Timer/CompS51Timer.vhdl $(RTL)/S51Timer/PkgS51Timer.vhdl $(RTL)/S51Timer/S51TimerCore.vhdl  $(RTL)/S51Timer/S51Timer.vhdl 
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibTopAppliS51 $(RTL)/TopAppliS51/CompTopAppliS51.vhdl $(RTL)/TopAppliS51/TopAppliS51.vhdl
	vcom -modelsimini modelsim_rtl.ini -nologo -explicit -work $(WORK_DIR)/LibTestBench $(TECH)/VHDL/RDac/CompRDac.vhdl $(TECH)/VHDL/RDac/RDac.vhdl $(RTL)/TestBench/CompDriver.vhdl $(RTL)/TestBench/Driver.vhdl $(RTL)/TestBench/TestBench.vhdl

compile_msim_synthams:
	perl patch_netlist.pl $(NTLSF)/top_synth_ams.v > $(NTLSF)/top_synth_ams.v.patched
	mkdir -p $(WORK_DIR_NTL)
	rm -rf $(WORK_DIR_NTL)/Lib*
	rm -rf $(WORK_DIR_NTL)/c35_corelib
						
	cd $(WORK_DIR_NTL)			     
	vlib $(WORK_DIR_NTL)/LibPkg		     
	vlib $(WORK_DIR_NTL)/LibPkgS51Cpu	     
	vlib $(WORK_DIR_NTL)/LibNetlist 	     
	vlib $(WORK_DIR_NTL)/LibInternalRom16	     
	vlib $(WORK_DIR_NTL)/LibInternalRam  	     
	vlib $(WORK_DIR_NTL)/LibTestBench	     
	vlib $(WORK_DIR_NTL)/LibS51Cpu       	     
	vlib $(WORK_DIR_NTL)/LibTopAppliS51  	     
	vlib $(WORK_DIR_NTL)/LibRegisterFile8	     
	vlib $(WORK_DIR_NTL)/LibGpioCtrl   	     
	vlib $(WORK_DIR_NTL)/LibSfrDecoder   	     
	vlib $(WORK_DIR_NTL)/LibPkgS51ItCtrl	     
	vlib $(WORK_DIR_NTL)/LibS51ItCtrl    	     
	vlib $(WORK_DIR_NTL)/LibS51Timer    	     
	vlib $(WORK_DIR_NTL)/c35_corelib	     
	vlib $(WORK_DIR_NTL)/LibBod		     
	vlib $(WORK_DIR_NTL)/LibRstCtl		     
						      
#	vlog -modelsimini modelsim_ntl.ini -nologo -work $(WORK_DIR_NTL)/c35_corelib $(AMS_V)/c35_UDP.v $(AMS_V)/c35_CORELIB.v $(AMS_V)/c35_IOLIB_4M.v
	vlog -modelsimini modelsim_ntl.ini -nologo -work $(WORK_DIR_NTL)/c35_corelib $(AMS_V)/c35_UDP.v $(AMS_V)/c35_CORELIB.v $(AMS_V)/c35_IOLIB_4M.v

	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibPkg $(RTL)/Pkg/MyUtils.vhdl $(RTL)/Pkg/Utils.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibPkgS51Cpu $(RTL)/PkgS51Cpu/PkgS51Cpu.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibS51Cpu  $(RTL)/S51Cpu/PkgAlu.vhdl $(RTL)/S51Cpu/PkgPsw.vhdl $(RTL)/S51Cpu/CompOpcodeReader.vhdl $(RTL)/S51Cpu/PkgDAX.vhdl $(RTL)/S51Cpu/CompDAX.vhdl $(RTL)/S51Cpu/CompSequencer.vhdl $(RTL)/S51Cpu/CompALUARITH.vhdl $(RTL)/S51Cpu/CompDAXDisplay.vhdl $(RTL)/S51Cpu/CompS51ClockGen.vhdl $(RTL)/S51Cpu/CompALU.vhdl $(RTL)/S51Cpu/CompPSW.vhdl  $(RTL)/S51Cpu/CompS51Cpu.vhdl $(RTL)/S51Cpu/PkgAlu.vhdl $(RTL)/S51Cpu/DAXDisplay.vhdl $(RTL)/S51Cpu/PkgPsw.vhdl $(RTL)/S51Cpu/PkgDAX.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibGpioCtrl $(RTL)/GpioCtrl/CompGpioCtrl.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibRegisterFile8 $(RTL)/RegisterFile8/CompRegisterFile8.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibSfrDecoder $(RTL)/SfrDecoder/CompSfrDecoder.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibPkgS51ItCtrl $(RTL)/PkgS51ItCtrl/PkgS51ItCtrl.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibS51ItCtrl $(RTL)/S51ItCtrl/CompS51ItCtrl.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibS51Timer $(RTL)/S51Timer/CompS51Timer.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibBod $(TECH)/VHDL/Bod/CompBod.vhdl $(TECH)/VHDL/Bod/Bod.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibRstCtl $(RTL)/RstCtl/CompRstCtl.vhdl

	vcom -modelsimini modelsim_ntl.ini -87 -nologo -explicit -work $(WORK_DIR_NTL)/LibInternalRom16 $(RTL)/InternalRom16/dirom32768x8_pkg.vhd $(RTL)/InternalRom16/dirom32768x8_comp.vhd $(RTL)/InternalRom16/dirom32768x8.vhd $(RTL)/InternalRom16/CompInternalRom16.vhdl $(RTL)/InternalRom16/InternalRom16_dolphin.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibInternalRam $(RTL)/InternalRam/CompInternalRam.vhdl

	vlog -modelsimini modelsim_ntl.ini -nologo -work $(WORK_DIR_NTL)/LibNetlist $(NTLSF)/top_synth_ams.v.patched
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibNetlist $(RTL)/InternalRam/InternalRam.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibTopAppliS51 $(RTL)/TopAppliS51/CompTopAppliS51.vhdl
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibTestBench $(TECH)/VHDL/RDac/CompRDac.vhdl $(TECH)/VHDL/RDac/RDac.vhdl $(RTL)/TestBench/CompDriver.vhdl $(RTL)/TestBench/Driver.vhdl $(RTL)/TestBench/TestBench.vhdl

#	vcom -nologo -explicit -work $(WORK_DIR_NTL)/c35_corelib $(AMS)/c35_CORELIB_Vtables.vhd
#	vcom -nologo -explicit -work $(WORK_DIR_NTL)/c35_corelib $(AMS)/c35_CORELIB_Vcomponents.vhd
#	vcom -nologo -explicit -work $(WORK_DIR_NTL)/c35_corelib $(AMS)/c35_CORELIB_VITAL.vhd

compile_msim_synthams_tb:
	vcom -modelsimini modelsim_ntl.ini -nologo -explicit -work $(WORK_DIR_NTL)/LibTestBench $(TECH)/VHDL/RDac/CompRDac.vhdl $(TECH)/VHDL/RDac/RDac.vhdl $(RTL)/TestBench/CompDriver.vhdl $(RTL)/TestBench/Driver.vhdl $(RTL)/TestBench/TestBench.vhdl

compile_bod_vams:
	cd $(WORK_AMS) && vacom   $(TECH)/VHDLAMS/Bod/Bod_vhdlams.vhdl	 -work  $(WORK_DIR)/LibBod

vaspi_bod:
	cd $(WORK_AMS) && vaspi -f  -work LibBod -srclib ../WORK/LibBod  -interface $(PWD)/BOD-bod.assoc bod -subckt_name BOD -subckt_file $(TECH)/SPICE/$(BODCIR)/$(BODCIR).cir -arch

vaspi_rdac:
	cd $(WORK_AMS) && vaspi -f  -work LibTestBench -srclib ../WORK/LibTestBench  -interface $(PWD)/RDAC-rdac.assoc rdac -subckt_name RDAC -subckt_file $(TECH)/SPICE/RDac/RDac.cir  -arch

compile_vams_prepare:
#	cp modelsim_rtl.ini $(WORK_AMS)/modelsim.ini
#	cp adms.cmd $(WORK_AMS)/
	mkdir -p $(WORK_AMS)
	@-rm -rf $(WORK_AMS)/Lib*
	@-rm $(WORK_AMS)/*.reuse $(WORK_AMS)/*.wlf $(WORK_AMS)/*.chi
	@-rm $(WORK_AMS)/*.wdb $(WORK_AMS)/*.swd $(WORK_AMS)/*.conv $(WORK_AMS)/*.log

compile_vams: compile_vams_prepare compile_msim compile_bod_vams vaspi_bod vaspi_rdac

#	valib	-link $(WORK_DIR)/c35_corelib	   $(WORK_AMS)/c35_corelib
#	valib	-link $(WORK_DIR)/LibAWARITH	   $(WORK_AMS)/LibAWARITH
#	valib	-link $(WORK_DIR)/LibPkg	   $(WORK_AMS)/LibPkg		    
#	valib	-link $(WORK_DIR)/LibPkgS51Cpu     $(WORK_AMS)/LibPkgS51Cpu	    
#	valib	-link $(WORK_DIR)/LibPkgS51ItCtrl  $(WORK_AMS)/LibPkgS51ItCtrl
#	valib	-link $(WORK_DIR)/LibInternalRom16 $(WORK_AMS)/LibInternalRom16
#	valib	-link $(WORK_DIR)/LibRegisterFile8 $(WORK_AMS)/LibRegisterFile8
#	valib	-link $(WORK_DIR)/LibGpioCtrl      $(WORK_AMS)/LibGpioCtrl   
#	valib	-link $(WORK_DIR)/LibInternalRam   $(WORK_AMS)/LibInternalRam  
#	valib	-link $(WORK_DIR)/LibS51Cpu	   $(WORK_AMS)/LibS51Cpu       
#	valib	-link $(WORK_DIR)/LibSfrDecoder    $(WORK_AMS)/LibSfrDecoder   
#	valib	-link $(WORK_DIR)/LibS51ItCtrl     $(WORK_AMS)/LibS51ItCtrl    
#	valib	-link $(WORK_DIR)/LibTopAppliS51   $(WORK_AMS)/LibTopAppliS51  
#	valib	-link $(WORK_DIR)/LibNetlist	   $(WORK_AMS)/LibNetlist    
#	valib	-link $(WORK_DIR)/LibS51Timer	   $(WORK_AMS)/LibS51Timer   
#	valib	-link $(WORK_DIR)/LibBod	   $(WORK_AMS)/LibBod	     
#	valib	-link $(WORK_DIR)/LibRstCtl	   $(WORK_AMS)/LibRstCtl     
#	valib	-link $(WORK_DIR)/LibTestBench     $(WORK_AMS)/LibTestBench

sim:
	cd $(WORK_DIR) && vsim -t ps -debugDB -vopt -voptargs=+acc  +nospecify -do wave.do LibTestBench.testbench
#	cd $(WORK_DIR) && vsim -t ps -novopt -do wave.do -debugDB LibTestBench.testbench

sim_ntl:
	cd $(WORK_DIR_NTL) && vsim -debugDB -vopt -voptargs=+acc -t ps +nospecify -do wave.do -l questa.log -L LibBod -L c35_corelib -L LibNetlist -L LibInternalRom16 -L LibInternalRam LibTestBench.testbench

sim_synth:
#	cd $(WORK_DIR_NTL) && vsim -novopt -t ps -sdfmax topapplis51_i=$(NTLSF)/top_synth_ams.sdf -sdfnoerror -do wave.do -l questa.log -L c35_corelib -L LibNetlist -L LibInternalRom16 -L LibInternalRam LibTestBench.testbench 
	cd $(WORK_DIR_NTL) && vsim -debugDB -vopt -voptargs=+acc -t ps -sdfmax topapplis51_i=$(NTLSF)/top_synth_ams.sdf -sdfnoerror -do wave.do -l questa.log -L LibBod -L c35_corelib -L LibNetlist -L LibInternalRom16 -L LibInternalRam LibTestBench.testbench 

sim_adms:
	cd $(WORK_AMS) && vasim -novopt -t ps LibTestBench.testbench +nospecify -cmd adms.cmd -do wave.do 

#copy_synt_files:
#	mkdir $(SYNTFILES)
#	cp rc.log report_timing.txt report_area.txt report_power.txt report_clock_gating.txt report_timing_worst.txt synth.tcl $(SYNTFILES)
#	cp $(NTLSF)/top_synth_ams.v $(NTLSF)/top_synth_ams.sdf $(NTLSF)/top_synth_ams.db $(SYNTFILES)

synth_tim:
	time rc -gui -files synth_timer.tcl
	
synth_chip:
	time rc -gui -files synth.tcl
#	make copy_synt_files
        
synth_chip_restore:        
	rc -files synth_restore.tcl


svn_cleanup:
	svn cleanup . --remove-unversioned

solution:
	cp ../SCRIPTS_CMPLT/gensin_poll.c	       ../SCRIPTS/
	cp ../SCRIPTS_CMPLT/gensin_it.c 	       ../SCRIPTS/
	cp ../SCRIPTS_CMPLT/gensin_tai.c 	       ../SCRIPTS/
	cp ../VHDL_CMPLT/S51Cpu/DAX.vhdl	       ../VHDL/S51Cpu/
	cp ../VHDL_CMPLT/TopAppliS51/TopAppliS51.vhdl  ../VHDL/TopAppliS51/
	cp ../VHDL_CMPLT/SfrDecoder/SfrDecoder.vhdl    ../VHDL/SfrDecoder/
	cp ../VHDL_CMPLT/S51Timer/S51Timer.vhdl        ../VHDL/S51Timer/
	cp ../VHDL_CMPLT/S51Timer/S51TimerCore.vhdl    ../VHDL/S51Timer/
