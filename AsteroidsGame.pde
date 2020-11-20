//your variable declarations here
public Spaceship falcon = new Spaceship();
public Star [] galaxy = new Star[450];
public int start; //used for timing animations
public boolean triggerH = false; //stores whether or not hyperspace has been triggered

public void setup() 
{
  //your code here
  background(0);
  size(1200, 600);
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
  if(triggerH){ // if hyperspace has been triggere (by SPACE)
  for(int i = 0; i < galaxy.length; i++){ // play the zoop animation
    galaxy[i].zoop();
  }
  if(millis()-start > 1800){
    triggerH = false; //stop animation after 1.8 seconds, reset all variables
    for(int i = 0; i < galaxy.length; i++){
        galaxy[i].setsTail(1.7);
      }
    falcon.hyperspace(); //make the jump to hyperspace!
    }
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
  System.out.println("Ya clicked it");
  System.out.println(start);
 
  }
}
