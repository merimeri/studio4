
//Luokka, luo napin ja pitaa huolta sen toiminnoista
class Nappula {
  int x;  
  int y;
  int leveys;
  int korkeus;
  int tunniste;
 

  Nappula (int x, int y, int korkeus, int leveys,int tunniste) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.tunniste = tunniste;
    
    
  }

  void draw() {
    stroke(0);
    fill(255);  
    //rectMode(CENTER);  
    rect(this.x, this.y, this.leveys, this.korkeus);  
  }
  
  
    void mouseClicked() {
    if(ruudussa(this.x, this.y,this.leveys, this.korkeus, this.tunniste)){   
        if(this.tunniste == 1){
          println("EKAA KLIKATTIIN!!");
          selectInput("Select a file to process:", "fileSelected");
        } 
        if(this.tunniste == 2){
          println("TOKAA KLIKATTIIN!!");
        }
         if(this.tunniste == 3){
          println("VIKAA KLIKATTIIN!!");
        }   
      }  
    }      

boolean ruudussa(int x, int y, int leveys, int korkeus, int tunniste)  {
    if (mouseX >= x && mouseX <= x+leveys && 
      mouseY >= y && mouseY <= y+korkeus) {
        println("ruudussa:" + this.tunniste);
        return true;

    } 
    else{
        return false;
     }
  } 
}



