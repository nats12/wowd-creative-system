/**
 * World of Web Design
 * @author Natalie Mclaren 
 * 
 */
 
// Variable to store text currently being typed
String typing = "";
  
// Variable to store saved text when return is hit
String saved = "";
  
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
  size(640, 640);
  f = createFont("Arial",16);
  
  elementsHandler = new ElementsHandler();
  responseHandler = new ResponseHandler("http://localhost:8000/api/websites/new", elementsHandler);
  inputHandler = new InputHandler();
  
  response = responseHandler.getResponseBody();

  noLoop();
}


/**
 * draw
 * 
 * 
 */
void draw() {
  background(255);
  
  if(saved == "") {
    displayUserInput();
  } else {
    responseHandler.formatResponse(response, saved);
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
    
  }


  /**
   * keyPressed
   * 
   * 
   */
  void keyPressed() {
    // If the return key is pressed, save the String and clear it
    if (key == '\n' ) {
      saved = typing;
      // A String can be cleared by setting it equal to ""
      typing = ""; 
    } else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key; 
    }
    
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
    
    // Display everything
    text("You would like to see a typical website design from the year: ", indent, 170);
    text("Input: " + typing,indent,190);
   }
