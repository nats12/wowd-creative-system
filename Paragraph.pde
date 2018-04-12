/**
 * Paragraph Class
 * @author Natalie Mclaren
 * 
 */

class Paragraph {
  float x,y;
  
  Paragraph(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  /**
   * display
   * 
   * 
   */
  void display() {
    stroke(0);
    fill(0);
    String s = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates aliquid maiores dolorem ea, omnis consequatur fugiat at sequi impedit facilis ex porro. Beatae veritatis molestias, voluptatem iste est magni quas?";
    text(s, x, y);
  }
}
