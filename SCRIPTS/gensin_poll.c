#include <reg.h>
#include <compiler.h>

#define TCTRL_AUTOIDLE_POS 3
#define TCTRL_CLRSTAT_POS 2
#define TCTRL_STOP_POS 1
#define TCTRL_START_POS 0

#define TIMER_PERIOD 200 - 1 - 1 // Because it takes 1 cycle to jump to reload state

void main(void)
{

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

    unsigned char i = 0;

    CNT_H = TIMER_PERIOD << 8;
    CNT_L = (unsigned char)TIMER_PERIOD;
    TCTRL = 1 << TCTRL_START_POS;

    while (1)
    {
        for (i = 0; i < sizeof(SINV) / sizeof(SINV[0]); i++)
        {
            DOUT0 = SINV[i];
            while (!TSTAT)
                ;
            TCTRL = 1 << TCTRL_CLRSTAT_POS;
        }
    }
}
