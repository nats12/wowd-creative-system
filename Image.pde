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
    PImage img;
    img = loadImage("moonwalk.jpg");
  
    stroke(0);
    strokeWeight(1);
    noFill();
    image(img, x, y, 100, 100);
  }
}