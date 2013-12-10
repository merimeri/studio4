import processing.opengl.*;
import saito.objloader.*;
import peasy.*;

OBJModel model;
PeasyCam cam;
float rotX;
float rotY;
float changeSize = 30;

void setup()
{
size(800, 600, P3D);
frameRate(30);
model = new OBJModel(this);
model.enableTexture();
model.setDrawMode(POLYGON);
//model.debugMode();
model.load("ready_world2.obj");
cam = new PeasyCam(this, 500);
cam.pan(200, -400);

}
void draw()
{
background(255);
lights();
pushMatrix();
scale(changeSize);
model.enableTexture();
model.draw();
popMatrix();

}


void mouseDragged()
{
rotX += (mouseX - pmouseX) * 0.01;
rotY -= (mouseY - pmouseY) * 0.01;
}
