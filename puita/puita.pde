void setup() {
  //maaritellaan koko, ladataan kuvat ja maaritetaan ensimmainen piirtovari
  size(720, 480);
  background(255);
  
}

void draw() {
  //fill(12, 35, 87);
  
  //ellipse(40, 40, 40, 40);
  pallot();
  //rect(100,10,30,200);
  fill(0);
  triangle(90, 420, 120, 90, 150, 420);
 triangle(120, 200, 120, 220, 230, 120);
 triangle(120, 180, 120, 200, 50, 140);
 noLoop();
  
}
void pallot() {
  for (int i=0; i<180; i++) {
    fill(15, 150+0.7*i, 1+0.8*i, 90);
    noStroke();
    float randomx = random(10,250);
    float randomy = random(40, 200);
    ellipse(randomx, randomy, 40, 40);
  }
}

/*void pallot() {
  for (int i=0; i<25; i++) {
    fill(12+i, 67+2*i, 12+i, 80);
    noStroke();
    float randomkoko = random(80,220);
    //float randomy = random(40, 200);
    ellipse(10+9*i, 120, randomkoko, randomkoko);
  } 
}*/

