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

double ssd_fract(double argument)                                                   // возвращает дробную часть числа (с округлением)
{
	return ( argument - (double)int_part(argument) );
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
