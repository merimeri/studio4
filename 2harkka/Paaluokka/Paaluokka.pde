PImage kuva;


Nappula nappula1 = new Nappula(40,25, 50, 150, 1);
Nappula nappula2 = new Nappula(230,25, 50, 150, 2);
Nappula nappula3 = new Nappula(420,25, 50, 150, 3);
Nappula nappula4 = new Nappula(610, 25, 50, 150, 4);
Nappula nappula5 = new Nappula (0, 100, 200, (800/3), 5);
Nappula nappula6 = new Nappula (800/3, 100, 200, (800/3), 6);
Nappula nappula7 = new Nappula (798-(800/3), 100, 200, (800/3), 7);
Nappula nappula8 = new Nappula (0, 300, 200,(800/3), 8);
Nappula nappula9 = new Nappula (800/3, 300, 200,(800/3), 9);
Nappula nappula10 = new Nappula (798-(800/3), 300, 200,(800/3), 10);
Nappula nappula11 = new Nappula (0, 500, 200,(800/3), 11);
Nappula nappula12 = new Nappula (800/3, 500, 200,(800/3),12);
Nappula nappula13 = new Nappula (798-(800/3), 500, 200,(800/3),13);


//String osoite;

void setup() {
  size(800,700);
  background(255);
  piirraValikko();
  
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
  image(kuva, 0, height/7, width, height-height/7);
  piirraValikko();
  }
}

  void piirraValikko(){  
  fill(190);
  strokeWeight(1);
  stroke(0,0,0);
  rect(0, 0, width, height/7);
  nappula1.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
}

void piirraTaulukko() {
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

}

void mouseMoved() {
  nappula1.mouseMoved();
  nappula2.mouseMoved();
  nappula3.mouseMoved();
  nappula4.mouseMoved();
}


