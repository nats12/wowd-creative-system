import processing.net.*;

/**
 * ElementsHandler Class
 * @author Natalie Mclaren
 * 
 */
 class ElementsHandler {
  
   Image[] imagesArray;
   Link[] linksArray;
   Paragraph[] paragraphsArray;
   Nav[] navsArray;
   Footer[] footersArray;
   
   ArrayList<Sibling> siblingsArray = new ArrayList<Sibling>();
   
   int childFrequencies;

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
      int numberOfParagraphs = getNumberOfParagraphsInObject(object);
      int numberOfNavs = getNav(object);
      int numberOfFooters = getFooter(object);
  
      imagesArray = new Image[numberOfImages]; 
      linksArray = new Link[numberOfLinks]; 
      paragraphsArray = new Paragraph[numberOfParagraphs]; 
      navsArray = new Nav[numberOfNavs];
      footersArray = new Footer[numberOfFooters];

      populateImagesArray(numberOfImages);
      populateLinksArray(numberOfLinks);
      populateSiblingsArray("p");
      populateParagraphsArray(numberOfParagraphs);
      //populateNavArray(numberOfNavs);
      populateFootersArray(numberOfFooters);
    
    
   }
  
  
  /**
   * getNumberOfParagraphsInObject
   * 
   * 
   */
   int getNumberOfParagraphsInObject(JSONObject object) {

    return object.getInt("p");
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
   * populateSiblingsArray
   * 
   * 
   */
  public ArrayList<Sibling> populateSiblingsArray(String element) {
    
    
    String[] response;
    
    ResponseHandler responseHandler;
    responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/" + element + "/siblings", this);
    response = responseHandler.getResponseBody();
   
    
    for (int i = 0; i < response.length; i++) {
      
      // Remove array brackets and every object's final curly bracket
      String[] formattedResponse = responseHandler.splitEndBracketAndComma(response[i]);
      
       for(int k = 0; k < formattedResponse.length; k++) {
        
        // Re-append last curly bracket to make them JSON parsable
        JSONObject obj = parseJSONObject(formattedResponse[k].concat("}"));
 
        String elementSibling = obj.getString("sibling");
        int elementSiblingFrequency = obj.getInt("sibling_frequency");
        
        siblingsArray.add(new Sibling(elementSibling, elementSiblingFrequency));
        
       }
    }
    
    return siblingsArray;
  }
  
  
  
  /**
   * populateParagraphsArray
   * 
   * 
   */
   public Paragraph[] populateParagraphsArray(int numberOfParagraphs) {
   
    int x = 0;
    int y = 30;
    
    
    if(numberOfParagraphs > 0) {
      for(int k = 0; k < numberOfParagraphs; k++) {
         
         y+=20;
        // Put object in array
        paragraphsArray[k] = new Paragraph(x, y);
       }
     } 
    

    //for (Sibling s : siblingsArray) {
    //  //Sibling s = siblingsArray.get(i);
    //  s.display();
    //}
    
     return paragraphsArray;
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
    
     
    if(numberOfNavs > 0) {
      for(int i = 0; i < numberOfNavs; i++) {
        // Put object in array
        //navsArray[i] = new Nav();
      }
      
      //for(int j = 0; j < formattedResponse.length-1; j++) {
          
        
        
      // }
   
      
    } else {
      print("Empty 'nav' array!");
    }
   
     return navsArray;
  }
  
  /**
   * getObjectChildren
   * 
   * 
   */
  public void getElementChildren() {

    ResponseHandler responseHandler;
    responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/nav/children", this);
    response = responseHandler.getResponseBody();
    
    
    for (int i = 0; i < response.length; i++) {
  
      // Remove array brackets and every object's final curly bracket
      String[] formattedResponse = responseHandler.splitEndBracketAndComma(response[i]);
      
      for(int k = 0; k < formattedResponse.length; k++) {
        // Re-append last curly bracket to make them JSON parsable
        JSONObject obj = parseJSONObject(formattedResponse[k].concat("}"));
        
        if (obj == null) {
          println("JSONObject could not be parsed");
        } else {
          String child = obj.getString("child");
          if(child.equals("ul") == true) {
             responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/ul/children", this);
             response = responseHandler.getResponseBody();
             //println(response);
             
             for (int j = 0; j < response.length; j++) {
                // Remove array brackets and every object's final curly bracket
                formattedResponse = responseHandler.splitEndBracketAndComma(response[i]);
 
                for(int l = 0; l < formattedResponse.length; l++) {
                  // Re-append last curly bracket to make them JSON parsable
                  obj = parseJSONObject(formattedResponse[l].concat("}"));
                  println(obj);
                  
                  childFrequencies = obj.getInt("child_frequency");
                }
             }
          }
        }
      }
    }
      
    //print(response);
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
   * drawParagraphElements
   * 
   * 
   */
  public void drawParagraphElements() {
    
    for (Paragraph p : paragraphsArray) {
      p.display();
    }
  }
  
  
  /**
   * drawNavElements
   * 
   * 
   */
  public void drawNavElements() {
    
    int percent = (int)(childFrequencies / 100)*10;
    
    int randX = int(random(1024));
    int randY = int(random(0, 100));
  
    for(int i = 0; i < percent; i++) {
      randX += 100;
      randY += 10;
      if(randX > 1020) {
        randX -= 100;
      }
      if(randY > 100) {
        randY -= 10;
      }
      
      Nav n = new Nav(randX, randY);
      n.display();
    }
    
  }
  
  
  /**
   * drawFooterElements
   * 
   * 
   */
  public void drawFooter() {

    for (Footer f : footersArray) {
      f.display();
    }
  }
  
  
  /**
   * getSiblings
   *
   * 
   */
  public void getSiblings() {
    
    //for(Sibling s : siblingsArray) {
    //  s.display();
    //}
  }
 
}
