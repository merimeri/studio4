import ddf.minim.*;

class Voice {

Minim minim;
AudioInput in;

Voice()
{
   minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
 in = minim.getLineIn(Minim.MONO, 512);
}

void draw() {
 
  float voima = 0;
  voima = in.mix.level();
  if(voima > 0.2) {
    println(in.mix.level());
   }

  }
}
