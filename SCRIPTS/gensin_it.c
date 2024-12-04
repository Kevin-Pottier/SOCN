#include <reg.h>
#include <compiler.h>

#define TCTRL_AUTOIDLE_POS 3
#define TCTRL_CLRSTAT_POS  2
#define TCTRL_STOP_POS     1
#define TCTRL_START_POS    0

__code unsigned char SINV[] = {  };

void testitf0 (void) __interrupt 0 __using 1
{
  static unsigned char i = 0;
 

}

void main(void) {

IE0=0x01;
ITCTLCON=0x01;

 while(1) {
 }

}

