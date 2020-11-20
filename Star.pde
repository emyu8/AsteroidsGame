class Star //note that this class does NOT extend Floater
{
  //your code here
   private int sColor;
   private int sX, sY;
   private double sAng, sDistance;
   private float sTail;
   
  public Star() {
    // took a different approach to assigning variables, each particle is assigned a random angle and distance from the center
    sColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    sAng = Math.random()*2*Math.PI;
    sDistance = (int)(Math.random()*Math.pow(Math.pow(width/2, 2)+Math.pow(height/2, 2),0.5 )); //ranges from 0 to longest possible distance
    sX = (int)(sDistance*Math.cos(sAng))+width/2;
    sY = (int)(sDistance*Math.sin(sAng))+height/2;
    sTail = 1.7; //starting "zoop" speed
  }
  public void show() {
    noStroke();
    fill(sColor);
    ellipse(sX, sY, 3, 3);
  }
  
  public void zoop() {
    stroke(sColor);
    strokeWeight(3);
    line(sX, sY, sX-(float)(Math.cos(sAng)*sTail), sY-(float)(Math.sin(sAng)*sTail));
    
    // while the distance of the endpoint from the center is greater than 10, accelerate the zoop
    if(dist(sX-(float)(Math.cos(sAng)*sTail), sY-(float)(Math.sin(sAng)*sTail), width/2, height/2) > 20){
    sTail*= 1.07;
    
    }
  }
  //getters and setters
  public int getsX(){return sX;}
  public int getsY(){return sY;}
  public float getsTail(){return sTail;}
  public void setsTail(float t){sTail = t;}
}
