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
    text("You would like to see a website design inspired by those from the year: ", indent, 170);
    text("Input: " + typing,indent,190);
   }
  
}
