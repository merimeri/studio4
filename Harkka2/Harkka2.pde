PImage kuva;
//String osoite;
void setup() {
  selectInput("Select a file to process:", "fileSelected");
  size(600,600);
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
  image(kuva, 10, 10);
  }
}
  
