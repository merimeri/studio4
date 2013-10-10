import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.io.FileNotFoundException; 
import java.io.IOException; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Paaluokka extends PApplet {




/**
*Kiltojen logot
**/
PImage img1;
PImage img2;
PImage img3;
PImage img4;

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
  int taivas, valk;
  
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

public void setup(){
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
  ekaKierros = false; //kun puut pysahtyvat aluksi palkkoja ei piireta
}

public void draw(){

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
*Metodi, joka piirt\u00e4\u00e4 maan sinik\u00e4yr\u00e4n avulla
**/
public void piirraMaa(){
  float a = 0.0f;
  float lisays = TWO_PI/560.0f;
   stroke(38,158, 58);
  for(int i=0; i<width; i++) {
    line(i, height, i, abs(650+sin(a)*10.0f));
    a = a + lisays;
  }
}
  
  
//Metodi, joka piirtaa valikon  
public void piirraValikko(){  
  textFont(fontti,16);
  fill(0);
  text("<1", 740, 30); //uusi!
  text("1-2", 840, 30);
  text("3-4", 940, 30);
  text("5-9", 1040, 30);
  textFont(fontti3, 22);
  text("Perustieteiden korkeakoulun aloilta valmistuneiden palkat", 30, 40);
  textFont(fontti3, 18);
  text("ty\u00f6vuosien mukaan", 250, 70);
  text("Ty\u00f6vuodet", 850, 90);
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
  
  
public void mouseClicked() {
   nappula.mouseClicked(); 
   nappula2.mouseClicked();
   nappula3.mouseClicked();
   nappula4.mouseClicked();
}
  
public void nollaaPainallukset(){
  nappula.painettu = false;
  nappula2.painettu = false;
  nappula3.painettu = false;
  nappula4.painettu = false;
}

//Metodi, joka kertoo ovatko kaikki puut kasvaneet haluttuun pituuteen
public boolean onKasvettu(){
 if (infoPuu.onKasvanut && tutaPuu.onKasvanut && tefyPuu.onKasvanut
     && tikPuu.onKasvanut && kaikkiPuu.onKasvanut){
    return true;
 }else{
    return false;
 }   
}

//Metodi, joka asettaa kaikille puille tiedon siita, etta niiden pitaa kasvaa
public void nollaaKasvu(){
  infoPuu.onKasvanut = false;
  tutaPuu.onKasvanut = false;
  tefyPuu.onKasvanut = false;
  tikPuu.onKasvanut = false;
  kaikkiPuu.onKasvanut = false;
}

public void piirraGradientti(int x, 
int y, float w, float h, 
int yla, int ala) {

  noFill();

    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      int maalaus = lerpColor(yla, ala, inter);
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


public void draw() {
  
  testi(muuttuja);
  piirraRunko();
  piirraLehdet();
  muutaArvoa();
  
}
// Piirtaa puun rungon
public void piirraRunko(){
  line(0,0,0,muuttuja);
  noFill();
}
// Piirtaa puun lehdet satunnaiseen paikkaan maaritellyn alueen sisalla
public void piirraLehdet(){
  noStroke();
  //luodaan varitaulukko, josta varit arvotaan
  int varit[] = {color(55,220,116,80),
                   color(99,220,144,80),
                   color(0,185,69,80),
                   color(35,139,73,80)};
  int index;
   if(muuttuja == 5.0f){
      for(int i = 0; i < 300; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
    // tarkastetaan onko arvottu halutun ympyran sisalle
     if(overCircle(0, -125, 130-lehtienYmpyra/2, x, y)){     
        index = PApplet.parseInt(random(varit.length));
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
          index = PApplet.parseInt(random(varit.length));
          fill(varit[index]); 
          ellipse(x, y, 30, 30);
        }
    }
   }  
}

        
  

/**
*Kirjoitetaan puihin nakyviin palkka
**/
public void piirraPalkka(){
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
public void muutaArvoa(){
 
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

public int palautaPalkka(){
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
public void testi(float kulma){
  float a = (0.2f+(kulma / (float) width)) * 40f;
  // radiaaneiksi
  theta = radians(a);
  translate(this.x,height);
  
  // Maaritetaan uuden viivan alku
  translate(0,-muuttuja*1.2f);
  // Start the recursive branching!
  branch(80);
}

/**
* Metodissa luodaan rekursiivisesti puun oksia
**/
public void branch(float h) {
  strokeWeight(2+muuttuja/40);
  stroke(102,77,51);
  // Seuraavan pituus 0.7*edellisen pituus
  h *= 0.7f;
  
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
public boolean overCircle(int x, int y, float radius, float x2, float y2){
  if(pow((x - x2),2) + pow((y - y2),2) <= pow(radius,2)){
    return true;
  }else{
    return false;  
  } 
} 

//Metodi, joka muuttaa puiden tilaa, eli piirretaanko niita vai ei
public void muutaLooppia(){
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
  
  float ok = -0.5f;

  Ukko(int koko, int paikka, int kilta, int Y) {
    this.koko=koko; 
    this.paikka=paikka;
    this.kilta = kilta;
    this.Y = Y;
  }
  
  public void paa() {
    noStroke();
    fill(228, 187, 94);
    //fill(255); KIPA
    ellipseMode(CENTER);
    ellipse(paikka, setY-koko+Y, 0.3f*koko, 0.3f*koko);

    //naaman v\u00e4ri
    fill(228, 187, 94);
    arc(paikka, setY-koko+Y, 0.3f*koko, 0.3f*koko, 0, PI);

    ellipse(paikka, setY-koko+Y, 0.3f*koko, 0.1f*koko);

    //silm\u00e4t
    fill(255);
    ellipse(paikka+0.04f*koko, setY-0.98f*koko+Y, 0.04f*koko, 0.06f*koko);
    ellipse(paikka-0.04f*koko, setY-0.98f*koko+Y, 0.04f*koko, 0.06f*koko);

    fill(0);
    ellipse(paikka+0.04f*koko, setY-0.98f*koko+Y, 0.01f*koko, 0.01f*koko);
    ellipse(paikka-0.04f*koko, setY-0.98f*koko+Y, 0.01f*koko, 0.01f*koko);

    //nen\u00e4
    stroke(1);
    strokeWeight(1);
    fill(228, 187, 94);
    //noFill();
    beginShape();
    vertex(paikka, setY-0.97f*koko+Y);
    vertex(paikka+0.02f*koko, setY-0.93f*koko+Y);
    vertex(paikka-0.01f*koko, setY-0.93f*koko+Y);
    endShape();
    
    //suu
    fill(175, 0, 0);
    ellipse(paikka, setY-0.9f*koko+Y, 0.08f*koko, 0.02f*koko);
    
    //silinteri
    fill(0);
    ellipse(paikka, setY-1.05f*koko+Y, 0.4f*koko, 0.07f*koko);
    
    stroke(90,90,90);
    ellipse(paikka, setY-1.05f*koko+Y, 0.3f*koko, 0.05f*koko);
    
    noStroke();
    rect(paikka-0.15f*koko, setY-1.3f*koko+Y, 0.3f*koko, 0.25f*koko);
    
    stroke(90,90,90);
    ellipse(paikka, setY-1.3f*koko+Y, 0.3f*koko, 0.05f*koko);
    
  }
  
  public void logo(){
    if(this.kilta==1){
    image(img1, paikka-0.1f*koko, setY-1.25f*koko+Y, 0.2f*koko, 0.2f*koko);
    }
    if(this.kilta==2){
     image(img2, paikka-0.1f*koko, setY-1.25f*koko+Y, 0.2f*koko, 0.2f*koko); 
    }
     if(this.kilta==3){
     image(img3, paikka-0.1f*koko, setY-1.25f*koko+Y, 0.2f*koko, 0.2f*koko); 
    }
    if(this.kilta==4){
     image(img4, paikka-0.1f*koko, setY-1.25f*koko+Y, 0.2f*koko, 0.2f*koko); 
    }
  }

  public void ruumis() {
    fill(0);
    rectMode(CORNER);
    rect((paikka-0.2f*koko), (setY-0.9f*koko+Y), 0.4f*koko, 0.6f*koko, 0.2f*koko);

    //paita
    fill(255);
    triangle(paikka-0.1f*koko, setY-0.9f*koko+Y, paikka+0.1f*koko, setY-0.9f*koko+Y, paikka, setY-0.5f*koko+Y);

    //solmio
    fill(0);
    triangle(paikka-0.05f*koko, setY-0.9f*koko+Y, paikka+0.05f*koko, setY-0.9f*koko+Y, paikka, setY-0.8f*koko+Y);
    triangle(paikka, setY-0.8f*koko+Y, paikka-0.03f*koko, setY-0.65f*koko+Y, paikka+0.03f*koko, setY-0.65f*koko+Y);
    triangle(paikka, setY-0.6f*koko+Y, paikka-0.03f*koko, setY-0.65f*koko+Y, paikka+0.03f*koko, setY-0.65f*koko+Y);
  }

  public void kadet() {
    fill(0);
    rect(paikka+0.1f*koko, setY-0.82f*koko+Y, 0.3f*koko, 0.12f*koko, 0.1f*koko);
    rect(paikka-0.1f*koko, setY-0.82f*koko+Y, -0.3f*koko, 0.12f*koko, 0.1f*koko);
  }
  
  public void jalat(){
    fill(134);
    //oikea jalka
    rect(paikka-0.15f*koko, setY-0.35f*koko+Y, 0.15f*koko, 0.1f*koko);
    //vasen jalka
    rect(paikka, setY-0.35f*koko+Y, 0.15f*koko, 0.1f*koko);
    
    noStroke();
    fill(0);
    rect(paikka, setY-0.25f*koko+Y, -0.2f*koko, 0.05f*koko, 0.1f*koko, 0, 0, 0);
    rect(paikka, setY-0.25f*koko+Y, 0.2f*koko, 0.05f*koko, 0, 0.1f*koko, 0, 0);
  }
  
  public void kokoUkko(){
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

  public void draw() {
    noStroke();
    fill(255);  
    ellipseMode(CENTER);  
    ellipse(this.x, this.y, this.leveys, this.korkeus);
    if(this.painettu){
      fill(0);
      ellipse(this.x, this.y, this.leveys/2, this.korkeus/2);
    }      
  }

  public void mouseClicked() {
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
public boolean overRect(int x, int y, int leveys, int korkeus)  {

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
public boolean overCircle(int x, int y, int radius){
  if(pow((x - mouseX),2) + pow((y - mouseY),2) <= pow(radius,2)){
    return true;
  }else{
    return false;  
  } 
}

//Metodi, joka asettaa tiedon siita, mihin palkkaan asti puiden pitaa kasvaa
public void lataaPalkkatiedot(int tunniste){
  nollaaKasvu();
  infoPuu.muutaLooppia();
  infonPalkka = PApplet.parseInt(info[2*tunniste-1]);
  tutanPalkka = PApplet.parseInt(tuta[2*tunniste-1]);
  tefynPalkka = PApplet.parseInt(tefy[2*tunniste-1]);
  tikinPalkka = PApplet.parseInt(tik[2*tunniste-1]);
  kaikkienPalkka = PApplet.parseInt(kaikki[2*tunniste-1]);
  
} 
  
  
  

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Paaluokka" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
