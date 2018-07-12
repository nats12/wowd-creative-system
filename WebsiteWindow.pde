import processing.net.*;

/**
 * WebsiteWindow Class
 * @author Natalie Mclaren
 * 
 */
class WebsiteWindow {
 
  // Website structure variables
  private int topX;
  private int topY;
  private int topWidth;
  private int topHeight;
  
  private int midX;
  private int midY;
  private int midWidth;
  private int midHeight;
  
  private int bottomX;
  private int bottomY;
  private int bottomWidth;
  private int bottomHeight;

  
  Website website;
 
  /**
   * Constructor
   * @param ElementsHandler elHandler An ElementsHandler object
   * @return {void} N/A
   */ 
  WebsiteWindow(Website web) {
    this.topX = 0;
    this.topY = 0;
    this.topWidth = 1024;
    this.topHeight = 100;
    
    this.midX = 0;
    this.midY = 100;
    this.midWidth = 1024;
    this.midHeight = 600;
    
    this.bottomX = 0;
    this.bottomY = 700;
    this.bottomWidth = 1024;
    this.bottomHeight = 67;
    
    this.website = web;
  }
  
  
  
  /**
   * topSection
   * Draws a rectangle for the top section of the frame
   * Draws nav elements
   * @param N/A
   * @return {void} N/A 
   */ 
  public void topSection() {
    
    noFill();

    rect(this.topX, this.topY, this.topWidth, this.topHeight);
  }
  
  
  
  /**
   * midSection
   * Draws a rectangle for the middle section of the frame
   * Draws image, link and paragraph elements
   * @param N/A
   * @return {void} N/A   
   */ 
  public void midSection() {
   
    noFill();

    rect(this.midX, this.midY, this.midWidth, this.midHeight);
    
    this.website.drawImageElements();
  }
  
  
  
  /**
   * bottomSection
   * Draws a rectangle for the bottom section of the frame
   * Draws footer elements
   * @param N/A
   * @return {void} N/A  
   */ 
  public void bottomSection() {
    
    noFill();

    rect(this.bottomX, this.bottomY, this.bottomWidth, this.bottomHeight);
  }
  
}
