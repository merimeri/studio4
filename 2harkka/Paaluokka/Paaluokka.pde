PImage kuva;

Nappula nappula1 = new Nappula(100,25, 50, 150, 1);
Nappula nappula2 = new Nappula(325,25, 50, 150, 2);
Nappula nappula3 = new Nappula(550,25, 50, 150, 3);


//String osoite;

void setup() {
  size(800,700);
  background(255);
  piirraValikko();
  
 
 
 

}

void fileSelected(File selection) {
  println("moi");
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    kuva = loadImage(selection.getAbsolutePath());
    
  }
}
void draw() {
  
  if (kuva != null) {
  image(kuva, 0, 0, width, height);
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
}



void mouseClicked() {
   nappula1.mouseClicked(); 
   nappula2.mouseClicked();
   nappula3.mouseClicked();

}



