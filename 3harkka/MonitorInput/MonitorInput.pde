/**
  * This sketch demonstrates how to monitor the currently active audio input 
  * of the computer using an <code>AudioInput</code>. What you will actually 
  * be monitoring depends on the current settings of the machine the sketch is running on. 
  * Typically, you will be monitoring the built-in microphone, but if running on a desktop
  * its feasible that the user may have the actual audio output of the computer 
  * as the active audio input, or something else entirely.
  * <p>
  * When you run your sketch as an applet you will need to sign it in order to get an input. 
  */

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
 
  in.printControls();
  //in.setGain(2);
  // uncomment this line to *hear* what is being monitored, in addition to seeing it
 //in.enableMonitoring();

 
}

void draw()
{
  background(0);
  stroke(255);
  float voima = 0;
  
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    voima = in.mix.level();
   if(voima > 0.2) {
    println(in.mix.level());
   }
   // if (in.hasControl(Controller.GAIN)) {
    //  println(in.getGain());
      text("The current gain value is " + in.getGain() + ".", 5, 60);
  //  line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
  //  line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }
}

