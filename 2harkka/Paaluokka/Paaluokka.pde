PImage kuva;
//String osoite;
void setup() {
  size(600,600);
  background(255);
  piirraValikko();
  selectInput("Select a file to process:", "fileSelected");
 // osoite = "";
  

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
  //textFont(fontti,16);
  fill(190);
   strokeWeight(1);
   stroke(0,0,0);
  rect(0, 0, width, height/7);
}  
