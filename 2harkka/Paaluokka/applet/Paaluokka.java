import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Paaluokka extends PApplet {

PImage kuva;
PImage kuva5;
PImage kuva6;
PImage kuva7;
PImage kuva8;
PImage kuva9;
PImage kuva10;
PImage kuva11;
PImage kuva12;
PImage kuva13;
int harmaa;
int harmaa2;
boolean klikkaukset;
PFont fontti1;
PFont fontti2;
boolean infonakyvilla;
boolean gallerianakyvilla;
Inforuutu info;



Nappula nappula1 = new Nappula(40,70, 50, 150, 1);
Nappula nappula2 = new Nappula(230,70, 50, 150, 2);
Nappula nappula3 = new Nappula(420,70, 50, 150, 3);
Nappula nappula4 = new Nappula(610, 70, 50, 150, 4);
Nappula nappula5 = new Nappula (0, 141, (560/3), (800/3),  5);
Nappula nappula6 = new Nappula (800/3, 141, (560/3),(800/3),  6);
Nappula nappula7 = new Nappula (798-(800/3), 141,(560/3), (800/3), 7);
Nappula nappula8 = new Nappula (0, 141+(560/3), (560/3),(800/3),  8);
Nappula nappula9 = new Nappula (800/3, 141+(560/3), (560/3), (800/3), 9);
Nappula nappula10 = new Nappula (798-(800/3), 141+(560/3), (560/3), (800/3), 10);
Nappula nappula11 = new Nappula (0, 141+2*(560/3),(560/3), (800/3), 11);
Nappula nappula12 = new Nappula (800/3, 141+2*(560/3), (560/3), (800/3), 12);
Nappula nappula13 = new Nappula (798-(800/3), 141+2*(560/3), (560/3),(800/3), 13);
Nappula nappula14 = new Nappula(750, 10, 25, 25, 14);


//String osoite;

public void setup() {
  size(800,700);
  frame.setTitle("Marivalli-design");
  background(255);
  info = new Inforuutu();
  klikkaukset = false;
  infonakyvilla = false;
  gallerianakyvilla = false;
  fontti1 = loadFont("CourierNewPS-BoldMT-48.vlw");
  fontti2 = createFont("Futura-Medium",14);
  harmaa = color(255);
  harmaa2 = color(150);
  piirraValikko();
  
  
  kuva5 = loadImage("kuva5.jpg");
  kuva6 = loadImage("kuva6.jpg");
  kuva7 = loadImage("kuva7.jpg");
  kuva8 = loadImage("kuva8.jpg");
  kuva9 = loadImage("kuva9.jpg");
  kuva10 = loadImage("kuva10.jpg");
  kuva11 = loadImage("kuva11.jpg");
  kuva12 = loadImage("kuva12.jpg");
  kuva13 = loadImage("kuva13.jpg"); 
  
}


public void fileSelected(File selection) {
  if (selection == null) {
    println("Ei valittu kuvaa, k\u00e4ytt\u00e4j\u00e4 painoi cancel.");
  } else {
    println("K\u00e4ytt\u00e4j\u00e4 valitsi kuvan " + selection.getAbsolutePath());
    println(selection.getAbsolutePath());
    kuva = loadImage(selection.getAbsolutePath());
  }
}


public void folderSelected(File selection) {
  if (selection == null) {
    println("Ei valittu kansiota, k\u00e4ytt\u00e4j\u00e4 painoi cancel");
  } else {
    int x = PApplet.parseInt(random(0,2000));
    println("K\u00e4ytt\u00e4j\u00e4 valitsi kansion " + selection.getAbsolutePath());
    kuva.save(selection.getAbsolutePath()+ "/kuva"+ x +".jpg");
  }
}

public void draw() {  
  if (kuva != null) {
    image(kuva, 0, height/5, width, height-height/5); 
      piirraValikko();  
  } 

     
  
  if(infonakyvilla){
    info.draw();
   }
  
}

  public void piirraValikko(){  
  //fill(190);
   strokeWeight(1);
   stroke(0,0,0);
   rect(0, 0, width, height/5);
  piirraGradientti(0, 0, width, height/5, harmaa, harmaa2);
  fill(1);
  textFont(fontti1, 48);
  text("Marivalli-design", 75, 50);
  nappula1.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  nappula14.draw();
}

public void piirraTaulukko() {
  klikkaukset = true;
  kuva = null;
  nappula5.draw();
  nappula6.draw();
  nappula7.draw();
  nappula8.draw();
  nappula9.draw();
  nappula10.draw();
  nappula11.draw();
  nappula12.draw();
  nappula13.draw();
   
  }

public void mouseClicked() {
   nappula1.mouseClicked();
   nappula2.mouseClicked();
   nappula3.mouseClicked();
   nappula4.mouseClicked();
   nappula5.mouseClicked();
   nappula6.mouseClicked();
   nappula7.mouseClicked();
   nappula8.mouseClicked();
   nappula9.mouseClicked();
   nappula10.mouseClicked();
   nappula11.mouseClicked();
   nappula12.mouseClicked();
   nappula13.mouseClicked();
   nappula14.mouseClicked();

}

public void mouseMoved() {
  nappula1.mouseMoved();
  nappula2.mouseMoved();
  nappula3.mouseMoved();
  nappula4.mouseMoved();
  nappula14.mouseMoved();
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

public void nollaus(){
   if(gallerianakyvilla == false){
     if(kuva == null){
       background(255);
     }
     piirraValikko();
   }
   
   else{
     piirraValikko();
     piirraTaulukko();
   }
}


class Inforuutu {
  Nappula nappula;
  
  public void draw() {
    fill(224);
    strokeWeight(1);
    rect(540,35, 255, 370, 7); 
    fill(1);
    textSize(10);
    text("Sulje inforuutu klikkaamalla uudestaan", 590, 55); 
    textSize(18);
    text("Suunnittele oma desingnisi!\n", 560, 85);
    textSize(16);
    text("Lataa oma kuva tietokoneeltasi \ntai hy\u00f6dynn\u00e4 valmiita kuvia\ngalleriasta.",560, 110);
    text("Voit muokata haluamastasi\nkuvasta uudenlaisen desingnin \nja tallentaa sen koneellesi.", 560, 200);
    text("Jos luotu design ei miellyt\u00e4 \nviel\u00e4, voit ladata kuvasi \nuudestaan ja muokata sen. \nJokainen muokkauskerta luo \nuniikin taideteoksen!", 560, 290);
  }
 
}
/* Koko luokan rakenne pohjautuu osittain http://processing.org/tutorials/pixels/ 
 l\u00f6ytyv\u00e4\u00e4n esimerkkiin
 */


class Muokkaus {

  PImage img;            // parametrina annettu kuva   
  PImage muokattavaKuva;   // muokattuKuva

    Muokkaus(PImage kuva) {

    img = kuva;
    muokattavaKuva = createImage(img.width, img.height, RGB);
    img.loadPixels();
  }

  public PImage teeMuokkaus() {
    
    PImage blurrattu_kuva = tee_blur(muokattavaKuva);
    // kuvasta kaksi s\u00e4vy\u00e4
    int[] varit = tutki_paletti(img);
    
    muokattavaKuva = blurrattu_kuva;
    // ladataan muokattavan kuvan pikselit k\u00e4ytt\u00f6\u00f6n
    muokattavaKuva.loadPixels();
    
    // aloitetaan x = 1, koska verrataan vasempaan naapuriin
    for (int x = 1; x < img.width; x++ ) {
      for (int y = 0; y < img.height; y++ ) {

        // selvitet\u00e4\u00e4n pikselin sijainti ja v\u00e4li
        int loc = x + y*img.width;
        int pix = img.pixels[loc];

        // sama vasemmalle puolelle
        int leftLoc = (x - 1) + y*img.width;
        int leftPix = img.pixels[leftLoc];

        // uusi v\u00e4ri on kahden pikselin kirkkauden vertauksien itseisarvo, ja t\u00e4m\u00e4 
        // kerrotaan 8lla jotta saataisiin eroja enemm\u00e4n esiin...
        float diff = 8*abs(brightness(pix) - brightness(leftPix));

        // tallennetaan v\u00e4ri muokattavan kuvan pikseliin
        muokattavaKuva.pixels[loc] = color(255-diff);
      }
    }

    // p\u00e4ivitet\u00e4\u00e4n muokattavan kuvan pikselit ennen uutta vertailua
    muokattavaKuva.updatePixels();
   

    // avataan uudet pikselit
    muokattavaKuva.loadPixels();

    /* K\u00e4yd\u00e4\u00e4n l\u00e4pi uuden kuvan pikselit ja pyrit\u00e4\u00e4n korostamaan eroja siten, ett\u00e4
     harmaas\u00e4vyt jaetaan 3 osaan. Mustaan, vaalean harmaaseen ja valkoiseen.
     */
    for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++) {
        // pikselin sijainti
        int loc = x + y*img.width;

        // pikselin kirkkaus asetettuna v\u00e4lille 0 - > 255
        float bright = constrain(brightness(muokattavaKuva.pixels[loc]), 0, 255);
        
        if (bright < 50) {
          muokattavaKuva.pixels[loc] = color(10);
        }
        else if (bright < 180 && bright > 50) {

          muokattavaKuva.pixels[loc] = color(120);
        }
        else if (bright > 180) {
          muokattavaKuva.pixels[loc] = color(255);
        }
      }
    }

    muokattavaKuva.updatePixels();
    
     /* Piirret\u00e4\u00e4n v\u00e4rit kuvaan*/
    
   for(int i = 0; i < varit.length; i++){
    
    int vari = varit[i];
   
    float vari_red = (vari >> 16) & 0xFF;
    float vari_green = (vari >> 8) & 0xFF;
    float vari_blue = vari & 0xFF;
    
   for (int x = 1; x < img.width-1; x++) {
    for (int y = 1; y < img.height-1; y++) {
      
      int loc = x + y*img.width;
      int ap_vari = color(img.pixels[loc]);
      
      float red = (ap_vari >> 16) & 0xFF;
      float green = (ap_vari >> 8) & 0xFF;
      float blue = ap_vari & 0xFF;
      
      if((abs(red-vari_red) < 22) && (abs(green - vari_green) < 22) &&
        (abs(blue - vari_blue) < 22)){
        if(muokattavaKuva.pixels[loc] != color(10)&&
          muokattavaKuva.pixels[loc-1] != color(10)&&
          muokattavaKuva.pixels[loc+1] != color(10)&&
          muokattavaKuva.pixels[loc+img.width] != color(10)&&
          muokattavaKuva.pixels[loc-img.width] != color(10)
        ){
          muokattavaKuva.pixels[loc] = color(vari);
          muokattavaKuva.pixels[loc-1] = color(vari);
          muokattavaKuva.pixels[loc+1] = color(vari);
          muokattavaKuva.pixels[loc+img.width] = color(vari);
          muokattavaKuva.pixels[loc-img.width] = color(vari);
        }
        }
      
    }
   }
   }
   
   muokattavaKuva.updatePixels();
    return muokattavaKuva;
  }
  
  /*Koko blurrauksen idea on yhdistell\u00e4 pikselien v\u00e4riarvoja helpottamaan reunojen tunnistamista, sek\u00e4 v\u00e4ripaletin
  etsimist\u00e4*/
  public PImage tee_blur(PImage kuva) {
  float v = 1.0f / 5.0f; // Kernel matriisin arvo haettu kokeilemalla, "toimii parhaiten"
  float[][] kernel = {{ v, v, v}, 
                      { v, v, v}, 
                      { v, v, v}};


  PImage blurrattu_kuva = createImage(kuva.width, kuva.height, RGB);
  kuva.loadPixels();
  blurrattu_kuva.loadPixels();

  // K\u00e4yt\u00e4n pohjana Processingin esimerkeist\u00e4 otettua mustavalkoisen kuvan blur
  // ohjetta: http://processing.org/examples/blur.html
  for (int y = 1; y < kuva.height-1; y++) {   
    for (int x = 1; x < kuva.width-1; x++) {  
      float ker_pun = 0; // kernel summa
      float ker_vih = 0;
      float ker_sin = 0;

      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // viereinen pikseli kernel summalle
          int viereinen = (y + ky)*kuva.width + (x + kx);
          
          int vali_vari = kuva.pixels[viereinen];
          
          float punanen = (vali_vari >> 16) & 0xFF;
          float vihrea = (vali_vari >> 8) & 0xFF;
          float sininen = vali_vari & 0xFF;
          
          
          ker_pun += kernel[ky+1][kx+1] * punanen;
          ker_vih += kernel[ky+1][kx+1] * vihrea;
          ker_sin += kernel[ky+1][kx+1] * sininen;
        }
      }
      blurrattu_kuva.pixels[y*kuva.width + x] = color(ker_pun, ker_vih, ker_sin);
    }
  }
  blurrattu_kuva.updatePixels();
  return blurrattu_kuva;
}

  /*Tutkii kuvan v\u00e4ripaletin ja palauttaa yleisimm\u00e4t v\u00e4rit, k\u00e4yd\u00e4\u00e4n
  pikselit l\u00e4pi samalla ideologialla kuin aikasemmin*/
  
  public int[] tutki_paletti(PImage imgC){
    int[] varit = new int[3];
    imgC.loadPixels();
    for(int i=0; i < 3; i++){
      int rand = PApplet.parseInt(random(imgC.width * imgC.height));
      int rgb = imgC.pixels[rand];
      varit[i] = rgb;
    }
   return varit;
   
   /*
    ALLA VANHA YRITYS JOSSA YRITIN TUTKIA HISTOGRAMMIEN AVULLA
    KUVAN V\u00c4RITYST\u00c4 JA L\u00d6YT\u00c4\u00c4 SIELT\u00c4 YLEISINT\u00c4 S\u00c4VY\u00c4...
    
    LOPULLINEN LOPPUTULOS EI KUITENKAAN OLLUT TAITEELLISESTI 
    MIELLYTT\u00c4V\u00c4.
   
   */
   
   
   
    /*// lista toimii rgb 0-255 arvojen kvantisoituina arvoina 255/15 = 17
    // 255 luvun tekij\u00e4t ovat 3, 5, 17, siksi pelataan luvuilla 15 ja 17
    
    float[] kvant_varit = {7,23,39,55,71,87,103,119,135,151,
                                  167,183,199,215,231,247,255};
    
    // histogrammit punaisesta, vihre\u00e4st\u00e4 ja sinisest\u00e4
    int[] pun_histo = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int[] vih_histo = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int[] sin_histo = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    
   
    
    imgC.loadPixels();
    
    
    for(int x = 0; x < imgC.width; x++){
      for(int y = 0; y < imgC.height; y++){
        
        int loc = x + y * imgC.width;
        
        color rgb = imgC.pixels[loc];
        
        int red = (rgb >> 16) & 0xFF;
        int green = (rgb >> 8) & 0xFF;
        int blue = rgb & 0xFF;
        
        
        pun_histo[int(red/15)] += 1;
        vih_histo[int(green/15)] += 1;
        sin_histo[int(blue/15)] += 1;
      }
    }
    
    int pun_yleisin = 0;
    int vih_yleisin = 0;
    int sin_yleisin = 0;
    
    int pun_arvo = 0;
    int vih_arvo = 0;
    int sin_arvo = 0;
    // k\u00e4yd\u00e4\u00e4n l\u00e4pi histogrammit ja katsotaan yleisimm\u00e4t v\u00e4rit
    // voidaan k\u00e4ytt\u00e4\u00e4 pituutena 18, koska kaikilla sama pituus
    println(pun_histo);
    println(sin_histo);
    println(vih_histo);
    for(int i = 0; i < 17; i++){
      float rand = random(2);
 
      if(pun_histo[i] > pun_arvo){
        pun_yleisin = i;
        pun_arvo = pun_histo[i];
      }
     if(vih_histo[i] > vih_arvo){
        vih_yleisin = i;
        vih_arvo = vih_histo[i];
      }
      
      if(sin_histo[i] > sin_arvo){
        sin_yleisin = i;
        sin_arvo = sin_histo[i];
      }
    }
    println(pun_yleisin);
    println(sin_yleisin);
    println(vih_yleisin);
    /*palauttaa v\u00e4rin, histogrammin yleisimm\u00e4n v\u00e4rin kukinta v\u00e4ri\u00e4 kohti
    ja sen j\u00e4lkeen katsomalla kvant_varit listasta sit\u00e4 vastaavan rgb arvon v\u00e4lilt\u00e4 0-255*/
    /*return color(kvant_varit[pun_yleisin],kvant_varit[vih_yleisin],kvant_varit[sin_yleisin]); 
  */} 
 
}

//Luokka, luo napin ja pitaa huolta sen toiminnoista
class Nappula {
  int x;  
  int y;
  int leveys;
  int korkeus;
  int tunniste;
  int vari = 255;
  int vari2 = 255;
 // boolean klikkaukset;
  
 


Nappula (int x, int y, int korkeus, int leveys, int tunniste) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.tunniste = tunniste; //arvo jonka mukaan m\u00e4\u00e4ritell\u00e4\u00e4n mik\u00e4 nappula
   // klikkaukset = false;
    println(this.tunniste);    
  }

  public void draw() {
    stroke(0);
    
    if(this.tunniste >4 && this.tunniste != 14){
     if(this.tunniste == 5){
      image(kuva5, x,y, leveys, korkeus);
     }
      if(this.tunniste == 6){
      image(kuva6, x,y, leveys, korkeus);
     } 
    if(this.tunniste == 7){
      image(kuva7, x,y, leveys, korkeus);
     } 
    if(this.tunniste == 8){
      image(kuva8, x,y, leveys, korkeus);
     }
     if(this.tunniste == 9){
      image(kuva9, x,y, leveys, korkeus);
     }
    if(this.tunniste == 10){
      image(kuva10, x,y, leveys, korkeus);
     }
     if(this.tunniste == 11){
      image(kuva11, x,y, leveys, korkeus);
     }
    if(this.tunniste == 12){
      image(kuva12, x,y, leveys, korkeus);
     }
      if(this.tunniste == 13){
        image(kuva13, x,y, leveys, korkeus);
     }  
   noFill();
  strokeWeight(2); 
   rect(this.x, this.y, this.leveys, this.korkeus);
  
    }
    else if (this.tunniste==14) {
      strokeWeight(1);
      fill(vari);
      rect(this.x, this.y, this.leveys, this.korkeus, 50);
      fill(1);
      text("?", this.x+8, this.y+17);
    }
    
    else {
   fill(vari);
   textFont(fontti2, 17);
   strokeWeight(1);
      rect(this.x, this.y, this.leveys, this.korkeus, 10);
       if (this.tunniste == 1) {
           fill(1);
         text("Valitse oma kuva", this.x+10, this.y+30);
       }
       if (this.tunniste == 2) {
           fill(1);
         text("Kuvagalleria", this.x+17, this.y+30);
       }
       if (this.tunniste == 3) {
           fill(1);
         text("Muokkaa", this.x+17, this.y+30);
       }
       if (this.tunniste == 4) {
           fill(1);
        text("Tallenna kuva", this.x+17, this.y+30);
       }
    }
   
   
  }
 
  
  public void mouseMoved() {
    if (infonakyvilla == false) {
  if (ruudussa(this.x, this.y,this.leveys, this.korkeus, this.tunniste)) {
    println("jee");
    this.vari2 = vari;
    this.vari = 134;
    if (vari2 != vari) {
    this.draw();
    println("piirto");
    }
  }
  else{
    vari2 = vari;
    vari = 255;
    if (vari2 != vari) {
    this.draw();
    println("piirto");
    println("2" + vari2);
    }
  }
    }
}

    public void mouseClicked() {
     
    if(ruudussa(this.x, this.y,this.leveys, this.korkeus, this.tunniste)){ 
     if (infonakyvilla == false) {  
        if(this.tunniste == 1){
          gallerianakyvilla = false;
          println("EKAA KLIKATTIIN!!");
          selectInput("Valitse kuva jonka muokkaat", "fileSelected");
        } 
        if(this.tunniste == 2){
          println("TOKAA KLIKATTIIN!!");
          //klikkaukset = true;
          piirraTaulukko();
          gallerianakyvilla = true;
          
        }
         if(this.tunniste == 3){
          println("KOLMATTA KLIKATTIIN!!");
          if (kuva !=null) {
          Muokkaus muokkaus = new Muokkaus (kuva);
          kuva = muokkaus.teeMuokkaus();
          gallerianakyvilla = false;
          }
          
        } 
          if(this.tunniste == 4){
          println("VIKAA KLIKATTIIN");
          
          selectFolder("Valitse kansio johon tallenetaan", "folderSelected");
          
        }  
     
         if(kuva == null && klikkaukset == true){
         if(this.tunniste == 5){
          println("1. ruutua KLIKATTIIN");
          kuva = kuva5;
          gallerianakyvilla = false;
         }
         if(this.tunniste == 6){
          println("2. ruutua KLIKATTIIN");
          kuva = kuva6;   
          gallerianakyvilla = false;
         }
         if(this.tunniste == 7){
          println("3. ruutua KLIKATTIIN");
          kuva = kuva7;
          gallerianakyvilla = false;
         }
         if(this.tunniste == 8){
          println("4. ruutua KLIKATTIIN");
          kuva = kuva8;
          gallerianakyvilla = false;
         }
         if(this.tunniste == 9){
          println("5. ruutua KLIKATTIIN");
          kuva = kuva9; 
          gallerianakyvilla = false;         
         }
         if(this.tunniste == 10){
          println("6. ruutua KLIKATTIIN");
          kuva = kuva10;
          gallerianakyvilla = false;
           }
       
         if(this.tunniste == 11){
          println("7. ruutua KLIKATTIIN");
          kuva = kuva11;
          gallerianakyvilla = false;
           }
         
         if(this.tunniste == 12){
          println("8. ruutua KLIKATTIIN");
          kuva = kuva12;
          gallerianakyvilla = false;
          }
         
         if(this.tunniste == 13){
          println("9.ruutua KLIKATTIIN");
          kuva = kuva13;
          gallerianakyvilla = false;
          } 
         }
         }
         if (this.tunniste == 14) {
   
           if (infonakyvilla == false) {
           infonakyvilla = true;
           println(infonakyvilla);
          }
          else{
            infonakyvilla = false;
            println(infonakyvilla);
            nollaus();
     
          }
          
      }
    }
    }


public boolean ruudussa(int x, int y, int leveys, int korkeus, int tunniste)  {
    if (mouseX >= x && mouseX <= x+leveys && 
      mouseY >= y && mouseY <= y+korkeus) {
        println("ruudussa:" + this.tunniste);
        return true;
    } 
    else{
        return false;
    }
  } 
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
