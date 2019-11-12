  class UFOBullet extends GameObject{
    int timer;
     UFOBullet() {
      timer=100;
    size=10;
    location=new PVector(positionx, positiony);
    velocity=new PVector(myShip.location.x-positionx, myShip.location.y-positiony);
   velocity.setMag(15);
    
  }void show() {
    fill(#AA0A15);
  
    
       ellipse(location.x, location.y, size, size); 
  }

  void act() {
  location.add(velocity);
  
  
  if (dist(location.x, location.y, myShip.location.x, myShip.location.y) < size/2 + myShip.size/2) {
          lives=0;
  ufolives = ufolives-1; }
    
    timer--;
    if (timer==0) {
      lives=0;
    }
  }
}
  
