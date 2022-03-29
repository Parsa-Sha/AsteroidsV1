class Asteroid extends GameObject {

  PVector finalPos;

  Asteroid() {
    lives = 1;
    size = 100;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 1);
    velocity.setMag( random(0, 2) );
    velocity.rotate( random(TWO_PI) );
    
    finalPos = location;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    size = s;
    location = new PVector(x, y);
    velocity = new PVector(0, 1);
    velocity.setMag( random(0, 2) );
    velocity.rotate( random(TWO_PI) );
  }

  void show() {
    stroke(0,255,0);
    noFill();
    beginShape();
    for(int i = 0; i < 30; i++) { // Noise distance and index based angle and using radial to coords
      vertex(cos((360 / 30 * i) * (PI / 180)) * (size/2 + noise(i)*(size/4)) + location.x, sin((360 / 30 * i) * (PI / 180)) * (size/2 + noise(i)*(size/4)) + location.y);
    }
    endShape(CLOSE);
  }

  void act() {
    super.act();
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives = 0;
          myObj.lives = 0;
          asteroidCount--;
          if (size > 15) {
            myGameObjects.add(new Asteroid(size/2, location.x, location.y));
            myGameObjects.add(new Asteroid(size/2, location.x, location.y));
            asteroidCount += 2;
          }
        }
      }
    }
  }
}
