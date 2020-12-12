//your variable declarations here
public Spaceship falcon = new Spaceship();
public Star [] galaxy = new Star[450];
public ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
public ArrayList <Bullet> bullets = new ArrayList <Bullet>();
public int score = 0;
public int lives = 4;

public int start; //used for timing animations
public boolean triggerH = false; //stores whether or not hyperspace has been triggered

public void setup() 
{
  //your code here
  background(0);
  size(1000, 800);
  for(int i = 0; i < galaxy.length; i++){
    galaxy[i] = new Star();
  }
  
  for(int i = 0; i < 10; i++){
    rocks.add(new Asteroid());
  }
  
}
public void draw() 
{
  //your code here
  background(0);
  
  
if(lives > 0 && rocks.size() > 0){
  for(int i = 0; i < galaxy.length; i++){
    galaxy[i].show();
  }
  
  for(int i = 0; i < rocks.size(); i++){
    rocks.get(i).show();
    rocks.get(i).move();
    
    if(rocks.size() > 0 && dist(falcon.getspaceX(), falcon.getspaceY(), rocks.get(i).getastX(), rocks.get(i).getastY()) < 40){ 
      rocks.remove(i); //destroy all asteroids the spaceship comes near
      lives--;
    }
  }
  for(int i = 0; i < rocks.size(); i++){
    for(int b = 0; b < bullets.size(); b++){
      if(b < bullets.size() && i < rocks.size() && rocks.size() > 0 && bullets.size() > 0 && dist(rocks.get(i).getastX(), rocks.get(i).getastY(), bullets.get(b).getX(),  bullets.get(b).getY()) < 40){ //CHANGE SO THAT IT CHECKS FOR EVERY ASTEROID
        bullets.remove(b);
        rocks.remove(i);
        score+=100;
      }
    }
  }

  //hyperspace and spaceship maneuvers
  if(triggerH){ // if hyperspace has been triggered (by SPACE)
  for(int i = 0; i < galaxy.length; i++){ // play the zoop animation
    galaxy[i].zoop();
  }
  if(millis()-start > 1800){
    triggerH = false; //stop animation after 1.8 seconds, reset all variables
    for(int i = 0; i < galaxy.length; i++){
        galaxy[i].setsTail(1.7);
      }
    for(int i = 0; i < rocks.size(); i++){ //create new set of asteroids
    rocks.set(i, new Asteroid());
      }
    falcon.hyperspace(); //make the jump to hyperspace!
    }
  }
  
  falcon.move();
  falcon.show();
  
  if(keyPressed && key == 'w'){
    falcon.engageEngines();
  }
    
    for(int b = 0; b < bullets.size(); b++){
      bullets.get(b).move();
      bullets.get(b).show();
    }
    
  fill(255); //display score
  textSize(25);
  text("Score: "+score, 20, 28);
  
  //display healthbar
  textSize(18);
  text("SHIELD STRENGTH", width/2, 20);
  stroke(255);
  strokeWeight(1);
  fill(255, 0, 0);
  rect(200, 30, 700, 10);
  fill(50, 205, 50);
  if(lives > 0){
  rect(200.0, 30.0, 700.0*(lives/4.0), 10.0);
  }
    }
 else if (rocks.size() == 0 && lives > 0){
   fill(255);
    textSize(100);
    text("YOU WIN", 200, 300);
    textSize(30);
    text("Score: " + score, 220, 400);
    text("Press the Q key to restart", 220, 500);
    if(keyPressed && key == 'q'){
      lives = 4;
      score = 0;
      
  for(int i = 0; i < 10; i++){
    rocks.add(new Asteroid());
  }
    }
 }
   else{
    fill(255);
    textSize(100);
    text("GAME OVER", 200, 300);
    textSize(30);
    text("Score: " + score, 220, 400);
    text("Press the Q key to restart", 220, 500);
    if(keyPressed && key == 'q'){
      lives = 4;
      score = 0;
      
      for(int i = 0; i < 10; i++){
        rocks.add(new Asteroid());
      }
      falcon.setxSpeed(0);
      falcon.setySpeed(0);
    }
   
   }
}

public void keyPressed() 
{
  /*
  HOW TO PLAY:
  
  W to deploy engines (accelerate)
  A to rotate clockwise
  D to rotate counterclockwise
  S to deploy brakes 
  SPACE for hyperspace
  */
  if(key == 'w'){

  falcon.accelerate(0.1);

  }
  if(key == 'a'){

  falcon.turn(-10);

  }
  if(key == 'd'){

  falcon.turn(10);

  }
  if(key == 's'){

  falcon.brake();

  }
  if(key == ' '){

  //falcon.hyperspace(); actually, it's triggered after the animation (see draw function)
  
  triggerH = true;
  start = millis();
  }
  if(key == CODED && keyCode == SHIFT){
    
    bullets.add(new Bullet(falcon));
  }
}
