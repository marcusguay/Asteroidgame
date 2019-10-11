class Bullet extends GameObject {
  int timer;
  Bullet() {

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
    ellipse(location.x+25, location.y, 5, 5); 
    ellipse(location.x-25, location.y, 5, 5);
  }

  void act() {
    super.act();
    timer--;
    if (timer==0) {
      lives=0;
    }
  }
}
