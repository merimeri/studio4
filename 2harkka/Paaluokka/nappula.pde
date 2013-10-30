
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
    this.tunniste = tunniste; //arvo jonka mukaan määritellään mikä nappula
    println(this.tunniste);    
  }

  void draw() {
    stroke(0);
    
    if(this.tunniste >4){
     if(this.tunniste == 5){
      image(kuva5, x,y, leveys, korkeus);
     }
      if(this.tunniste == 6){
      image(kuva6, x,y, leveys, korkeus);
     } 
    if(this.tunniste == 7){
      image(kuva7, x,y, leveys, korkeus);
     } 
    if(this.tunniste == 8){
      image(kuva8, x,y, leveys, korkeus);
     }
     if(this.tunniste == 9){
      image(kuva9, x,y, leveys, korkeus);
     }
    if(this.tunniste == 10){
      image(kuva10, x,y, leveys, korkeus);
     }
     if(this.tunniste == 11){
      image(kuva11, x,y, leveys, korkeus);
     }
    if(this.tunniste == 12){
      image(kuva12, x,y, leveys, korkeus);
     }
      if(this.tunniste == 13){
        image(kuva13, x,y, leveys, korkeus);
     }  
   noFill(); 
   rect(this.x, this.y, this.leveys, this.korkeus);
  
    }
    
    else {
   fill(vari);
      rect(this.x, this.y, this.leveys, this.korkeus, 10);
       if (this.tunniste == 1) {
           fill(1);
         text("Valitse oma kuva", this.x+10, this.y+20);
       }
       if (this.tunniste == 2) {
           fill(1);
         text("Kuvagalleria", this.x+10, this.y+20);
       }
       if (this.tunniste == 3) {
           fill(1);
         text("Muokkaa", this.x+10, this.y+20);
       }
       if (this.tunniste == 4) {
           fill(1);
        
         text("Tallenna kuva", this.x+10, this.y+20);
       }
    }
   
   
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
          selectInput("Valitse kuva jonka muokkaat", "fileSelected");
        } 
        if(this.tunniste == 2){
          
          
          println("TOKAA KLIKATTIIN!!");
          piirraTaulukko();
          
        }
         if(this.tunniste == 3){
          
           
           println("KOLMATTA KLIKATTIIN!!");
          if (kuva !=null) {
          Muokkaus muokkaus = new Muokkaus (kuva);
          kuva = muokkaus.teeMuokkaus();
         
          }
        } 
          if(this.tunniste == 4){
          println("VIKAA KLIKATTIIN");
          selectFolder("Valitse kansio johon tallenetaan", "folderSelected");
          
        }  
         
         if(kuva == null){
         if(this.tunniste == 5){
          println("1. ruutua KLIKATTIIN");
          kuva = kuva5;
         }
         if(this.tunniste == 6){
          println("2. ruutua KLIKATTIIN");
          kuva = kuva6;     
         }
         if(this.tunniste == 7){
          println("3. ruutua KLIKATTIIN");
          kuva = kuva7;
         }
         if(this.tunniste == 8){
          println("4. ruutua KLIKATTIIN");
          kuva = kuva8;
         }
         if(this.tunniste == 9){
          println("5. ruutua KLIKATTIIN");
          kuva = kuva9;          
         }
         if(this.tunniste == 10){
          println("6. ruutua KLIKATTIIN");
          kuva = kuva10;
           }
       
         if(this.tunniste == 11){
          println("7. ruutua KLIKATTIIN");
          kuva = kuva11;
           }
         
         if(this.tunniste == 12){
          println("8. ruutua KLIKATTIIN");
          kuva = kuva12;
          }
         
         if(this.tunniste == 13){
          println("9.ruutua KLIKATTIIN");
          kuva = kuva13;
          }
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
  





