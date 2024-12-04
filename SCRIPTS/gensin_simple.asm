;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW64)
;--------------------------------------------------------
	.module gensin_simple
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main_SINV_10000_2
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
	.area RSEG    (ABS,DATA)
	.org 0x0000
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
	.area RSEG    (ABS,DATA)
	.org 0x0000
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
	.area SSEG
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
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
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
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	gensin_simple.c:4: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	gensin_simple.c:14: for(i=0; i < sizeof(SINV)/sizeof(unsigned char); i++){
00109$:
	mov	r7,#0x00
00105$:
;	gensin_simple.c:15: DOUT0 = SINV[i];
	mov	a,r7
	mov	dptr,#_main_SINV_10000_2
	movc	a,@a+dptr
	mov	_DOUT0,_ACC
	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	gensin_simple.c:14: for(i=0; i < sizeof(SINV)/sizeof(unsigned char); i++){
	inc	r7
	cjne	r7,#0x64,00128$
00128$:
	jc	00120$
;	gensin_simple.c:19: }
	ljmp	00109$
	
00120$:
	ljmp	00105$
	
	.area CSEG    (CODE)
	.area CONST   (CODE)
_main_SINV_10000_2:
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0x3d	; 61
	.db #0x5d	; 93
	.db #0x7c	; 124
	.db #0x9b	; 155
	.db #0xb9	; 185
	.db #0xd7	; 215
	.db #0xf3	; 243
	.db #0x0f	; 15
	.db #0x29	; 41
	.db #0x43	; 67	'C'
	.db #0x5b	; 91
	.db #0x71	; 113	'q'
	.db #0x86	; 134
	.db #0x9a	; 154
	.db #0xac	; 172
	.db #0xbc	; 188
	.db #0xcb	; 203
	.db #0xd8	; 216
	.db #0xe3	; 227
	.db #0xeb	; 235
	.db #0xf2	; 242
	.db #0xf7	; 247
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xfa	; 250
	.db #0xf7	; 247
	.db #0xf2	; 242
	.db #0xeb	; 235
	.db #0xe3	; 227
	.db #0xd8	; 216
	.db #0xcb	; 203
	.db #0xbc	; 188
	.db #0xac	; 172
	.db #0x9a	; 154
	.db #0x86	; 134
	.db #0x71	; 113	'q'
	.db #0x5b	; 91
	.db #0x43	; 67	'C'
	.db #0x29	; 41
	.db #0x0f	; 15
	.db #0xf3	; 243
	.db #0xd7	; 215
	.db #0xb9	; 185
	.db #0x9b	; 155
	.db #0x7c	; 124
	.db #0x5d	; 93
	.db #0x3d	; 61
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0xdd	; 221
	.db #0xbe	; 190
	.db #0x9e	; 158
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0xec	; 236
	.db #0xd2	; 210
	.db #0xb8	; 184
	.db #0xa0	; 160
	.db #0x8a	; 138
	.db #0x75	; 117	'u'
	.db #0x61	; 97	'a'
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x23	; 35
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x23	; 35
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x4f	; 79	'O'
	.db #0x61	; 97	'a'
	.db #0x75	; 117	'u'
	.db #0x8a	; 138
	.db #0xa0	; 160
	.db #0xb8	; 184
	.db #0xd2	; 210
	.db #0xec	; 236
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x9e	; 158
	.db #0xbe	; 190
	.db #0xdd	; 221
	.area CABS    (ABS,CODE)
