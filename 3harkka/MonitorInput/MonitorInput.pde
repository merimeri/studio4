import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(512, 200, P3D);
  tee();
}
void tee() {
  minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
 in = minim.getLineIn(Minim.MONO, 512);
 
}

void draw()
{
  background(0);
  stroke(255);
  float voima = 0;
  voima = in.mix.level();
  if(voima > 0.1) {
    println(in.mix.level());
   }

}

