/*
Luokka vastaa inforuudun toteutuksesta
*/
class Inforuutu {
  Nappula nappula;
  
  void draw() {
    fill(224);
    strokeWeight(1);
    rect(540,35, 255, 370, 7); 
    fill(1);
    textSize(10);
    text("Sulje inforuutu klikkaamalla uudestaan", 590, 55); 
    textSize(18);
    text("Suunnittele oma desingnisi!\n", 560, 85);
    textSize(16);
    text("Lataa oma kuva tietokoneeltasi \ntai hyödynnä valmiita kuvia\ngalleriasta.",560, 110);
    text("Voit muokata haluamastasi\nkuvasta uudenlaisen desingnin \nja tallentaa sen koneellesi.", 560, 200);
    text("Jos luotu design ei miellytä \nvielä, voit ladata kuvasi \nuudestaan ja muokata sen. \nJokainen muokkauskerta luo \nuniikin taideteoksen!", 560, 290);
  }
 
}
