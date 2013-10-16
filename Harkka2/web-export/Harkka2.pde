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
  
void setup2() {
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected2(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}

