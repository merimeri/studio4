/*
* This class represents the night sky in the model. It is a sphere with texture. The class is based on
* the processing example "Texture Sphere", which can be found in the processing examples or here 
* http://processing.org/examples/texturesphere.html.
*/ 
class Sphere{
  
  PImage sky;
  int attr = 35;  // Sphere attribute
  float rotationX = 0;
  float rotationY = 0;
  float velocityX = 0;
  float velocityY = 0;
  float globeRadius = 6000;
  float pushBack = 0;
  float[] cx, cz, sphereX, sphereY, sphereZ;
  float sinLUT[];
  float cosLUT[];
  float SINCOS_PRECISION = 0.5;
  int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);
  
  Sphere(){
    sky = loadImage("night-sky.jpg");    
    initializeSphere(attr);
  }

  
  void draw() {               
    renderGlobe(); 
  }
  
  void renderGlobe() {
    pushMatrix();
    translate(width * 0.33, height * 0.5, pushBack);
    pushMatrix();
    noFill();
    stroke(255,200);
    strokeWeight(2);
    smooth();
    popMatrix();
    lights();    
    pushMatrix();
    rotateX( radians(-rotationX) );  
    rotateY( radians(270 - rotationY) );
    fill(200);
    noStroke();
    textureMode(IMAGE);  
    texturedSphere(globeRadius, sky);
    popMatrix();  
    popMatrix();
    rotationX += velocityX;
    rotationY += velocityY;
    velocityX *= 0.95;
    velocityY *= 0.95;
    
  }
  
  //intializing the data needed to render the sphere
  void initializeSphere(int res)
  {
    sinLUT = new float[SINCOS_LENGTH];
    cosLUT = new float[SINCOS_LENGTH];
  
    for (int i = 0; i < SINCOS_LENGTH; i++) {
      sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SINCOS_PRECISION);
      cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SINCOS_PRECISION);
    }
  
    float delta = (float)SINCOS_LENGTH/res;
    float[] cx = new float[res];
    float[] cz = new float[res];
    
    for (int i = 0; i < res; i++) {
      cx[i] = -cosLUT[(int) (i*delta) % SINCOS_LENGTH];
      cz[i] = sinLUT[(int) (i*delta) % SINCOS_LENGTH];
    }

    int vertCount = res * (res-1) + 2;
    int currVert = 0;
    
    sphereX = new float[vertCount];
    sphereY = new float[vertCount];
    sphereZ = new float[vertCount];
    float angle_step = (SINCOS_LENGTH*0.5f)/res;
    float angle = angle_step;
    
    for (int i = 1; i < res; i++) {
      float curradius = sinLUT[(int) angle % SINCOS_LENGTH];
      float currY = -cosLUT[(int) angle % SINCOS_LENGTH];
      for (int j = 0; j < res; j++) {
        sphereX[currVert] = cx[j] * curradius;
        sphereY[currVert] = currY;
        sphereZ[currVert++] = cz[j] * curradius;
      }
      angle += angle_step;
    }
    attr = res;
  }
  
  //Method to draw the sphere
  void texturedSphere(float r, PImage t) {
    int v1,v11,v2;
    r = (r + 240 ) * 0.33;
    beginShape(TRIANGLE_STRIP);
    texture(t);
    float iu=(float)(t.width-1)/(attr);
    float iv=(float)(t.height-1)/(attr);
    float u=0,v=iv;
    for (int i = 0; i < attr; i++) {
      vertex(0, -r, 0,u,0);
      vertex(sphereX[i]*r, sphereY[i]*r, sphereZ[i]*r, u, v);
      u+=iu;
    }
    vertex(0, -r, 0,u,0);
    vertex(sphereX[0]*r, sphereY[0]*r, sphereZ[0]*r, u, v);
    endShape();   
    
    int voff = 0;
    for(int i = 2; i < attr; i++) {
      v1=v11=voff;
      voff += attr;
      v2=voff;
      u=0;
      beginShape(TRIANGLE_STRIP);
      texture(t);
      for (int j = 0; j < attr; j++) {
        vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1++]*r, u, v);
        vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2++]*r, u, v+iv);
        u+=iu;
      }
    
      v1=v11;
      v2=voff;
      vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1]*r, u, v);
      vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v+iv);
      endShape();
      v+=iv;
    }
    u=0;
    
    beginShape(TRIANGLE_STRIP);
    texture(t);
    for (int i = 0; i < attr; i++) {
      v2 = voff + i;
      vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v);
      vertex(0, r, 0,u,v+iv);    
      u+=iu;
    }
    vertex(sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r, u, v);
    endShape();
    
  }
}  
