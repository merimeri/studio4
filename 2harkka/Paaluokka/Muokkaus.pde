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


    // ladataan muokattavan kuvan pikselit käyttöön
    muokattavaKuva.loadPixels();

    // aloitetaan x = 1, koska verrataan vasempaan naapuriin
    for (int x = 1; x < width; x++ ) {
      for (int y = 0; y < height; y++ ) {

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
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        // pikselin sijainti
        int loc = x + y*img.width;

        // pikselin kirkkaus asetettuna välille 0 - > 255
        float bright = constrain(brightness(muokattavaKuva.pixels[loc]), 0, 255);
        if (bright < 60) {
          muokattavaKuva.pixels[loc] = color(10);
        }
        else if (bright < 180 && bright > 60) {

          muokattavaKuva.pixels[loc] = color(240);
        }
        else if (bright > 180) {
          muokattavaKuva.pixels[loc] = color(255);
        }
      }
    }

    muokattavaKuva.updatePixels();

    return muokattavaKuva;
  }
}

