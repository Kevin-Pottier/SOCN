#include <reg.h>
#include <compiler.h>

#define TCTRL_START_POS 0

void main(void) {

// unsigned char i;

//  ACC=0x00;

//  for(i=0; i<0xFF; i++) {
//   ACC++;  
//  }

CNT_H = 0x12;
CNT_L = 0x34;
TCTRL = 1 << TCTRL_START_POS;

 while(!TSTAT); //Only 1 bit can set to 1 in this reg so no need to mask, otherwise TSTAT & 0x01

 while(1);

}

