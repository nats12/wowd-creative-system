/**
 * Nav Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Nav {
  float x,y;
  
  
  /**
   * Constructor
   * @param float x_ The navs's x axis position
   * @param float y_ The navs's y axis position
   * @return {void} N/A 
   */ 
  Nav(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  /**
   * display
   * 
   * 
   */
  void display() {
    stroke(0);
    strokeWeight(1);
    noFill();
    String s = "Nav link";
    text(s, x, y);
  }
}
