import processing.net.*;

/**
 * WebsiteWindow Class
 * @author Natalie Mclaren
 * 
 */
class WebsiteWindow {
 
  // Website structure variables
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

  
  Website website;
 
  /**
   * Constructor
   * @param ElementsHandler elHandler An ElementsHandler object
   * @return {void} N/A
   */ 
  WebsiteWindow(Website web) {
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
    
    website = web;
  }
  
  
  
  /**
   * topSection
   * Draws a rectangle for the top section of the frame
   * Draws nav elements
   * @param N/A
   * @return {void} N/A 
   */ 
  void topSection() {
    
    noFill();

    rect(topX, topY, topWidth, topHeight);
  }
  
  
  
  /**
   * midSection
   * Draws a rectangle for the middle section of the frame
   * Draws image, link and paragraph elements
   * @param N/A
   * @return {void} N/A   
   */ 
  void midSection() {
   
    noFill();

    rect(midX, midY, midWidth, midHeight);
    
    website.drawImageElements();
  }
  
  
  
  /**
   * bottomSection
   * Draws a rectangle for the bottom section of the frame
   * Draws footer elements
   * @param N/A
   * @return {void} N/A  
   */ 
  void bottomSection() {
    
    noFill();

    rect(bottomX, bottomY, bottomWidth, bottomHeight);
  }
  
}
