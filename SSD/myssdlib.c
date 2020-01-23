#ifndef _STDIO_H_
 #include <stdio.h>
 #define _STDIO_H_
#endif

#include "myssdlib.h"


int int_part(double a)                                                              // возвращает целую часть числа без округления
{
	return a;
}


int ssd_int(double argument)                                                        //возвращает наибольшее целое число, меньшее или равное "argument"
{
	if ( (argument < 0) && (argument == (double) int_part(argument)) )
	     return int_part(argument);
	else if (argument < 0)
	     return ( int_part(argument) - 1 );
	else return int_part(argument);
}


double ssd_abs(double x)
{
	if (x<0)
	{
		return -(x);
	}
	else return x;
}


double ssd_fract(double argument)                                                   // возвращает дробную часть числа (с округлением)
{
	return ( argument - (double)int_part(argument) );
}


double sqr(double a)                                                                //квадрат числа
{
	return a*a;
}


double cube(double a)                                                               // куб числа
{
	return a*a*a;
}


double ssd_sqrt(double x)                                                           // квадратный корень
{
	double x1,x0=x;

	x1=(x0+x/x0)/2;

	while( ssd_abs(x1-x0)>(1e-37) )
	{
		x0=x1;
		x1=(x0+x/x0)/2;
	}

	return x1;

}


double int_power(double x,int k)//x в n-той целой степени n>=0
{
	double temp=1;
	int i;

	for(i=0;i<k;i++)
	{
		temp=temp*x;
	}
	return temp;
}


double n_root(int k,double x)//корень k-той целой степени k>0 из x
{
	double x1,x0=x;

	x1=1/k*( x0 + x/int_power( x0,k-1 ) );

	while( ssd_abs(x1-x0)>(1e-37) )
	{
		x0=x1;
		x1=1/k*( (k-1)*x0 + x/int_power( x0,k-1 ) );
	}

	return x1;
}


double distance(struct mech_param one,struct mech_param two)                        // расстояние между двумя точками
{
	return ssd_sqrt( sqr(one.x - two.x ) + sqr( one.y - two.y ) + sqr( one.z - two.z ) );
}


void gregorian_to_julian(int year,int month,int day,double ut,double *jd,int *flag) //преобразование Грегорианской даты в Юлианскую дату
{
	int y,m,b;


	if (month <= 2)
	{
		y = year - 1;
		m = month + 12;
	}
	else
	{
		y = year;
		m = month;
	}


	if (year==1582)
	{
		if (month==10)
		{
			if (day<=4)
			{
				b= -2;
				*flag=0;
			}
			else
			{
				if (day>=15)
				{
					b=ssd_int(y/400)-ssd_int(y/100);
					*flag=0;
				}
				else *flag=-1;
			}
		}
		else
		{
			if (month>10)
			{
				b=ssd_int(y/400)-ssd_int(y/100);
				*flag=0;
			}
			else
			{
				b= -2;
				*flag=0;
			}
		}
	}
	else
	{
		if (year>1582)
		{
			b=ssd_int(y/400)-ssd_int(y/100);
			*flag=0;
		}
		else
		{
			b= -2;
			*flag=0;
		}
	}


	if (*flag==0)
	{
		*jd=ssd_int( 365.25*y )+ ssd_int( 30.6001*(m+1) ) + b + 1720996.5 + day + ut/24;
	}

} //gregorian_to_julian 


void julian_to_gregorian(double jd,int *year, int *month, int *day, double *ut)     //преобразование Юлианской даты в Грегорианскую
{
	int a,b,c,d,e,f;

	a=ssd_int( jd + 0.5 );

	if (a < 2299161)
	{
		c=1524;
	}
	else
	{
		b=ssd_int( (a - 1867216.25)/36524.25 );
		c=a + b - ssd_int( b/4 ) + 1525;
	}

	d=ssd_int( (c - 122.1)/365.25 );
	e=ssd_int(      365.25*d      );
	f=ssd_int(   (c - e)/30.6001  );

	*ut   =24*ssd_fract( jd+0.5 );
	*day  =c - e - ssd_int(30.6001*f);
	*month=f - 1 - 12*ssd_int(f/14);
	*year =d - 4715 - ssd_int( ( 7 + (*month) )/10 );
}//julian_to_gregorian


void force_gravity(struct mech_param (*body)[],int num)                   //вычисляет значения ускорений для всех объектов num-количество объектов
{
	int i,j;

	for(i=0;i<num;i++)
	{
		(*body)[i].ax=(*body)[i].ay=(*body)[i].az=0;     //обнуление ускорений для нового перерасчёта их в новом положении
		for(j=0;j<num;j++)
		{
			if(i!=j)
			{
				(*body)[i].ax += G*(*body)[j].mass*( (*body)[j].x-(*body)[i].x )/cube( distance((*body)[i],(*body)[j]) );
				(*body)[i].ay += G*(*body)[j].mass*( (*body)[j].y-(*body)[i].y )/cube( distance((*body)[i],(*body)[j]) );
				(*body)[i].az += G*(*body)[j].mass*( (*body)[j].z-(*body)[i].z )/cube( distance((*body)[i],(*body)[j]) );
			}
		}//for j
	}//for i
	
}// force_gravity

/*
void force_nongravity(struct mech_param (*body)[],int num )
{
	int i;

	for(i=0;i<num;i++)
	{
		if( ((*body)[i].is_comet)=1 )
		{
			(*body)[i].ax=(*body)[i].ax+Ar*ssd_power(r,n+1)+?????....????...???
		}
	}


}//force_nongravity
*/

void new_position(struct mech_param (*body)[], int num )
{
	int i;

	for(i=0;i<num;i++)
	{
		(*body)[i].x += (*body)[i].vx*dt;
		(*body)[i].y += (*body)[i].vy*dt;
		(*body)[i].z += (*body)[i].vz*dt;

		(*body)[i].vx += (*body)[i].ax*dt;
		(*body)[i].vy += (*body)[i].ay*dt;
		(*body)[i].vz += (*body)[i].az*dt;
	}
}


double test(struct mech_param one)
{
	return one.y;
}