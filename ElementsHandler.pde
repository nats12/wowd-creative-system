import processing.net.*;

/**
 * ElementsHandler Class
 * @author Natalie Mclaren
 * 
 */
 class ElementsHandler {
   
   Image[] imagesArray;
   Link[] linksArray;
   Nav[] navsArray;
   Footer[] footerArray;

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
      int numberOfNavs = getNav(object);
  
      imagesArray = new Image[numberOfImages]; 
      linksArray = new Link[numberOfLinks]; 
      navsArray = new Nav[numberOfNavs]; 

      populateImagesArray(numberOfImages);
      populateLinksArray(numberOfLinks);
      populateNavArray(numberOfNavs);

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
   * getFooter
   * 
   * 
   */
   int getNav(JSONObject object) {
    
     return object.getInt("nav");
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
    int y = 200;
    
    for(int i = 0; i < numberOfImages; i++) {
       x+=100;
      // Put object in array
      //world_of_web_design w = new world_of_web_design();
      imagesArray[i] = new Image(x, y);
      
     }
     
     return imagesArray;
  }
  
  
  /**
   * populateNavArray
   * 
   * 
   */
   public Nav[] populateNavArray(int numberOfNavs) {
    
     // Possible navigation positions
    int randomNavs[][] = {{0, 15}, {320, 30}, {70, 50}};
    int index = 0;
    
    // Loop through the random navigation positions array and choose one at random
    for(int i = 0; i < randomNavs.length; i++) {
      index = int(random(randomNavs.length));
    }
    
    // Assign x and y to the chosen position indexes
    int x = randomNavs[index][0];
    int y = randomNavs[index][1];
    
    for(int i = 0; i < numberOfNavs; i++) {
      y+=20;
      // Put object in array
      navsArray[i] = new Nav(x, y);
     }
     
     return navsArray;
     
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
  
  
  /**
   * drawNavElements
   * 
   * 
   */
  public void drawNavElements() {
    
    for (Nav n : navsArray) {
      n.display();
    }
  }
}
