// bRigid provides classes for an easier handling of jBullet in Processing. bRigid is thought as a kind of Processing port for the bullet physics simulation library written in C++. 
// This library allows the interaction of rigid bodies in 3D. Geometry/ Shapes are build with Processing PShape Class, for convinient display and export (c) 2013 Daniel Köhler, daniel@lab-eds.org

//here: build a TriangleMesh and use it as "Terrain"

import javax.vecmath.Vector3f;
import processing.core.PApplet;
import peasy.*;
import bRigid.*;

PeasyCam cam;

BPhysics physics;

BObject rigid;
BTerrain terrain;

public void setup() {
  size(1280, 720, P3D);
  fill(213, 56, 74);
  frameRate(60);

  cam = new PeasyCam(this, 200);
  cam.pan(0, 50);

  Vector3f min = new Vector3f(-120, -250, -120);
  Vector3f max = new Vector3f(120, 250, 120);
  //create a rigid physics engine with a bounding box
  physics = new BPhysics(min, max);
  physics.world.setGravity(new Vector3f(0, 40, 0));

  float height = 0f;
  //BTerrain(PApplet p, int tesselation, float height, int seed, Vector3f position, Vector3f scale) 
  terrain = new BTerrain(this, 100, height, 10, new Vector3f(), new Vector3f(10,10,10));
  physics.addBody(terrain);

  //create the first rigidBody as Sphere
  rigid = new BBox(this, 1,15, 60, 15);
  
  for (int i = 0; i < 10; i++) {
    Vector3f pos = new Vector3f(random(-90, 90), -30, random(-90, 90));
    //reuse the rigidBody of the sphere for performance resons
    BObject r = new BObject(this, 5, rigid, pos, true);
    physics.addBody(r);
  }
  
}

public void draw() {
  background(255);
  lights();
  
  float[] rotations = cam.getRotations();
  this.physics.world.setGravity(new Vector3f(rotations[0]*100, rotations[1]*100, rotations[2]*100));
  

  physics.update();
  terrain.display();
  for (int i =1;i<physics.rigidBodies.size();i++) {
    BObject b = (BObject) physics.rigidBodies.get(i);
    b.display(50, 50, 50);
  }
}

