import java.io.FileNotFoundException;
import java.io.IOException;

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



