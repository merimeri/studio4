import java.io.FileNotFoundException;
import java.io.IOException;


Namiska nappula = new Namiska(400,50,25,25,1);
Namiska nappula2 = new Namiska(500,50,25,25,2);
Namiska nappula3 = new Namiska(600, 50,25,25,3);
Namiska nappula4 = new Namiska(700, 50, 25, 25,4);
BufferedReader reader;
String line;
  String[] info;
  String[] tefy;
  String[] tik;
  String[] tuta;
  String[] kaikki;
  int infonPalkka = 2000;
  int tutanPalkka = 2000;
  int tefynPalkka = 2000;
  int tikinPalkka = 2000;
  int kaikkienPalkka = 2000;
  
LiikkuvaPuu puu = new LiikkuvaPuu(100);
LiikkuvaPuu puu2 = new LiikkuvaPuu(300);
LiikkuvaPuu puu3 = new LiikkuvaPuu(500);
LiikkuvaPuu puu4 = new LiikkuvaPuu(650);
int valittuNappula = 0;



void setup(){
  size(800, 800);
  // Open the file from the createWriter() example
  reader = createReader("palkkatilastot.txt");    
  luoPalkkataulukot();

}

void draw(){

  if(puu.looppi){
    background(255);
    piirraMaa(); 
    piirraValikko();
     
  nappula.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  puu4.draw();
  resetMatrix(); 
  puu2.draw();
  resetMatrix();
  puu.draw();
  resetMatrix();
  puu3.draw();
 resetMatrix(); 
  
  println(puu.x);
  
  
  
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
          tefy = line.split(" ");
        }else if(i==4){
          tik = line.split(" ");
        }else if(i == 6){
          tuta = line.split(" ");
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
  







