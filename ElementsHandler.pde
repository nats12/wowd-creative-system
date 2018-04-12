import processing.net.*;

/**
 * ElementsHandler Class
 * @author Natalie Mclaren
 * 
 */
 class ElementsHandler {
   
   Image[] imagesArray;
   Link[] linksArray;

  /**
   * Constructor
   * 
   * 
   */ 
   ElementsHandler() {}
    

  /**
   * getWebsiteElementCount
   * 
   * 
   */
   public void getWebsiteElementCount(JSONObject object) {
    
    
      
      int numberOfImages = getNumberOfImagesInObject(object);
      int numberOfLinks = getNumberOfLinksInObject(object);
  
      imagesArray = new Image[numberOfImages]; 
      linksArray = new Link[numberOfLinks]; 

      populateImagesArray(numberOfImages);
      populateLinksArray(numberOfLinks);
      

  }
  
  
  /**
   * getNumberOfImagesInObject
   * 
   * 
   */
   int getNumberOfImagesInObject(JSONObject object) {

    return object.getInt("img");
  }
  
  
  
  /**
   * getNumberOfLinksInObject
   * 
   * 
   */
   int getNumberOfLinksInObject(JSONObject object) {
    
    return object.getInt("a");
  }
  
  
  
  /**
   * populateLinksArray
   * 
   * 
   */
   public Link[] populateLinksArray(int numberOfLinks) {
   
    int x = 0;
    int y = 30;
    for(int k = 0; k < numberOfLinks; k++) {
       y+=20;
      // Put object in array
      //world_of_web_design w = new world_of_web_design();
      linksArray[k] = new Link(x, y);
     }
     
     return linksArray;
     
  }
  
  
  
  
  /**
   * populateImagesArray
   * 
   * 
   */
   public Image[] populateImagesArray(int numberOfImages) {
    
    int x = 0;
    int y = 20;
    
    for(int i = 0; i < numberOfImages; i++) {
       x+=200;
      // Put object in array
      //world_of_web_design w = new world_of_web_design();
      imagesArray[i] = new Image(x, y);
      
     }
     
     return imagesArray;
  }
  
  
  
  /**
   * drawImageElements
   * 
   * 
   */
  public void drawImageElements() {
    
    for(Image img : imagesArray) {
        img.display();
    }
  }
  
  /**
   * drawLinkElements
   * 
   * 
   */
  public void drawLinkElements() {
    
    for (Link l : linksArray) {
      l.display();
    }
  }
}
