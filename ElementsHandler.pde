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
   Footer[] footersArray;

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
      int numberOfFooters = getFooter(object);
  
      imagesArray = new Image[numberOfImages]; 
      linksArray = new Link[numberOfLinks]; 
      navsArray = new Nav[numberOfNavs];
      footersArray = new Footer[numberOfFooters];

      populateImagesArray(numberOfImages);
      populateLinksArray(numberOfLinks);
      populateNavArray(numberOfNavs);
      populateFootersArray(numberOfFooters);

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
   * getNav
   * 
   * 
   */
   int getNav(JSONObject object) {
    
     return object.getInt("nav");
   }
   
   
   
   /**
   * getFooter
   * 
   * 
   */
   int getFooter(JSONObject object) {
    
     return object.getInt("footer");
   }
  
  
  
  /**
   * populateLinksArray
   * 
   * 
   */
   public Link[] populateLinksArray(int numberOfLinks) {
   
    int x = 0;
    int y = 30;
 
    if(numberOfLinks > 0) {
      for(int k = 0; k < numberOfLinks; k++) {
         y+=20;
        // Put object in array
        linksArray[k] = new Link(x, y);
       }
     } else {
      print("Empty 'links' array!");
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
    
    if(numberOfImages > 0) {
      for(int i = 0; i < numberOfImages; i++) {
         x+=100;
        // Put object in array
        imagesArray[i] = new Image(x, y);
      }
    } else {
      print("Empty 'images' array!");
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
    
    // Loop through the possible navigation positions array and choose one at random
    for(int i = 0; i < randomNavs.length; i++) {
      index = int(random(randomNavs.length));
    }
    
    // Assign x and y to the chosen position indexes
    int x = randomNavs[index][0];
    int y = randomNavs[index][1];
    
    if(numberOfNavs > 0) {
      for(int i = 0; i < numberOfNavs; i++) {
        y+=20;
        // Put object in array
        navsArray[i] = new Nav(x, y);
      }
    } else {
      print("Empty 'nav' array!");
    }
   
     return navsArray;
  }
  
  
  
  /**
   * populateFootersArray
   * 
   * 
   */
   public Footer[] populateFootersArray(int numberOfFooters) {
    
    int x = 0;
    int y = 200;
    
    if(numberOfFooters > 0) {
      for(int i = 0; i < numberOfFooters; i++) {
         x+=100;
        // Put object in array
        footersArray[i] = new Footer();
      }
    } else {
      print("Empty 'images' array!");
    }
    
     return footersArray;
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
  
  
  /**
   * drawFooterElements
   * 
   * 
   */
  public void drawFooterElements() {
    
    for (Footer f : footersArray) {
      f.display();
    }
  }
}
