/**
 * Footer Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Footer {
  float x,y;
 
  Footer() {
    x = 0;
    y = 620;
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
    rect(x,y,1024,100);
  }
}
