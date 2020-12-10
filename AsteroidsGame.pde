//your variable declarations here
public Spaceship falcon = new Spaceship();
public Star [] galaxy = new Star[450];
public ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
public ArrayList <Bullet> bullets = new ArrayList <Bullet>();


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
  
  
  for(int i = 0; i < galaxy.length; i++){
    galaxy[i].show();
  }
  
  for(int i = 0; i < rocks.size(); i++){
    rocks.get(i).show();
    rocks.get(i).move();
    
    if(dist(falcon.getspaceX(), falcon.getspaceY(), rocks.get(i).getastX(), rocks.get(i).getastY()) < 40){ 
      rocks.remove(i); //destroy all asteroids the spaceship comes near
    }
  
    for(int b = 0; b < bullets.size(); b++){
      if(rocks.size() > 0 && dist(rocks.get(i).getastX(), rocks.get(i).getastY(), bullets.get(b).getX(),  bullets.get(b).getY()) < 40){ //CHANGE SO THAT IT CHECKS FOR EVERY ASTEROID
        bullets.remove(b);
        rocks.remove(i);
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
  
  

    /*if(keyPressed && key == 'q'){ //key == CODED && keyCode == SHIFT){
      System.out.println("ya pressed shift!");
        bullets.add(new Bullet(falcon));
    }*/
    
    for(int b = 0; b < bullets.size(); b++){
      bullets.get(b).move();
      bullets.get(b).show();
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
    System.out.println("ya pressed shift!");
    bullets.add(new Bullet(falcon));
  }
}
