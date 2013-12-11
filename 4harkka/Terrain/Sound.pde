class Sound{
  
  Sample mySample;
  
  Sound(){
    // create a new sample object.
    mySample = new Sample("testi.wav"); 
    LiveInput.start(1024);
  } 
  
  public void play(){
    mySample.play();  
    mySample.connectLiveInput(true);
  }
 
}
