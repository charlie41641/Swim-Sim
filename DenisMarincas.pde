/*
Name : Marincas Denis Remus
 Student Number: 20099160
 Course Name: Applied Computing
 
 Brief description of the animation achieved: An x number of swimmers in a pool that race for y laps.
 
 Known bugs/problems: N/A
 
 Any sources referred to during the development of the assignment (no need to reference lecture/lab materials): N/A
 
 */


//-------------------------------------------------------------------------------------------//
// Swimmers Race
//-------------------------------------------------------------------------------------------//
// EXISTING FUNCTIONALITY:                                                                    //
// Background color added                                                                    //
// Swimmers added                                                                            //
// Random color applied for each swimmer                                                     //
// Swimmers move                                                                             //
// Edge added                                                                                //
// Swimmers collide with both edges                                                          //
// ** fixed starting position for swimmers (now they start at edge.getEdgeWidth()) **        //
// Edge constantly changes color                                                             //
// Number of swimmers changeable                                                             //
// Each swimmer is assigned an number                                                        //
// Option to set a number of max laps available                                              //
// Number of completed laps is tracked                                                       //
// Program stops after there is a winner                                                     //
// Pop-up displaying number of swimmers, number of the winning swimmer and the number of laps//

// ADDED FUNCIONALITY:                                                                       //
// Labeled each swimmer with its number                                                      //
//-------------------------------------------------------------------------------------------//

import javax.swing.*;


//Current game data
int maxNumberOfSwimmers = Integer.parseInt(JOptionPane.showInputDialog("Welcome to the Race!\n\n Please enter the number of swimmers(1-9): ", "9")); //number of swimmers in the pool
int maxLaps = Integer.parseInt(JOptionPane.showInputDialog("Number of laps for this race: ", "3"));     //maximum number of laps 
int winner;        //stores the number of the winning swimmer
int lapsDone;      //keeps track of the number of laps done by each swimmer
String str1 = "The winning swimmer is swimmer number ";
String str2 = "Number of swimmers: ";


//Objects required in the program
private Swimmer swimmers[] = new Swimmer[maxNumberOfSwimmers]; //number of swimmers
Edge edge;


void setup() {
  size(600, 600);
  noCursor();
  str1 = str1.toUpperCase();
  str2 = str2.toLowerCase();
  textSize(30);
  edge = new Edge(12, 600); // width and height of the edge
  for (int i = 0; i< swimmers.length; i++) {
    swimmers[i] = new Swimmer(((i+1)*60), 20); // fills the swimmer array with swimmers
  }
}



void draw() {

  background(#1F85DE);
  edge.display();   //displays a lime edge
  //edge.flash();   //displays an edge that constantly changes colors
  for (int i = 0; i < swimmers.length; i++) {
    text(i+1, swimmers[i].getXCoord() + swimmers[i].getSize(), (i+1)*60);   //labels each swimmer with its number
    swimmers[i].move();  //provides swimmer movement
    swimmers[i].display(); //displays the swimmers
    if (swimmers[i].getLaps() == maxLaps) {
      winner = i+1;
      println("Swimmer " + (i+1) + " won the race!" + "The race is over! \n\n"  
        + str2 + maxNumberOfSwimmers
        + "\n\n" + str1 + winner
        +   "\n\nNumber of laps:  "      + maxLaps);
      raceOver();
    }
  }
}



void raceOver()   //this function stops the animation and displays statistics
{
  JOptionPane.showMessageDialog(null, "The race is over! \n\n"  
    + str2 + maxNumberOfSwimmers
    + "\n\n" + str1 + winner
    +   "\n\nNumber of laps:  "      + maxLaps);
  exit();
}
