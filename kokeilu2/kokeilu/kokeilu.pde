
class LiikkuvaPuu{
  
float theta; 
boolean suunta;
float muuttuja;
float lehtienYmpyra;
boolean looppi;
color varit[];


 LiikkuvaPuu(){
   this.suunta = true;
   this.muuttuja = 0;
   this.lehtienYmpyra = 210;
   this.looppi = true;
   this.varit = {color(55,220,116),
                 color(99,220,144),
                 color(0,185,69),
                 color(35,139,73)}
                 
 }  


void draw() {
  muutaArvoa();
  testi(muuttuja);
  piirraRunko();
  piirraLehdet();
  noLoop();
}

void piirraRunko(){
  line(0,0,0,muuttuja);
  strokeWeight(muuttuja/20);
  noFill();
}

void piirraLehdet(){
  noStroke();
  int index = int(random(varit.length));
  fill(index); 
  if(muuttuja > 125){ 
  for(int i = 0; i < 10*muuttuja; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
     if(overCircle(0, -100, 130-lehtienYmpyra/2, x, y)){
      ellipse(x, y, 25, 25);
    } 
  } 
 }
  else{
     for(int i = 0; i < 8*muuttuja; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
       if(overCircle(0, -120, 130-lehtienYmpyra/2, x, y)){
        ellipse(x, y, 25, 25);
      } 
    }
  }
}

void piirraLisaLehdet(){
  noStroke();
  fill(55,220,116,90); 
  for(int i = 0; i < 5*muuttuja; i++){
    float x = random(-muuttuja/2 -100, muuttuja/2+100);
    float y = random(-muuttuja/2 -185, muuttuja/2);
     if(overCircle(0, -100, 130-lehtienYmpyra/2, x, y)){
      ellipse(x, y, 25, 25);
    } 
  } 
}


void muutaArvoa(){
       System.out.println(muuttuja);
  if(suunta){
    muuttuja = muuttuja + 3;
    lehtienYmpyra = lehtienYmpyra - 3;
  }else{
   muuttuja = muuttuja - 3;
   lehtienYmpyra = lehtienYmpyra + 3;
  }  
  if(muuttuja <= 0){
    suunta = true;   
  }
  if(muuttuja >= 400){
    suunta = false;
  }  
  
}  

void mouseClicked(){
 if(looppi){
  looppi = false;
  noLoop();
 }else{
  looppi = true;
  loop();
 } 
}

void testi(float kulma){
  float a = (0.2+(kulma / (float) width)) * 60f;
  theta = radians(a);
  translate(width/2,height);
 // line(0,0,0,-10);
  translate(0,-muuttuja);
  // Start the recursive branching!
  branch(80);
}


void branch(float h) {
  strokeWeight(2+muuttuja/50);
  stroke(102,77,51);
  //minkä kokoinen seuraava oksa on
  h *= 0.7;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h >10) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    
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

void nollaaPuu(){
  this.muuttuja = 0;
  this.lehtienYmpyra = 210;
  this.looppi = true;
  println("sprolol");
}


  
} 

 

