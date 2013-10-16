
//Luokka, luo napin ja pitaa huolta sen toiminnoista
class Namiska {
  int x;  
  int y;
  int leveys;
  int korkeus;
  int tunniste;
  boolean painettu; // false jos ei painettu, muuten true

  Namiska (int x, int y, int korkeus, int leveys, int tunniste) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.painettu = false;
    this.tunniste = tunniste;
  }

  void draw() {
    noStroke();
    fill(255);  
    ellipseMode(CENTER);  
    ellipse(this.x, this.y, this.leveys, this.korkeus);
    if(this.painettu){
      fill(0);
      ellipse(this.x, this.y, this.leveys/2, this.korkeus/2);
    }      
  }

  void mouseClicked() {
    ekaKierros = true;
    if(overCircle(this.x, this.y,this.leveys/2)){ //&& (valittuNappula == 0 || valittuNappula == this.tunniste)){
      
      if(this.painettu){
        this.painettu = false;
        valittuNappula = 0;       
      }else{    
        nollaaPainallukset();
        this.painettu = true;
        valittuNappula = this.tunniste;
        lataaPalkkatiedot(this.tunniste);
        
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

//Metodi, joka asettaa tiedon siita, mihin palkkaan asti puiden pitaa kasvaa
void lataaPalkkatiedot(int tunniste){
  nollaaKasvu();
  infoPuu.muutaLooppia();
  infonPalkka = int(info[2*tunniste-1]);
  tutanPalkka = int(tuta[2*tunniste-1]);
  tefynPalkka = int(tefy[2*tunniste-1]);
  tikinPalkka = int(tik[2*tunniste-1]);
  kaikkienPalkka = int(kaikki[2*tunniste-1]);
  
} 
  
  
  

