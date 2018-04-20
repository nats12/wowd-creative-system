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

// Button variables
  
int buttonX, buttonY;       
int buttonSize = 90;    
color buttonColor;
color buttonHighlight;
color currentColor;

boolean buttonOver = false;

/**
 * setup
 * 
 * 
 */
void setup() {
  size(1024, 768);
 
  f = createFont("Arial", 16);
  
  elementsHandler = new ElementsHandler();
  inputHandler = new InputHandler();
  responseHandler = new ResponseHandler("http://localhost:8000/api/websites/new", elementsHandler);
  website = new Website(elementsHandler);
  
  response = responseHandler.getResponseBody();
  
  buttonX = 100;
  buttonY = 50;
  buttonColor = color(0);
  buttonHighlight = color(51);
  currentColor = color(102);
    
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
    // Saves each frame as line-000001.png, line-000002.png, etc.
    saveFrame("line-######.png");
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
    
    //inputHandler.year = "";
    
    //delay(5000);
    
    //redraw();
   
  }
