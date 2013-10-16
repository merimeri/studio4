
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
