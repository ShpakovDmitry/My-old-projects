#include <stdlib.h>

long double f(long double x,long double y);

int runge_kutta(long double x0, long double y0,long double x_end, long double step, long double *x, long double *y)
{
	x = (long double *)malloc( (long int)((x_end-x0)/step)*sizeof(long double));
	y = (long double *)malloc( (long int)((x_end-x0)/step)*sizeof(long double));
	if( (x == NULL) || (y == NULL) )
	{
		return -1;
	}
	
	*x = x0;
	*y = y0;
	
	long double w1,w2,w3,w4;
	
	while(x0<x_end)
	{
		w1 = f(x0,y0);
		w2 = f(x0 + step/2, y0 + w1/2);
		w3 = f(x0 + step/2, y0 + w2/2);
		w4 = f(x0 + step, y0 + w3);
		
		y0 += (w1 + 2*w2 + 2*w3 + w4) * step / 6.0;
		x0 += step;
		
		*x = x0;
		*y = y0;
	}
	
	return 0;
	
	
};

