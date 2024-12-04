
#include <reg.h>
#include <compiler.h>

//void testitf0 (void) __interrupt 0 __using 1
void testitf0 (void) __interrupt (0) __using (1)
{
 DOUT0 = 0xAA;
 //while(1);
}
//void testitf1 (void) __interrupt 1 __using 1
void testitf1 (void) __interrupt (1) __using (1)
{
 DOUT0 = 0x01;
 //while(1);
}
//void testitf2 (void) __interrupt 2 __using 1
void testitf2 (void) __interrupt (2) __using (1)
{
 DOUT0 = 0x02;
 //while(1); 
}
//void testitf3 (void) __interrupt 3 __using 1
void testitf3 (void) __interrupt (3) __using (1)
{
 DOUT0 = 0x03;
 //while(1);
}
//void testitf4 (void) __interrupt 4 __using 1
void testitf4 (void) __interrupt (4) __using (1)
{
 DOUT0 = 0x04;
 //while(1); 
}
//void testitf5 (void) __interrupt 5 __using 1
void testitf5 (void) __interrupt (5) __using (1)
{
 DOUT0 = 0x05;
 //while(1); 
}
//void testitf6 (void) __interrupt 6 __using 1
void testitf6 (void) __interrupt (6) __using (1)
{
 DOUT0 = 0x06;
 //while(1); 
}
//void testitf7 (void) __interrupt 7 __using 1
void testitf7 (void) __interrupt (7) __using (1)
{
 DOUT0 = 0x07;
 //while(1);
}
//void testitf8 (void) __interrupt 8 __using 1
void testitf8 (void) __interrupt (8) __using (1)
{
 DOUT0 = 0x08;
 //while(1);
}
//void testitf9 (void) __interrupt 9 __using 1
void testitf9 (void) __interrupt (9) __using (1)
{
 DOUT0 = 0x09;
 //while(1); 
}
//void testitf10 (void) __interrupt 10 __using 1
void testitf10 (void) __interrupt(10) __using(1)
{
 DOUT0 = 0x0A;
 //while(1); 
}
//void testitf11 (void) __interrupt 11 __using 1
void testitf11 (void) __interrupt(11) __using (1)
{
 DOUT0 = 0x0B;
 //while(1); 
}
//void testitf12 (void) __interrupt 12 __using 1
void testitf12 (void) __interrupt(12) __using (1)
{
 DOUT0 = 0x0C;
 //while(1); 
}
//void testitf13 (void) __interrupt 13 __using 1
void testitf13 (void) __interrupt(13) __using (1)
{
 DOUT0 = 0x0D;
 //while(1); 
}
//void testitf14 (void) __interrupt 14 __using 1
void testitf14 (void) __interrupt(14) __using (1)
{
 DOUT0 = 0x0E;
 //while(1); 
}
//void testitf15 (void) __interrupt 15 __using 1
void testitf15 (void) __interrupt(15) __using (1)
{
 DOUT0 = 0x0F;
 //while(1); 
}


void main(void) {

unsigned char i;

IE0=0xFF;
IE1=0xFF;
ITCTLCON=0x01;

 while(1);
 
 //for(i=0; i<5; i++) {
 // ACC++;  
 //}
 //IPL0=0x01;
//
 //for(i=0; i<10; i++) {
 // ACC++;  
 //}
 //IPH0=0x02;
 //IPL0=0x03;
 //
 //ACC=0x00;
 //while(1) {
 // ACC++;  
 //}

}

