//import java.util.Arrays;//to help with sorting coordinates in order for the asteroids

class Asteroid extends Floater {
  // asteroid shapes are randomly generated with vertices stemming
  // out from a "center" point at random angles (ptAng)
  private float rotSpeed; //asteroid shapes are randomly generated with vertices stemming out from a "center" point at random angles 
  private int size;
  private double[] angles;
  private double temp;
  
  public Asteroid() {
    rotSpeed = (int)(Math.random()*3)+1;
    myXspeed = myYspeed = 0;
    corners = (int)(Math.random()*4)+5; //anywhere from 5-9 corners
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    myCenterX = (float)(Math.random()*(width)); //the "center" point X and Y coordinates
    myCenterY = (float)(Math.random()*(height));
    angles = new double[corners];
 
    size = (int)(Math.random()*5)+50; //distance from the "center" of each vertex
    myColor = color(0, 255, 0);
    
    for(int i = 0; i < angles.length; i++){
      angles[i] = (Math.random()*2*Math.PI);
    }
    //Arrays.sort(angles);
    
    
   //sorts the list of angles, code courtesy of https://study.com/academy/lesson/how-to-sort-an-array-in-java.html
   for (int i = 1; i < angles.length; i++) {
    for (int j = i; j > 0; j--) {
     if (angles[j] < angles[j - 1]) {
      temp = angles[j];
      angles[j] = angles[j - 1];
      angles[j - 1] = temp;
     }
    }
   }
   for (int i = 0; i < angles.length; i++) {
     System.out.println(angles[i]);
   }
   
   
   
    for(int i = 0; i < angles.length; i++){
      
      xCorners[i] = (int)(size*Math.cos(angles[i]));
      yCorners[i] = (int)(size*Math.sin(angles[i]));
    }
    
    
  }
  
  public void move() {
    turn(rotSpeed);
    super.move();
}
  public void show() {
    noFill();   
    strokeWeight(1);
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public int getCorners() {return corners;}
  public float getastX() {return (float)myCenterX;}
  public float getastY() {return (float)myCenterY;}

}
