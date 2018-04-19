import processing.net.*;

/**
 * ElementsHandler Class
 * @author Natalie Mclaren
 * 
 */
 class ElementsHandler {
  
   //Image[] imagesArray;
   //Link[] linksArray;
   //Paragraph[] paragraphsArray;
   Footer[] footersArray;
   
   int numberOfNavs;
   int numberOfParagraphs;
   int numberOfLinks;
   int numberOfImages;
   int navLinksArray;
   
   ArrayList<Paragraph> paragraphsArray = new ArrayList<Paragraph>();
   ArrayList<Image> imagesArray = new ArrayList<Image>();
   ArrayList<Link> linksArray = new ArrayList<Link>();
   ArrayList<Sibling> siblingsArray = new ArrayList<Sibling>();
  

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
    
    
      
      numberOfImages = getNumberOfImagesInObject(object);
      numberOfLinks = getNumberOfLinksInObject(object);
      numberOfParagraphs = getNumberOfParagraphsInObject(object);
      numberOfNavs = getNav(object);
      int numberOfFooters = getFooter(object);
  
      //imagesArray = new Image[numberOfImages]; 
      //linksArray = new Link[numberOfLinks]; 
      //paragraphsArray = new Paragraph[numberOfParagraphs]; 
      footersArray = new Footer[numberOfFooters];

      populateImagesArray(numberOfImages);
      populateLinksArray();
      //populateSiblingsArray("p");
      populateParagraphsArray();
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
   public ArrayList<Paragraph> populateParagraphsArray() {
   
    int paragraphs = 0;
    int percentOfParagraphsArray = (int)(numberOfParagraphs / 100) * 10;
     
     if(numberOfParagraphs > 15) {
       paragraphs = percentOfParagraphsArray;
     } else {
       paragraphs = numberOfParagraphs;
     }
    
    int textWidth = int(random(300, 1020));
    int textHeight = int(random(100));
    
    //String[] siblings = getElementSiblings("p");
    int randX = int(random(30, 450));
    int randY = 110;
    
    int tempX = randX;
    int tempY = randY;
   
    //println(paragraphs);
    if(paragraphs > 0) {
      for(int k = 0; k < paragraphs; k++) {
        
   
        // 600 - size of mid section / 

        //if(parseInt(inputHandler.year) > 2010) {
        //  randX += 200;
        //  randY += 100;
        //} else {
        //  randX = 30;
        //  randY = 110;
          
          //randY += 30;
        //}
        
        println("y:");
        println(randY);
        
        println("text height:");
        println(textHeight);
        
        randY += textHeight;
        
        tempY = randY;
        
        println("temp:");
        println(tempY);
        println("new randy:");
        println(randY);
  
        if(randX + textWidth > 1020) {
          int newX = (randX + textWidth) - 1020;
          randX -= newX;
        }
        if((randY + textHeight) > 600) {
          randY -= 110;
          // Shift paragraphs to other side
          randX = int(random(450, 1020));
        }
        
        paragraphsArray.add(new Paragraph(randX, randY, textWidth, textHeight));

       }
     } 

     return paragraphsArray;
  }
  
  
  /**
   * populateLinksArray
   * 
   * 
   */
   public ArrayList<Link> populateLinksArray() {
   
    int x = 0;
    int y = 30;
    int links = 0;
    
    int percentOfLinksArray = (int)(numberOfLinks / 100) * 10;
     
     if(numberOfLinks > 15) {
       links = percentOfLinksArray;
     } else {
       links = numberOfLinks;
     }
      
    print(numberOfLinks);
    if(links > 0) {
      for(int k = 0; k < links; k++) {
        int randX = int(random(0));
        int randY = int(random(110, 700));

        // Put object in array
        linksArray.add(new Link(randX, randY));

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
   public ArrayList<Image> populateImagesArray(int numberOfImages) {
    
    int x = 0;
    int y = 200;

    int images = 0;
    int percentOfImagesArray = (int)(numberOfImages / 100) * 10;
     
     if(numberOfParagraphs > 15) {
       images = percentOfImagesArray;
     } else {
       images = numberOfParagraphs;
     }
    
    int imageWidth = int(random(100));
    int imageHeight = int(random(100));
    
    int randX = int(random(30, 450));
    int randY = 110;
    
    int tempX = randX;
    int tempY = randY;
   
    //println(paragraphs);
    if(images > 0) {
      for(int k = 0; k < images; k++) {
        
   
        // 600 - size of mid section / 

        //if(parseInt(inputHandler.year) > 2010) {
        //  randX += 200;
        //  randY += 100;
        //} else {
        //  randX = 30;
        //  randY = 110;
          
          //randY += 30;
        //}
        
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
        
        imagesArray.add(new Image(randX, randY, imageWidth, imageHeight));

       }
     } 
     

     return imagesArray;
  }
  
 
  
  /**
   * getObjectChildren
   * 
   * 
   */
  public String[] getElementChildren(String element) {

    ResponseHandler responseHandler;
    responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/" + element + "/children", this);
    return response = responseHandler.getResponseBody();
  }
  
  
  /**
   * getElementSiblings
   * 
   * 
   */
  public String [] getElementSiblings(String element) {
    
    ResponseHandler responseHandler;
    responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/" + element + "/siblings", this);
    return response = responseHandler.getResponseBody();
    
  }
  
  
  /**
   * populateFootersArray
   * 
   * 
   */
   public Footer[] populateFootersArray(int numberOfFooters) {

    if(numberOfFooters > 0) {
      for(int i = 0; i < numberOfFooters; i++) {
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
    

    if(numberOfNavs > 0) {
      String[] response = getElementChildren("nav");
      
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
                    
                    navLinksArray = obj.getInt("child_frequency");
                  }
               }
            }
          }
        }
      }
      
      
      int percentOfNavLinksArray = (int)(navLinksArray / 100) * 10;
      
      int randX = int(random(1020));
      int randY = int(random(10, 100));
      
      for(int i = 0; i < percentOfNavLinksArray; i++) {
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
    
   } else {
     print("Empty 'images' array!");
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
  
}
