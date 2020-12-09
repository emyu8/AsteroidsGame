class Bullet extends Floater {
  public Bullet(Spaceship theShip){
    myCenterX = theShip.getspaceX();
    myCenterY = theShip.getspaceY();
    myPointDirection = theShip.getpointDirection();
    accelerate(6);
    
    myColor = color(255, 0, 0);
    
  }
  
  public void update(Spaceship theShip) { //updates the coordinates of bullet to new spaceship coordinates
     myCenterX = theShip.getspaceX();
    myCenterY = theShip.getspaceY();
    myPointDirection = theShip.getpointDirection();
   // myXspeed = theShip.getxSpeed();
   // myYspeed = theShip.getySpeed();
  }
  
  public void show() {
    
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
     rect(5, -1, 40, 2);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  
  public void move(){
     //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
  }
  public float getX(){return (float)myCenterX;}
  public float getY(){return (float)myCenterY;}
  
  
}
