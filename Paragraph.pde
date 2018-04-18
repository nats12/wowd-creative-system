/**
 * Paragraph Class
 * @author Natalie Mclaren
 * 
 */

class Paragraph {
  float x, y, textWidth, textHeight;
  
  Paragraph(float x_, float y_, int width_, int height_) {
    x = x_;
    y = y_;
    textWidth = width_;
    textHeight = height_;
  }
  
  
  /**
   * setX
   * 
   * 
   */
  public void setX(int newX) {
    
    x = newX;
    
  }
  
  
  /**
   * sety
   * 
   * 
   */
  public void sety(int newY) {
    
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
    //println(textWidth(s));
    //textAlign(LEFT);
    
    
    text(s, x, y, textWidth, textHeight);
  }
}
