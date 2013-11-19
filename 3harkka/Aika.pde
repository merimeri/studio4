class Time {

int begin = millis();




Time() {
 println(begin);


}
 

/*void draw() {
  time = millis();
  println(time);
  point = time/1000;
  println(point);

 
}*/


int points() {
  int timenow = millis();
  println(timenow);
  int point = time/1000;
  println(point);
  
  return point;
  
}
}
