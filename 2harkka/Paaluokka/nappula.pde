
//Luokka, luo napin ja pitaa huolta sen toiminnoista
class Nappula {
  int x;  
  int y;
  int leveys;
  int korkeus;
  int tunniste;
  int vari = 255;
  int vari2 = 255;

  
 


Nappula (int x, int y, int korkeus, int leveys, int tunniste) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.tunniste = tunniste; //arvo jonka mukaan määritellään mikä nappula
    println(this.tunniste);    
  }

  /*Maaritetaan nappulan piirto
*/
  void draw() {
    stroke(0);
    // Piiretaan gallerian kuvat nappuloina ja piirretaan ne tietylla tavalla
    if(this.tunniste >4 && this.tunniste != 14){
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
  strokeWeight(2); 
   rect(this.x, this.y, this.leveys, this.korkeus);
  
    }
    // Kysymysmekkinapin ulkonako
    else if (this.tunniste==14) {
      strokeWeight(1);
      fill(vari);
      rect(this.x, this.y, this.leveys, this.korkeus, 50);
      fill(1);
      text("?", this.x+8, this.y+17);
    }
    
      // Piirretaan valikkonapit
    else {
   fill(vari);
   textFont(fontti2, 17);
   strokeWeight(1);
      rect(this.x, this.y, this.leveys, this.korkeus, 10);
       if (this.tunniste == 1) {
           fill(1);
         text("Valitse oma kuva", this.x+10, this.y+30);
       }
       if (this.tunniste == 2) {
           fill(1);
         text("Kuvagalleria", this.x+17, this.y+30);
       }
       if (this.tunniste == 3) {
           fill(1);
         text("Muokkaa", this.x+17, this.y+30);
       }
       if (this.tunniste == 4) {
           fill(1);
        text("Tallenna kuva", this.x+17, this.y+30);
       }
    }
   
   
  }
 
  
  void mouseMoved() {
    if (infonakyvilla == false) {
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
}

    /* Tutkitaan onko klikattu nappuloiden sisaan. Maaritetaan tapahtuman nappulan maarittama asia.
*/
    void mouseClicked() {
     
    if(ruudussa(this.x, this.y,this.leveys, this.korkeus, this.tunniste)){ 
     if (infonakyvilla == false) {  
        if(this.tunniste == 1){
           // Annetaan kayttajan tehda kuvavalinta
          gallerianakyvilla = false;
          println("EKAA KLIKATTIIN!!");
          selectInput("Valitse kuva jonka muokkaat", "fileSelected");
        } 
        if(this.tunniste == 2){
          println("TOKAA KLIKATTIIN!!");
        // Piirretaan gallerikuvat nakyviin valittavaksi
          piirraTaulukko();
          gallerianakyvilla = true;
          
        }
         if(this.tunniste == 3){
          println("KOLMATTA KLIKATTIIN!!");
          if (kuva !=null) {
           // Muokataan kuva
          Muokkaus muokkaus = new Muokkaus (kuva);
          kuva = muokkaus.teeMuokkaus();
          gallerianakyvilla = false;
          }
          
        } 
          if(this.tunniste == 4){
           // Tallennetaan kuva kayttajan valitsemaan kansioon
          println("VIKAA KLIKATTIIN");
          selectFolder("Valitse kansio johon tallenetaan", "folderSelected");
          
        }  
     
         if(kuva == null && klikkaukset == true){
          // Gallerian kuvanappulat, klikkaus avaa valitun kuvan
          if(this.tunniste == 5){
          println("1. ruutua KLIKATTIIN");
          kuva = kuva5;
          gallerianakyvilla = false;
         }
         if(this.tunniste == 6){
          println("2. ruutua KLIKATTIIN");
          kuva = kuva6;   
          gallerianakyvilla = false;
         }
         if(this.tunniste == 7){
          println("3. ruutua KLIKATTIIN");
          kuva = kuva7;
          gallerianakyvilla = false;
         }
         if(this.tunniste == 8){
          println("4. ruutua KLIKATTIIN");
          kuva = kuva8;
          gallerianakyvilla = false;
         }
         if(this.tunniste == 9){
          println("5. ruutua KLIKATTIIN");
          kuva = kuva9; 
          gallerianakyvilla = false;         
         }
         if(this.tunniste == 10){
          println("6. ruutua KLIKATTIIN");
          kuva = kuva10;
          gallerianakyvilla = false;
           }
       
         if(this.tunniste == 11){
          println("7. ruutua KLIKATTIIN");
          kuva = kuva11;
          gallerianakyvilla = false;
           }
         
         if(this.tunniste == 12){
          println("8. ruutua KLIKATTIIN");
          kuva = kuva12;
          gallerianakyvilla = false;
          }
         
         if(this.tunniste == 13){
          println("9.ruutua KLIKATTIIN");
          kuva = kuva13;
          gallerianakyvilla = false;
          } 
         }
         }
         if (this.tunniste == 14) {
           // kysymysmerkkinappi, avaa infon
           if (infonakyvilla == false) {
           infonakyvilla = true;
           println(infonakyvilla);
          }
          else{
            //tai sulkee sen
            infonakyvilla = false;
            println(infonakyvilla);
            nollaus();
     
          }
          
      }
    }
    }

/* Metodi, joka tutkii onko klikkauksen koordinaatit jonkin nappulan alueella
*/
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
  

