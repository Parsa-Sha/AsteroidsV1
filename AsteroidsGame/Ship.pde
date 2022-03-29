class Ship extends GameObject {

  //1. Instance variables
  PVector direction;
  int shotTimer;
  int threshold;
  
  int invincibilityThreshold;
  int invincibilityFrames;
    
  //2. Constructor(s)
  Ship() {
    lives = 3;
    shotTimer = 0;
    threshold = 30;
    
    location = new PVector(width/2, height/2);   
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);

    invincibilityThreshold = 120;
    invincibilityFrames = 0;
  }

  //3. Behaviour functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate( direction.heading() );
    stroke(0,255,0);
    noFill();
    //image(shipImage, 0, 0, 48, 27);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
    
    stroke(197, 255, 179);
    pushMatrix();
    translate(location.x, location.y);
    rotate(-HALF_PI);
    arc(0, 0, 30, 30, 0, min(invincibilityThreshold, invincibilityFrames)*TWO_PI/invincibilityThreshold);
    arc(0, 0, 15, 15, 0, min(threshold, shotTimer)*TWO_PI/threshold);
    popMatrix();
  }

  void act() {
    super.act();

    shotTimer++;
    invincibilityFrames++;
    
    if (upkey){
      velocity.add(direction);
      myGameObjects.add(new Fire()); // Fire does not appear to be working
    }
    
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate( -radians(2) );
    if (rightkey) direction.rotate( radians(2) );
    if (spacekey && shotTimer >= threshold) { 
      myGameObjects.add(new Bullet());
      shotTimer = 0;
    }
        
    if (velocity.mag() > 5) velocity.setMag(5);
    
    for(int i = 0; i < myGameObjects.size(); i++){ // Checking every object
      GameObject myObj = myGameObjects.get(i);
      
      if(
        myObj.location.x >= location.x-myObj.size && myObj.location.x <= location.x+myObj.size && // If any object is within bounding box
        myObj.location.y >= location.y-myObj.size && myObj.location.y <= location.y+myObj.size &&
        myObj instanceof Asteroid &&  // Disabling friendly fire
        invincibilityFrames > invincibilityThreshold // Including invincibility frames
        ){
        invincibilityFrames = 0; // Start invincibility frames
        myGameObjects.add(new Asteroid(myObj.size/2, myObj.location.x, myObj.location.y)); // Spawn two new asteroids and destroy the current one
        myGameObjects.add(new Asteroid(myObj.size/2, myObj.location.x, myObj.location.y));
        myGameObjects.remove(i);
        lives--; // Decrease lives
      }
    }
    
    if(myShip.lives == 0) mode = GAMEOVER;    
  }
}
