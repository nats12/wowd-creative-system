import processing.net.*;

/**
 * InputHandler Class
 * @author Natalie Mclaren
 * 
 */
class InputHandler {
   
  // Keys
  private char backspace = '\b';
  private char enter = '\n';
  
  // Variable to store text currently being typed
  private String typing = "";
    
  // Variable to store a given year
  private String year = "";
  
  // For invalid year inputs
  private boolean error = false;
  
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
  public String getYear() {
  
    return this.year;
  }
  
  
  /**
   * processUserInput
   * Processes user input - checks for valid year, updates the year string when enter is pressed etc.
   * @param N/A
   * @return {void} N/A
   */
  public void processUserInput() {
    // If the return key is pressed, save the String and clear it
    if (key == this.enter) {
      this.year = this.typing;
      
      switch(parseInt(this.year)) {
        case 2002: 
        case 2006: 
        case 2007:
        case 2008:
        case 2009:
        case 2010:
        case 2011:
        case 2013:
        case 2014:
        case 2016:
          this.error = true;
          this.year = "";
          break;
     }

      // Clear typing string
      this.typing = ""; 
 
    } else if(key == this.backspace) {
      // If the backspace key is pressed, remove the last character from the string
      this.typing = this.typing.substring(0, typing.length() - 1);
    } else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      this.typing += key; 
    }
  }

  /**
   * displayUserInput
   * Displays the user input frame
   * @param N/A
   * @return {void} N/A
   */ 
  public void displayUserInput() {
    int indent = 25;
    textFont(f);
    fill(0);
    textSize(24);
    text("You would like to see a typical website from the year: " + this.typing, indent, 170);
    textSize(12);
    text("(Choose from: 1990, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005, 2012, 2015, 2017)", indent, 190);
    
    if(this.error) {
      textSize(24);
      fill(255,0,0);
      text("Please enter a valid year from the list above!", indent, 230);
    }
   }
}
