/**
 * Link Class
 * @author Natalie Mclaren
 * 
 */

class Link {
  float x,y;
  
  Link(float x_, float y_) {
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
    fill(0);
    String s = "Lorem Impsum";
    text(s, x, y);
  }
}
