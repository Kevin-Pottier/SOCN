onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider S51
add wave -noupdate -format Literal /testbench/TopAppliS51_I/S51Cpu_I/DAX_I/State
add wave -noupdate -format Literal /testbench/TopAppliS51_I/S51Cpu_I/DAX_I/StateI
add wave -noupdate /testbench/gendaxdisplay/DAXDisplay_I/RI
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/RstB
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/iRstB
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/Ck
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/S51ClockGen_I/GatedCkI
add wave -noupdate -radix hexadecimal /testbench/gendaxdisplay/DAXDisplay_I/PC
add wave -noupdate -format Analog-Step -height 50 -max 255.0 -radix unsigned /testbench/TopAppliS51_I/S51Cpu_I/Sequencer_I/Accu
add wave -noupdate -radix unsigned /testbench/TopAppliS51_I/S51Cpu_I/Sequencer_I/Accu
add wave -noupdate -radix unsigned /testbench/TopAppliS51_I/S51Cpu_I/Sequencer_I/Breg
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/PSW_I/PswRegI
add wave -noupdate -divider ALU
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/DAX_I/CMDOP1SEL
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/DAX_I/CMDOP2SEL
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/DAX_I/CmdAluI
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/DAX_I/CMDACCUISEL
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/DAX_I/CMDBREGISEL
add wave -noupdate -divider ALU_DIV
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/ALU_I/DIV8_I/Div8S1
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/ALU_I/DIV8_I/Div8S2
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/ALU_I/DIV8_I/Div8Op1
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/ALU_I/DIV8_I/Div8Op2
add wave -noupdate -divider GPIO
add wave -noupdate -format Analog-Step -max 220.00000000000003 -radix hexadecimal /testbench/TopAppliS51_I/P
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/P
add wave -noupdate -divider BOD
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/bod_det
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/bod_det_m
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/bod_det_q
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/bod_det_qq
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/bod_det_qqq
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/Bod_I/bod_en
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/iRstB
add wave -noupdate /testbench/TopAppliS51_I/RstCtl_I/RstB
add wave -noupdate -divider ROM
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/OpcodeReader_I/RomClk
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/OpcodeReader_I/RomEn
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/OpcodeReader_I/Rom0Clk
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/OpcodeReader_I/Rom0Me
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/OpcodeReader_I/Rom0Address
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/OpcodeReader_I/Rom0Out
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/OpcodeReader_I/RomData
add wave -noupdate -divider SFR
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/SrcSfrAddress
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/DstSfrAddress
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/SfrDin
add wave -noupdate -radix hexadecimal /testbench/TopAppliS51_I/S51Cpu_I/SfrDout
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/WriteSfr
add wave -noupdate /testbench/TopAppliS51_I/S51Cpu_I/ReadSfr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4343386 ps} 0} {Trace {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 45
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {4300 ns} {4983333 ps}
