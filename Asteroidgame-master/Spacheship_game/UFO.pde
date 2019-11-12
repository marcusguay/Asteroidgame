class UFO extends GameObject {
  float fvelocity;

  UFO() {
    size=75;
    size=75;
    ufocd=100;
    ufotimer=100;
    ufocd=200;
    lives=3;
    location = new PVector(UX,UY);
    velocity = new PVector(100, 0);
    velocity.setMag(4);
  
  }

  public void show() {

    image(ufoimg, location.x, location.y);
  }

  public void act() {
    UFOTIMER=UFOTIMER-1;
    
    if (ufotimer<=0){
      ufocd=200;
      ufotimer=1000;
    }
  
 if(ufocd>0 ){ 
   ufocd=ufocd-1;
     location.x=location.x+velocity.x;
     location.y=location.y+velocity.y;
     positionx=location.x;
     positiony=location.y;
    
      if (UFOTIMER<=0) {
        mygameObjects.add(new UFOBullet()); 
        UFOTIMER=100;
      }
 }
   
   if(ufocd<=0){   
     
     location.x=-100;
     location.y=300;
    }
  
   if(ufotimer>-2 && ufocd<=0){
    ufotimer=ufotimer-1; 

   
    
   

    }
  }
}
