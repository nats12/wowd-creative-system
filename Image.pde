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
   * @param float x_ The image's x axis position
   * @param float y_ The image's y axis position
   * @param int width_ The image's width
   * @param int height_ The image's height
   * @return {void} N/A 
   */
  Image(float x_, float y_, int _width, int _height) {
    x = x_;
    y = y_;
    imageWidth = _width;
    imageHeight = _height;
  }
  
  
  /**
   * getX
   * Returns the x axis value
   * @param N/A
   * @return {float} x The x axis 
   */
  public float getX() {
    
    return x;
  }
  
  
  
  /**
   * getY
   * Returns the y axis value
   * @param N/A
   * @return {float} y The y axis  
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
