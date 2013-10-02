import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

Namiska nappula = new Namiska(200,200,50,50);


void setup(){
  size(800, 800);
  luoPalkkataulukot();
}

void draw(){
  nappula.draw();
}  
  
  String[] info;
  String[] tefy;
  String[] tik;
  String[] tuta;
  String[] kaikki;
  /**
   * Metodi, joka luo pelin kaikki mahdolliset radat ja tallentaa ne luokalle
   */
  public void luoPalkkataulukot(){
    try {
      FileInputStream fis = new FileInputStream("palkkatilastot.txt");
      InputStreamReader in = new InputStreamReader(fis);
      BufferedReader lukija = new BufferedReader(in);
      String rivi;
      int i = 0;
      while ((rivi = lukija.readLine()) != null) {
        i++;
        System.out.println(i);
        System.out.println(rivi);
        if(i==1){
          info = rivi.split(" ");
        }else if(i==2){
          tefy = rivi.split(" ");
        }else if(i==3){
          tik = rivi.split(" ");
        }else if(i == 4){
          tuta = rivi.split(" ");
        }else{
          kaikki = rivi.split(" ");
        }
          
      }

    lukija.close();    
    } catch (FileNotFoundException e) {
      System.out.println("File not found!");
    } catch (IOException e) {
      System.out.println("nonne!!!!!!!");
    }  
  }
  
  void mouseClicked() {
   nappula.mouseClicked();  
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
