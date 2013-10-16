void setup() {
  //maaritellaan koko, ladataan kuvat ja maaritetaan ensimmainen piirtovari
  size(720, 480);
  background(255);
  
<<<<<<< HEAD
=======
   Puu(int x, int y, int korkeus, int leveys){
     this.x = x;
     this.y = y;
     this.korkeus = korkeus;
     this.leveys = leveys;
>>>>>>> 4ca19ac4312488a10cbe14d6b5223caf223aa855
}

void draw() {
  pallot();
  fill(0);
  
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
<<<<<<< HEAD
 triangle(90, 420, 120, 90, 150, 420);
 triangle(120, 200, 120, 220, 230, 120);
 triangle(120, 180, 120, 200, 50, 140);
}
=======
 triangle(x, y, x+(leveys/2), y-korkeus, x+leveys, y);
 triangle(x+(leveys/2), y-(0.7*korkeus), x+(leveys/2), y-(0.75*korkeus), x+(2*leveys), y-(0.9*korkeus));
 triangle(x+(leveys/2), y-(0.75*korkeus), x+(leveys/2), y-(0.8)*korkeus, x-(2.5*leveys), y-(0.95*korkeus));
  }
  
  
  
}//end of class
>>>>>>> 4ca19ac4312488a10cbe14d6b5223caf223aa855


