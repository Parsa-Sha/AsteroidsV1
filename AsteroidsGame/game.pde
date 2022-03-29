void game() {
  image(bgImage, width/2, height/2);
  textSize(40);
  textAlign(LEFT);
  text("Lives: " + myShip.lives, 10, 40);
  textAlign(RIGHT);
  text("Asteroids Remaining: "+ asteroidCount, width-10, 40);
  if(asteroidCount == 0) mode = GAMEWON;
  
  myShip.show();
  myShip.act();
  
  int i = 0;
  while(i < myGameObjects.size()) {
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives == 0) {
       myGameObjects.remove(i); 
    } else {
       i++;
    }
  }
}
