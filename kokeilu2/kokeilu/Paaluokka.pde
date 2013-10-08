import java.io.FileNotFoundException;
import java.io.IOException;


Namiska nappula = new Namiska(400,50,25,25);
Namiska nappula2 = new Namiska(500,50,25,25);
Namiska nappula3 = new Namiska(600, 50,25,25);
Namiska nappula4 = new Namiska(700, 50, 25, 25);
BufferedReader reader;
String line;
  String[] info;
  String[] tefy;
  String[] tik;
  String[] tuta;
  String[] kaikki;
  
Puu infoPuu = new Puu(500, 300, 100, 50);  
LiikkuvaPuu puu = new LiikkuvaPuu();

void setup(){
  size(800, 800);
  // Open the file from the createWriter() example
  reader = createReader("palkkatilastot.txt");    
  luoPalkkataulukot();

}

void draw(){
  background(255); 
  piirraValikko();
  piirraMaa();
    
  nappula.draw();
  nappula2.draw();
  nappula3.draw();
  nappula4.draw();
  puu.draw();
  
  

 
loop(); 
 
  //infoPuu.draw();
  

  
}  

/**
*Metodi, joka piirtää maan sinikäyrän avulla
**/
void piirraMaa(){
  float a = 0.0;
  float lisays = TWO_PI/560.0;
   strokeWeight(2);
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
        System.out.println(i);
        System.out.println(line);
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
    println(info.length);
    println(tefy.length);
    println(tik.length);
    println(tuta.length);
    println(kaikki.length);
    
  }
  
  
void mouseClicked() {
   nappula.mouseClicked();  
   nappula2.mouseClicked();
   nappula3.mouseClicked();
   nappula4.mouseClicked();
   puu.mouseClicked();
}
  
  

