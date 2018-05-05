import processing.net.*;

/**
 * InputHandler Class
 * @author Natalie Mclaren
 * 
 */
class InputHandler {
   
  // Variable to store text currently being typed
  String typing = "";
    
  // Variable to store a given year
  String year = "";
  
  // For invalid year inputs
  boolean error = false;
  
  /**
   * Constructor
   * @param N/A
   * @return {void} N/A  
   */ 
  InputHandler() {}
  
  
  /**
   * getYear
   * Returns the year input by the user
   * @param N/A
   * @return String year The year input by the user
   * 
   */ 
  String getYear() {
  
    return year;
  }
  
  
  /**
   * keyPressed
   * Listens for key presses and, specifically the return and backspace keys to adjust the "year" variable accordingly
   * @param N/A
   * @return {void} N/A
   */
  void processUserInput() {
    // If the return key is pressed, save the String and clear it
    if (key == '\n' ) {
      year = typing;
      
      // Check for invalid year inputs
      if(parseInt(year) == 2002 || parseInt(year) == 2006 || parseInt(year) == 2007 || parseInt(year) == 2008 || parseInt(year) == 2009 || parseInt(year) == 2010 || parseInt(year) == 2011 || parseInt(year) == 2013 || parseInt(year) == 2014 || parseInt(year) == 2016) {
        error = true;
        year = "";
      }
      
      // A String can be cleared by setting it equal to ""
      typing = ""; 
 
    } else if(key == '\b') {
      // If the backspace key is pressed, remove the last character from the string
      typing = typing.substring(0, typing.length() - 1);
    } else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key; 
    }
  }


  /**
   * displayUserInput
   * Displays the user input frame
   * @param N/A
   * @return {void} N/A
   */ 
  void displayUserInput() {
    int indent = 25;
    textFont(f);
    fill(0);
    textSize(16);
    text("You would like to see a website design inspired by those from the year: ", indent, 170);
    textSize(12);
    text("(Choose from: 1990, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005, 2012, 2015, 2017)", indent, 190);
    textSize(16);
    text("Input: " + typing, indent, 250);
    
    if(error) {
      fill(255,0,0);
      text("Please enter a valid year from the list above!", indent, 230);
    }
   }
}
