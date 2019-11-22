import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
AudioPlayer explosion2;
AudioPlayer laser;
AudioPlayer explosion;
AudioPlayer ufo;
Minim minim;
int pcd;

int btimer;
 int stimer;
boolean akey, dkey, skey, wkey, spacekey;
PImage shipimg;
PImage ship2img;
PImage ufoimg;
int mode; 
float d;
int parttimer=10;
float xx, yy;
int lastpoints;
int ufolives;
float t;
int highscore;
int ITimer;
int lasthighscore;
float UX, UY;
float URX, URY;
boolean invincible;
float positionx;
float positiony;
int ufotimer;
int ufocd;
int lives;
int points;
int modetimer;
float UFOTIMER;
float ax=width/2, ay=height/2;
final int intro = 0;
final int play =1;
final int gameover=2;
int timer;
ArrayList<GameObject> mygameObjects;
Ship myShip;
UFO myUFO;
Particle myPart;
public void setup() {
  minim= new Minim(this);
  explosion2=minim.loadFile("explosion2.wav");
  laser=minim.loadFile("fire.wav");
  explosion=minim.loadFile("bangLarge.wav");
  ufo=minim.loadFile("saucerBig.wav"); 
  size(800, 600);
  ITimer=0;
  textSize(50);
  timer=30;

  float t=255;
  boolean invincible = false;
  ship2img=loadImage("spaceshipcopy.png");
  shipimg=loadImage("spaceship.png");
  ufoimg=loadImage("ufo.png");
  imageMode(CENTER);
  mygameObjects= new ArrayList<GameObject>();
  myShip=new Ship();
  ufolives=10;
  myUFO=new UFO();

  mygameObjects.add(myShip);
  mygameObjects.add(new UFO());


  shipimg.resize(75, 75);
  ship2img.resize(75, 75);
  ufoimg.resize(75, 75);
}

public void draw() {   
  modetimer=modetimer-1;
  if (mode== intro) {
    intro();
  } else if (mode== play) {
    play();
  } else if (mode==gameover) {
    gameover();
  } else { 
    println("Mode Error" + mode);
  }
}


public void keyPressed() {
  if (key=='a') akey = true;
  if (key=='d') dkey = true;
  if (key=='s') skey = true;
  if (key=='w') wkey = true;    
  if (key==' ') spacekey=true;
}


public void keyReleased() {
  if (key=='a') akey = false;
  if (key=='d') dkey = false;
  if (key=='s') skey = false;
  if (key=='w') wkey = false;
  if (key==' ') spacekey= false;
}

public void mouseReleased() {
  if (mode== intro) {
    setup();
    mode=play;
  } else if (mode==gameover && modetimer<=0) {
    mode = intro;
  }
}
