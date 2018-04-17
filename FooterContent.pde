/**
 * Footer Content Class
 * @author Natalie Mclaren
 * 
 */
 
 
class FooterContent {
  float x,y;
  int randX = int(random(1024));
  int randY = int(random(700, 768));
  
  FooterContent() {
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
    String s = "Footer link";
    text(s, x, y);
  }
}
