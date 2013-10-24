PImage kuva;


Nappula nappula1 = new Nappula(40,25, 50, 150, 1);
Nappula nappula2 = new Nappula(230,25, 50, 150, 2);
Nappula nappula3 = new Nappula(420,25, 50, 150, 3);
Nappula nappula4 = new Nappula(610, 25, 50, 150, 4);


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



void mouseClicked() {
   nappula1.mouseClicked();
   nappula2.mouseClicked();
   nappula3.mouseClicked();
   nappula4.mouseClicked();

}

void mouseMoved() {
  nappula1.mouseMoved();
  nappula2.mouseMoved();
  nappula3.mouseMoved();
  nappula4.mouseMoved();
}


