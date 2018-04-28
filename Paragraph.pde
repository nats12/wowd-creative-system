/**
 * Paragraph Class
 * @author Natalie Mclaren
 * 
 */

class Paragraph {
  float x, y, textWidth, textHeight;
  
  /**
   * Constructor
   * @param float x_ The paragraph's x axis position
   * @param float y_ The paragraph's y axis position
   * @param int width_ The paragraph's width
   * @param int height_ The paragraph's height
   * @return {void} N/A 
   */ 
  Paragraph(float x_, float y_, int width_, int height_) {
    x = x_;
    y = y_;
    textWidth = width_;
    textHeight = height_;
  }
  
  
  /**
   * setX
   * Sets the x axis value
   * @param int newX The new x axis value
   * @return {void} N/A
   */
  public void setX(int newX) {
    
    x = newX;
    
  }
  
  
  /**
   * setY
   * Sets the y axis value
   * @param int newY The new y axis value
   * @return {void} N/A 
   */
  public void setY(int newY) {
    
    y = newY;
    
  }
  
  
  
  /**
   * display
   * 
   * 
   */
  void display() {
    stroke(0);
    fill(0);
    String s = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates aliquid maiores dolorem ea, omnis consequatur fugiat at sequi impedit facilis ex porro. Beatae veritatis molestias, voluptatem iste est magni quas?";

    text(s, x, y, textWidth, textHeight);
  }
}
