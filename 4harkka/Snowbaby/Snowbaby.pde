import peasy.*;


// Stars parameters
int           depth = 8;
int           numberSnowMax = 10000;
Snow[]       tableSnow = new Snow[numberSnowMax];
int[]       tableSnowSize = new int[numberSnowMax];
int           maxSnowSpeed = 5;
 
// Drawing parameters
int           sizeX = 640;
int           sizeY = 640;

int           diameter;
int           transparency = 255;
PeasyCam cam;
 


void setup() {
  
  size(sizeX,sizeY,P3D);
  colorMode(RGB,255);
  loop();
  
  
  for(int i=0; i<numberSnowMax; i++) {
     diameter = int(random(1,5));
    tableSnowSize[i] = diameter;
    tableSnow[i] = new Snow(random(-2*sizeX,2*sizeX),random(-2*sizeY,2*sizeY),
                               -random(depth*255),random(1,maxSnowSpeed));
  }
 cam = new PeasyCam(this, 200);
 cam.pan(0, 50); 
}

void draw() {
 
  background(0);
  
  for(int i=0; i<numberSnowMax; i++) { 
    strokeWeight(tableSnowSize[i]);
    tableSnow[i].create();
    tableSnow[i].fall();
  } 
}


class Snow {
  float x, y, z;
  float dY;
   
  Snow(float coordX, float coordY, float coordZ, float speedY) {
    x  = coordX; 
    y  = coordY; 
    z  = coordZ; 
    dY = speedY;
  }
   
  void create() {
    
    stroke(250+z/depth,transparency);
    point(x,y,z);
  }
   
  void fall() {
    y = y + dY;
    if(y>=0)
      y = -2000.0;
  }
}
