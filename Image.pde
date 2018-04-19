/**
 * Image Class
 * @author Natalie Mclaren
 * 
 */
 
 
class Image {
  float x,y;
  int imageWidth;
  int imageHeight;
  
  
  /**
   * Constructor
   * 
   * 
   */
  Image(float x_, float y_, int _width, int _height) {
    x = x_;
    y = y_;
    imageWidth = _width;
    imageHeight = _height;
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
    image(img, x, y, imageWidth, imageHeight);
  }
}
