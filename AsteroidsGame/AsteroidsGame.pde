// Parralax, background 4 pngs move according to ships position
// Slight adjustments to make it look 3D


boolean upkey, downkey, leftkey, rightkey, spacekey;
PImage shipimg;
Ship myShip;
ArrayList<GameObject> myGameObjects;

PImage shipImage, bgImage;

final int GAME = 0;
final int GAMEOVER = 1;
final int GAMEWON = 2;
final int INTRO = 3;
int mode = GAME;

int asteroidCount = 3;

void setup() {
  size(960, 540); // 
  imageMode(CENTER);
  rectMode(CENTER);
  
  myShip = new Ship();
  myGameObjects = new ArrayList<GameObject>();
  
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  
  shipImage = loadImage("ship.png");
  bgImage = loadImage("bg.png");
}

void draw() {
  switch(mode){
    case INTRO:
    intro();
    break;
    case GAME:
    game();
    break;
    case GAMEOVER:
    gameover();
    break;
    case GAMEWON:
    gamewon();
    break;
    default:
    println("MODE ERROR. MODE = " + mode);
  }
}

void keyPressed() {
  if (keyCode == UP || key == 'w')    upkey = true; 
  if (keyCode == DOWN || key == 's')  downkey = true;
  if (keyCode == LEFT || key == 'a')  leftkey = true;
  if (keyCode == RIGHT || key == 'd') rightkey = true;
  if (key == ' ')                     spacekey = true;
}

void keyReleased() {
  if (keyCode == UP || key == 'w')    upkey = false; 
  if (keyCode == DOWN || key == 's')  downkey = false;
  if (keyCode == LEFT || key == 'a')  leftkey = false;
  if (keyCode == RIGHT || key == 'd') rightkey = false;
  if (key == ' ')                     spacekey = false;
}
