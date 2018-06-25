import processing.net.*;

/**
 * Website Class
 * @author Natalie Mclaren
 * 
 */
class Website {
 
  int numberOfImages;
  ArrayList<Image> imagesArray = new ArrayList<Image>();
 
  /**
   * Constructor
   * @param ElementsHandler elHandler An ElementsHandler object
   * @return {void} N/A
   */ 
  Website() {}

  
  /**
   * getElementCount
   * Gets the number of times a specific element is present in a website design
   * @param JSONObject object
   * @param String website
   * @return {}  
   */
   void getElementCount(JSONObject object, String element) {

    numberOfImages = object.getInt(element);
   }
 
  
  /**
   * getWebsiteElementCount
   * Calls functions to obtain the number of each element in each website.
   * Calls functions that populates element arrays ready for drawing.
   * @param JSONObject object 
   * @return {void} N/A 
   */
   void init(JSONObject object) {
    
      getElementCount(object, "img");
      
      populateImagesArray();
   }
   
  
  /**
   * drawImageElements
   * Calls the Image display function for every Image object in the imagesArray
   * @param N/A
   * @return {void} N/A
   */
  public void drawImageElements() {
    
    for(Image img : imagesArray) {
        img.display();
    }
  }
  
  
  /**
   * populateImagesArray
   * Generates random x and y positions and width and height values for Image objects
   * Populates the imagesArray with Image objects
   * @param N/A
   * @return {ArrayList} imagesArray An array populated with Image objects  
   */
   public ArrayList<Image> populateImagesArray() {
    
    int x = 0;
    int y = 200;

    int images = 0;
    int percentOfImagesArray = (int)(numberOfImages / 100) * 2;
     
     if(numberOfImages > 15) {
       images = percentOfImagesArray;
     } else {
       images = numberOfImages;
     }
    
    
    int imageWidth = int(random(150, 200));
    int imageHeight = int(random(150, 200));
    
    int randX = int(random(100, 450));
    int randY = 110;
    
    if(images > 0) {
      for(int k = 0; k < images; k++) {
       
        randY += imageHeight;
        
        if(randX + imageWidth > 1020) {
          int newX = (randX + imageWidth) - 1020;
          randX -= newX;
        }
        if((randY + imageHeight) > 600) {
          randY -= 110;
          // Shift paragraphs to other side
          randX = int(random(450, 1020));
        }
        
        println("IMAGE");
        println("Random x: ");
        println(randX);
        println("Random y: ");
        println(randY);
        println("Random width: ");
        println(imageWidth);
        println("Random height: ");
        println(imageHeight);
        
        imagesArray.add(new Image(randX, randY, imageWidth, imageHeight));

       }
     } 
     

     return imagesArray;
  }
}
