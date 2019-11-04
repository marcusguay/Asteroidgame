  class UFOBullet extends GameObject{
    int timer;
     UFOBullet() {
      timer=100;
    size=10;
    location=new PVector(positionx, positiony);
    velocity=new PVector(myShip.location.x-positionx, myShip.location.y-positiony);
   velocity.setMag(15);
    
  }void show() {
    fill(#6E89E8);

    
       ellipse(location.x, location.y, size, size); 
  }

  void act() {
  location.add(velocity);
    
    timer--;
    if (timer==0) {
      lives=0;
    }
  }
}
  
