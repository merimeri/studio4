color palkki;
color variNyt;
color nappi;
color vari1, vari2, vari3, vari4, vari5, vari6;
int palkkiX, palkkiY;
int palkkiL, palkkiK;
int nappiX, nappi1y, nappi2y, nappi3y;
int nappiKoko;
int ruutuX, ruutuY;
int ruutuKoko;
int vari1x, vari2x, vari3x, vari4x, vari5x, vari6x;
int vari1y, vari2y, vari3y, vari4y, vari5y, vari6y;
int variKoko;
boolean kyna;
boolean kumi;
boolean leima;
PFont fontti;
PImage img1, img2, img3, img4, img5, img6, pyyhi, piirto;
int kokoKyna, kokoLeima;
int pieniK, keskiK, suuriK;
int pieniL, keskiL, suuriL;
int koko1x, koko2x, koko3x;
int kokoY;
int koko;






void setup() {
  size(900, 640);
  background(255);
  frameRate(1000);
  noStroke();
  palkki = color(209, 218, 219);
  nappi = color (255);
  vari1 = variNyt = color(0);
  vari2 = color(253,100, 147);
  vari3 = color(208, 100, 253);
  vari4 = color(100, 238, 253);
  vari5 = color(141, 253, 100);
  vari6 = color(253, 253, 100);
  palkkiX = 0;
  palkkiY = 0;
  palkkiL = 200;
  palkkiK = 640;
  ruutuX = 70;
  ruutuY = 560;
  ruutuKoko = 60;
  nappiX = 60;
  nappi1y = 15;
  nappi2y = 105;
  nappi3y = 195;
  nappiKoko = 80;
  vari1y =  vari2y = vari3y = 470; 
  vari4y = vari5y = vari6y = 500;
  vari1x = vari4x = 55; 
  vari2x = vari5x = 85;
  vari3x = vari6x = 115;
  variKoko = 30;
  kyna = true;
  leima = false;
  kumi = false;
  fontti = createFont("Futura-Medium", 14);
  textFont(fontti);
  img1 = loadImage("omena1.gif");
  img2 = loadImage("omena2.gif");
  img3 = loadImage("omena3.gif");
  img4 = loadImage("omena4.gif");
  img5 = loadImage("omena5.gif");
  img6 = loadImage("omena6.gif");
  pyyhi = loadImage("kumi.png");
  piirto = loadImage("piirto.png");
  pieniK = kokoKyna = 10;
  keskiK = 20;
  suuriK = 70;
  pieniL = kokoLeima =  50;
  keskiL = 100;
  suuriL = 200;
  koko1x = 35;
  koko2x = 80;
  koko3x = 125;
  kokoY = 350;
  koko = 40;
  
  
}


void draw() {
  if (mousePressed == true && leima == false) {
        strokeWeight(kokoKyna);
        strokeJoin(ROUND);
        stroke(variNyt);    
        line(mouseX, mouseY, pmouseX, pmouseY);    
  } 
     tyokalut();
  }

boolean ruudussa(int x, int y, int leveys, int korkeus)  {
    if (mouseX >= x && mouseX <= x+leveys && 
      mouseY >= y && mouseY <= y+korkeus) {
    return true;
  } else {
    return false;
  }
}
  //ellipse(mouseX, mouseY, 20, 20);
  
    
void tyokalut(){
  noStroke();
  fill(palkki);
  rect(palkkiX, palkkiY, palkkiL, palkkiK);
  fill(nappi);
  rect(nappiX, nappi1y, nappiKoko, nappiKoko);
  rect(nappiX, nappi2y, nappiKoko, nappiKoko);
  rect(nappiX, nappi3y, nappiKoko, nappiKoko);
  rect(koko1x, kokoY, koko, koko);
  rect(koko2x, kokoY, koko, koko);
  rect(koko3x, kokoY, koko, koko);
  
  fill(variNyt);
  rect(ruutuX, ruutuY, ruutuKoko, ruutuKoko);
  fill(vari1);
  text("Size", koko1x, kokoY-5);
  text("Color", vari1x, vari1y-5);
  text("S", koko1x + 15 , kokoY + 25);
  text("M", koko2x + 15 , kokoY + 25);
  text("L", koko3x + 15 , kokoY + 25);
  image(img1, nappiX + 7, nappi3y +7, 60, 60);
  image(pyyhi, nappiX +7, nappi2y +7, 60, 60);
  image(piirto, nappiX +7, nappi1y +7, 60, 60);
  rect(vari1x, vari1y, variKoko, variKoko);
  fill(vari2);
  rect(vari2x, vari2y, variKoko, variKoko);
  fill(vari3);
  rect(vari3x, vari3y, variKoko, variKoko);
  fill(vari4);
  rect(vari4x, vari4y, variKoko, variKoko);
  fill(vari5);
  rect(vari5x, vari5y, variKoko, variKoko);
  fill(vari6);
  rect(vari6x, vari6y, variKoko, variKoko); 

  
}

 void mouseClicked(){
     //tarkastellaan työkalunvalinta  
     if(ruudussa(nappiX, nappi1y, nappiKoko, nappiKoko)){
        if(kumi == true){
           variNyt = vari1;
           stroke(variNyt);
           }
          if(leima == true || kyna == true){
          stroke(variNyt);
          } 
        kyna = true;
        kumi = false;
        leima = false;
            
       } 
       
       if(ruudussa(nappiX, nappi2y, nappiKoko, nappiKoko)){
        kyna = false;
        kumi = true;
        leima = false;
        stroke(nappi);
        variNyt = nappi;
       } 
       
       if(ruudussa(nappiX, nappi3y, nappiKoko, nappiKoko)){
           if(kumi == true){
            stroke(vari1);
            variNyt = vari1; 
          }
        kyna = false;
        kumi = false;
        leima = true;
       
       } 
       
       
       //tarkastellaan mahd. värinvaihto
        if(ruudussa(vari1x, vari1y, variKoko, variKoko) && kumi == false){
        stroke(vari1);
        variNyt = vari1;
        }  
        if(ruudussa(vari2x, vari2y, variKoko, variKoko)&& kumi == false){
        stroke(vari2);
        variNyt = vari2;
        }
        if(ruudussa(vari3x, vari3y, variKoko, variKoko) && kumi == false){
        stroke(vari3);
        variNyt = vari3;
        }
        if(ruudussa(vari4x, vari4y, variKoko, variKoko)&& kumi == false){
        stroke(vari4);
        variNyt = vari4;
        }
        if(ruudussa(vari5x, vari5y, variKoko, variKoko)&& kumi == false){
          stroke(vari5);
          variNyt = vari5;
        }
        if(ruudussa(vari6x, vari6y, variKoko, variKoko)&& kumi == false){
          stroke(vari6);
          variNyt = vari6;
        } 
        
        if(ruudussa(koko1x, kokoY, koko, koko)){
        kokoKyna = pieniK;
        kokoLeima = pieniL;
        }
        
        if(ruudussa(koko2x, kokoY, koko, koko)){
        kokoKyna = keskiK;
        kokoLeima = keskiL;
        }
        
        if(ruudussa(koko3x, kokoY, koko, koko)){
        kokoKyna = suuriK;
        kokoLeima = suuriL;
        }
 }
 
void mouseReleased(){
  if(leima == true && mouseX > 200){
    if(variNyt == vari1){
      image(img1, mouseX, mouseY, kokoLeima, kokoLeima);
    }
   if(variNyt == vari2){
      image(img2, mouseX, mouseY, kokoLeima, kokoLeima);
    }
   if(variNyt == vari3){
      image(img3, mouseX, mouseY, kokoLeima, kokoLeima);
    }
   if(variNyt == vari4){
      image(img4, mouseX, mouseY, kokoLeima, kokoLeima);
    }
   if(variNyt == vari5){
      image(img5, mouseX, mouseY, kokoLeima, kokoLeima);
    }
   if(variNyt == vari6){
      image(img6, mouseX, mouseY, kokoLeima, kokoLeima);
    }
  }  
}








