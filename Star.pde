class Star //note that this class does NOT extend Floater
{
  //your code here
   private int sColor;
   private int sX, sY;
   
  public Star() {
    sColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    sX = (int)(Math.random()*width);
    sY = (int)(Math.random()*height);
  }
  public void show() {
    noStroke();
    fill(sColor);
    ellipse(sX, sY, 3, 3);
  }
  
}
