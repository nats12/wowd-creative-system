/**
 * Link Class
 * @author Natalie Mclaren
 * 
 */

class Link {
  float x,y;

  /**
   * Constructor
   * @param float x_ The link's x axis position
   * @param float y_ The link's y axis position
   * @return {void} N/A 
   */ 
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
    String s = "Href link";
    fill(0, 102, 153);
    text(s, x, y);
   
  }
}
