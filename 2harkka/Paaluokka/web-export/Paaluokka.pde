PImage kuva;
//String osoite;
void setup() {
  size(600,600);
  background(255);
  piirraValikko();
  selectInput("Select a file to process:", "fileSelected");
 // osoite = "";
 
 Nappula nappula1 = new Nappula(0.5*width, 0.5*height, 20, 20, 1);
 Nappula nappula2 = new Nappula(0.55*width, 0.55*height, 20, 20, 1);

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
  nappula.draw();
  nappula1.draw();
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
  

//Luokka, luo napin ja pitaa huolta sen toiminnoista
class Nappula {
  int x;  
  int y;
  int leveys;
  int korkeus;
 

  Nappula (int x, int y, int korkeus, int leveys) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    
    
  }

  void draw() {
    noStroke();
    fill(255);  
    rectMode(CENTER);  
    rect(this.x, this.y, this.leveys, this.korkeus);  
  }

  void mouseClicked() {
    if(overRect(this.x, this.y,this.leveys, this.korkeus)){   
        println("MUA KLIKATTIIN!!");
        
      }  
    }      

/**
*Returns true, if the cursor is inside the rectangle described in the parameters.
**/
boolean overRect(int x, int y, int leveys, int korkeus)  {

  if (mouseX >= x && mouseX <= x+leveys && 
      mouseY >= y && mouseY <= y+korkeus) {
    return true;
  } else {
    return false;
  }
}

