
//Luokka, luo napin ja pitaa huolta sen toiminnoista
class Nappula {
  int x;  
  int y;
  int leveys;
  int korkeus;
  int tunniste;
  int vari = 255;
  int vari2 = 255;
 

  Nappula (int x, int y, int korkeus, int leveys,int tunniste) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.tunniste = tunniste;
    
    
  }

  void draw() {
    stroke(0);
    fill(vari);  
    rect(this.x, this.y, this.leveys, this.korkeus);  
  }
  
  void mouseMoved() {
  if (ruudussa(this.x, this.y,this.leveys, this.korkeus, this.tunniste)) {
    println("jee");
    this.vari2 = vari;
    this.vari = 134;
    if (vari2 != vari) {
    this.draw();
    println("piirto");
    }
  }
  else{
    vari2 = vari;
    vari = 255;
    if (vari2 != vari) {
    this.draw();
    println("piirto");
    println("2" + vari2);
    }
  }
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



