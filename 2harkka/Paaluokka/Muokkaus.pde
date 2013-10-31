/* Koko luokan rakenne pohjautuu osittain http://processing.org/tutorials/pixels/ 
 löytyviin esimerkkiin
 */


class Muokkaus {

  PImage img;              // parametrina annettu kuva   
  PImage muokattavaKuva;   // muokattuKuva

    Muokkaus(PImage kuva) {

    img = kuva;
    muokattavaKuva = createImage(img.width, img.height, RGB);
    img.loadPixels();
  }

  PImage teeMuokkaus() {
    
    /*Blurrataan kuva, jotta viereisten pikseleiden "ero pienenee", jolloin rajojen
    tunnistaminen tehostuu*/
    PImage blurrattu_kuva = tee_blur(muokattavaKuva); 
    
    //poimitaan kuvasta värisävyjä
    color[] varit = tutki_paletti(img);
    
    //asetetaan blurrattu kuva, muokatuksi kuvaksi
    muokattavaKuva = blurrattu_kuva;
    
    // ladataan muokattavan kuvan pikselit käyttöön
    muokattavaKuva.loadPixels();
    
    // aloitetaan x = 1, koska verrataan vasempaan naapuripikseliin
    for (int x = 1; x < img.width; x++ ) {
      for (int y = 0; y < img.height; y++ ) {

        // selvitetään pikselin sijainti ja väri
        int loc = x + y*img.width;
        color pix = img.pixels[loc];

        // sama vasemmalle puolelle
        int leftLoc = (x - 1) + y*img.width;
        color leftPix = img.pixels[leftLoc];

        // uusi väri on kahden pikselin kirkkauden vertauksien itseisarvo, ja tämä 
        // kerrotaan 8(itse haettu arvo)lla jotta saataisiin eroja enemmän esiin...
        float diff = 8*abs(brightness(pix) - brightness(leftPix));

        // tallennetaan väri muokattavan kuvan pikseliin
        muokattavaKuva.pixels[loc] = color(255-diff);
      }
    }

    // päivitetään muokattavan kuvan pikselit ennen uutta vertailua
    muokattavaKuva.updatePixels();
   

    // avataan uudet pikselit
    muokattavaKuva.loadPixels();

    /* Käydään läpi uuden kuvan pikselit ja pyritään korostamaan eroja siten, että
     harmaasävyt jaetaan 3 osaan. Mustaan, vaalean harmaaseen ja valkoiseen.
     */
    for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++) {
        // pikselin sijainti
        int loc = x + y*img.width;

        // pikselin kirkkaus asetettuna välille 0 - > 255
        float bright = constrain(brightness(muokattavaKuva.pixels[loc]), 0, 255);
        
        /*Kvantisoidaan eri brightnessit 3 harmaansävylle*/
        if (bright < 50) {
          muokattavaKuva.pixels[loc] = color(10); 
        }
        else if (bright < 180 && bright > 50) {

          muokattavaKuva.pixels[loc] = color(120);
        }
        else if (bright > 180) {
          muokattavaKuva.pixels[loc] = color(255);
        }
      }
    }

    muokattavaKuva.updatePixels();
    
     /* Piirretään värit kuvaan*/
    /* Käydään varit lista läpi, ja väritetään kukinta väriä mikäli tutkittavan
    pikselin väri on tarpeeksi lähellä listasta poimittua väriä*/
   for(int i = 0; i < varit.length; i++){
    
    color vari = varit[i];
   
     /*Haetaan rgb arvot erikseen, tämä on tehokkaampi ja nopeampi tapa saada arvot, kuin
     esim red() tai blue() jne. http://processing.org/reference/rightshift.html*/
    float vari_red = (vari >> 16) & 0xFF;
    float vari_green = (vari >> 8) & 0xFF;
    float vari_blue = vari & 0xFF;
    
    /* Käydään kaikki pikselit läpi, sama logiikka värien poiminnassa kuin edellä*/
   for (int x = 1; x < img.width-1; x++) {
    for (int y = 1; y < img.height-1; y++) {
      
      // sijainti loc on seuraavanlainen, koska pikselit ovat yksiulotteisessa listassa
      int loc = x + y*img.width; 
      color ap_vari = color(img.pixels[loc]);
      
      float red = (ap_vari >> 16) & 0xFF;
      float green = (ap_vari >> 8) & 0xFF;
      float blue = ap_vari & 0xFF;
      
      /*Katsotaan onko tutkittavan pikselin väri tarpeeksi lähellä, varit listasta
      poimittua väriä. Tämän lisäksi pidetään huoli, ettei piirettä mustien ääriviivojen
      päälle, jotta ne näkyvät kuvassa selkeästi*/
      if((abs(red-vari_red) < 22) && (abs(green - vari_green) < 22) &&
        (abs(blue - vari_blue) < 22)){
        if(muokattavaKuva.pixels[loc] != color(10)&&
          muokattavaKuva.pixels[loc-1] != color(10)&&
          muokattavaKuva.pixels[loc+1] != color(10)&&
          muokattavaKuva.pixels[loc+img.width] != color(10)&&
          muokattavaKuva.pixels[loc-img.width] != color(10)
        ){
          /*Väritetään pikselit risti muodossa, jotta piirto jälki olisi kivempi ja
          taiteellisempi*/
          muokattavaKuva.pixels[loc] = color(vari);
          muokattavaKuva.pixels[loc-1] = color(vari);
          muokattavaKuva.pixels[loc+1] = color(vari);
          muokattavaKuva.pixels[loc+img.width] = color(vari);
          muokattavaKuva.pixels[loc-img.width] = color(vari);
        }
        }
      
    }
   }
   }
 
   muokattavaKuva.updatePixels();
   return muokattavaKuva; // palautetaan valmis kuva
  }
  
  /*Koko blurrauksen idea on yhdistellä pikselien väriarvoja helpottamaan reunojen tunnistamista, sekä väripaletin
  etsimistä*/
  PImage tee_blur(PImage kuva) {
  float v = 1.0 / 5.0; // Kernel matriisin arvo haettu kokeilemalla, "toimii parhaiten"
  float[][] kernel = {{ v, v, v}, 
                      { v, v, v}, 
                      { v, v, v}};


  PImage blurrattu_kuva = createImage(kuva.width, kuva.height, RGB);
  kuva.loadPixels();
  blurrattu_kuva.loadPixels();

  // Käytän pohjana Processingin esimerkeistä otettua mustavalkoisen kuvan blur
  // ohjetta: http://processing.org/examples/blur.html
  for (int y = 1; y < kuva.height-1; y++) {   
    for (int x = 1; x < kuva.width-1; x++) {  
       
      // kernel summat kaikille värikanaville
      float ker_pun = 0;
      float ker_vih = 0;
      float ker_sin = 0;

      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // viereinen pikseli kernel summalle
          int viereinen = (y + ky)*kuva.width + (x + kx);
          
          color vali_vari = kuva.pixels[viereinen];
          // jälleen tehokkaampi tapa poimia eri värikanavien arvot
          float punanen = (vali_vari >> 16) & 0xFF;
          float vihrea = (vali_vari >> 8) & 0xFF;
          float sininen = vali_vari & 0xFF;
          
          
          ker_pun += kernel[ky+1][kx+1] * punanen;
          ker_vih += kernel[ky+1][kx+1] * vihrea;
          ker_sin += kernel[ky+1][kx+1] * sininen;
        }
      }
      // kernelin arvojen sijoittaminen pikseliin
      blurrattu_kuva.pixels[y*kuva.width + x] = color(ker_pun, ker_vih, ker_sin);
    }
  }
  blurrattu_kuva.updatePixels();
  return blurrattu_kuva; 
}

  /*Metodi poimii kuvasta 3 random pikseliä, joiden väriä käytetään väritykseen. Alle
  olen jättänyt vanhan yritelmän, jossa koitin tutkia kuvan väriarvoja kolmen (rgb jokaista
  kanavaa kohden yksi) histogrammin avulla, mutta joka kuitenkin antoi "huonomman"
  taiteellisen lopputuloksen*/
  
  color[] tutki_paletti(PImage imgC){
    color[] varit = new color[3];
    imgC.loadPixels();
    for(int i=0; i < 3; i++){
      int rand = int(random(imgC.width * imgC.height));
      color rgb = imgC.pixels[rand];
      varit[i] = rgb;
    }
   return varit;
  }
  
   /*
    ALLA VANHA YRITYS JOSSA YRITIN TUTKIA HISTOGRAMMIEN AVULLA
    KUVAN VÄRITYSTÄ JA LÖYTÄÄ SIELTÄ YLEISINTÄ SÄVYÄ...
    
    LOPULLINEN LOPPUTULOS EI KUITENKAAN OLLUT TAITEELLISESTI 
    MIELLYTTÄVÄ.
   
   
   
   
   
   // lista toimii rgb 0-255 arvojen kvantisoituina arvoina 255/15 = 17
    //255 luvun tekijät ovat 3, 5, 17, siksi pelataan luvuilla 15 ja 17
    
    float[] kvant_varit = {7,23,39,55,71,87,103,119,135,151,
                                  167,183,199,215,231,247,255};
    
    // histogrammit punaisesta, vihreästä ja sinisestä
    int[] pun_histo = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int[] vih_histo = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int[] sin_histo = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    
   
    
    imgC.loadPixels();
    
    
    for(int x = 0; x < imgC.width; x++){
      for(int y = 0; y < imgC.height; y++){
        
        int loc = x + y * imgC.width;
        
        color rgb = imgC.pixels[loc];
        
        int red = (rgb >> 16) & 0xFF;
        int green = (rgb >> 8) & 0xFF;
        int blue = rgb & 0xFF;
        
        
        pun_histo[int(red/15)] += 1;
        vih_histo[int(green/15)] += 1;
        sin_histo[int(blue/15)] += 1;
      }
    }
    
    int pun_yleisin = 0;
    int vih_yleisin = 0;
    int sin_yleisin = 0;
    
    int pun_arvo = 0;
    int vih_arvo = 0;
    int sin_arvo = 0;
    // käydään läpi histogrammit ja katsotaan yleisimmät värit
    // voidaan käyttää pituutena 18, koska kaikilla sama pituus
    println(pun_histo);
    println(sin_histo);
    println(vih_histo);
    for(int i = 0; i < 17; i++){
      float rand = random(2);
 
      if(pun_histo[i] > pun_arvo){
        pun_yleisin = i;
        pun_arvo = pun_histo[i];
      }
     if(vih_histo[i] > vih_arvo){
        vih_yleisin = i;
        vih_arvo = vih_histo[i];
      }
      
      if(sin_histo[i] > sin_arvo){
        sin_yleisin = i;
        sin_arvo = sin_histo[i];
      }
    }
    //testailua....
    println(pun_yleisin);
    println(sin_yleisin);
    println(vih_yleisin);
    palauttaa värin, histogrammin yleisimmän värin kukinta väriä kohti
    ja sen jälkeen katsomalla kvant_varit listasta sitä vastaavan rgb arvon väliltä 0-255
    return color(kvant_varit[pun_yleisin],kvant_varit[vih_yleisin],kvant_varit[sin_yleisin]); 
  */
 
}
