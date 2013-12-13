/*Class to play th ebackground music and 
* to track the music volume. The fire in the model responses
* to the sound level of the music and also to the microphone 
* sound level.
*/
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
