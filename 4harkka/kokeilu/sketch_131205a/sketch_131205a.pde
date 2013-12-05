import processing.opengl.*;
import saito.objloader.*;

OBJModel model;
float rotX;
float rotY;
float changeSize = 30;

void setup()
{
size(800, 600, P3D);
frameRate(30);
model = new OBJModel(this);
//model.debugMode();
model.load("talo.obj");
}
void draw()
{
background(255);
lights();
pushMatrix();
translate(mouseX, mouseY);
rotateX(rotY);
rotateY(rotX);
//scale(changeSize);
model.draw();
popMatrix();

}


void mouseDragged()
{
rotX += (mouseX - pmouseX) * 0.01;
rotY -= (mouseY - pmouseY) * 0.01;
}
