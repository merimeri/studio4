class Sound{
  
  Sample mySample;
  
  Sound(){
    
    mySample = new Sample("tausta.wav"); 
    LiveInput.start(1024);
  } 
  
  public void play(){
    mySample.play();  
    mySample.connectLiveInput(true);
  }
 
}
