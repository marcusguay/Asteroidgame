class Particle extends GameObject {

  Particle() {
  }

  Particle(PVector incominglocation,float incomingfvelocity) {
    location= incominglocation;
    velocity = new PVector(0, 1);
    velocity.rotate( random(0,360) );
    velocity.setMag( random(0, 2) );
    size=1;
    timer=100;
  }

  void show() {
    fill(#F2D7EE);
    ellipse (location.x, location.y, size, size);
   
  }
  void act() { 
    super.act();

    timer=timer-1;
    if (timer<=0) {
      lives=0;
    }
  }
}
