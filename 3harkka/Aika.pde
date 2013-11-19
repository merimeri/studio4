class Time {

int begin;


Time() {
 begin = millis();
 println("alku" + begin);
 

}

int points() {
  println(begin);
  int timenow = millis();
  println("nyt ennen: " + timenow);
  int time = timenow-begin;
  println("aika" + time);
  int point = timenow/1000;
  println(point);
  
  return point;
  
}


}
