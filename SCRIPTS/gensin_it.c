#include <reg.h>
#include <compiler.h>

#define TCTRL_AUTOIDLE_POS 3
#define TCTRL_CLRSTAT_POS  2
#define TCTRL_STOP_POS     1
#define TCTRL_START_POS    0

#define TIMER_PERIOD 200-1-1 // For 10kHz clock
#define ARRAY_SIZE (sizeof(SINV)/sizeof(SINV[0]))
    __code unsigned char SINV[] = {
        254,
        30,
        61,
        93,
        124,
        155,
        185,
        215,
        243,
        15,
        41,
        67,
        91,
        113,
        134,
        154,
        172,
        188,
        203,
        216,
        227,
        235,
        242,
        247,
        250,
        252,
        250,
        247,
        242,
        235,
        227,
        216,
        203,
        188,
        172,
        154,
        134,
        113,
        91,
        67,
        41,
        15,
        243,
        215,
        185,
        155,
        124,
        93,
        61,
        30,
        254,
        221,
        190,
        158,
        127,
        96,
        66,
        36,
        8,
        236,
        210,
        184,
        160,
        138,
        117,
        97,
        79,
        63,
        48,
        35,
        24,
        16,
        9,
        4,
        1,
        0,
        1,
        4,
        9,
        16,
        24,
        35,
        48,
        63,
        79,
        97,
        117,
        138,
        160,
        184,
        210,
        236,
        8,
        36,
        66,
        96,
        127,
        158,
        190,
        221,
    };

// Interrupt service routine for Timer 0
void testitf0 (void) __interrupt 0 __using 1
{
  static unsigned char i = 0;
  DOUT0 = SINV[i++]; // Output the next value from the SINV array
  if(i >= ARRAY_SIZE) i = 0; // Reset index if it exceeds array size
  TCTRL = 1 << TCTRL_CLRSTAT_POS; // Clear the interrupt flag
}

void main(void) {

IE0=0x01;
ITCTLCON=0x01;

CNT_H = (unsigned char) TIMER_PERIOD >> 8; // Set the timer period
CNT_L = (unsigned char) TIMER_PERIOD & 0xFF;

TCTRL = 1 << TCTRL_START_POS; // Enable the timer  
 while(1) {
 }

}

