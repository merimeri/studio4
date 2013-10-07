import java.io.FileNotFoundException;
import java.io.IOException;


Namiska nappula = new Namiska(600,50,25,25);
Namiska nappula2 = new Namiska(700,50,25,25);
BufferedReader reader;
String line;
  String[] info;
  String[] tefy;
  String[] tik;
  String[] tuta;
  String[] kaikki;
  
Puu infoPuu = new Puu(200, 600, 400, 50);  

void setup(){
  size(800, 800);
  // Open the file from the createWriter() example
  reader = createReader("palkkatilastot.txt");    
  luoPalkkataulukot();

}

void draw(){
  piirraMaa(); 
  piirraValikko();
  nappula.draw();
  nappula2.draw(); 
  infoPuu.draw();
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
  

void testi(){
  for(int i = 0; i < 8; i++){
     println(kaikki[i]);
  }  
    
}  
  
void mouseClicked() {
   nappula.mouseClicked();  
   nappula2.mouseClicked();
}
  
  
class Namiska {
  int x;  
  int y;
  int leveys;
  int korkeus;
  boolean painettu; // false jos ei panettu, muuten true

  Namiska (int x, int y, int korkeus, int leveys) {
    this.x = x;
    this.y = y;
    this.leveys = leveys;
    this.korkeus = korkeus;
    this.painettu = false;
  }

  void draw() {
    fill(255);  
    ellipseMode(CENTER);  
    ellipse(this.x, this.y, this.leveys, this.korkeus);
    if(this.painettu){
      fill(0);
      ellipse(this.x, this.y, this.leveys/2, this.korkeus/2);
    }      
  }

  void mouseClicked() {
    
    if(overCircle(this.x, this.y,this.leveys/2)){
      if(this.painettu){
        this.painettu = false;       
      }else{
        this.painettu = true;
      }  
    }  
  }
}    

/**
*Returns true, if the cursor is inside the rectangle described in the parameters.
**/
boolean overRect(int x, int y, int leveys, int korkeus)  {

  if (mouseX >= x && mouseX <= x+leveys && 
      mouseY >= y && mouseY <= y+korkeus) {
    return true;
  } else {
    return false;
  }
}  

/**
*Returns true, if the cursor is inside the circle described in the parameters.
*Otherwise returns false.
**/
boolean overCircle(int x, int y, int radius){
  if(pow((x - mouseX),2) + pow((y - mouseY),2) <= pow(radius,2)){
    return true;
  }else{
    return false;  
  } 
}
