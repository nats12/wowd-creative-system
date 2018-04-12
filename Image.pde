/**
 * Image Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Image {
  float x,y;
 
  Image(float x_, float y_) {
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
    rect(x,y,100,100);
  }
}
