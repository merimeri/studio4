
// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PVector start;

  Particle(PVector l) {
    this.start = l;
    acceleration = new PVector(0,-0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }

  void zero(){
    acceleration = new PVector(0,-0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = this.start.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    lifespan -= abs(40.0 * LiveInput.getLevel());
    println(lifespan);
  }

  // Method to display
  void display() {
 
      stroke(223,49,45,lifespan);
      fill(223,49,45,lifespan);
      ellipse(location.x,location.y,8,8);
      stroke(245,239,94,lifespan);
      fill(245,239,94,lifespan);
      ellipse(location.x+10,location.y,8,8);
      rotateY(radians(90));
      stroke(223,49,45,lifespan);
      fill(223,49,45,lifespan);
      ellipse(location.x,location.y,8,8);
      stroke(245,239,94,lifespan);
      fill(245,239,94,lifespan);
      ellipse(location.x+10,location.y,8,8);

  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


