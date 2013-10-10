/* Luokka, joka vastaa puiden piirrosta ja kasvattamisesta
*/
class LiikkuvaPuu{
  
float theta; 
boolean suunta;
float muuttuja;
float lehtienYmpyra;
int koko;
boolean looppi;
int x;
int puu;
boolean onKasvanut;

 LiikkuvaPuu(int x, int puu){
   this.suunta = true;
   this.muuttuja = 0;
   this.lehtienYmpyra = 210;
   this.looppi = true;
   this.x = x;
   this.puu = puu;
   this.onKasvanut = false;
 }  


void draw() {
  
  testi(muuttuja);
  piirraRunko();
  piirraLehdet();
  muutaArvoa();
  
}
// Piirtaa puun rungon
void piirraRunko(){
  line(0,0,0,muuttuja);
  noFill();
}
// Piirtaa puun lehdet satunnaiseen paikkaan maaritellyn alueen sisalla
void piirraLehdet(){
  noStroke();
  //luodaan varitaulukko, josta varit arvotaan
  color varit[] = {color(55,220,116,80),
                   color(99,220,144,80),
                   color(0,185,69,80),
                   color(35,139,73,80)};
  int index;
   if(muuttuja == 5.0){
      for(int i = 0; i < 300; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
    // tarkastetaan onko arvottu halutun ympyran sisalle
     if(overCircle(0, -125, 130-lehtienYmpyra/2, x, y)){     
        index = int(random(varit.length));
        fill(varit[index]); 
        ellipse(x, y, 30, 30);
      }
  }
    
  }
  else{
  for(int i = 0; i < 9*muuttuja; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
      // tarkastetaan onko arvottu halutun ympyran sisalla
       if(overCircle(0, -110, 130-lehtienYmpyra/2, x, y)){     
          index = int(random(varit.length));
          fill(varit[index]); 
          ellipse(x, y, 30, 30);
        }
    }
   }  
}

        
  

/**
*Kirjoitetaan puihin nakyviin palkka
**/
void piirraPalkka(){
  textSize(32);
  fill(255);
  if(this.puu == 1){   
    text(str(infonPalkka), -40, -100);
  }else if(this.puu == 2){
    text(str(tutanPalkka), -40, -100);
  }else if(this.puu == 3){
    text(str(tefynPalkka), -40, -100);
  }else if(this.puu == 4){
    text(str(tikinPalkka), -40, -100);
  }else{
    text(str(kaikkienPalkka), -40, -100);
  } 
} 

/**
*koossa talllennettuna koko miksi halutaan, muuttujassa minka kokoisia ollaan
**/
void muutaArvoa(){
 
  koko = (palautaPalkka()-2000)/14;
  if(koko >= muuttuja){
    suunta = true;
  }else{
    suunta = false; 
  }
  if(!this.onKasvanut){
    if(suunta){
      muuttuja = muuttuja + 5;
      lehtienYmpyra = lehtienYmpyra - 5;
    }else{
       muuttuja = muuttuja - 5;
      lehtienYmpyra = lehtienYmpyra + 5;
    }
  }
  
  
  if(this.muuttuja == this.koko || this.muuttuja == this.koko+5 || this.muuttuja == this.koko+4 ||
    this.muuttuja == this.koko+3 || this.muuttuja == this.koko+2 || this.muuttuja == this.koko+1){
    this.onKasvanut = true;
    if(onKasvettu()){
      muutaLooppia();
      if(ekaKierros){
        this.piirraPalkka();
      }  
    }
  }  
}  

int palautaPalkka(){
  switch (this.puu) {
  case 1: return infonPalkka;
  case 2: return tutanPalkka;
  case 3: return tefynPalkka;
  case 4: return tikinPalkka;
  default: return kaikkienPalkka;
 }
}

/**
* Piirretaan puut, jotka kuvaavat palkan suuruutta. Puiden piirrossa on otettu mallia processingin esimerkeista: http://processing.org/examples/tree.html
**/
void testi(float kulma){
  float a = (0.2+(kulma / (float) width)) * 40f;
  // radiaaneiksi
  theta = radians(a);
  translate(this.x,height);
  
  // Maaritetaan uuden viivan alku
  translate(0,-muuttuja*1.2);
  // Start the recursive branching!
  branch(80);
}

/**
* Metodissa luodaan rekursiivisesti puun oksia
**/
void branch(float h) {
  strokeWeight(2+muuttuja/40);
  stroke(102,77,51);
  // Seuraavan pituus 0.7*edellisen pituus
  h *= 0.7;
  
  // Piirretaan oksia kunnes niiden pituus on alle 10
  if (h > 10) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Kutsutaan itseaan piirtaakseen lisaa
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}



/**
*Returns true, if the cursor is inside the circle described in the parameters.
*Otherwise returns false.
**/
boolean overCircle(int x, int y, float radius, float x2, float y2){
  if(pow((x - x2),2) + pow((y - y2),2) <= pow(radius,2)){
    return true;
  }else{
    return false;  
  } 
} 

//Metodi, joka muuttaa puiden tilaa, eli piirretaanko niita vai ei
void muutaLooppia(){
  if(this.looppi == true){
   this.looppi = false;
   if(ekaKierros){
     this.piirraPalkka();
   }
   
  }else{
   this.looppi = true;
  }
 }
}


