/**
 * Image Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Image {
  float x,y;
  int randX = int(random(1024));
  int randY = int(random(100, 600));
  
  
  /**
   * Constructor
   * 
   * 
   */
  Image(float x_, float y_) {
    x = randX;
    y = randY;
  }
  
  
  /**
   * getX
   * 
   * 
   */
  public float getX() {
    
    return x;
  }
  
  
  
  /**
   * getY
   * 
   * 
   */
  public float getY() {
    
    return y;
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
