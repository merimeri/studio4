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
color harmaa;
color harmaa2;
boolean klikkaukset;
PFont fontti1;
PFont fontti2;
boolean infonakyvilla;
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

void setup() {
  size(800,700);
  background(255);
  info = new Inforuutu();
  klikkaukset = false;
  infonakyvilla = false;
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


void fileSelected(File selection) {
  if (selection == null) {
    println("Ei valittu kuvaa, käyttäjä painoi cancel.");
  } else {
    println("Käyttäjä valitsi kuvan " + selection.getAbsolutePath());
    println(selection.getAbsolutePath());
    kuva = loadImage(selection.getAbsolutePath());
  }
}


void folderSelected(File selection) {
  if (selection == null) {
    println("Ei valittu kansiota, käyttäjä painoi cancel");
  } else {
    int x = int(random(0,2000));
    println("Käyttäjä valitsi kansion " + selection.getAbsolutePath());
    kuva.save(selection.getAbsolutePath()+ "/kuva"+ x +".jpg");
  }
}

void draw() {  
  if (kuva != null) {
    image(kuva, 0, height/5, width, height-height/5);    
    piirraValikko();
     
  }
  if(infonakyvilla){
    info.draw();
   }
  
}

  void piirraValikko(){  
  //fill(190);
   strokeWeight(1);
   stroke(0,0,0);
   rect(0, 0, width, height/5);
  piirraGradientti(0, 0, width, height/5, harmaa, harmaa2);
  fill(1);
  textFont(fontti1, 48);
  text("Pieniä hetkiä...", 75, 50);
  nappula1.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  nappula14.draw();
}

void piirraTaulukko() {
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

void mouseClicked() {
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

void mouseMoved() {
  nappula1.mouseMoved();
  nappula2.mouseMoved();
  nappula3.mouseMoved();
  nappula4.mouseMoved();
  nappula14.mouseMoved();
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

void nollaus(){
   background(255);
   piirraValikko();
  
}


