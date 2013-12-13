/*
* This project uses 3 different external libraries, which can be 
* downloaded here:
* PeasyCam: http://mrfeinberg.com/peasycam/
* OBJLoader: https://code.google.com/p/saitoobjloader/
* Sonia: http://sonia.pitaru.com/
*
* The libraries were used to display import ready 3D sketches, to enable free
* camera movement and to track the sound level of the background music.
*
*/
import javax.vecmath.Vector3f;
import processing.core.PApplet;
import peasy.*;
import saito.objloader.*;
import pitaru.sonia_v2_9.*;



PeasyCam cam;
ParticleSystem ps;
OBJModel model;
int state;//state of the program (1 or 2)
Snowing snowing;
int transparency = 255;//attribute for the particles in the fire
int depth = 10;//attribute for the snow fall
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

  Sonia.start(this);
  sound = new Sound();
  sound.play();

  cam = new PeasyCam(this, 100, 100, 0, 600);
  cam.setMaximumDistance(1000);

}

public void draw() {

  switch(state) {
  case 1: 
   
    background(0);
    color(255);
    stroke(3);
    textSize(25);
    text("Armoton tuuli puskee lunta yksinäisen poronhoitajan karun kolkkoon kotaan.", -450, -100);
    text("Porot ovat kuolleet, kodassa on hyytävän kylmä ja pakkanen puree yhä kovempaa.", -450, -65);
    text("Edes auringon valo ei tuo lohdutusta loputtomaan yöhön.", -450, -30);
    text("Lapin erämaat eivät lepää edes jouluna.", -450, 5);
    text("Nuotion roihu on yhtä kova kuin hoitajan halu selviytyä.",-450, 40);
    text("Napin painauksella pääset kurkistamaan poronhoitajan sielunmaisemaan.", -450, 200);
    break;

  case 2:
    background(0, 0, 0, 0);
    lights();
    fill(255, 0, 0);
    noStroke();
    cam.rotateX(-.002);
    cam.rotateY(.01);
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

public void keyPressed(){
 state = 2;
 cam.reset();
}

//Method to draw the axes
public void arrow() {
  line(0, 0, 100, 0);
  triangle(1000, 0, 800, 100, 800, -100);
}

