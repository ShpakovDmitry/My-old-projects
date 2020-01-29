#include <stdio.h>
#include <stdlib.h>
//#include "runge_kutta.h"

#define h 0.01

long double f(long double x,long double y)
{
	return x;
};

void w1234(long double x,long double y,long double *w);
void iteration(long double *x,long double *y,long double *w);

int main()
{
	long double x = 0.0;
	long double y = 0.0;
	long double x_end = 0.5; 
	long double w[4];
	
	long double *datax;
	long double *datay;
	long int i = 0;
	
	datax = (long double *)malloc( (long int)((x_end - x)/h) * sizeof(long double));
	datay = (long double *)malloc( (long int)((x_end - x)/h) * sizeof(long double));
	
	if( (datax == NULL) || (datay == NULL))
	{
		printf("ERROR\n");
		return -1;
	}
	
	while(x<x_end)
	{
		w1234(x,y,w);
		iteration(&x, &y, w);
		*(datax + i) = x;
		*(datay + i) = y;
		//printf("x = %Lf\ty = %Lf\n", x, y);
		i++;
	}
	
	printf("Done\n\tx = %.20Lf\n\ty = %.20Lf\n", x, y);
	
	for(;i>=0;i--)
		printf("x = %Lf\ty = %Lf\n", *(datax + i), *(datay + i));
	
	//printf("%lf\n", h);
	//printf("%e\n", (double)(y-1.0*1.0*1.0/3));
	
	/*
	long double x;
	long double y;
	int flag;
	
	flag = runge_kutta(0.0, 0.0, 5.0, h, &x, &y);
	if(flag == -1)
	{
		printf("ERROR\n");
		return -1;
	}
	
	
	printf("x = %Lf\ty = %Lf\n", *(&x+2), y);
	//printf("%Lf\n", y);
	*/
	


	return 0;
}

void iteration(long double *x,long double *y,long double *w)
{
	(*y) += ( (*w) + 2*(*(w+1)) + 2*(*(w+2)) + (*(w+3)) )/6;
	(*x) += h;
}

void w1234(long double x,long double y,long double *w)
{
	*w = h*f(x,y);
	*(w+1) = h*f(x + h/2, y + (*w)/2);
	*(w+2) = h*f(x + h/2, y + (*(w+1))/2);
	*(w+3) = h*f(x + h, y + *(w+2));
};




