public class Swimmer {

  //fields - private variables -default values for xCoord and yCoord
  private float xCoord;
  private float yCoord;
  private float size;
  private float speedX; //speed along the x-axis
  private float r, g, b;
  private float lapsDone;


  //constructors - special public methods to build this object. Same name as class.


  public Swimmer() {
  }




  public Swimmer(float yCoord, float size) {               
    speedControl();                                        
    setSize(size);                                          //size - default swimmer size is 20px , permission between 20 - 30
    setXCoord();                              
    setYCoord(yCoord);                                      //yCoord - how far from the top they start
    r = random(255);                                        //selects a random value from 0 TO 255
    g = random(255);                                        //selects a random value from 0 TO 255
    b = random(255);                                        //selects a random value from 0 TO 255
  }




  //methods 

  public void display() {
    noStroke();  
    fill(r, g, b);
    rect(xCoord, yCoord, size, size);
  }



  public void move()
  {
    //update swimmer coordinates
    xCoord = xCoord + speedX;

    //If swimmer hits the left edge of the swimming pool, change direction of xCoord
    if (xCoord < edge.getEdgeWidth()) {
      //xCoord = edge.getEdgeWidth();
      speedX = speedX * -1;
      lapsDone++;
    }
    //If swimmer hits the right edge of the display window, change direction of xCoord
    else if (xCoord > width - size/2) {
      xCoord = width - size/2;
      speedX = speedX * -1;
    }
  }

  //getter methods


  public float getXCoord()
  {
    return xCoord;
  }  

  public float getYCoord()
  {
    return yCoord;
  }  

  public float getSize()
  {
    return size;
  }

  public float getLaps()
  {
    return lapsDone;
  }  

  //setter methods


  public void setSize(float size)
  {
    //The swimmer size must be between 20 and 30 (inclusive)
    if ((size >= 20) && (size <= 30)) {
      this.size = size;
    } else {
      // If an invalid size is passed as a parameter, a default of 20 is imposed.\
      this.size = 20;
    }
  }

  public void setXCoord() {

    this.xCoord = edge.getXCoord() + edge.getEdgeWidth() ;  //makes sure that the swimmers will always start from the edge and that they will always make contact with it at the end of an lap
  }

  public void setYCoord(float yCoord) {

    this.yCoord = yCoord;
  }

  //private helper method
  private void speedControl()
  {
    speedX = random(1, 3);
  }
}
