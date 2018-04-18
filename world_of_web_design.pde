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

int windowWidth = 1024;
int windowHeight = 768;

/**
 * setup
 * 
 * 
 */
void setup() {
  size(1024, 768);
  //insets = frame.getInsets();
  surface.setResizable(true);

  f = createFont("Arial", 16);
  
  elementsHandler = new ElementsHandler();
  inputHandler = new InputHandler();
  responseHandler = new ResponseHandler("http://localhost:8000/api/websites/new", elementsHandler);
  website = new Website(elementsHandler);
  
  response = responseHandler.getResponseBody();

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
    elementsHandler.getElementChildren();
    drawWebsiteDesign();
    //saveFrame("line-######.png");
  }
}



  /**
   * drawElements
   * 
   * 
   */
  void drawWebsiteDesign() {
   
    background(255);
    //x, y, w, h
    website.topSection();
    website.midSection();
    website.bottomSection();
    
  }
  
  
  //void mouseWheel() {
    
  //  setSize(windowWidth, windowHeight += 1);
  //  //redraw();
  //  //website.adjustSections();
  //}


  
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


  
