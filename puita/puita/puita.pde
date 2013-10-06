class Puu{
  int x; 
  int y;
  int korkeus;
  int leveys;
  
void Puu(int x, int y, int korkeus, int leveys){
     this.x = x;
     this.y = y;
     this.korkeus = korkeus;
     this.leveys = leveys;
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
       float randomx = random((x-3*leveys),(x+leveys+3*leveys));
       float randomy = random(y+korkeus-90, y+korkeus+90);
       ellipse(randomx, randomy, 40, 40);
      
  }
}
void runko() {
 triangle(x, y, x+(leveys/2), y-korkeus, x+leveys, y);
 triangle(x+(leveys/2), y-(0.7*korkeus), x+(leveys/2), y-(0.75*korkeus), x+(2*leveys), y-(0.9*korkeus));
 triangle(x+(leveys/2), y-(0.75*korkeus), x+(leveys/2), y-(0.8)*korkeus, x-(2.5*leveys), y-(0.95*korkeus));
  }
}

