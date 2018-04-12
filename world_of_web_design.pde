/**
 * World of Web Design
 * @author Natalie Mclaren 
 * 
 */
 

  
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
  
  if(inputHandler.year == "") {
    inputHandler.displayUserInput();
  } else {
    responseHandler.formatResponse(response, inputHandler.year);
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
    elementsHandler.drawFooterElements();
    
  }
  
  
  
  /**
   * keyPressed
   * 
   * 
   */
  void keyPressed() {
   
    inputHandler.processUserInput(); 
    
    // Keep drawing until year has been given
    redraw();
  }


  
