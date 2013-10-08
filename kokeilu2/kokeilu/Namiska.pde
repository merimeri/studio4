class Namiska {
  int x;  
  int y;
  int leveys;
  int korkeus;
  boolean painettu; // false jos ei painettu, muuten true

  Namiska (int x, int y, int korkeus, int leveys) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.painettu = false;
  }

  void draw() {
    fill(255);  
    strokeWeight(2);
    stroke(255);
    ellipseMode(CENTER);  
    ellipse(this.x, this.y, this.leveys, this.korkeus);
    if(this.painettu){
      fill(0);
      ellipse(this.x, this.y, this.leveys/2, this.korkeus/2);
    }      
  }

  void mouseClicked() {
    
    if(overCircle(this.x, this.y,this.leveys/2)){
      if(this.painettu){
        this.painettu = false;       
      }else{
        
        this.painettu = true;
      }  
    }  
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

/**
*Returns true, if the cursor is inside the circle described in the parameters.
*Otherwise returns false.
**/
boolean overCircle(int x, int y, int radius){
  if(pow((x - mouseX),2) + pow((y - mouseY),2) <= pow(radius,2)){
    return true;
  }else{
    return false;  
  } 
}
