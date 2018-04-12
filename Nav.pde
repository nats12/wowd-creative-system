/**
 * Nav Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Nav {
  float x,y;
 
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
