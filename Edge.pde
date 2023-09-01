public class Edge {


  //fields - private variables -default values for xCoord and yCoord
  private int edgeWidth;
  private int edgeHeight;        // height of the paddle
  private int xCoord;              // X coordinate of the paddle
  private int yCoord;              // Y coordinate of the paddle 
  private float r, g, b;


  //constructors - special public methods to build this object. Same name as class.

  public Edge() {
  }

  public Edge(int edgeWidth, int edgeHeight) {
    setEdgeWidth(edgeWidth);
    setEdgeHeight(edgeHeight);
  }


  //methods


  public void display() {
    noStroke();  
    fill(#84DE02);
    rect(0, 0, edgeWidth, edgeHeight);
  }

  public void flash() {
    noStroke();
    fill(r, g, b);
    rect(0, 0, edgeWidth, edgeHeight);
    r = random(255); //selects a random value from 0 TO 255
    g = random(255); //selects a random value from 0 TO 255
    b = random(255); //selects a random value from 0 TO 255
  }

  //getter methods


  public int getXCoord()
  {
    return xCoord;
  }  

  public int getYCoord()
  {
    return yCoord;
  }  

  public int getEdgeWidth()
  {
    return edgeWidth;
  }

  public int getEdgeHeight()
  {
    return edgeHeight;
  }  



  //setter methods


  public void setEdgeWidth(int edgeWidth)
  {
    //The paddle width must be between 5 and 15 (inclusive)
    if ((edgeWidth >= 5) && (edgeWidth <= 15)) {
      this.edgeWidth = edgeWidth;
    } else {
      // If an invalid width is passed as a parameter, a default width of 10 is imposed.
      this.edgeWidth = 10;
    }
  }  

  public void setEdgeHeight(int edgeHeight)
  {
    //The paddle height must be between 50 and height/2 (inclusive)
    if (edgeHeight == height) {
      this.edgeHeight = edgeHeight;
    } else {
      // If an invalid height is passed as a parameter, a default height value is imposed
      this.edgeHeight = height;
    }
  }
}
