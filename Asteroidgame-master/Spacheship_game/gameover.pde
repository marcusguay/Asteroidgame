void gameover(){
 background(#4F535A);
fill(255);
text("GAMEOVER",width/2,height/2);
text(highscore+"Highscore",100,100);
   textSize(50);
text("You had" + points+ "points last round" ,00,400);
if (lastpoints < points){
  highscore=points;}
  
  if (highscore < lasthighscore){
 text("new highscore",100,300);}
  lastpoints=points;
}
