class Snowing{
  
  int numberSnowMax = 15000;
  Snow[] tableSnow = new Snow[numberSnowMax];
  int[] tableSnowSize = new int[numberSnowMax];
  int maxSnowSpeed = 5;

  int sizeX = 1000;
  int sizeY = 1000;
  int diameter;
  
  Snowing(){
    loop();
    for(int i=0; i<numberSnowMax; i++) {
       diameter = int(random(1,4));
      tableSnowSize[i] = diameter;
      tableSnow[i] = new Snow(random(-2*sizeX,2*sizeX),random(-2*sizeY,2*sizeY),
                                 random(-depth*255,depth*255),random(1,maxSnowSpeed));
    }
  }
  
  void draw() {
    for(int i=0; i<numberSnowMax; i++) { 
      strokeWeight(tableSnowSize[i]);
      tableSnow[i].create();
      tableSnow[i].fall();
    } 
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
      stroke(255+z/depth,transparency);
      point(x,y,z);
    }
     
    void fall() {
      y = y + dY;
      if(y>=500)
        y = -2000.0;
    }
 }
