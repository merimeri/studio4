/* Koko luokan rakenne pohjautuu osittain http://processing.org/tutorials/pixels/ 
 löytyvään esimerkkiin
 */


class Muokkaus {

  PImage img;            // parametrina annettu kuva   
  PImage muokattavaKuva;   // muokattuKuva

    Muokkaus(PImage kuva) {

    img = kuva;
    muokattavaKuva = createImage(img.width, img.height, RGB);
    img.loadPixels();
  }

  PImage teeMuokkaus() {

    PImage blurrattu_kuva = tee_blur(muokattavaKuva);
    muokattavaKuva = blurrattu_kuva;
    // ladataan muokattavan kuvan pikselit käyttöön
    muokattavaKuva.loadPixels();

    // aloitetaan x = 1, koska verrataan vasempaan naapuriin
    for (int x = 1; x < img.width; x++ ) {
      for (int y = 0; y < img.height; y++ ) {

        // selvitetään pikselin sijainti ja väli
        int loc = x + y*img.width;
        color pix = img.pixels[loc];

        // sama vasemmalle puolelle
        int leftLoc = (x - 1) + y*img.width;
        color leftPix = img.pixels[leftLoc];

        // uusi väri on kahden pikselin kirkkauden vertauksien itseisarvo, ja tämä 
        // kerrotaan 8lla jotta saataisiin eroja enemmän esiin...
        float diff = 8*abs(brightness(pix) - brightness(leftPix));

        // tallennetaan väri muokattavan kuvan pikseliin
        muokattavaKuva.pixels[loc] = color(255-diff);
      }
    }

    // päivitetään muokattavan kuvan pikselit ennen uutta vertailua
    muokattavaKuva.updatePixels();
    // TESTI, VOIDAAN POISTAA LOPULLLISESSA
    //image(destination,0,0);

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
        if (bright < 50) {
          muokattavaKuva.pixels[loc] = color(10);
        }
        else if (bright < 180 && bright > 50) {

          muokattavaKuva.pixels[loc] = color(100);
        }else if (bright < 230 && bright > 180){
          muokattavaKuva.pixels[loc] = color(210);
        }
        else if (bright > 230) {
          muokattavaKuva.pixels[loc] = color(255);
        }
      }
    }

    muokattavaKuva.updatePixels();

    return muokattavaKuva;
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
      float ker_pun = 0; // kernel summa
      float ker_vih = 0;
      float ker_sin = 0;

      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // viereinen pikseli kernel summalle
          int viereinen = (y + ky)*kuva.width + (x + kx);

          float punanen = red(kuva.pixels[viereinen]);
          float vihrea = green(kuva.pixels[viereinen]);
          float sininen = blue(kuva.pixels[viereinen]);


          ker_pun += kernel[ky+1][kx+1] * punanen;
          ker_vih += kernel[ky+1][kx+1] * vihrea;
          ker_sin += kernel[ky+1][kx+1] * sininen;
        }
      }
      blurrattu_kuva.pixels[y*kuva.width + x] = color(ker_pun, ker_vih, ker_sin);
    }
  }
  blurrattu_kuva.updatePixels();
  return blurrattu_kuva;
}
/*
  /*Tutkii kuvan väripaletin ja palauttaa yleisimmät värit
  color[] tutki_paletti(PImage kuva){
    
    return [];
  }
  */
}
