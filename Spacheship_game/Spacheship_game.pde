boolean akey, dkey, skey, wkey, spacekey;
PImage shipimg;
ArrayList<GameObject> mygameObjects;
Ship myShip;
void setup() {
  size(800, 600);  
  shipimg=loadImage("spaceship.jpg");
  imageMode(CENTER);
  mygameObjects= new ArrayList<GameObject>();
  myShip=new Ship();
  mygameObjects.add(myShip);
  shipimg.resize(75, 75);
}

void draw() {
  background(0);


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


void keyPressed() {
  if (key=='a') akey = true;
  if (key=='d') dkey = true;
  if (key=='s') skey = true;
  if (key=='w') wkey = true;    
  if (key==' ') spacekey=true;
}


void keyReleased() {
  if (key=='a') akey = false;
  if (key=='d') dkey = false;
  if (key=='s') skey = false;
  if (key=='w') wkey = false;
  if (key==' ') spacekey= false;
}
