import java.io.FileNotFoundException;
import java.io.IOException;

/**
*Kiltojen logot
**/
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

//ylareunaan piirrettavat napi
Namiska nappula = new Namiska(750, 50,25,25,1);
Namiska nappula2 = new Namiska(850,50,25,25,2);
Namiska nappula3 = new Namiska(950, 50,25,25,3);
Namiska nappula4 = new Namiska(1050, 50, 25, 25,4);

BufferedReader reader;
String line;
PFont fontti;
PFont fontti2;
PFont fontti3;
boolean ekaKierros;//aluksi ei piirreta palkkoja

/**
*Tassa jarkassa aina kaikkialla: info, tuta, tefy, tik, kaikki!!!
**/
  String[] info;
  String[] tuta;
  String[] tefy;
  String[] tik;
  String[] kaikki;
  int infonPalkka = 2000;//aluksi palkat ovat kaikilla 2000
  int tutanPalkka = 2000;
  int tefynPalkka = 2000;
  int tikinPalkka = 2000;
  int kaikkienPalkka = 2000;
  color taivas, valk;
  
//liikkuvat puut  
LiikkuvaPuu infoPuu = new LiikkuvaPuu(150,1);
LiikkuvaPuu tutaPuu = new LiikkuvaPuu(380,2);
LiikkuvaPuu tefyPuu = new LiikkuvaPuu(600,3);
LiikkuvaPuu tikPuu = new LiikkuvaPuu(820,4);
LiikkuvaPuu kaikkiPuu = new LiikkuvaPuu(1050,5);
int valittuNappula = 0;//mika nappi on painettuna

//puiden vieressa olevat ukkelit
Ukko u1 = new Ukko(120, 200, 1, -100);
Ukko u2 = new Ukko(120, 430, 2, -100);
Ukko u3 = new Ukko(120, 650, 3, -100);
Ukko u4 = new Ukko(120, 870, 4, -100);
Ukko u5 = new Ukko(120, 1100, 5, -100);

void setup(){
  size(1200, 700);
  frameRate(10);
  taivas = color(81,127,252);
  valk = color(255);
  reader = createReader("palkkatilastot.txt");    
  luoPalkkataulukot();
  fontti = createFont("Futura-Medium",14); //uusi!
  fontti3 = loadFont("GungsuhChe-24.vlw");
  img1 = loadImage("inf.png");
  img2 = loadImage("tut.png");
  img3 = loadImage("fys.png");
  img4 = loadImage("tik.png");
  img5 = loadImage("kaikki.png");
  ekaKierros = false; //kun puut pysahtyvat aluksi palkkoja ei piireta
}

void draw(){

 //puut pysaytetaan kun ne ovat kasvaneet haluttuun pituuteen
 if(infoPuu.looppi){
   piirraGradientti(0, 0, width, height, taivas, valk);
   piirraValikko();
  
  //piirretaan napi
  nappula.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  
  //puita piirrettaessa tyhjennetaan matrixit
  resetMatrix();
  infoPuu.draw();
  resetMatrix();
  tutaPuu.draw();
  resetMatrix();
  tefyPuu.draw();
  resetMatrix(); 
  kaikkiPuu.draw();
  resetMatrix(); 
  tikPuu.draw();
  resetMatrix();  

  //piirretaan maa j aukkelit
  piirraMaa();
  u1.kokoUkko();
  u2.kokoUkko();
  u3.kokoUkko();
  u4.kokoUkko();
  u5.kokoUkko();
  
 }else{
  
   //ekalla kierroksella ei piirreta palkkoja
   if(ekaKierros){
    infoPuu.piirraPalkka();
    tutaPuu.piirraPalkka();
    tefyPuu.piirraPalkka();
    tikPuu.piirraPalkka();
    kaikkiPuu.piirraPalkka(); 
   }
 
  nappula.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  u1.kokoUkko();
  u2.kokoUkko();
  u3.kokoUkko();
  u4.kokoUkko();
  u5.kokoUkko();
  }

  
}  


/**
*Metodi, joka piirtää maan sinikäyrän avulla
**/
void piirraMaa(){
  float a = 0.0;
  float lisays = TWO_PI/560.0;
   stroke(38,158, 58);
  for(int i=0; i<width; i++) {
    line(i, height, i, abs(650+sin(a)*10.0));
    a = a + lisays;
  }
}
  
  
//Metodi, joka piirtaa valikon  
void piirraValikko(){  
  textFont(fontti,16);
  fill(0);
  text("<1", 740, 30); //uusi!
  text("1-2", 840, 30);
  text("3-4", 940, 30);
  text("5-9", 1040, 30);
  textFont(fontti3, 22);
  text("Perustieteiden korkeakoulun aloilta valmistuneiden palkat", 30, 40);
  textFont(fontti3, 18);
  text("työvuosien mukaan", 250, 70);
  text("Työvuodet", 850, 90);
}  
  
  
  /**
   * Metodi, joka luo pelin kaikki palkkalistat ja tallentaa ne
   */
  public void luoPalkkataulukot(){
    try {
      int i = 0;
      while ((line = reader.readLine()) != null) {
        i++;
        if(i==1){
          info = line.split(" ");
        }else if(i==2){
          tefy = line.split(" ");
        }else if(i==4){
          tik = line.split(" ");
        }else if(i == 6){
          tuta = line.split(" ");
        }else{
          kaikki = line.split(" ");
        }
          
      }
    } catch (FileNotFoundException e) {
      System.out.println("File not found!");
    } catch (IOException e) {
      System.out.println("nonne!!!!!!!");
    } 
    
  }
  
  
void mouseClicked() {
   nappula.mouseClicked(); 
   nappula2.mouseClicked();
   nappula3.mouseClicked();
   nappula4.mouseClicked();
}
  
void nollaaPainallukset(){
  nappula.painettu = false;
  nappula2.painettu = false;
  nappula3.painettu = false;
  nappula4.painettu = false;
}

//Metodi, joka kertoo ovatko kaikki puut kasvaneet haluttuun pituuteen
boolean onKasvettu(){
 if (infoPuu.onKasvanut && tutaPuu.onKasvanut && tefyPuu.onKasvanut
     && tikPuu.onKasvanut && kaikkiPuu.onKasvanut){
    return true;
 }else{
    return false;
 }   
}

//Metodi, joka asettaa kaikille puille tiedon siita, etta niiden pitaa kasvaa
void nollaaKasvu(){
  infoPuu.onKasvanut = false;
  tutaPuu.onKasvanut = false;
  tefyPuu.onKasvanut = false;
  tikPuu.onKasvanut = false;
  kaikkiPuu.onKasvanut = false;
}

void piirraGradientti(int x, 
int y, float w, float h, 
color yla, color ala) {

  noFill();

    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color maalaus = lerpColor(yla, ala, inter);
      stroke(maalaus);
      line(x, i, x+w, i);
    }
}



/* Luokka, joka vastaa puiden piirrosta ja kasvattamisesta
*/
class LiikkuvaPuu{
  
float theta; 
boolean suunta;
float muuttuja;
float lehtienYmpyra;
int koko;
boolean looppi;
int x;
int puu;
boolean onKasvanut;

 LiikkuvaPuu(int x, int puu){
   this.suunta = true;
   this.muuttuja = 0;
   this.lehtienYmpyra = 210;
   this.looppi = true;
   this.x = x;
   this.puu = puu;
   this.onKasvanut = false;
 }  


void draw() {
  
  testi(muuttuja);
  piirraRunko();
  piirraLehdet();
  muutaArvoa();
  
}
// Piirtaa puun rungon
void piirraRunko(){
  line(0,0,0,muuttuja);
  noFill();
}
// Piirtaa puun lehdet satunnaiseen paikkaan maaritellyn alueen sisalla
void piirraLehdet(){
  noStroke();
  //luodaan varitaulukko, josta varit arvotaan
  color varit[] = {color(55,220,116,80),
                   color(99,220,144,80),
                   color(0,185,69,80),
                   color(35,139,73,80)};
  int index;
   if(muuttuja == 5.0){
      for(int i = 0; i < 300; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
    // tarkastetaan onko arvottu halutun ympyran sisalle
     if(overCircle(0, -125, 130-lehtienYmpyra/2, x, y)){     
        index = int(random(varit.length));
        fill(varit[index]); 
        ellipse(x, y, 30, 30);
      }
  }
    
  }
  else{
  for(int i = 0; i < 9*muuttuja; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
      // tarkastetaan onko arvottu halutun ympyran sisalla
       if(overCircle(0, -110, 130-lehtienYmpyra/2, x, y)){     
          index = int(random(varit.length));
          fill(varit[index]); 
          ellipse(x, y, 30, 30);
        }
    }
   }  
}

        
  

/**
*Kirjoitetaan puihin nakyviin palkka
**/
void piirraPalkka(){
  textSize(32);
  fill(255);
  if(this.puu == 1){   
    text(str(infonPalkka), -40, -100);
  }else if(this.puu == 2){
    text(str(tutanPalkka), -40, -100);
  }else if(this.puu == 3){
    text(str(tefynPalkka), -40, -100);
  }else if(this.puu == 4){
    text(str(tikinPalkka), -40, -100);
  }else{
    text(str(kaikkienPalkka), -40, -100);
  } 
} 

/**
*koossa talllennettuna koko miksi halutaan, muuttujassa minka kokoisia ollaan
**/
void muutaArvoa(){
 
  koko = (palautaPalkka()-2000)/14;
  if(koko >= muuttuja){
    suunta = true;
  }else{
    suunta = false; 
  }
  if(!this.onKasvanut){
    if(suunta){
      muuttuja = muuttuja + 5;
      lehtienYmpyra = lehtienYmpyra - 5;
    }else{
       muuttuja = muuttuja - 5;
      lehtienYmpyra = lehtienYmpyra + 5;
    }
  }
  
  
  if(this.muuttuja == this.koko || this.muuttuja == this.koko+5 || this.muuttuja == this.koko+4 ||
    this.muuttuja == this.koko+3 || this.muuttuja == this.koko+2 || this.muuttuja == this.koko+1){
    this.onKasvanut = true;
    if(onKasvettu()){
      muutaLooppia();
      if(ekaKierros){
        this.piirraPalkka();
      }  
    }
  }  
}  

int palautaPalkka(){
  switch (this.puu) {
  case 1: return infonPalkka;
  case 2: return tutanPalkka;
  case 3: return tefynPalkka;
  case 4: return tikinPalkka;
  default: return kaikkienPalkka;
 }
}

/**
* Piirretaan puut, jotka kuvaavat palkan suuruutta. Puiden piirrossa on otettu mallia processingin esimerkeista: http://processing.org/examples/tree.html
**/
void testi(float kulma){
  float a = (0.2+(kulma / (float) width)) * 40f;
  // radiaaneiksi
  theta = radians(a);
  translate(this.x,height);
  
  // Maaritetaan uuden viivan alku
  translate(0,-muuttuja*1.2);
  // Start the recursive branching!
  branch(80);
}

/**
* Metodissa luodaan rekursiivisesti puun oksia
**/
void branch(float h) {
  strokeWeight(2+muuttuja/40);
  stroke(102,77,51);
  // Seuraavan pituus 0.7*edellisen pituus
  h *= 0.7;
  
  // Piirretaan oksia kunnes niiden pituus on alle 10
  if (h > 10) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Kutsutaan itseaan piirtaakseen lisaa
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}



/**
*Returns true, if the cursor is inside the circle described in the parameters.
*Otherwise returns false.
**/
boolean overCircle(int x, int y, float radius, float x2, float y2){
  if(pow((x - x2),2) + pow((y - y2),2) <= pow(radius,2)){
    return true;
  }else{
    return false;  
  } 
} 

//Metodi, joka muuttaa puiden tilaa, eli piirretaanko niita vai ei
void muutaLooppia(){
  if(this.looppi == true){
   this.looppi = false;
   if(ekaKierros){
     this.piirraPalkka();
   }
   
  }else{
   this.looppi = true;
  }
 }
}


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


//Luokka, luo napin ja pitaa huolta sen toiminnoista
class Namiska {
  int x;  
  int y;
  int leveys;
  int korkeus;
  int tunniste;
  boolean painettu; // false jos ei painettu, muuten true

  Namiska (int x, int y, int korkeus, int leveys, int tunniste) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.painettu = false;
    this.tunniste = tunniste;
  }

  void draw() {
    noStroke();
    fill(255);  
    ellipseMode(CENTER);  
    ellipse(this.x, this.y, this.leveys, this.korkeus);
    if(this.painettu){
      fill(0);
      ellipse(this.x, this.y, this.leveys/2, this.korkeus/2);
    }      
  }

  void mouseClicked() {
    ekaKierros = true;
    if(overCircle(this.x, this.y,this.leveys/2)){ //&& (valittuNappula == 0 || valittuNappula == this.tunniste)){
      
      if(this.painettu){
        this.painettu = false;
        valittuNappula = 0;       
      }else{    
        nollaaPainallukset();
        this.painettu = true;
        valittuNappula = this.tunniste;
        lataaPalkkatiedot(this.tunniste);
        
      }  
    }  
  }
}    

/**
*Returns true, if the cursor is inside the rectangle described in the parameters.
**/
boolean overRect(int x, int y, int leveys, int korkeus)  {

  if (mouseX >= x && mouseX <= x+leveys && 
      mouseY >= y && mouseY <= y+korkeus) {
    return true;
  } else {
    return false;
  }
}  

/**
*Returns true, if the cursor is inside the circle described in the parameters.
*Otherwise returns false.
**/
boolean overCircle(int x, int y, int radius){
  if(pow((x - mouseX),2) + pow((y - mouseY),2) <= pow(radius,2)){
    return true;
  }else{
    return false;  
  } 
}

//Metodi, joka asettaa tiedon siita, mihin palkkaan asti puiden pitaa kasvaa
void lataaPalkkatiedot(int tunniste){
  nollaaKasvu();
  infoPuu.muutaLooppia();
  infonPalkka = int(info[2*tunniste-1]);
  tutanPalkka = int(tuta[2*tunniste-1]);
  tefynPalkka = int(tefy[2*tunniste-1]);
  tikinPalkka = int(tik[2*tunniste-1]);
  kaikkienPalkka = int(kaikki[2*tunniste-1]);
  
} 
  
  
  


