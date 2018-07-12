import processing.net.*;

/**
 * Website Class
 * @author Natalie Mclaren
 * 
 */
class Website {
 
  private int responseImages;
  private ArrayList<Image> imagesArray = new ArrayList<Image>();
 
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
   public void init(JSONObject website) {
     
     processImageElements(website, "img");
     
   }
   
   /**
     * processImageElements
     * Function calls to retrieve element counts and populate image array
     * @param JSONObject website
     * @param String element
     * @return {}  
     */
   public void processImageElements(JSONObject website, String element) {
     
     getHTMLElementCount(website, element);
     
     populateImagesArray();
   }
   
   
  /**
   * getElementCount
   * Gets the number of times a specific element is present in a website design
   * @param JSONObject object
   * @param String website
   * @return {}  
   */
   public void getHTMLElementCount(JSONObject website, String element) {

    this.responseImages = website.getInt(element);
    
   }
 
   
  /**
   * drawImageElements
   * Calls the Image display function for every Image object in the imagesArray
   * @param N/A
   * @return {void} N/A
   */
  public void drawImageElements() {
    
    int index = 0;
    
    for(Image img : this.imagesArray) {
        
        if(index > 0) {
          float currentX = this.imagesArray.get(index).x;
          float prevX = this.imagesArray.get(index-1).x;
          float prevXWidth = this.imagesArray.get(index-1).imageWidth;
      
          adjustPositions(currentX, prevX, prevXWidth, index);
        }
        
        index++;
        
        img.display();  
    }
  }
  
  
  /**
   * adjustPositions
   *  
   */
  public void adjustPositions(float currentX, float prevX, float prevXWidth, int index) {
    
    if(currentX < (prevX + prevXWidth)) {
      this.imagesArray.get(index).x = this.imagesArray.get(index-1).x + this.imagesArray.get(index-1).imageWidth;
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
   
    int images = 0;
    int percentOfImagesArray = (int)(responseImages / 100) * 2;

     if(responseImages > 6) {
       images = percentOfImagesArray;
     } else {
       images = responseImages;
     }
    
    if(images > 0) {
      for(int k = 0; k < images; k++) {
        
        int imageWidth = int(random(150, 200));
        int imageHeight = int(random(150, 200));
        
        int x = int(random(100, 450));
        int y = int(random(100, 450));
   
        if(x > width - imageWidth) {
          x = width - imageWidth;
        }

        //if((y + imageHeight) > height) {
        //  y -= 110;
        //  // Shift paragraphs to other side
        //  y = int(random(450, 1020));
        //}
        
 
        println("Random x: " + x + ", Random y: " + y + ", Random width: " + imageWidth + ", Random height: " + imageHeight);

        this.imagesArray.add(new Image(x, y, imageWidth, imageHeight));

       }
     } 
     

     return this.imagesArray;
  }
}
