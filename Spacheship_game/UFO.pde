class UFO extends GameObject{
  float fvelocity;
  
  UFO(){
    size=75;
    size=75;
  

    lives=3;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,1);
    velocity.setMag(1 );
    velocity.rotate( random(TWO_PI) );
  }
  
  public void show(){
 text(ufocd,200,300);
   image(ufoimg, location.x, location.y);
    }
  
 public void act(){
 ufotimer=100;
   ufocd=ufocd-1;
   if(ufocd>=0){
     super.act();
    
    } else {
       lives=0;
     ufotimer=100; 
      
    }
  
  
}
}
     
    
