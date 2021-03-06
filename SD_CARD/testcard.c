#include <avr/io.h> //Cтандартная библиотека ввода/вывода
#include <string.h> //Библиотека для работы с строками

/*
#define DI 0
#define DO 1
#define CLK 2
#define CS 3
#define INS 4
#define WP 5
*/

#define DI 5
#define DO 6
#define CLK 7
#define CS 4
#define INS 3
#define WP 2
  
char buffer [512]={}; //Буфер данных для записи/чтения
     
//Программа инициализации UART
void uart_init(void)
{
	UBRRH = 0x00; UBRRL = 0x02; // 500000 бод; 12 MHz; x2
	
	// 8 бит данных, 1 стоп бит, без контроля чётности
	UCSRC = ( 1 << URSEL ) | ( 1 << UCSZ1 ) | ( 1 << UCSZ0 );// | ( 1 << UPM1 ) | ( 1 << UPM0 );
	
	// разрешить приём и передачу данных
	UCSRB = ( 1 << TXEN ) | ( 1 << RXEN ) ;
	
	// удвоенная скорость
	UCSRA = (1 << U2X); // |(1 << UDRE)
}
     
//Программа передачи байта по UART
void uart_transmit(unsigned char data)
{
	while ( !( UCSRA & (1<<UDRE)) );
	UDR = data;
}

//Программа приема байта по UART
unsigned char uart_receive (void)
{
	while ( !(UCSRA & (1<<RXC)) );
	return UDR;
}

//Программа передачи строки по UART
void uart_transmit_message(char* msg)
{
	unsigned char i;
	i=0; //Начальное значение переменной

	//Цикл до перебора всех элементов строки
	while ((i<256)&(msg[i]!=0x00) )
	{
		//Отправка поэлементно символов строки
		uart_transmit(msg[i]);
		i++; //Увеличиваем номер элемента строки
	}
}

//Программа передачи байта карте SD|MMC
void spi_transmit (unsigned char data)
{
	unsigned char i;
	for (i=0;i<8;i++) //Цикл перебора битов отправляемого байта
	{
		if ((data&0x80)==0x00) //Если все данные переданы
			PORTB&=~_BV(DI); //Выставить бит данных
		else
			PORTB|=_BV(DI);
		data=data<<1;
		PORTB|=_BV(CLK); //Импульс
		asm("nop"); //Пауза в 1 такт
		
		
		/*asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		*/
		
		PORTB&=~_BV(CLK);
	}
}

//Программа приема байт от карты SD|MMC
unsigned char spi_receive (void)
{
	//Декларация переменных
	unsigned char i, res=0;
	for(i=0;i<8;i++)
	{
		PORTB|=_BV(CLK); //Фронт импульса
		res=res<<1;
		if ((PINB&_BV(DO))!=0x00)
			res=res|0x01; //Считать бит данных
		PORTB&=~_BV(CLK); //Спад испульса
		asm("nop");
		
		/*asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		asm("nop"); //Пауза в 1 такт
		*/
		
	}
	
	return res;
}

unsigned char sd_cmd(char b0, char b1, char b2, char b3, char b4, char b5)	//Отправка команды карте SD|MMC
{
	unsigned char res;
	long int count;
	spi_transmit (b0); //Передать индекс команды
	
	spi_transmit (b1); //Передать аргумент
	spi_transmit (b2);
	spi_transmit (b3);
	spi_transmit (b4);

	spi_transmit (b5); //Передать CRC
	count=0;
	do
	{ 
		//Подождпть R1 ответа
		res=spi_receive();
		count=count+1;
	} while ( ((res&0x80)!=0x00)&&(count<0xffff) );
	
	if(count >= 0xffff)
		uart_transmit_message("0xffff\n");
	
	
	return res;
    }

unsigned char sd_card_init(void)
{
	unsigned char i,temp;
	long int count;

	if ((PINB&_BV(INS))!=0x00)	//Проверка карты в слоту 
		return 1; 

	for (i=0;i<10;i++) //80 импульсов
		spi_transmit (0xff);
	
	PORTB&=~_BV(CS); //CS опустить

	temp=sd_cmd (0x40,0x00,0x00,0x00,0x00,0x95); //CMD0
	if (temp!=0x01) 
		return 3; //Выйти, если ответ не 0х01
		
	spi_transmit (0xff);

	count=0;
	do
	{
		temp=sd_cmd (0x41,0x00,0x00,0x00,0x00,0x95); //CMD1
		spi_transmit (0xff);
		count=count+1;
	} while ( (temp!=0x00)&&(count<0xffff) ); //Ждем 0x01 ответа R1

	if (count>=0xffff) 
		return 4;
	
	return 0;
}

unsigned char read_block (char* buff, unsigned char a1, unsigned char a2, unsigned char a3, unsigned char a4)
{
	unsigned char temp;
	long int count;
	
	if ((PINB&_BV(INS))!=0x00)
		return 1; //Проверка карты в слоту

	spi_transmit (0xff);
	spi_transmit (0xff);
	spi_transmit (0xff);
	spi_transmit (0xff);
	
	temp=sd_cmd (0x51,a1,a2,a3,a4,0x95); //CMD17
	
	
	if (temp!=0x00)
	{
		uart_transmit_message("Read.I'm here1\r\n");
		return 5; //Выйти, если ответ не 0x00
	}
	
	spi_transmit (0xff);
	spi_transmit (0xff);
	
	
	
	count=0;
	do 		//Ждем начала пакета данных
	{
		temp=spi_receive();
		count=count+1;
	} while ( (temp!=0xfe)&&(count<0xffff) );

	if (count>=0xffff)
	{
		uart_transmit(temp);
		uart_transmit_message("Read.I'm here2\r\n");
		return 5;
	}

	for (count=0;count<512;count=count+1) //Сохраняем данные
		buff[count]=spi_receive();

	spi_receive(); //Сохраняем CRC
	spi_receive();
	
	return 0;
}

unsigned char write_block (char* buff, unsigned char a1, unsigned char a2, unsigned char a3, unsigned char a4)
{
	unsigned char temp;
	long int count;

	if ((PINB&_BV(INS))!=0x00)
		return 1; //Проверка карты в слоту
	if ((PINB&_BV(WP))!=0x00)
		return 2; //Проверка write protect

	temp=sd_cmd(0x58,a1,a2,a3,a4,0x95); //CMD24
	if (temp!=0x00)
	{
		uart_transmit_message("Write.I'm here1\r\n");
		return 6; //Выйти, если ответ не 0x00
	}
	
	spi_transmit (0xff);
	spi_transmit (0xfe); //Начало пакета данных
	
	for (count=0;count<512;count=count+1) //Отослать данные
		spi_transmit(buff[count]);

	spi_transmit (0xff); //Отослать CRC
	spi_transmit (0xff);
	temp=spi_receive();
	
	if ((temp&0x05)!=0x05)
	{
		uart_transmit_message("Write.I'm here2\r\n");
		return 6; //Выйти, если данные не приняты
	}

	count=0;
	do 			//Ждем окончания busy состояния
	{
		temp=spi_receive();
		count=count+1;
	}while ( (temp!=0xff)&&(count<0xffff) );
	
	if (count>=0xffff)
	{
		uart_transmit_message("Write.I'm here3\r\n");
		return 6;
	}
	
	return 0;
}

int main(void)
{
	unsigned char temp;
	int i;
	
	PORTB=_BV(CS)|_BV(DO)|_BV(DI)|_BV(WP)|_BV(INS); //Инициализация портов
	DDRB=_BV(CS)|_BV(DI)|_BV(CLK);


	uart_init(); //Инициализация UART

	temp=sd_card_init(); //Инициализация карты
	
	if (temp==0x00)
	{
		uart_transmit_message("sd_card_init: initialization succes\r\n");
		//for (i=0;i<512;i=i+1)
		//	buffer[i]=0x30+(i%10); //Заполнить буфер 12345...
		/*temp=write_block(buffer,0x00,0x00,0x02,0x00);//Записать буфер
		if(temp==0x00)
			uart_transmit_message("write_block: block writte succes\r\n");
		else if (temp==1)
			uart_transmit_message("write_block: fail, no card in the slot\r\n");
		else if (temp==2)
			uart_transmit_message("write_block: fail, card write protected\r\n");
		else
			uart_transmit_message("read_block: CMD24 fail\r\n");
		*/
		temp=read_block(buffer,0x00,0x00,0x00,0x00); //Считать буфер
		if(temp==0x00)
		{
			uart_transmit_message("read_block: data block read succes:\r\n");
			for (i=0;i<512;i=i+1) //Выслать буфер по UART
				uart_transmit(buffer[i]);
		}
		else if (temp==0x01)
			uart_transmit_message("read_block: fail, no card in the slot\r\n");
		else
			uart_transmit_message("read_block: CMD17 fail\r\n");
	}
	else if (temp==0x01)
		uart_transmit_message("sd_card_init: fail, no card in the slot\r\n");
	else if (temp==0x03)
		uart_transmit_message("sd_card_init: CMD0 fail\r\n");
	else
		uart_transmit_message("sd_card_init: CMD1 fail\r\n");
     
	while (1);

	return 1;
}
