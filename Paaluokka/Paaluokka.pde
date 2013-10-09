import java.io.FileNotFoundException;
import java.io.IOException;


Namiska nappula = new Namiska(100, 50,25,25,1);
Namiska nappula2 = new Namiska(200,50,25,25,2);
Namiska nappula3 = new Namiska(300, 50,25,25,3);
Namiska nappula4 = new Namiska(400, 50, 25, 25,4);
BufferedReader reader;
String line;

/**
*Tassa jarkassa aina kaikkialla: info, tuta, tefy, tik, kaikki!!!
**/
  String[] info;
  String[] tuta;
  String[] tefy;
  String[] tik;
  String[] kaikki;
  int infonPalkka = 2000;
  int tutanPalkka = 2000;
  int tefynPalkka = 2000;
  int tikinPalkka = 2000;
  int kaikkienPalkka = 2000;
  
LiikkuvaPuu infoPuu = new LiikkuvaPuu(100,1);
LiikkuvaPuu tutaPuu = new LiikkuvaPuu(300,2);
LiikkuvaPuu tefyPuu = new LiikkuvaPuu(500,3);
LiikkuvaPuu tikPuu = new LiikkuvaPuu(650,4);
LiikkuvaPuu kaikkiPuu = new LiikkuvaPuu(800,5);
int valittuNappula = 0;



void setup(){
  size(1100, 700);
  // Open the file from the createWriter() example
  reader = createReader("palkkatilastot.txt");    
  luoPalkkataulukot();

}

void draw(){

  if(infoPuu.looppi){
    background(107, 161, 203);
   // piirraMaa(); 
    piirraValikko();
     
  nappula.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  tikPuu.draw();
  resetMatrix(); 
  tutaPuu.draw();
  resetMatrix();
  infoPuu.draw();
  resetMatrix();
  tefyPuu.draw();
 resetMatrix(); 
 kaikkiPuu.draw();
 resetMatrix();   
 println("infon koko: " + infoPuu.koko);
  println("infon muuttuja: " + infoPuu.muuttuja); 
  println("tutan koko: " + tutaPuu.koko);
  println("tutan muuttuja: " + tutaPuu.muuttuja); 
  piirraMaa();
  
 }else{
  
  nappula.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  }

  
}  


/**
*Metodi, joka piirtää maan sinikäyrän avulla
**/
void piirraMaa(){
  float a = 0.0;
  float lisays = TWO_PI/560.0;
   stroke(11,189,82);
  for(int i=0; i<width; i++) {
    line(i, height, i, abs(700+sin(a)*10.0));
    a = a + lisays;
  }
}
  
void piirraValikko(){  
  strokeWeight(1);
  stroke(0);
  fill(148);
  rect(0,0,width,100); 
}  
  
  
  /**
   * Metodi, joka luo pelin kaikki palkkalistat ja tallentaa ne
   */
  public void luoPalkkataulukot(){
    try {
     /** FileInputStream fis = new FileInputStream("palkkatilastot.txt");
      InputStreamReader in = new InputStreamReader(fis);
      BufferedReader lukija = new BufferedReader(in);
      String rivi;**/
      int i = 0;
      while ((line = reader.readLine()) != null) {
        i++;
        if(i==1){
          info = line.split(" ");
        }else if(i==2){
          tuta = line.split(" ");
        }else if(i==4){
          tefy = line.split(" ");
        }else if(i == 6){
          tik = line.split(" ");
        }else{
          kaikki = line.split(" ");
        }
          
      }

    //lukija.close();    
    } catch (FileNotFoundException e) {
      System.out.println("File not found!");
    } catch (IOException e) {
      System.out.println("nonne!!!!!!!");
    } 
    
  }
  
  
void mouseClicked() {
   nappula.mouseClicked(); 
   nappula2.mouseClicked();
   nappula3.mouseClicked();
   nappula4.mouseClicked();
}
  
void nollaaPainallukset(){
  nappula.painettu = false;
  nappula2.painettu = false;
  nappula3.painettu = false;
  nappula4.painettu = false;
}

boolean onKasvettu(){
 if (infoPuu.onKasvanut && tutaPuu.onKasvanut && tefyPuu.onKasvanut
     && tikPuu.onKasvanut && kaikkiPuu.onKasvanut){
    return true;
 }else{
    return false;
 }   
}

void nollaaKasvu(){
  infoPuu.onKasvanut = false;
  tutaPuu.onKasvanut = false;
  tefyPuu.onKasvanut = false;
  tikPuu.onKasvanut = false;
  kaikkiPuu.onKasvanut = false;
}



