/**
 * Footer Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Footer {
  float x,y;
 
  int randX = int(random(1024));
  int randY = int(random(710, 767));
 
  
  Footer() {
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
    String s = "Footer text";
    text(s, x, y);
  }
}
