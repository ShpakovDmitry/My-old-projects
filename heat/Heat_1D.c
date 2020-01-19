#include <stdio.h>
#include <stdlib.h>

#include "GL/freeglut.h"
#include "GL/gl.h"


#define        lenght 1		//                 длина стержня в метрах
#define         kappa 400	//      теплопроводность стержня в Вт/(м*К)
#define       density 1000	//             плотность стержня в кг/м^3
#define heat_capacity 4200	// удельная топлоёмкость стержня в Дж/(кг*К) 

//#define T0 573 // температура в начале стержня
float T0 = 273.0;
//#define Tl 200 // Температура в  конце стержня
float Tl = 0.0;

#define dt 5e-3	// шаг времени в секундах
#define  N 1000	// количество разбиений стержня
#define scale 1 // значение масштаба

float Time = 0.0;

int WindowWidth  = 500;
int WindowHeight = 500;


struct node	// структура узла стержня
{
	double x;	//  координата узла
	double T;	// температура узла
	float color[3];	// цвет(RGB) температуры, для отображения с помощью OpenGL
} *nodes;


void init_values(struct node **nodes);
void calculate_new_pos(struct node **nodes );
void set_colors(struct node **nodes);

void renderfunction()
{
	glClearColor(0.0, 0.0, 0.0, 0.0);
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3f(1.0, 1.0, 1.0);
	glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0);
	
	int i;
	
	for(i=0;i<5000;i++)
	{
		calculate_new_pos(&nodes);
		Time+=dt;
	}
	//printf("%f\n", Time);
	set_colors(&nodes);
	Tl+=0.01;
	if(Tl>=10) Tl = 0.0;
	
	for(i=0; i<N; i++)
	{
		glBegin(GL_QUADS);
		 glColor3f( (nodes)[i].color[0], (nodes)[i].color[1], (nodes)[i].color[2] );
		  glVertex2f(i*(float)lenght/(float)N*scale-0.5,-0.5);
		  glVertex2f(i*(float)lenght/(float)N*scale-0.5, 0.5);
		 glColor3f( (nodes)[i+1].color[0], (nodes)[i+1].color[1], (nodes)[i+1].color[2] );
		  glVertex2f((i+1)*(float)lenght/(float)N*scale-0.5, 0.5);
		  glVertex2f((i+1)*(float)lenght/(float)N*scale-0.5,-0.5);
		glEnd();
		
	}
	
	
	glFlush();
}


int main(int argc, char **argv)
{
	// выделим память под N+1 элементов структуры node
	nodes = (struct node *)malloc(sizeof(struct node)*(N+1));
	
	if(nodes==NULL)
	{
		printf("Неудалось выделить память!\n");
		return -1;
	}
	
	init_values(&nodes);
	
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGB);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(0,0);
	glutCreateWindow("Heat1D");
	
	
	//glutFullScreen();
	//glutDisplayFunc(renderfunction);
	glutIdleFunc(renderfunction);

	
	int i;
	/*for(i=0; i<N+1;i++)
	 printf("%lf\n", nodes[i].T);*/
	/*for(i=0; i<10; i++) 
		calculate_new_pos(&nodes);
	for(i=0; i<N+1;i++)
	 printf("%lf %lf %lf\n", nodes[i].x, nodes[i].T, nodes[i].color[0]);*/
	 
	
	glutMainLoop();
	
	return 0;
}







//--------------------------------------------------------------//

void set_colors(struct node **nodes)
{
	int i;
	float dT = ((float)T0 - 0.0)/1536.0;
	
	
	for(i=0; i<N+1; i++)
	{
		/*if( (((*nodes)[i].T - 100.0)/dT) < (256*1) )
		{
			(*nodes)[i].color[0] = (T0-(*nodes)[i].T)/dT/255;
		}	
		
		if( ((((*nodes)[i].T - 100.0)/dT) < (256*2)) && ((((*nodes)[i].T - 100.0)/dT) > (256*1)) )
		{
			(*nodes)[i].color[0] = 1.0;
			(*nodes)[i].color[1] = 
		}*/
		
		(*nodes)[i].color[0] = ( (*nodes)[i].T - 0.0 )/ dt / 1536.0;

	}
}

void init_values(struct node **nodes)
{
	int i;
	
	// начальные условия
	(*nodes)[0].x = 0;	(*nodes)[N].x = lenght;
	(*nodes)[0].T = T0;	(*nodes)[N].T = Tl;
	
	// задание координат узлов стержня
	for(i=1; i<N; i++)
	{
		(*nodes)[i].x = (double)i*lenght/N;
	}
	// задание температур в стержне
	for(i=1; i<N; i++)
	{
		(*nodes)[i].T = 0.0;
	}

	//(*nodes)[(int)(N/2)].T = T0;
	
}

void calculate_new_pos(struct node **nodes)
{
	double Temp_buff[2];
	int i;
	double hi = (double)kappa/density/heat_capacity;
	double dx = (double)lenght/(double)N;
	double A = hi*dt/dx/dx;
	
	Temp_buff[1] = A*( (*nodes)[0].T + (*nodes)[2].T ) + ( 1 - 2*A ) * (*nodes)[1].T;
	for(i=2; i<N; i++)
	{
		Temp_buff[2] = A*( (*nodes)[i-1].T + (*nodes)[i+1].T ) + ( 1 - 2*A ) * (*nodes)[i].T;
		(*nodes)[i-1].T = Temp_buff[1];
		Temp_buff[1] = Temp_buff[2];
		
	}
	(*nodes)[N-1].T = Temp_buff[1];
	
}
