/**
 * Link Class
 * @author Natalie Mclaren
 * 
 */

class Link {
  float x,y;
  int randX = int(random(1024));
  int randY = int(random(100, 600));
  
  Link(float x_, float y_) {
    x = randX;
    y = randY;
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
