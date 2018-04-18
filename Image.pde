/**
 * Image Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Image {
  float x,y;
  int randX = int(random(1024));
  int randY = int(random(100, 600));
  
  
  
  Image(float x_, float y_) {
    x = randX;
    y = randY;
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
