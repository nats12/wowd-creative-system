import processing.net.*;

/**
 * Website Class
 * @author Natalie Mclaren
 * 
 */
class Website {
 
  int topX;
  int topY;
  int topWidth;
  int topHeight;
  
  int midX;
  int midY;
  int midWidth;
  int midHeight;
  
  int bottomX;
  int bottomY;
  int bottomWidth;
  int bottomHeight;
  
  ElementsHandler elementsHandler;
 
  /**
   * Constructor
   * 
   * 
   */ 
  Website(ElementsHandler elHandler) {
    topX = 0;
    topY = 0;
    topWidth = 1024;
    topHeight = 100;
    
    midX = 0;
    midY = 100;
    midWidth = 1024;
    midHeight = 600;
    
    bottomX = 0;
    bottomY = 700;
    bottomWidth = 1024;
    bottomHeight = 67;
    
    elementsHandler = elHandler;
  }
  
  
  
  /**
   * topSection
   * 
   * 
   */ 
  void topSection() {
    
    noFill();
    //fill(#CCFFAA);
    rect(topX, topY, topWidth, topHeight);
    
    elementsHandler.drawNavElements();
  }
  
  
  
  /**
   * midSection
   * 
   * 
   */ 
  void midSection() {
   
    noFill();
    //fill(#336699);
    rect(midX, midY, midWidth, midHeight);
    
    //elementsHandler.drawImageElements();
    //elementsHandler.drawLinkElements();
    elementsHandler.drawParagraphElements();
  }
  
  
  
  /**
   * bottomSection
   * 
   * 
   */ 
  void bottomSection() {
    
    noFill();
    //fill(#ff0000);
    rect(bottomX, bottomY, bottomWidth, bottomHeight);
    
    elementsHandler.drawFooter();
  }
  
  
  
  /**
   * adjustSections
   *
   *
   */
  void adjustSections() {
   
    topY += 1;
    midY += 1;
    bottomY += 1;
    
    redraw();  
  }
    
}
