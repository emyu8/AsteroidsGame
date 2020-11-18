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
    public void brake() {
      myXspeed *= 0.7;
      myYspeed *= 0.7;
    }
    public void hyperspace() {
      myCenterX = (int)(Math.random()*width)-10;
      myCenterY = (int)(Math.random()*height)-10;
    }
}
