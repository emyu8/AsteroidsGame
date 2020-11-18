//your variable declarations here
Spaceship falcon = new Spaceship();
public void setup() 
{
  //your code here
  background(0);
  size(1000, 800);
}
public void draw() 
{
  //your code here
  background(0);
  falcon.move();
  falcon.show();
  
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
  background(0);
  falcon.accelerate(0.1);
  falcon.show();
  }
  if(key == 'a'){
  background(0);
  falcon.turn(-10);
  falcon.show();
  }
  if(key == 'd'){
  background(0);
  falcon.turn(10);
  falcon.show();
  }
  if(key == 's'){
  background(0);
  falcon.brake();
  falcon.show();
  }
  if(key == ' '){
  background(0);
  falcon.hyperspace();
  falcon.show();
  }
}
