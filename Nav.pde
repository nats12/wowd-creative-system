/**
 * Nav Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Nav {
  float x,y;
  int randX = int(random(1024));
  int randY = int(random(100));
  
  Nav(float x_, float y_) {
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
    strokeWeight(1);
    noFill();
    String s = "Nav link";
    text(s, x, y);
  }
}
