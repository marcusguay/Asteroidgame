import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Spacheship_game extends PApplet {

boolean akey, dkey, skey, wkey, spacekey;
PImage shipimg;
PImage ufoimg;
int mode; 
int ufotimer;
int ufocd;
int lives;
int points;
int modetimer;
final int intro = 0;
final int play =1;
final int gameover=2;
int timer;
ArrayList<GameObject> mygameObjects;
Ship myShip;
UFO myUFO;
Particle myPart;
public void setup() {

  timer=30;
    
  shipimg=loadImage("spaceship.png");
    ufoimg=loadImage("ufo.png");
  imageMode(CENTER);
  mygameObjects= new ArrayList<GameObject>();
  myShip=new Ship();
  myUFO=new UFO();
   myPart= new Particle();
  mygameObjects.add(myShip);
  ufotimer=100;

 
  shipimg.resize(75, 75);
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
    mode=play;
  } else if (mode==gameover && modetimer<=0) {
    mode = intro;
  }
}
           class Bullet extends GameObject {
  int timer;
  float lazerx;
  float lazery;
  Bullet() {
     timer=30;
     size=10;
    location=new PVector(myShip.location.x, myShip.location.y);
    velocity=new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(15);
    // location.x=new PVector(myShip.location.x,myShip.location.y);
    //location.y=myShip.location.y;
    //velocity.x=myShip.direction.x;
    // velocity.y=myShip.direction.y;
  }
  public void show() {
    fill(0xff6E89E8);
   // ellipse(location.x, location.y, size, size); 
       ellipse(location.x, location.y, size, size); 
  }

  public void act() {
    super.act();
    
    timer--;
    if (timer==0) {
      lives=0;
    }
  }
}
abstract class GameObject {
  int timer;
  int lives;
  PVector location;
  PVector direction;
  PVector velocity;
  PVector gravity;
  int size;
  GameObject() {
    lives=1;
  }

  public void show() {
  }

  public void act() {
//gravity=new PVector( width/2-location.x,height/2-location.y);
    location.add(velocity);
 //velocity.add(gravity);
    if (location.y< -50) location.y=height+50;
    if (location.y > height+50) location.y=-50;
    if (location.x < -50) location.x=width+50;
    if (location.x > width+50) location.x=-50;
  }
}
class Ship extends GameObject {
  //1. Instance Variables
  
  PVector direction;
  int bulletcd;

  //2. Constructor(s)
  Ship() {
    size=75;
    lives=3;
    location= new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1f);
  }
  //3 Behaviour function
  public void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(shipimg, 0, 0);
    popMatrix();
  }


  public void act() {
    super.act();

    location.add(velocity);
    if (wkey)
      velocity.add(direction);


    if (skey)
      velocity.sub(direction);


    if (akey) direction.rotate (-radians(2));
    if (dkey) direction.rotate ( radians(2));
bulletcd=bulletcd-1;
if(bulletcd<=0){
    if (spacekey) mygameObjects.add(new Bullet());
    bulletcd=10;
}
  }
}
class UFO extends GameObject{
  float fvelocity;

  UFO(){
    size=75;
  

    lives=3;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,1);
    velocity.setMag(1 );
    velocity.rotate( random(TWO_PI) );
  }
  
  public void show(){
 text(ufocd,200,300);
   image(ufoimg, location.x, location.y);
    }
  
 public void act(){
 ufotimer=100;
   ufocd=ufocd-1;
   if(ufocd>=0){
     super.act();
    
    } else {
       lives=0;
     ufotimer=100; 
      
    }
  
  
}
    
     
    }
      //(in bullet) velocity=newPVector(target.x,-a.x,target.y-a.y)
      //velocity.setMag(5);
    

  
  
  
  

class Asteroid extends GameObject {
 float fvelocity;
  Asteroid() {
    lives = 1;
    size = 100;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 1);
    velocity.setMag( random(0, 2) );
    velocity.rotate( random(TWO_PI) );
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    size = s;
    location = new PVector(x, y);
    velocity = new PVector(0, 1);
    velocity.setMag( random(0, 2) );
    velocity.rotate( random(TWO_PI) );
  }

  public void show() {
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  public void act() {
    super.act();
  fvelocity=( random(TWO_PI) );
    int i = 0;
    while (i <mygameObjects.size()) {
      GameObject myObj = mygameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives = 0;
          mygameObjects.add(new Particle(location,fvelocity));
        
          myObj.lives = 0;
          points=points+1;

          if (size>25) {
            mygameObjects.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }

      i++;
    }
    int j = 0;
    while (j <mygameObjects.size()) {
      GameObject myObj = mygameObjects.get(j);
      if (myObj instanceof Ship) {
        if (dist(myShip.location.x, myShip.location.y, location.x, location.y) < size/2 + myShip.size/2) {
          text("oh on jah", 100, 100);
          //myObj.lives = 0;
          lives=0;
          if (size>25) {
            mygameObjects.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }
      j++;
    }
  }
}
public void gameover(){
  background(0xff4F535A);
text("L",width/2,height/2);

}
public void intro(){
 background(0xffFF7171);
  
  L();
  
  
}

public void L(){
  
   text("L",100,100);
   
}
class Particle extends GameObject {

  Particle() {
  }

  Particle(PVector incominglocation,float incomingfvelocity) {
    location= incominglocation;
    velocity = new PVector(0, 1);
    velocity.rotate( incomingfvelocity );
    velocity.setMag( random(0, 2) );
    size=1;
    timer=100;
  }

  public void show() {
    fill(0xffF2D7EE);
    ellipse (location.x, location.y, size, size);
   
  }
  public void act() { 
    super.act();

    timer=timer-1;
    if (timer<=0) {
      lives=0;
    }
  }
}
public void play(){

 background(0);

 text("lives"+lives,100,100);
 text("points"+points,100,200);
timer=timer-1;  
text(ufotimer,200,200);
if(ufotimer>0){
  ufotimer=ufotimer-1; }
if (ufotimer<=0){
mygameObjects.add(new UFO());

 ufocd=1000;
}
  
if (timer <=0){  timer=100;
  mygameObjects.add(new Asteroid());  }

  int i=0;
  while (i< mygameObjects.size()) {
    GameObject myObj =  mygameObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives==0) {
     mygameObjects.remove(i);
   } else { 
      i++;
    }
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Spacheship_game" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
