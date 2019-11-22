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
    direction = new PVector(0, -0.1);
  }
  //3 Behaviour function
  void show() {
    if(invincible==true){ t=255;
    t=100;
 } else { t=255;}
      

    pushMatrix();
          tint(t);
    translate(location.x, location.y);
    rotate(direction.heading());
    if (wkey){    image(ship2img, 0, 0); } else {
    image(shipimg, 0, 0);}
    popMatrix();
    tint(255);
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
bulletcd=bulletcd-1;
if(bulletcd<=0){
    if (spacekey){ mygameObjects.add(new Bullet());
 laser.play();
 laser.rewind();
if( btimer>0){bulletcd=5;    } else {
    bulletcd=10;}
}
  }
}
}
