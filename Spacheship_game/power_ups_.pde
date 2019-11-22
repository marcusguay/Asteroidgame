  class powerups extends GameObject{
 float cdtype;
    powerups(float j){
         lives = 1;
    size = 25;
    location = new PVector(random(width), random(height));
        cdtype=j;
    }
    
    void show(){
      text(cdtype,200,200);
      if(cdtype<2){
    fill(255);
  text("L",location.x,location.y);
        fill(#F02222);
        ellipse(location.x,location.y,size,size);
        
         }
      if(cdtype>2   
|| cdtype<3){
  fill(255);
  text("B",location.x,location.y);
        fill(#22DDF0);
         ellipse(location.x,location.y,size,size);
         
         }
        if(cdtype>3){
             fill(255);
  text("S",location.x,location.y);
          fill(#22F049);
          ellipse(location.x,location.y,size,size);
        
         }
    }
    
    
    void act(){   
      
  if (dist(location.x, location.y, myShip.location.x, myShip.location.y) < size/2 + myShip.size/2) {
    if(cdtype<2){
        ufolives=ufolives+3;
       lives=0;
         }
      if(cdtype>2 
|| cdtype<3){
      btimer=1000;
      lives=0;
         }
        if(cdtype>3){
       points=points+10;
        lives=0;
         }
    
    
  }
   }
    
  }
