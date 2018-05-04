import processing.net.*;

/**
 * ElementsHandler Class
 * @author Natalie Mclaren
 * 
 */
 class ElementsHandler {
  
   Footer[] footersArray;
   
   int numberOfNavs;
   int numberOfParagraphs;
   int numberOfLinks;
   int numberOfImages;
   int navLinksArray;
   
   // Could be used to optimise the positions of elements without overlapping.
   //int occupiedX;
   //int occupiedY;
   //int occupiedWidth;
   //int occupiedHeight;
   
   ArrayList<Paragraph> paragraphsArray = new ArrayList<Paragraph>();
   ArrayList<Image> imagesArray = new ArrayList<Image>();
   ArrayList<Link> linksArray = new ArrayList<Link>();
   ArrayList<Sibling> siblingsArray = new ArrayList<Sibling>();
  

  /**
   * Constructor
   * @param N/A
   * @return {void} N/A  
   */ 
   ElementsHandler() {}
    

  /**
   * getWebsiteElementCount
   * Calls functions to obtain the number of each element in each website.
   * Calls functions that populates element arrays ready for drawing.
   * @param JSONObject object 
   * @return {void} N/A 
   */
   public void getWebsiteElementCount(JSONObject object) {
    
      numberOfImages = getNumberOfImagesInObject(object);
      numberOfLinks = getNumberOfLinksInObject(object);
      numberOfParagraphs = getNumberOfParagraphsInObject(object);
      numberOfNavs = getNav(object);
      int numberOfFooters = getFooter(object);
 
      footersArray = new Footer[numberOfFooters];

      populateImagesArray();
      populateLinksArray();
      //populateSiblingsArray("p");
      populateParagraphsArray();
      populateFootersArray(numberOfFooters);
   }
  
  
  /**
   * getNumberOfParagraphsInObject
   * Gets the number of "p" element appearances in a website
   * @param JSONObject object
   * @return {int} The number of paragraphs in a website 
   */
   int getNumberOfParagraphsInObject(JSONObject object) {

    return object.getInt("p");
   }
   
  
  /**
   * getNumberOfImagesInObject
   * Gets the number of "img" element appearances in a website
   * @param JSONObject object
   * @return {int} The number of image elements in a website  
   */
   int getNumberOfImagesInObject(JSONObject object) {

    return object.getInt("img");
   }
  
  
  
  /**
   * getNumberOfLinksInObject
   * Gets the number of "a" element appearances in a website
   * @param JSONObject object
   * @return {int} The number of link elements in a website  
   */
   int getNumberOfLinksInObject(JSONObject object) {
    
      return object.getInt("a");
   }
  
  
  /**
   * getNav
   * Gets the "nav" element in a website
   * @param JSONObject object
   * @return {int} The number of navigation elements in a website  
   */
   int getNav(JSONObject object) {
    
     return object.getInt("nav");
   }
   
   
   
   /**
   * getFooter
   * Gets the "footer" in a website
   * @param JSONObject object
   * @return {int} The number of footer elements in a website   
   */
   int getFooter(JSONObject object) {
    
     return object.getInt("footer");
   }
  
  
  /**
   * populateSiblingsArray
   * Finds the sibling of an element and creates a Sibling object
   * @param String element
   * @return {ArrayList} siblingsArray An array populated with Sibling objects  
   */
  public ArrayList<Sibling> populateSiblingsArray(String element) {
    
    
    JSONArray response;
    
    ResponseHandler responseHandler;
    responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/" + element + "/siblings", this);
    response = responseHandler.getResponseBody();
   
    
    for (int i = 0; i < response.size(); i++) {
  
        JSONObject obj = response.getJSONObject(i);
 
        String elementSibling = obj.getString("sibling");
        int elementSiblingFrequency = obj.getInt("sibling_frequency");
        
        siblingsArray.add(new Sibling(elementSibling, elementSiblingFrequency));

    }
    
    return siblingsArray;
  }
  
  
  
  /**
   * populateParagraphsArray
   * Generates random x and y positions and width and height values for Paragraph objects
   * Populates the paragraphsArray with Paragraph Objects
   * @param N/A
   * @return {ArrayList} paragraphsArray An array populated with Paragraph objects  
   */
   public ArrayList<Paragraph> populateParagraphsArray() {
   
    int paragraphs = 0;
    int percentOfParagraphsArray = (int)(numberOfParagraphs / 100) * 2;
     
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


    if(paragraphs > 0) {
      for(int k = 0; k < paragraphs; k++) {

        randY += textHeight;
        
  
        if(randX + textWidth > 1020) {
          int newX = (randX + textWidth) - 1020;
          randX -= newX;
        }
        if((randY + textHeight) > 600) {
          randY -= 110;
          // Shift paragraphs to other side
          randX = int(random(450, 1020));
        }
        
        //occupiedX = randX;
        //occupiedY = randY;
        
        //occupiedWidth = textWidth;
        //occupiedHeight = textHeight;
        
        paragraphsArray.add(new Paragraph(randX, randY, textWidth, textHeight));

       }
     } 

     return paragraphsArray;
  }
  
  
  /**
   * populateLinksArray
   * Generates random x and y positions for Link objects
   * Populates the populateLinksArray with Link Objects
   * @param N/A
   * @return {ArrayList} populateLinksArray An array populated with Link objects  
   */
   public ArrayList<Link> populateLinksArray() {
  
    int links = 0;
    
    int percentOfLinksArray = (int)(numberOfLinks / 100) * 2;
     
     if(numberOfLinks > 15) {
       links = percentOfLinksArray;
     } else {
       links = numberOfLinks;
     }
      
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

        
        imagesArray.add(new Image(randX, randY, imageWidth, imageHeight));

       }
     } 
     

     return imagesArray;
  }
  
 
  
  /**
   * getObjectChildren
   * Sends a HTTP request to an API endpoint that fetches all children elements of an element
   * @param element 
   * @return {String[]} response A string array containing an element's child elements
   */
  public JSONArray getElementChildren(String element) {

    ResponseHandler responseHandler;
    responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/" + element + "/children", this);
    return response = responseHandler.getResponseBody();
  }
  
  
  /**
   * getElementSiblings
   * Sends a HTTP request to an API endpoint that fetches all sibling elements of an element
   * @param element 
   * @return {String[]} response A string array containing an element's sibling elements 
   */
  public JSONArray getElementSiblings(String element) {
    
    ResponseHandler responseHandler;
    responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/" + element + "/siblings", this);
    return response = responseHandler.getResponseBody();
    
  }
  
  
  /**
   * populateFootersArray
   * Populates the footersArray with Footer objects
   * @param N/A
   * @return {ArrayList} footersArray An array populated with Footer objects  
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
   * drawLinkElements
   * Calls the Link display function for every Link object in the linksArray
   * @param N/A
   * @return {void} N/A 
   */
  public void drawLinkElements() {
    
    for (Link l : linksArray) {
      l.display();
    }
  }
  
  
  /**
   * drawParagraphElements
   * Calls the Paragraph display function for every Paragraph object in the paragraphsArray
   * @param N/A
   * @return {void} N/A  
   */
  public void drawParagraphElements() {
    
    for (Paragraph p : paragraphsArray) {
      p.display();
    }
  }
  
  
  /**
   * drawNavElements
   * Formats the response into a JSON object
   * Fetches the child elements of "nav", fetches the child elements of "ul" (if it happens to be a child of nav) to assert the number of links in the menu
   * Generates random x and y axis positions for the "nav" links
   * Calls the Nav display function 
   * @param N/A
   * @return {void} N/A  
   */
  public void drawNavElements() {
    

    if(numberOfNavs > 0) {
      JSONArray response = getElementChildren("nav");
      
      for (int i = 0; i < response.size(); i++) {
    
          // Re-append last curly bracket to make them JSON parsable
          JSONObject obj = response.getJSONObject(i);
          
          if (obj == null) {
            println("JSONObject could not be parsed");
          } else {
            String child = obj.getString("child");
            if(child.equals("ul") == true) {
               responseHandler = new ResponseHandler("http://localhost:8000/api/websites/" + inputHandler.year + "/elements/ul/children", this);
               response = responseHandler.getResponseBody();
               
               for (int j = 0; j < response.size(); j++) {
                    JSONObject objChild = response.getJSONObject(j);
                    navLinksArray = objChild.getInt("child_frequency");
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
   * Calls the Footer display function for every Footer object in the footersArray
   * @param N/A
   * @return {void} N/A 
   */
  public void drawFooter() {

    if(footersArray.length != 0) {
      for (Footer f : footersArray) {
        f.display();
      }
    }
  }
  
}
