class Spaceship extends Floater  
{   
    //your code here
    public Spaceship() {
      corners = 18;
      xCorners = new int[]{-18, -15, -9, -3, 9, 15, 27, 27, 15, 15, 27, 27, 15, 9, -3, -9, -15, -18};
      yCorners = new int[]{6, 12, 18, 21, 21, 15, 6, 3, 3, -3, -3, -6, -15, -21, -21, -18, -12, -6};
      
      myColor = color(169, 169, 169);
      myCenterX = 255;
      myCenterY = 225;
      
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
    }
    public void engageEngines () {
      //translate the (x,y) center of the ship to the correct position
      translate((float)myCenterX, (float)myCenterY);
      //convert degrees to radians for rotate()     
      float dRadians = (float)(myPointDirection*(Math.PI/180));
    
      //rotate so that the polygon will be drawn in the correct direction
      rotate(dRadians);
      strokeWeight(3);
      stroke(255);
      
      //main white tailight
      line(-9, 18, -15, 12);
      line(-15, 12, -18, 6);
      line(-18, 6, -18, -6);
      line(-18, -6, -15, -12);
      line(-15, -12, -6, -18);
      
      //blue light phase effect
      strokeWeight(5);
      stroke(131, 244, 252, 200);
      line(-12, 18, -18, 12);
      line(-18, 12, -21, 6);
      line(-21, 6, -21, -6);
      line(-21, -6, -18, -12);
      line(-18, -12, -9, -18);
      stroke(131, 244, 252, 130);
      line(-15, 18, -21, 12);
      line(-21, 12, -24, 6);
      line(-24, 6, -24, -6);
      line(-24, -6, -21, -12);
      line(-21, -12, -12, -18);
      
      rotate(-1*dRadians);
      translate(-1*(float)myCenterX, -1*(float)myCenterY);
    }
    public void brake() {
      myXspeed *= 0.7;
      myYspeed *= 0.7;
    }
    public void hyperspace() {
      myCenterX = (int)(Math.random()*width)-10;
      myCenterY = (int)(Math.random()*height)-10;
      
      myPointDirection = (int)(Math.random()*180);
    }
    
}
