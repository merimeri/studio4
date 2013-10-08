
class LiikkuvaPuu{
  
float theta; 
boolean suunta;
float muuttuja;
float lehtienYmpyra;
boolean looppi;


 LiikkuvaPuu(){
   this.suunta = true;
   this.muuttuja = 0;
   this.lehtienYmpyra = 210;
   this.looppi = true;
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
  noFill();

}

void piirraLehdet(){
  for(int i = 0; i < 100; i++){
    float x = random(-100, 100);
    float y = random(-150, 0);
    if(overCircle(0, -100, 100-lehtienYmpyra/2, x, y)){
      ellipse(x, y, 5, 5);
    } 
  } 
}  


void muutaArvoa(){

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
  if(muuttuja >= 200){
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
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (0.2+(kulma / (float) width)) * 40f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
 // line(0,0,0,-10);
  // Move to the end of that line
  translate(0,-muuttuja);
  // Start the recursive branching!
  branch(80);
}


void branch(float h) {
  
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
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

void nollaaPuu(){
  this.muuttuja = 0;
  this.lehtienYmpyra = 210;
  this.looppi = true;
  println("sprolol");
}  
  
} 


