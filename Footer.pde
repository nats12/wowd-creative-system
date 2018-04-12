/**
 * Footer Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Footer {
  float x,y;
 
  Footer() {
    x = 0;
    y = 0;
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
    rect(x,y,200,200);
  }
}
