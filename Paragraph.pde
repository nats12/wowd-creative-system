/**
 * Paragraph Class
 * @author Natalie Mclaren
 * 
 */

class Paragraph {
  float x,y;
  int randX = int(random(1024));
  int randY = int(random(100, 600));
  
  Paragraph(float x_, float y_) {
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
    fill(0);
    String s = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates aliquid maiores dolorem ea, omnis consequatur fugiat at sequi impedit facilis ex porro. Beatae veritatis molestias, voluptatem iste est magni quas?";
    text(s, x, y);
  }
}
