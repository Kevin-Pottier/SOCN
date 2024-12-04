/*H**************************************************************************
* NAME: compiler.h
*----------------------------------------------------------------------------
* Copyright (c) 2001 Atmel.
*----------------------------------------------------------------------------
* CREATED_BY:     R. LATAWIEC
* CREATION_DATE:  24/04/1997
* AUTHOR:         $Author: sgarnier $
* REVISION:       $Revision: 1.1 $
* DATE:           $Date: 2003/10/01 13:00:51 $
*----------------------------------------------------------------------------
* PURPOSE:
* This file redefines dedicated KEIL and TASKINKG C51/C251 keywords in order
* to ensure that any source file can be processed by both compilers.
*****************************************************************************/

#ifndef _COMPILER_H_
#define _COMPILER_H_

/*_____ I N C L U D E S ____________________________________________________*/


/*_____ M A C R O S ________________________________________________________*/

/***  Type definition ***/

typedef unsigned char      Byte;
typedef unsigned char      Uchar;
typedef unsigned int       Uint16;
typedef int                Int16;
typedef float              Float16;
typedef unsigned long	   Uint32;
typedef long int           Int32;
typedef unsigned char      Bool;


/***  General purpose defines ***/

/*
#define FALSE   0
#define TRUE    1
#define KO      0
#define OK      1
#define OFF     0
#define ON      1
#define CLR     0
#define SET     1
*/

/*_____ D E F I N I T I O N ________________________________________________*/


/*_____ D E C L A R A T I O N ______________________________________________*/


#endif /* _COMPILER_H_ */

