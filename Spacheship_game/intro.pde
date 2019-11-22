void intro(){
 
 background(0);
URX=random(0,2);
if (URX==1){
UX=random(-100,0);}
if (URX==2){
UX=random(800,900);}
UY=random(-100,700);
  L();
  
  
}

void L(){
 text("Asteroid Game",200,150);

   
     stroke(255);
    noFill();
    ellipse(600, height/2, 100, 100);
     image(shipimg, 200, height/2);
    
   
}
