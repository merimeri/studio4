class Puu{
  int x; 
  int y;
  
void Puu(int x, int y){
     this.x = x;
     this.y = y;
}

void draw() {
  pallot();
  fill(0);

 noLoop();
  
}
void pallot() {
    noStroke();
 
    for (int i=0; i<90; i++) {
      fill(15, 150+0.7*i, 1+0.8*i, 90);
      float randomx = random(10,250);
      float randomy = random(40, 200);
      ellipse(randomx, randomy, 40, 40);
      fill(0);
    }
    runko();
    
    for (int a=0; a<130; a++) {
       fill(15, 200+0.7*a, 70+0.8*a, 90);
       float randomx = random(10,250);
       float randomy = random(40, 200);
       ellipse(randomx, randomy, 40, 40);
      
  }
}
void runko() {
 triangle(90, 420, 120, 90, 150, 420);
 triangle(120, 200, 120, 220, 230, 120);
 triangle(120, 180, 120, 200, 50, 140);
}
}


