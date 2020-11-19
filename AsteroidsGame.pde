//your variable declarations here
Spaceship falcon = new Spaceship();
Star [] galaxy = new Star[100];
public void setup() 
{
  //your code here
  background(0);
  size(1000, 800);
  for(int i = 0; i < galaxy.length; i++){
    galaxy[i] = new Star();
  }
}
public void draw() 
{
  //your code here
  background(0);
  
  
  for(int i = 0; i < galaxy.length; i++){
    galaxy[i].show();
  }
  falcon.move();
  falcon.show();
  
  if(keyPressed && key == 'w'){
    falcon.engageEngines();
  }
  
}

public void keyPressed() 
{
  /*
  HOW TO PLAY:
  
  W to deploy engines (oaccelerate)
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
 
  falcon.hyperspace();
 
  }
}
