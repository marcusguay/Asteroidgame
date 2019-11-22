void play(){
background(0);
xx=400;
yy=300;
 if(pcd < 0){
   mygameObjects.add(new powerups(random(0,4))); 
   pcd=500;
   
 }
 pcd=pcd-1;
 
 text(pcd,100,300);
 
 stimer=stimer-1;
 btimer=btimer-1;
parttimer=parttimer-1;
   tint(255);
d=random(0,TWO_PI);
if(ufolives<=0){
  mode=gameover;}

if(invincible==true){
ITimer=ITimer-1; }

if(ITimer<=0){
 invincible=false; 
  
}


fill(255);
 text("Lives" + ufolives,100,100);
 text("points"+points,100,200);
timer=timer-1;  




  
if (timer <=0){  timer=150;
  mygameObjects.add(new Asteroid());  }

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
