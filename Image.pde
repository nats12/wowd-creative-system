/**
 * Image Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Image {
  float x,y;
  String name;
 
  
  // Create  the Square
  Image(float x_, float y_, String s) {
    x = x_;
    y = y_;
    name = s;
  }
  
  // Display the Square
  void display() {
    stroke(0);
    strokeWeight(1);
    noFill();
    rect(x,y,100,100);
  }
}
