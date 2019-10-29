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

  void show() {
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
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
