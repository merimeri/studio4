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
  
  ps = new ParticleSystem(new PVector(0,250, 0));
  snowing = new Snowing();
  sphere = new Sphere();
 
  model = new OBJModel(this);
  model.enableTexture();
  model.setDrawMode(POLYGON);
  model.load("ready_world6.obj");
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
    background(255);
    fill(0);
    stroke(3);
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
    cam.rotateY(0.1);
    //cam.rotateZ(-0.1);
    //directionalLight(51, 102, 126, -1, 0, 0);
    //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
    //ambientLight(50, 50, 50);
    sphere.draw();
    model.draw();
    snowing.draw();
    ps.addParticle();
    ps.run();
    /*stroke(255, 0, 0);
    arrow(); // red x-axis
    text("x-akseli!", 0, 0, 0);
    rotateZ (radians(90));
    stroke(0, 255, 0);
    arrow(); // green y-axis
    text("y-akseli!", 0, 0, 0);
    rotateY(radians(90));
    stroke(0, 0, 255);
    arrow();
    text("z-akseli!", 0, 0, 0);*/
    
    
    float[] rotations = cam.getRotations();
    println(rotations[0]);
    /*if(rotations[0] > 0.5 || rotations[0] < -0.5){
     cam.reset();
      println("tadaa"); 
    }*/
    
    
    
    break;
    
  default:
    break;
  }
}

public void arrow() {
  line(0, 0, 100, 0);
  triangle(1000, 0, 800, 100, 800, -100);
}

