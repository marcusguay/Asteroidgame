void play(){
background(0);

 text("lives"+lives,100,100);
 text("points"+points,100,200);
timer=timer-1;  
text(ufotimer,200,200);
if(ufotimer>0){
  ufotimer=ufotimer-1; }
if (ufotimer<=0){
mygameObjects.add(new UFO());

 ufocd=1000;
}
  
if (timer <=0){  timer=100;
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
