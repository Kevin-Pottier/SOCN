#include <reg.h>
#include <compiler.h>

void main(void) {

unsigned char i;

 ACC=0x00;

 for(i=0; i<0xFF; i++) {
  ACC++;  
 }

 while(1);

}

