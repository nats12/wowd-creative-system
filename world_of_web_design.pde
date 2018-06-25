/**
 * World of Web Design
 * @author Natalie Mclaren 
 * 
 */

java.awt.Insets insets;


PFont f;

ResponseHandler responseHandler;
ElementsHandler elementsHandler;
InputHandler inputHandler;
Website website;

String[] response;


/**
 * setup
 * @param N/A
 * @return {void} N/A
 */
void setup() {
  size(1024, 768);
 
  f = createFont("Arial", 16);
  
  elementsHandler = new ElementsHandler();
  inputHandler = new InputHandler();
  
  website = new Website(elementsHandler);
  
    
  // Stop draw function from looping once year has been set
  noLoop();
}


/**
 * draw
 * @param N/A
 * @return {void} N/A
 */
void draw() {
  background(255);
  
  String url = "http://localhost:8000/api/websites/new";
  responseHandler = new ResponseHandler(elementsHandler);
  response = responseHandler.getResponseBody(url);
  
  if(inputHandler.year == "") {
    inputHandler.displayUserInput();
  } else {
    responseHandler.formatResponseIntoJSON(response, inputHandler.year);
    drawWebsiteDesign();
  }
  
}


 /**
   * keyPressed
   * Listener function which calls the processUserInput when key is pressed
   * @param N/A
   * @return {void} N/A
   */
  void keyPressed() {
    
    inputHandler.error = false;
    inputHandler.processUserInput(); 

    // Keep drawing until year has been given
    redraw();   
  }
  

  /**
   * drawElements
   * Calls the functions that draw element shapes
   * @param N/A
   * @return {void} N/A
   */
  void drawWebsiteDesign() {
   
    background(255);

    website.topSection();
    website.midSection();
    website.bottomSection();
  }
  
 
 
