abstract class GameObject {
  int lives;
  int size;
  PVector location;
  PVector velocity;

  GameObject() {
  }

  void show() {
  }

  void act() {
    
    //gravity.setMag( min(10/dist(location.x, location.y, width/2, height/2), 10));
    location.add(velocity);
   
    if (location.y < -50) location.y = height+50;
    if (location.y > height+50) location.y = -50;
    if (location.x < -50) location.x = width+50;
    if (location.x > width+50) location.x = -50;
  }
}
