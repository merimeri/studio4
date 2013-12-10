// bRigid provides classes for an easier handling of jBullet in Processing. bRigid is thought as a kind of Processing port for the bullet physics simulation library written in C++. 
// This library allows the interaction of rigid bodies in 3D. Geometry/ Shapes are build with Processing PShape Class, for convinient display and export (c) 2013 Daniel Köhler, daniel@lab-eds.org

//here: build a TriangleMesh and use it as "Terrain"

import javax.vecmath.Vector3f;
import processing.core.PApplet;
import peasy.*;
import bRigid.*;
import saito.objloader.*;

//cam-object, that moves the camera
PeasyCam cam;

//physic-object that holds the physical rules
BPhysics physics;
BoundingBox bbox;
BObject rigid;
BTerrain terrain;
int g = 1;
OBJModel model;
BObject t;

public void setup() {
  size(1280, 720, P3D);
  fill(213, 56, 74);
  frameRate(60);

  background(0);

  model = new OBJModel(this, "map_ground_path_s.obj", "relative", QUADS);
  //model.debugMode();
  model.load("map_ground_path_s.obj");

  model.scale(100);
  model.translateToCenter();
  bbox = new BoundingBox(this, model);
  

  cam = new PeasyCam(this, 200);
  cam.pan(0, 50);

  //size of the world
  Vector3f min = new Vector3f(-100, -100, -100);
  Vector3f max = new Vector3f(-500, -500, -500);
  //create a rigid physics engine with a bounding box
  physics = new BPhysics(min, max);
  physics.world.setGravity(new Vector3f(0, 40, 0));


  float height = 0f;
  //BTerrain(PApplet p, int tesselation, float height, int seed, Vector3f position, Vector3f scale) 
  terrain = new BTerrain(this, 100, height, 10, new Vector3f(), new Vector3f(10,10,10));
  physics.addBody(terrain);

  //fill(255);
  //create the first rigidBody as Sphere
  rigid = new BBox(this, 1,15, 60, 15);
  t = new BObject(this, 5, rigid, new Vector3f(-300, -300, -300), true);
  
  //generates 10 objects into the world
  for (int i = 0; i < 10; i++) {
    Vector3f pos = new Vector3f(random(-150, 300), -300, random(-150, -300));
    //reuse the rigidBody of the sphere for performance resons
    BObject r = new BObject(this, 5, rigid, pos, true);
    physics.addBody(r);
  }
  
}

public void draw() {
  background(255);
  lights();
  noFill();
  stroke(0);
  sphere(500);
  //spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  //bbox.draw();
  model.draw();
  
  stroke(255,0,0);
arrow(); // red x-axis
text("x-akseli!", 0, 0, 0);
rotateZ (radians(90));
stroke(0,255,0);
arrow(); // green y-axis
text("y-akseli!", 0, 0, 0);
rotateY(radians(90));
stroke(0,0,255);
arrow();
text("z-akseli!", 0, 0, 0);
  
  //changes the gravity acording to the camera angele ***NOT WORKING***
  float[] rotations = cam.getRotations();
  //rotateX(rotations[0]);
  //rotateY(rotations[1]);
  //rotateZ(rotations[2]);
  println(rotations[0]);
  println(rotations[1]);
  println(rotations[2]);
  //this.physics.world.setGravity(new Vector3f(0, 0, 40));
  //this.physics.world.setGravity(new Vector3f(rotations[1]*40, rotations[2]*40, rotations[0]*40));
 
  t.display();
  //terrain.display();
  for (int i =1;i<physics.rigidBodies.size();i++) {
    BObject b = (BObject) physics.rigidBodies.get(i);
    b.display();
    
  }
  physics.update();
  println(this.g);

}

public void keyPressed(){
  if(key == 'b'){
    if(this.g == 1){
    this.physics.world.setGravity(new Vector3f(0, 0, 40)); 
    this.g = 2;
    println("tadaa");
  }else if (this.g == 2){
    this.physics.world.setGravity(new Vector3f(40, 0, 0)); 
    this.g = 3;
    println("tada");
  }else{
    this.physics.world.setGravity(new Vector3f(40, 0, 0));
    this.g = 1;
    println("tadaa");
  }
  }
}


public void arrow() {
line(0,0, 100,0);
triangle(1000,0, 800,100, 800,-100);
}
