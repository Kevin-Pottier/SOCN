/*H**************************************************************************
* NAME: reg.h
*----------------------------------------------------------------------------
* Copyright (c) 2003 Atmel.
*----------------------------------------------------------------------------
* CREATED_BY:     S.GARNIER
* CREATION_DATE:  07/10/2003
* AUTHOR:         
* REVISION:       
* DATE:           
*----------------------------------------------------------------------------
* PURPOSE:
* This file defines the HardMAD SFR regs:
*   - Register SFRs
*   - Bit SFRs
*****************************************************************************/

#ifndef _REGHARDMAD_H_
#define _REGHARDMAD_H_

//_____ I N C L U D E S ____________________________________________________


//_____ M A C R O S ________________________________________________________


// C51 CORE

	// Byte addressable

__sfr __at 0xF0 B;
__sfr __at 0xE0 ACC;
__sfr __at 0xD0 PSW;
__sfr __at 0x81 SP;
__sfr __at 0x82 DPL;
__sfr __at 0x83 DPH;

	// bit addressable

__sbit __at 0xF0 B0;
__sbit __at 0xF1 B1;
__sbit __at 0xF2 B2;
__sbit __at 0xF3 B3;
__sbit __at 0xF4 B4;
__sbit __at 0xF5 B5;
__sbit __at 0xF6 B6;
__sbit __at 0xF7 B7;

__sbit __at 0xE0 ACC0;
__sbit __at 0xE1 ACC1;
__sbit __at 0xE2 ACC2;
__sbit __at 0xE3 ACC3;
__sbit __at 0xE4 ACC4;
__sbit __at 0xE5 ACC5;
__sbit __at 0xE6 ACC6;
__sbit __at 0xE7 ACC7;

__sbit __at 0xD0 PSW0;
__sbit __at 0xD1 PSW1;
__sbit __at 0xD2 PSW2;
__sbit __at 0xD3 PSW3;
__sbit __at 0xD4 PSW4;
__sbit __at 0xD5 PSW5;
__sbit __at 0xD6 PSW6;
__sbit __at 0xD7 PSW7;

// UART

__sfr __at 0xC1 UartCON;
__sfr __at 0xC2 UartSTA;
__sfr __at 0xC3 UartSBuff;
__sfr __at 0xB9 UartPrescalerH;
__sfr __at 0xBA UartPrescalerL;

// IT CONTROLLER

__sfr __at 0xF9 IE0;
__sfr __at 0xFA IE1;
__sfr __at 0xF1 IPH0;
__sfr __at 0xF2 IPH1;
__sfr __at 0xE9 IPL0;
__sfr __at 0xEA IPL1;
__sfr __at 0xFB ITCTLCON;

//

__sfr __at 0x84 DOUT0;
__sfr __at 0x85 TCTRL;
__sfr __at 0x86 CNT_H;
__sfr __at 0x87 CNT_L;
__sfr __at 0x8f TSTAT;

#endif
