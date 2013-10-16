int setX = 800;
int setY = 800;

//Luokka, joka piirtaa puiden vierella seisovat ukkelit
class Ukko {
  int koko;
  int paikka;
  
  int kilta;
  int Y;
  
  float ok = -0.5;

  Ukko(int koko, int paikka, int kilta, int Y) {
    this.koko=koko; 
    this.paikka=paikka;
    this.kilta = kilta;
    this.Y = Y;
  }
  
  void paa() {
    noStroke();
    fill(228, 187, 94);
    //fill(255); KIPA
    ellipseMode(CENTER);
    ellipse(paikka, setY-koko+Y, 0.3*koko, 0.3*koko);

    //naaman väri
    fill(228, 187, 94);
    arc(paikka, setY-koko+Y, 0.3*koko, 0.3*koko, 0, PI);

    ellipse(paikka, setY-koko+Y, 0.3*koko, 0.1*koko);

    //silmät
    fill(255);
    ellipse(paikka+0.04*koko, setY-0.98*koko+Y, 0.04*koko, 0.06*koko);
    ellipse(paikka-0.04*koko, setY-0.98*koko+Y, 0.04*koko, 0.06*koko);

    fill(0);
    ellipse(paikka+0.04*koko, setY-0.98*koko+Y, 0.01*koko, 0.01*koko);
    ellipse(paikka-0.04*koko, setY-0.98*koko+Y, 0.01*koko, 0.01*koko);

    //nenä
    stroke(1);
    strokeWeight(1);
    fill(228, 187, 94);
    //noFill();
    beginShape();
    vertex(paikka, setY-0.97*koko+Y);
    vertex(paikka+0.02*koko, setY-0.93*koko+Y);
    vertex(paikka-0.01*koko, setY-0.93*koko+Y);
    endShape();
    
    //suu
    fill(175, 0, 0);
    ellipse(paikka, setY-0.9*koko+Y, 0.08*koko, 0.02*koko);
    
    //silinteri
    fill(0);
    ellipse(paikka, setY-1.05*koko+Y, 0.4*koko, 0.07*koko);
    
    stroke(90,90,90);
    ellipse(paikka, setY-1.05*koko+Y, 0.3*koko, 0.05*koko);
    
    noStroke();
    rect(paikka-0.15*koko, setY-1.3*koko+Y, 0.3*koko, 0.25*koko);
    
    stroke(90,90,90);
    ellipse(paikka, setY-1.3*koko+Y, 0.3*koko, 0.05*koko);
    
  }
  
  void logo(){
    if(this.kilta==1){
    image(img1, paikka-0.1*koko, setY-1.25*koko+Y, 0.2*koko, 0.2*koko);
    }
    if(this.kilta==2){
     image(img2, paikka-0.1*koko, setY-1.25*koko+Y, 0.2*koko, 0.2*koko); 
    }
     if(this.kilta==3){
     image(img3, paikka-0.1*koko, setY-1.25*koko+Y, 0.2*koko, 0.2*koko); 
    }
    if(this.kilta==4){
     image(img4, paikka-0.1*koko, setY-1.25*koko+Y, 0.2*koko, 0.2*koko); 
    }
     if(this.kilta==5){
     image(img5, paikka-0.1*koko, setY-1.25*koko+Y, 0.2*koko, 0.2*koko); 
    }
  }

  void ruumis() {
    fill(0);
    rectMode(CORNER);
    rect((paikka-0.2*koko), (setY-0.9*koko+Y), 0.4*koko, 0.6*koko, 0.2*koko);

    //paita
    fill(255);
    triangle(paikka-0.1*koko, setY-0.9*koko+Y, paikka+0.1*koko, setY-0.9*koko+Y, paikka, setY-0.5*koko+Y);

    //solmio
    fill(0);
    triangle(paikka-0.05*koko, setY-0.9*koko+Y, paikka+0.05*koko, setY-0.9*koko+Y, paikka, setY-0.8*koko+Y);
    triangle(paikka, setY-0.8*koko+Y, paikka-0.03*koko, setY-0.65*koko+Y, paikka+0.03*koko, setY-0.65*koko+Y);
    triangle(paikka, setY-0.6*koko+Y, paikka-0.03*koko, setY-0.65*koko+Y, paikka+0.03*koko, setY-0.65*koko+Y);
  }

  void kadet() {
    fill(0);
    rect(paikka+0.1*koko, setY-0.82*koko+Y, 0.3*koko, 0.12*koko, 0.1*koko);
    rect(paikka-0.1*koko, setY-0.82*koko+Y, -0.3*koko, 0.12*koko, 0.1*koko);
  }
  
  void jalat(){
    fill(134);
    //oikea jalka
    rect(paikka-0.15*koko, setY-0.35*koko+Y, 0.15*koko, 0.1*koko);
    //vasen jalka
    rect(paikka, setY-0.35*koko+Y, 0.15*koko, 0.1*koko);
    
    noStroke();
    fill(0);
    rect(paikka, setY-0.25*koko+Y, -0.2*koko, 0.05*koko, 0.1*koko, 0, 0, 0);
    rect(paikka, setY-0.25*koko+Y, 0.2*koko, 0.05*koko, 0, 0.1*koko, 0, 0);
  }
  
  void kokoUkko(){
  jalat();
  ruumis();
  kadet();
  paa();
  logo();
  }
}

