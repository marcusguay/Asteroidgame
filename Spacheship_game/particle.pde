class Particle extends GameObject  {
 float g=1;
 float d;
 int timer;

  PVector location;
  PVector direction;
  PVector velocity;
  int size;
  

  Particle(float incominglocationx,float incominglocationy,float incomingfvelocity) {
    location = new PVector(incominglocationx,incominglocationy);
    velocity = new PVector(0, 1);
    velocity.setMag( random(0, 2) );
    velocity.rotate( random(TWO_PI) );
    size=1;
    lives=1;
    timer=100;
  }

  void show() {
    fill(#F2D7EE);
    ellipse (location.x, location.y, size, size);
   
  }
  void act() { 
   
 
   location.add(velocity);
 
    timer=timer-1;
    if (timer<0) {
      lives=0;
    }
  }
}
