// максимальная длина передаваемой строки; UART
#define MAXLEN 1024

// выводы для SPI
#define SPI_DDR  DDRB
#define SPI_PORT PORTB
#define SPI_SS   PB4
#define SPI_MOSI PB5
#define SPI_MISO PB6
#define SPI_SCK  PB7


// функции для UART
void uart_init(void);			// инициализация UART
void uart_putc(unsigned char c);	// отправить байт по UART
unsigned char uart_getc(void);		// получить байт по UART
void uart_puts(unsigned char *s);	// отправить стороку по UART
void debug(unsigned char c);		// режим отладки по UART(байт в шеснадцатеричном представлении)

// функции для SPI
void spi_init(void);			// инициализация SPI
void spi_speedup(void);			// повысить тактовую частоту SPI
void spi_slowdown(void);		// понизить тактовую частоту SPI
unsigned char spi_transaction(unsigned char c);	// передать и принять байт данных; без управления SS




void uart_init(void)
{	
	// 8 бит данных, 1 стоп бит, без контроля чётности
	UCSRC = (1 << URSEL) | (1 << UCSZ1) | (1 << UCSZ0);
	
	// разрешить передачу и приём данных
	UCSRB = (1 << TXEN) | (1 << RXEN);
	
	// удвоенная скорость
	UCSRA = (1 << U2X);
	
	// настройка скорости обмена
	// F_CPU = 12 MHz
	//UBRRH = 0x00;	UBRRL = 0x02;	//500000 бод; F_CPU=12 MHz
	//UBRRH = 0x02;	UBRRL = 0x70;	//2400 бод; F_CPU=12 MHz
	//UBRRH = 0x00;	UBRRL = 0x00;	//1500000 бод; F_CPU=12 MHz
	// F_CPU = 16 MHz
	UBRRH = 0x00;	UBRRL = 0x00;	//2 000 000 бод; F_CPU=16 MHz
	//UBRRH = 0;	UBRRL = 25;	//38.4 kбод; F_CPU=16 MHz
	
	//TODO	........дополнить режимы........
	//------------------------------------------------F_CPU = 12 MHz----------------------------------------------
	//			U2X = 0				|			U2X = 1
	//baud rate	UBRRH		UBRRL	 error%		|	UBRRH		UBRRL	error%
	//     50	0x3a		0x97	  0.0	    v	|	0x75		0x2f	  0.0		v
	//     75	0x27		0x0f	  0.0	    v	|	0x4e		0x1f	  0.0		v
	//    110	0x1a		0xa1	 -0.0027	|	0x35		0x43	 -0.0027
	//    134	0x15		0xdc	 -0.00027	|	0x2b		0xb9	 -0.00027
	//    150	0x13		0x87	  0.0	    v	|	0x27		0x0f	  0.0		v
	//    200	0x0e		0xa5	  0.0	    v	|	0x1d		0x4b	  0.0		v
	//    300	0x09		0xc3	  0.0	    v	|	0x13		0x87	  0.0		v
	//    600	0x04		0xe1	  0.0	    v	|	0x09		0xc3	  0.0		v
	//   1200	0x02		0x70	  0.0	    v	|	0x04		0xe1	  0.0		v
	//   1800	0x01		0xa0	  0.08		|	0x03		0x40	 -0.04
	//   2400	0x01		0x38	  0.16		|	0x02		0x70	  0.0		v
	//   4800	0x00		0x9b	 -0.16		|	0x01		0x38	  0.16
	//   9600	0x00		0x4d	 -0.16		|	0x00		0x9b	 -0.16
	//  19200	0x00		0x26	 -0.16		|	0x00		0x4d	 -0.16
	//  38400	0x00		0x13	  2.4		|	0x00		0x27	  2.4
	//  57600	0x00		0x0c	 -0.16		|	0x00		0x19	 -0.16
	// 230400	0x00		0x02	 -7.84		|	0x00		0x06	  7.52
	// 460800	0x00		0x01	 22.88		|	0x00		0x02	 -7.84
	// 500000	0x00		0x01	 33.33		|	0x00		0x02	  0.0		v
	// 576000	0x00		0x00	-23.2		|	0x00		0x02	 15.2
	// 921600	0x00		0x00	 22.88		|	0x00		0x01	 22.88
	//1000000	----		----	--------	|	0x00		0x01	 33.33
	//1152000	----		----	--------	|	0x00		0x00	-23.2
	//1500000	----		----	--------	|	0x00		0x00	  0.0		v
	//2000000	----		----	--------	|	----		----
	
	///TODO	........изменить значения режимов........
	//------------------------------------------------F_CPU = 16 MHz----------------------------------------------
	//			U2X = 0				|			U2X = 1
	//baud rate	UBRRH		UBRRL	 error%		|	UBRRH		UBRRL	error%
	//     50	0x3a		0x97	  0.0	    v	|	0x75		0x2f	  0.0		v
	//     75	0x27		0x0f	  0.0	    v	|	0x4e		0x1f	  0.0		v
	//    110	0x1a		0xa1	 -0.0027	|	0x35		0x43	 -0.0027
	//    134	0x15		0xdc	 -0.00027	|	0x2b		0xb9	 -0.00027
	//    150	0x13		0x87	  0.0	    v	|	0x27		0x0f	  0.0		v
	//    200	0x0e		0xa5	  0.0	    v	|	0x1d		0x4b	  0.0		v
	//    300	0x09		0xc3	  0.0	    v	|	0x13		0x87	  0.0		v
	//    600	0x04		0xe1	  0.0	    v	|	0x09		0xc3	  0.0		v
	//   1200	0x02		0x70	  0.0	    v	|	0x04		0xe1	  0.0		v
	//   1800	0x01		0xa0	  0.08		|	0x03		0x40	 -0.04
	//   2400	0x01		0x38	  0.16		|	0x02		0x70	  0.0		v
	//   4800	0x00		0x9b	 -0.16		|	0x01		0x38	  0.16
	//   9600	0x00		0x4d	 -0.16		|	0x00		0x9b	 -0.16
	//  19200	0x00		0x26	 -0.16		|	0x00		0x4d	 -0.16
	//  38400	0x00		0x13	  2.4		|	0x00		0x27	  2.4
	//  57600	0x00		0x0c	 -0.16		|	0x00		0x19	 -0.16
	// 230400	0x00		0x02	 -7.84		|	0x00		0x06	  7.52
	// 460800	0x00		0x01	 22.88		|	0x00		0x02	 -7.84
	// 500000	0x00		0x01	 33.33		|	0x00		0x02	  0.0		v
	// 576000	0x00		0x00	-23.2		|	0x00		0x02	 15.2
	// 921600	0x00		0x00	 22.88		|	0x00		0x01	 22.88
	//1000000	----		----	--------	|	0x00		0x01	 33.33
	//1152000	----		----	--------	|	0x00		0x00	-23.2
	//1500000	----		----	--------	|	0x00		0x00	  0.0		v
	//2000000	----		----	--------	|	----		----

}

void uart_putc(unsigned char c)
{
	// ждём окончания передачи предыдущего байта
	while( (UCSRA & (1 << UDRE) ) == 0 )
		;
	// передача данных
	UDR = c;
}

unsigned char uart_getc(void)
{
	// ждём приёма данных
	while( (UCSRA & (1 << RXC) ) == 0 )
		;
	// считываем принятый байт
	return UDR;
}

void uart_puts(unsigned char *s)
{
	unsigned short int i;
	
	for(i = 0; (i < MAXLEN) && ( *s != '\0' ); i++)
	{
		uart_putc(*s);
		*(s++);
	}
}

void debug(unsigned char c)
{
	char hex[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
	uart_putc( hex[ (unsigned short int)c/16 ] ); uart_putc( hex[ (unsigned short int)c%16 ] ); uart_putc(' ');
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void spi_init(void)	// инициализация SPI, без управления SS
{
	// настраиваем выводы MOSI, SCK, SS на выходы
	SPI_DDR |= (1 << SPI_MOSI) | (1 << SPI_SCK) | (1 << SPI_SS);
	
	// разрешаем SPI, МК <- Master, частота 1/32 F_CPU, старший бит первый
	SPSR = (1 << SPI2X);
	SPCR = (0 << SPIE) | (1 << SPE) | (0 << DORD) | (1 << MSTR) | (0 << CPOL) | (0 << CPHA) | (0 << SPR1) | (0 << SPR0); // ?короче SPCR = 0x42;
	// делитель частоты
	//	SPI2X	SPR1	SPR0	SCK_F		F_CPU=12MHz	F_CPU=1MHZ
	//	  0	 0	 0	F_CPU/4		3000.00	kHz	250.000	kHz
	//	  0	 0	 1	F_CPU/16	 750.00	kHz	 62.500	kHz
	//	  0	 1	 0	F_CPU/64	 187.50	kHz	 15.625	kHz
	//	  0	 1	 1	F_CPU/128	  93.75	kHz	  7.8125kHz
	//	  1	 0	 0	F_CPU/2		6000.00	kHz	500.000	kHz
	//	  1	 0	 1	F_CPU/8		1500.00	kHz	125.000	kHz
	//	  1	 1	 0	F_CPU/32	 375.00	kHz	 31.250	kHz
	//	  1	 1	 1	F_CPU/64	 187.50	kHz	 15.625	kHz

}

void spi_speedup(void)
{
	SPSR = (1 << SPI2X);
	SPCR = (0 << SPIE) | (1 << SPE) | (0 << DORD) | (1 << MSTR) | (0 << CPOL) | (0 << CPHA) | (0 << SPR1) | (1 << SPR0);
}

void spi_slowdown(void)
{
	SPSR = (1 << SPI2X);
	SPCR = (0 << SPIE) | (1 << SPE) | (0 << DORD) | (1 << MSTR) | (0 << CPOL) | (0 << CPHA) | (1 << SPR1) | (0 << SPR0);
}

unsigned char spi_transaction(unsigned char c)	// без управления SS
{
	SPDR = c;	// передаваемые данные
	while( !( SPSR & (1 << SPIF) ) )
		;	// ждём окончания передачи
	// debug(SPDR);
	return SPDR;	// возвращаем принятые данные	
}




