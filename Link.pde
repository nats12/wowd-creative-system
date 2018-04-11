/**
 * Link Class
 * @author Natalie Mclaren
 * 
 */

class Link {
  float x,y;
  String name;
  
  // Create  the Square
  Link(float x_, float y_, String s) {
    x = x_;
    y = y_;
    name = s;
  }
  
  // Display the link
  void display() {
    stroke(0);
    fill(0);
    String s = "Lorem Impsum";
    text(s, x, y);
  }
}
