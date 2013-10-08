
class LiikkuvaPuu{
  
float theta; 
boolean suunta;
float muuttuja;
float lehtienYmpyra;
int koko;
boolean looppi;
int x;
int puu;

 LiikkuvaPuu(int x, int puu){
   this.suunta = true;
   this.muuttuja = 0;
   this.lehtienYmpyra = 210;
   this.looppi = true;
   this.x = x;
   this.puu = puu;
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
   
  
  if(muuttuja > 125){ 
  for(int i = 0; i < 10*muuttuja; i++){
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
  else{
     for(int i = 0; i < 8*muuttuja; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
       if(overCircle(0, -120, 130-lehtienYmpyra/2, x, y)){
        color varit[] = {color(55,220,116,90),
                   color(99,220,144,90),
                   color(0,185,69,90),
                   color(35,139,73,90)};
        int index = int(random(varit.length));
        fill(varit[index]); 
        ellipse(x, y, 25, 25);
      } 
    }
  }

        
}  


/**void piirraLehdet(){
  
    
    for(int i = 0; i < 100; i++){
      float x = random(-100, 100);
      float y = random(-150, 0);
      if(overCircle(0, -100, 100-lehtienYmpyra/2, x, y)){
        ellipse(x, y, 5, 5);
      } 
    } 
    
}  **/

/**
*koossa talllennettuna koko miksi haulutaan, muuttujassa minka kokoisia ollaan
**/
void muutaArvoa(){
  koko = palautaPalkka()/20;
  if(koko >= muuttuja){
    suunta = true;
  }else{
    suunta = false; 
  }
  
  if(suunta){
    muuttuja = muuttuja + 1;
    lehtienYmpyra = lehtienYmpyra - 1;
  }else{
   muuttuja = muuttuja - 1;
   lehtienYmpyra = lehtienYmpyra + 1;
  }
  
  if(muuttuja == koko){
   muutaLooppia();
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

void testi(float kulma){
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (0.2+(kulma / (float) width)) * 40f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(x,height);
  
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
  }else{
   this.looppi = true;
  }
}



  
} 


