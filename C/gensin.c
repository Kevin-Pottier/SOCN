#include <math.h>
#include <stdio.h>

// Time unit: second
#define SIN_PERIOD 0.001
#define STROBE_PERIOD 0.00001

// M_PI is defined in math.h

int main(void) {
	double nbpoints = SIN_PERIOD/STROBE_PERIOD;
	int i;
	
	printf("nbpoints = %f\n", nbpoints);
	printf("\n{\n");
	
	for(i=0;i<nbpoints; i++){
		printf(" %d, ", (unsigned char) ((sin( (double) i*2.0*M_PI / nbpoints ) + 1) *255.0*2.0));
	}
	printf("\n}\n");

 return(0); 
}
