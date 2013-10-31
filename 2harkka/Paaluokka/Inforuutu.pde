class Inforuutu {
  Nappula nappula;
  
  void draw() {
    fill(224);
    rect(540,35, 255, 350, 7); 
    fill(1); 
    textSize(18);
    text("Suunnittele oma desingnisi!\n", 560, 60);
    textSize(16);
    text("Lataa oma kuva tietokoneeltasi \ntai hyödynnä valmiita kuvia\ngalleriasta.",560, 90);
    text("Voit muokata haluamastasi\nkuvasta uudenlaisen desingnin \nja tallentaa sen koneellesi.", 560, 180);
    text("Jos luotu design ei miellytä \nvielä, voit ladata kuvasi \nuudestaan ja muokata sen. \nJokainen muokkauskerta luo \nuniikin taideteoksen!", 560, 270);
  }
 
}
