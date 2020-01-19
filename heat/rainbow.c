#include "GL/freeglut.h"
#include "GL/gl.h"

#include <stdlib.h>
#include <stdio.h>

int WindowWidth  = 640;
int WindowHeight = 480;
float Tmax = 273;
float Tmin = 200;


void printtext(double x, double y, char *String);


void renderfunction()
{
	glClearColor(0.0, 0.0, 0.0, 0.0);
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3f(1.0, 1.0, 1.0);
	glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0);
	
	float dy=2.0/(6.0*256.0);
	float dc=1.0/256.0;
	int i;


	
	printtext(0.85,1.0-1.0/3.0,"600 K");
	for(i=0; i<256; i++)
	{
		glBegin(GL_LINES);
		 glColor3f(1.0,(float)i*dc,0.0);
		 glVertex2f(0.8,1.0-(float)i*dy-2.0/6.0);
		 glVertex2f(0.7,1.0-(float)i*dy-2.0/6.0);
		glEnd();
	}
	printtext(0.85,1.0-2.0/3.0,"500 K");
	for(i=0; i<256; i++)
	{
		glBegin(GL_LINES);
		 glColor3f(1.0-(float)i*dc,1.0,0.0);
		 glVertex2f(0.8,1.0-(float)i*dy-4.0/6.0);
		 glVertex2f(0.7,1.0-(float)i*dy-4.0/6.0);
		glEnd();
	}
	printtext(0.85,1.0-3.0/3.0,"400 K");
	for(i=0; i<256; i++)
	{
		glBegin(GL_LINES);
		 glColor3f(0.0,1.0,(float)i*dc);
		 glVertex2f(0.8,1.0-(float)i*dy-6.0/6.0);
		 glVertex2f(0.7,1.0-(float)i*dy-6.0/6.0);
		glEnd();
	}
	printtext(0.85,1.0-4.0/3.0,"300 K");
	for(i=0; i<256; i++)
	{
		glBegin(GL_LINES);
		 glColor3f(0.0,1.0-(float)i*dc,1.0);
		 glVertex2f(0.8,1.0-(float)i*dy-8.0/6.0);
		 glVertex2f(0.7,1.0-(float)i*dy-8.0/6.0);
		glEnd();
	}	
	printtext(0.85,1.0-5.0/3.0,"200 K");
	for(i=0; i<256; i++)
	{
		glBegin(GL_LINES);
		 glColor3f((float)i*dc,0.0,1.0);
		 glVertex2f(0.8,1.0-(float)i*dy-10.0/6.0);
		 glVertex2f(0.7,1.0-(float)i*dy-10.0/6.0);
		glEnd();
	}
	printtext(0.85,1.0-6.0/3.0,"100 K");
	
	
	
	glFlush();
	
}


int main(int argc, char **argv)
{
	glutInit(&argc, argv);
	//glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
	//glutInitDisplayMode(GLUT_SINGLE);
	glutInitDisplayMode(GLUT_RGB);
	glutInitWindowSize(WindowWidth, WindowHeight);
	glutInitWindowPosition(0,0);
	glutCreateWindow("Rainbow");
	
	
	//glutFullScreen();
	
	glutDisplayFunc(renderfunction);
	
	//glutReshapeFunc(myReshape);
	//glutIdleFunc(renderfunction);
	//glutMouseFunc(mouse);
	
	glutMainLoop();
	
	return 0;
}

void printtext(double x, double y, char *String)
{
//(x,y) is from the bottom left of the window
    glColor3f(1.0 ,0.0 ,0.0 );
    /*glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();
    //glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0);
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();*/
    glPushAttrib(GL_DEPTH_TEST);
    glDisable(GL_DEPTH_TEST);
    glRasterPos2f(x,y);
    int i;
    for (i=0; i<5; i++)
    {
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15, String[i]);
    }
    glPopAttrib();
    glMatrixMode(GL_PROJECTION);
    glPopMatrix();
    glMatrixMode(GL_MODELVIEW);
    glPopMatrix();
}
