/**
 * World of Web Design
 * @author Natalie Mclaren 
 * 
 */
 
// Variable to store text currently being typed
String typing = "";
  
// Variable to store a given year
String year = "";
  
PFont f;

ResponseHandler responseHandler;
ElementsHandler elementsHandler;
InputHandler inputHandler;

String[] response;

/**
 * setup
 * 
 * 
 */
void setup() {
  size(1024, 768);
  f = createFont("Arial",16);
  
  elementsHandler = new ElementsHandler();
  responseHandler = new ResponseHandler("http://localhost:8000/api/websites/new", elementsHandler);
  inputHandler = new InputHandler();
  
  response = responseHandler.getResponseBody();
  //print(response);
  // Stop draw function from looping once year has been set
  noLoop();
}


/**
 * draw
 * 
 * 
 */
void draw() {
  background(255);
  
  if(year == "") {
    displayUserInput();
  } else {
    responseHandler.formatResponse(response, year);
    drawWebsiteDesign();
  }
}



  /**
   * drawElements
   * 
   * 
   */
  void drawWebsiteDesign() {
   
    background(255);
    
    elementsHandler.drawImageElements();
    elementsHandler.drawLinkElements();
    elementsHandler.drawNavElements();
    
  }


  /**
   * keyPressed
   * 
   * 
   */
  void keyPressed() {
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
    
    // Keep drawing until year has been given
    redraw();
  }


  /**
   * displayUserInput
   * 
   * 
   */ 
  void displayUserInput() {
    int indent = 25;
    textFont(f);
    fill(0);
    text("You would like to see a typical website design from the year: ", indent, 170);
    text("Input: " + typing,indent,190);
   }
