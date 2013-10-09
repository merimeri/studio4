
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

void piirraRunko(){
  line(0,0,0,muuttuja);
  noFill();
}

void piirraLehdet(){
    noStroke();
  for(int i = 0; i < 12*muuttuja; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
     if(overCircle(0, -100, 130-lehtienYmpyra/2, x, y)){
        color varit[] = {color(55,220,116,70),
                   color(99,220,144,70),
                   color(0,185,69,70),
                   color(35,139,73,70)};
        int index = int(random(varit.length));
        fill(varit[index]); 
        ellipse(x, y, 25, 25);
  }
  }   
}

        
  


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
*koossa talllennettuna koko miksi haulutaan, muuttujassa minka kokoisia ollaan
**/
void muutaArvoa(){
 
  koko = (palautaPalkka()-2000)/15;
  if(koko >= muuttuja){
    suunta = true;
  }else{
    suunta = false; 
  }
  if(!this.onKasvanut){
    if(suunta){
      muuttuja = muuttuja + 1;
      lehtienYmpyra = lehtienYmpyra - 1;
    }else{
       muuttuja = muuttuja - 1;
      lehtienYmpyra = lehtienYmpyra + 1;
    }
  }
  
  
  if(this.muuttuja == this.koko){
    this.onKasvanut = true;
    if(onKasvettu()){
      muutaLooppia();
      piirraPalkka();
    }
    
  }  
  
}  

int palautaPalkka(){
  println("info: " + infonPalkka);
  println("tuta: " + tutanPalkka);
  println("tefy: " + tefynPalkka);
  println("tik: " + tikinPalkka);
  println("kaikki: " + kaikkienPalkka);
  switch (this.puu) {
  case 1: return infonPalkka;
  case 2: return tutanPalkka;
  case 3: return tefynPalkka;
  case 4: return tikinPalkka;
  default: return kaikkienPalkka;
 }
}

void testi(float kulma){
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (0.2+(kulma / (float) width)) * 40f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(this.x,height);
  
  // Move to the end of that line
  translate(0,-muuttuja);
  // Start the recursive branching!
  branch(80);
}


void branch(float h) {
  strokeWeight(2+muuttuja/50);
  stroke(102,77,51);
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.7;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 10) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
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


void muutaLooppia(){
  if(this.looppi == true){
   this.looppi = false;
   piirraPalkka();
  }else{
   this.looppi = true;
  }
}



  
}


