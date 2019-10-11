class Ship extends GameObject {
  //1. Instance Variables
  
  PVector direction;


  //2. Constructor(s)
  Ship() {
    lives=3;
    location= new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }
  //3 Behaviour function
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(shipimg, 0, 0);
    popMatrix();
  }


  void act() {
    super.act();
    location.add(velocity);
    if (wkey)
      velocity.add(direction);


    if (skey)
      velocity.sub(direction);


    if (akey) direction.rotate (-radians(2));
    if (dkey) direction.rotate ( radians(2));

    if (spacekey) mygameObjects.add(new Bullet());
  }
}
