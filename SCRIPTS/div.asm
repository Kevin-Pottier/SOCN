;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.7.0 #4818 (May 31 2007)
; This file generated Wed Nov  7 09:00:10 2012
;--------------------------------------------------------
	.module test
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _PSW7
	.globl _PSW6
	.globl _PSW5
	.globl _PSW4
	.globl _PSW3
	.globl _PSW2
	.globl _PSW1
	.globl _PSW0
	.globl _ACC7
	.globl _ACC6
	.globl _ACC5
	.globl _ACC4
	.globl _ACC3
	.globl _ACC2
	.globl _ACC1
	.globl _ACC0
	.globl _B7
	.globl _B6
	.globl _B5
	.globl _B4
	.globl _B3
	.globl _B2
	.globl _B1
	.globl _B0
	.globl _TSTAT
	.globl _CNT_L
	.globl _CNT_H
	.globl _TCTRL
	.globl _DOUT0
	.globl _ITCTLCON
	.globl _IPL1
	.globl _IPL0
	.globl _IPH1
	.globl _IPH0
	.globl _IE1
	.globl _IE0
	.globl _UartPrescalerL
	.globl _UartPrescalerH
	.globl _UartSBuff
	.globl _UartSTA
	.globl _UartCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _PSW
	.globl _ACC
	.globl _B
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
_B	=	0x00f0
_ACC	=	0x00e0
_PSW	=	0x00d0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_UartCON	=	0x00c1
_UartSTA	=	0x00c2
_UartSBuff	=	0x00c3
_UartPrescalerH	=	0x00b9
_UartPrescalerL	=	0x00ba
_IE0	=	0x00f9
_IE1	=	0x00fa
_IPH0	=	0x00f1
_IPH1	=	0x00f2
_IPL0	=	0x00e9
_IPL1	=	0x00ea
_ITCTLCON	=	0x00fb
_DOUT0	=	0x0084
_TCTRL	=	0x0085
_CNT_H	=	0x0086
_CNT_L	=	0x0087
_TSTAT	=	0x008f
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
_B0	=	0x00f0
_B1	=	0x00f1
_B2	=	0x00f2
_B3	=	0x00f3
_B4	=	0x00f4
_B5	=	0x00f5
_B6	=	0x00f6
_B7	=	0x00f7
_ACC0	=	0x00e0
_ACC1	=	0x00e1
_ACC2	=	0x00e2
_ACC3	=	0x00e3
_ACC4	=	0x00e4
_ACC5	=	0x00e5
_ACC6	=	0x00e6
_ACC7	=	0x00e7
_PSW0	=	0x00d0
_PSW1	=	0x00d1
_PSW2	=	0x00d2
_PSW3	=	0x00d3
_PSW4	=	0x00d4
_PSW5	=	0x00d5
_PSW6	=	0x00d6
_PSW7	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	_main
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i                         Allocated to registers r2 
;------------------------------------------------------------
;	test.c:4: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	mov	_ACC,#0x10
	mov	_B,#0x2
	div ab
	mov	_ACC,#0x88
	mov	_B,#0x3
	div ab
	mov	_ACC,#0xFF
	mov	_B,#0x7
	div ab
	mov	_ACC,#0x01
	mov	_B,#0xFF
	div ab
	mov	_ACC,#0x30
	mov	_B,#0xF
	div ab
	mov	_ACC,#0x70
	mov	_B,#0x55
	div ab
	mov	_ACC,#0xDD
	mov	_B,#0x31
	div ab
	mov	_ACC,#0xA5
	mov	_B,#0x5A
	div ab
	mov	_ACC,#0xDD
	mov	_B,#0x0
	div ab
	mov	_ACC,#0xAA
	mov	_B,#0x55
	div ab
00104$:
	sjmp	00104$
