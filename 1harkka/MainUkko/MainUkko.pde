int setX = 800;
int setY = 800;

Ukko u1 = new Ukko(300, 200);
Ukko u2 = new Ukko(500, 450);

void setup() {
  size(setX, setY);
}

void draw() {
  u1.kokoUkko();
  
  u2.kokoUkko();
  

}

class Ukko {
  int koko;
  int paikka;

  Ukko(int koko, int paikka) {
    this.koko=koko; 
    this.paikka=paikka;
  }

  void paa() {
    noStroke();

    fill(255);
    ellipseMode(CENTER);
    ellipse(paikka, setY-koko, 0.3*koko, 0.3*koko);

    //naaman väri
    fill(228, 187, 94);
    arc(paikka, setY-koko, 0.3*koko, 0.3*koko, 0, PI);

    ellipse(paikka, setY-koko, 0.3*koko, 0.1*koko);

    //silmät
    fill(255);
    ellipse(paikka+0.04*koko, setY-0.98*koko, 0.04*koko, 0.06*koko);
    ellipse(paikka-0.04*koko, setY-0.98*koko, 0.04*koko, 0.06*koko);

    fill(0);
    ellipse(paikka+0.04*koko, setY-0.98*koko, 0.01*koko, 0.01*koko);
    ellipse(paikka-0.04*koko, setY-0.98*koko, 0.01*koko, 0.01*koko);

    //nenä
    stroke(1);
    fill(228, 187, 94);
    noFill();
    beginShape();
    vertex(paikka, setY-0.97*koko);
    vertex(paikka+0.02*koko, setY-0.93*koko);
    vertex(paikka-0.01*koko, setY-0.93*koko);
    endShape();
    
  }

  void ruumis() {
    fill(0);
    rectMode(CORNER);
    rect((paikka-0.2*koko), (setY-0.9*koko), 0.4*koko, 0.6*koko, 0.2*koko);

    //paita
    fill(255);
    triangle(paikka-0.1*koko, setY-0.9*koko, paikka+0.1*koko, setY-0.9*koko, paikka, setY-0.5*koko);

    //solmio
    fill(0);
    triangle(paikka-0.05*koko, setY-0.9*koko, paikka+0.05*koko, setY-0.9*koko, paikka, setY-0.8*koko);
    triangle(paikka, setY-0.8*koko, paikka-0.03*koko, setY-0.65*koko, paikka+0.03*koko, setY-0.65*koko);
    triangle(paikka, setY-0.6*koko, paikka-0.03*koko, setY-0.65*koko, paikka+0.03*koko, setY-0.65*koko);
  }

  void kadet() {
    fill(0);
    rect(paikka+0.1*koko, setY-0.82*koko, 0.3*koko, 0.12*koko, 0.1*koko);
    rect(paikka-0.1*koko, setY-0.82*koko, -0.3*koko, 0.12*koko, 0.1*koko);
  }
  
  void jalat(){
    fill(134);
    //oikea jalka
    rect(paikka-0.15*koko, setY-0.35*koko, 0.15*koko, 0.1*koko);
    //vasen jalka
    rect(paikka, setY-0.35*koko, 0.15*koko, 0.1*koko);
    
    noStroke();
    fill(0);
    rect(paikka, setY-0.25*koko, -0.2*koko, 0.05*koko, 0.1*koko, 0, 0, 0);
    rect(paikka, setY-0.25*koko, 0.2*koko, 0.05*koko, 0, 0.1*koko, 0, 0);
  }
  
  void kokoUkko(){
  jalat();
  ruumis();
  kadet();
  paa();
  }
}

