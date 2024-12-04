                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module gensin_simple
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main_SINV_10000_2
                                     12 	.globl _main
                                     13 	.globl _PSW7
                                     14 	.globl _PSW6
                                     15 	.globl _PSW5
                                     16 	.globl _PSW4
                                     17 	.globl _PSW3
                                     18 	.globl _PSW2
                                     19 	.globl _PSW1
                                     20 	.globl _PSW0
                                     21 	.globl _ACC7
                                     22 	.globl _ACC6
                                     23 	.globl _ACC5
                                     24 	.globl _ACC4
                                     25 	.globl _ACC3
                                     26 	.globl _ACC2
                                     27 	.globl _ACC1
                                     28 	.globl _ACC0
                                     29 	.globl _B7
                                     30 	.globl _B6
                                     31 	.globl _B5
                                     32 	.globl _B4
                                     33 	.globl _B3
                                     34 	.globl _B2
                                     35 	.globl _B1
                                     36 	.globl _B0
                                     37 	.globl _TSTAT
                                     38 	.globl _CNT_L
                                     39 	.globl _CNT_H
                                     40 	.globl _TCTRL
                                     41 	.globl _DOUT0
                                     42 	.globl _ITCTLCON
                                     43 	.globl _IPL1
                                     44 	.globl _IPL0
                                     45 	.globl _IPH1
                                     46 	.globl _IPH0
                                     47 	.globl _IE1
                                     48 	.globl _IE0
                                     49 	.globl _UartPrescalerL
                                     50 	.globl _UartPrescalerH
                                     51 	.globl _UartSBuff
                                     52 	.globl _UartSTA
                                     53 	.globl _UartCON
                                     54 	.globl _DPH
                                     55 	.globl _DPL
                                     56 	.globl _SP
                                     57 	.globl _PSW
                                     58 	.globl _ACC
                                     59 	.globl _B
                                     60 ;--------------------------------------------------------
                                     61 ; special function registers
                                     62 ;--------------------------------------------------------
                                     63 	.area RSEG    (ABS,DATA)
      000000                         64 	.org 0x0000
                           0000F0    65 _B	=	0x00f0
                           0000E0    66 _ACC	=	0x00e0
                           0000D0    67 _PSW	=	0x00d0
                           000081    68 _SP	=	0x0081
                           000082    69 _DPL	=	0x0082
                           000083    70 _DPH	=	0x0083
                           0000C1    71 _UartCON	=	0x00c1
                           0000C2    72 _UartSTA	=	0x00c2
                           0000C3    73 _UartSBuff	=	0x00c3
                           0000B9    74 _UartPrescalerH	=	0x00b9
                           0000BA    75 _UartPrescalerL	=	0x00ba
                           0000F9    76 _IE0	=	0x00f9
                           0000FA    77 _IE1	=	0x00fa
                           0000F1    78 _IPH0	=	0x00f1
                           0000F2    79 _IPH1	=	0x00f2
                           0000E9    80 _IPL0	=	0x00e9
                           0000EA    81 _IPL1	=	0x00ea
                           0000FB    82 _ITCTLCON	=	0x00fb
                           000084    83 _DOUT0	=	0x0084
                           000085    84 _TCTRL	=	0x0085
                           000086    85 _CNT_H	=	0x0086
                           000087    86 _CNT_L	=	0x0087
                           00008F    87 _TSTAT	=	0x008f
                                     88 ;--------------------------------------------------------
                                     89 ; special function bits
                                     90 ;--------------------------------------------------------
                                     91 	.area RSEG    (ABS,DATA)
      000000                         92 	.org 0x0000
                           0000F0    93 _B0	=	0x00f0
                           0000F1    94 _B1	=	0x00f1
                           0000F2    95 _B2	=	0x00f2
                           0000F3    96 _B3	=	0x00f3
                           0000F4    97 _B4	=	0x00f4
                           0000F5    98 _B5	=	0x00f5
                           0000F6    99 _B6	=	0x00f6
                           0000F7   100 _B7	=	0x00f7
                           0000E0   101 _ACC0	=	0x00e0
                           0000E1   102 _ACC1	=	0x00e1
                           0000E2   103 _ACC2	=	0x00e2
                           0000E3   104 _ACC3	=	0x00e3
                           0000E4   105 _ACC4	=	0x00e4
                           0000E5   106 _ACC5	=	0x00e5
                           0000E6   107 _ACC6	=	0x00e6
                           0000E7   108 _ACC7	=	0x00e7
                           0000D0   109 _PSW0	=	0x00d0
                           0000D1   110 _PSW1	=	0x00d1
                           0000D2   111 _PSW2	=	0x00d2
                           0000D3   112 _PSW3	=	0x00d3
                           0000D4   113 _PSW4	=	0x00d4
                           0000D5   114 _PSW5	=	0x00d5
                           0000D6   115 _PSW6	=	0x00d6
                           0000D7   116 _PSW7	=	0x00d7
                                    117 ;--------------------------------------------------------
                                    118 ; overlayable register banks
                                    119 ;--------------------------------------------------------
                                    120 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        121 	.ds 8
                                    122 ;--------------------------------------------------------
                                    123 ; internal ram data
                                    124 ;--------------------------------------------------------
                                    125 	.area DSEG    (DATA)
                                    126 ;--------------------------------------------------------
                                    127 ; overlayable items in internal ram
                                    128 ;--------------------------------------------------------
                                    129 	.area	OSEG    (OVR,DATA)
                                    130 ;--------------------------------------------------------
                                    131 ; Stack segment in internal ram
                                    132 ;--------------------------------------------------------
                                    133 	.area SSEG
      000008                        134 __start__stack:
      000008                        135 	.ds	1
                                    136 
                                    137 ;--------------------------------------------------------
                                    138 ; indirectly addressable internal ram data
                                    139 ;--------------------------------------------------------
                                    140 	.area ISEG    (DATA)
                                    141 ;--------------------------------------------------------
                                    142 ; absolute internal ram data
                                    143 ;--------------------------------------------------------
                                    144 	.area IABS    (ABS,DATA)
                                    145 	.area IABS    (ABS,DATA)
                                    146 ;--------------------------------------------------------
                                    147 ; bit data
                                    148 ;--------------------------------------------------------
                                    149 	.area BSEG    (BIT)
                                    150 ;--------------------------------------------------------
                                    151 ; paged external ram data
                                    152 ;--------------------------------------------------------
                                    153 	.area PSEG    (PAG,XDATA)
                                    154 ;--------------------------------------------------------
                                    155 ; uninitialized external ram data
                                    156 ;--------------------------------------------------------
                                    157 	.area XSEG    (XDATA)
                                    158 ;--------------------------------------------------------
                                    159 ; absolute external ram data
                                    160 ;--------------------------------------------------------
                                    161 	.area XABS    (ABS,XDATA)
                                    162 ;--------------------------------------------------------
                                    163 ; initialized external ram data
                                    164 ;--------------------------------------------------------
                                    165 	.area HOME    (CODE)
                                    166 	.area GSINIT0 (CODE)
                                    167 	.area GSINIT1 (CODE)
                                    168 	.area GSINIT2 (CODE)
                                    169 	.area GSINIT3 (CODE)
                                    170 	.area GSINIT4 (CODE)
                                    171 	.area GSINIT5 (CODE)
                                    172 	.area GSINIT  (CODE)
                                    173 	.area GSFINAL (CODE)
                                    174 	.area CSEG    (CODE)
                                    175 ;--------------------------------------------------------
                                    176 ; interrupt vector
                                    177 ;--------------------------------------------------------
                                    178 	.area HOME    (CODE)
      000000                        179 __interrupt_vect:
      000000 02 00 1C         [24]  180 	ljmp	_main
                                    181 ;--------------------------------------------------------
                                    182 ; global & static initialisations
                                    183 ;--------------------------------------------------------
                                    184 	.area HOME    (CODE)
                                    185 	.area GSINIT  (CODE)
                                    186 	.area GSFINAL (CODE)
                                    187 	.area GSINIT  (CODE)
                                    188 	.globl __sdcc_gsinit_startup
                                    189 	.globl __sdcc_program_startup
                                    190 	.globl __start__stack
                                    191 	.globl __mcs51_genRAMCLEAR
                                    192 	.area GSFINAL (CODE)
      000019 02 00 03         [24]  193 	ljmp	__sdcc_program_startup
                                    194 ;--------------------------------------------------------
                                    195 ; Home
                                    196 ;--------------------------------------------------------
                                    197 	.area HOME    (CODE)
                                    198 	.area HOME    (CODE)
      000003                        199 __sdcc_program_startup:
      000003 02 00 1C         [24]  200 	ljmp	_main
                                    201 ;	return from main will return to caller
                                    202 ;--------------------------------------------------------
                                    203 ; code
                                    204 ;--------------------------------------------------------
                                    205 	.area CSEG    (CODE)
                                    206 ;------------------------------------------------------------
                                    207 ;Allocation info for local variables in function 'main'
                                    208 ;------------------------------------------------------------
                                    209 ;i                         Allocated to registers r7 
                                    210 ;------------------------------------------------------------
                                    211 ;	gensin_simple.c:4: void main(void) {
                                    212 ;	-----------------------------------------
                                    213 ;	 function main
                                    214 ;	-----------------------------------------
      00001C                        215 _main:
                           000007   216 	ar7 = 0x07
                           000006   217 	ar6 = 0x06
                           000005   218 	ar5 = 0x05
                           000004   219 	ar4 = 0x04
                           000003   220 	ar3 = 0x03
                           000002   221 	ar2 = 0x02
                           000001   222 	ar1 = 0x01
                           000000   223 	ar0 = 0x00
                                    224 ;	gensin_simple.c:14: for(i=0; i < sizeof(SINV)/sizeof(unsigned char); i++){
      00001C                        225 00109$:
      00001C 7F 00            [12]  226 	mov	r7,#0x00
      00001E                        227 00105$:
                                    228 ;	gensin_simple.c:15: DOUT0 = SINV[i];
      00001E EF               [12]  229 	mov	a,r7
      00001F 90 00 32         [24]  230 	mov	dptr,#_main_SINV_10000_2
      000022 93               [24]  231 	movc	a,@a+dptr
      000023 85 E0 84         [24]  232 	mov	_DOUT0,_ACC
                                    233 ;	gensin_simple.c:14: for(i=0; i < sizeof(SINV)/sizeof(unsigned char); i++){
      000026 0F               [12]  234 	inc	r7
      000027 BF 64 00         [24]  235 	cjne	r7,#0x64,00128$
      00002A                        236 00128$:
      00002A 40 F2            [24]  237 	jc	00105$
                                    238 ;	gensin_simple.c:19: }
      00002C 80 EE            [24]  239 	sjmp	00109$
                                    240 	.area CSEG    (CODE)
                                    241 	.area CONST   (CODE)
      000032                        242 _main_SINV_10000_2:
      000032 FE                     243 	.db #0xfe	; 254
      000033 1E                     244 	.db #0x1e	; 30
      000034 3D                     245 	.db #0x3d	; 61
      000035 5D                     246 	.db #0x5d	; 93
      000036 7C                     247 	.db #0x7c	; 124
      000037 9B                     248 	.db #0x9b	; 155
      000038 B9                     249 	.db #0xb9	; 185
      000039 D7                     250 	.db #0xd7	; 215
      00003A F3                     251 	.db #0xf3	; 243
      00003B 0F                     252 	.db #0x0f	; 15
      00003C 29                     253 	.db #0x29	; 41
      00003D 43                     254 	.db #0x43	; 67	'C'
      00003E 5B                     255 	.db #0x5b	; 91
      00003F 71                     256 	.db #0x71	; 113	'q'
      000040 86                     257 	.db #0x86	; 134
      000041 9A                     258 	.db #0x9a	; 154
      000042 AC                     259 	.db #0xac	; 172
      000043 BC                     260 	.db #0xbc	; 188
      000044 CB                     261 	.db #0xcb	; 203
      000045 D8                     262 	.db #0xd8	; 216
      000046 E3                     263 	.db #0xe3	; 227
      000047 EB                     264 	.db #0xeb	; 235
      000048 F2                     265 	.db #0xf2	; 242
      000049 F7                     266 	.db #0xf7	; 247
      00004A FA                     267 	.db #0xfa	; 250
      00004B FC                     268 	.db #0xfc	; 252
      00004C FA                     269 	.db #0xfa	; 250
      00004D F7                     270 	.db #0xf7	; 247
      00004E F2                     271 	.db #0xf2	; 242
      00004F EB                     272 	.db #0xeb	; 235
      000050 E3                     273 	.db #0xe3	; 227
      000051 D8                     274 	.db #0xd8	; 216
      000052 CB                     275 	.db #0xcb	; 203
      000053 BC                     276 	.db #0xbc	; 188
      000054 AC                     277 	.db #0xac	; 172
      000055 9A                     278 	.db #0x9a	; 154
      000056 86                     279 	.db #0x86	; 134
      000057 71                     280 	.db #0x71	; 113	'q'
      000058 5B                     281 	.db #0x5b	; 91
      000059 43                     282 	.db #0x43	; 67	'C'
      00005A 29                     283 	.db #0x29	; 41
      00005B 0F                     284 	.db #0x0f	; 15
      00005C F3                     285 	.db #0xf3	; 243
      00005D D7                     286 	.db #0xd7	; 215
      00005E B9                     287 	.db #0xb9	; 185
      00005F 9B                     288 	.db #0x9b	; 155
      000060 7C                     289 	.db #0x7c	; 124
      000061 5D                     290 	.db #0x5d	; 93
      000062 3D                     291 	.db #0x3d	; 61
      000063 1E                     292 	.db #0x1e	; 30
      000064 FE                     293 	.db #0xfe	; 254
      000065 DD                     294 	.db #0xdd	; 221
      000066 BE                     295 	.db #0xbe	; 190
      000067 9E                     296 	.db #0x9e	; 158
      000068 7F                     297 	.db #0x7f	; 127
      000069 60                     298 	.db #0x60	; 96
      00006A 42                     299 	.db #0x42	; 66	'B'
      00006B 24                     300 	.db #0x24	; 36
      00006C 08                     301 	.db #0x08	; 8
      00006D EC                     302 	.db #0xec	; 236
      00006E D2                     303 	.db #0xd2	; 210
      00006F B8                     304 	.db #0xb8	; 184
      000070 A0                     305 	.db #0xa0	; 160
      000071 8A                     306 	.db #0x8a	; 138
      000072 75                     307 	.db #0x75	; 117	'u'
      000073 61                     308 	.db #0x61	; 97	'a'
      000074 4F                     309 	.db #0x4f	; 79	'O'
      000075 3F                     310 	.db #0x3f	; 63
      000076 30                     311 	.db #0x30	; 48	'0'
      000077 23                     312 	.db #0x23	; 35
      000078 18                     313 	.db #0x18	; 24
      000079 10                     314 	.db #0x10	; 16
      00007A 09                     315 	.db #0x09	; 9
      00007B 04                     316 	.db #0x04	; 4
      00007C 01                     317 	.db #0x01	; 1
      00007D 00                     318 	.db #0x00	; 0
      00007E 01                     319 	.db #0x01	; 1
      00007F 04                     320 	.db #0x04	; 4
      000080 09                     321 	.db #0x09	; 9
      000081 10                     322 	.db #0x10	; 16
      000082 18                     323 	.db #0x18	; 24
      000083 23                     324 	.db #0x23	; 35
      000084 30                     325 	.db #0x30	; 48	'0'
      000085 3F                     326 	.db #0x3f	; 63
      000086 4F                     327 	.db #0x4f	; 79	'O'
      000087 61                     328 	.db #0x61	; 97	'a'
      000088 75                     329 	.db #0x75	; 117	'u'
      000089 8A                     330 	.db #0x8a	; 138
      00008A A0                     331 	.db #0xa0	; 160
      00008B B8                     332 	.db #0xb8	; 184
      00008C D2                     333 	.db #0xd2	; 210
      00008D EC                     334 	.db #0xec	; 236
      00008E 08                     335 	.db #0x08	; 8
      00008F 24                     336 	.db #0x24	; 36
      000090 42                     337 	.db #0x42	; 66	'B'
      000091 60                     338 	.db #0x60	; 96
      000092 7F                     339 	.db #0x7f	; 127
      000093 9E                     340 	.db #0x9e	; 158
      000094 BE                     341 	.db #0xbe	; 190
      000095 DD                     342 	.db #0xdd	; 221
                                    343 	.area CABS    (ABS,CODE)
