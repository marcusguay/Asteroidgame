           class Bullet extends GameObject {
  int timer;
  float lazerx;
  float lazery;
  Bullet() {
     timer=50;
     size=10;
    location=new PVector(myShip.location.x, myShip.location.y);
    velocity=new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(15);
    // location.x=new PVector(myShip.location.x,myShip.location.y);
    //location.y=myShip.location.y;
    //velocity.x=myShip.direction.x;
    // velocity.y=myShip.direction.y;
  }
  void show() {
    fill(#6E89E8);
   // ellipse(location.x, location.y, size, size); 
   fill(#03A7FC);
       ellipse(location.x, location.y, size, size); 
      
  }

  void act() {
    super.act();
    
    timer--;
    if (timer==0) {
      lives=0;
    }
  }
}
