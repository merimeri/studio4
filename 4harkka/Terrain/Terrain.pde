import javax.vecmath.Vector3f;
import processing.core.PApplet;
import peasy.*;
import saito.objloader.*;
import pitaru.sonia_v2_9.*; // automatically created when importing sonia using the processing menu.


//cam-object, that moves the camera
PeasyCam cam;
ParticleSystem ps;
OBJModel model;
int state;
Snowing snowing;
int transparency = 255;
int depth = 10;
Sphere sphere;
Sound sound;


public void setup() {

  size(1280, 720, P3D);
  frameRate(30);  
  state =1;
  
  ps = new ParticleSystem(new PVector(0,0, 0));
  snowing = new Snowing();
  sphere = new Sphere();
 
  model = new OBJModel(this);
  model.enableTexture();
  model.setDrawMode(POLYGON);
  model.load("ready_worldFINAL.obj");
  model.scale(50);
  model.translateToCenter();

  Sonia.start(this); // Start Sonia engine.
  sound = new Sound();
  sound.play();

  cam = new PeasyCam(this, 0, 200, 0, 1000);
  //cam.rotateX(radians(20));
  //cam.setActive(false);
  cam.setMaximumDistance(1000);
  //cam.pan(0, 50);
  //cam.setWheelHandler(null);
}

public void draw() {

  switch(state) {
  case 1: 
    background(0);
    color(255);
    stroke(3);
    textSize(30);
    text("Paina mitä vaan näppäintä ääliö", 10, 10);
    
    if (keyPressed) {
      state = 2 ;
    }
    break;

  case 2:
    background(0, 0, 0, 0);
    lights();
    fill(255, 0, 0);
    noStroke();
    cam.rotateY(.01);
    //cam.rotateZ();
    //directionalLight(51, 102, 126, -1, 0, 0);
    //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
    //ambientLight(50, 50, 50);
    sphere.draw();
    model.draw();
    snowing.draw();
    pushMatrix();
    translate(100,250,0);
    rotateY(frameCount*2);
    
    if(ps.particles.size() < 500){
      ps.addParticle();
    }
    ps.run();
    popMatrix();
    
    break;
    
  default:
    break;
  }
}

public void arrow() {
  line(0, 0, 100, 0);
  triangle(1000, 0, 800, 100, 800, -100);
}

