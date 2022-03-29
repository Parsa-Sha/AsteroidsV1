class Fire extends GameObject {

  int timer;

  Fire() {
    size = 16;
    timer = 200;
    location = myShip.location.copy();
    velocity = myShip.direction.copy();
    velocity.rotate(PI + random(-0.2, 0.2));
    velocity.setMag(5);
    
    
    // Include rotation after translation
    
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading() - HALF_PI);
    stroke(254, 60, 6, timer*10);
    square(0, 0+size*2, size);
    stroke(250, 104, 5, timer*10);
    square(0, 0+size*2.5, size/2);
    stroke(255, 242, 95, timer*10);
    square(0, 0+size*2.75, size/4);
    popMatrix();
  }

  void act() {
    super.act();
    timer--;
    if (timer == 0) lives--;
  }
}
