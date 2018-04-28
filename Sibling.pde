import processing.net.*;

/**
 * SiblingHandler Class
 * @author Natalie Mclaren
 * 
 */
 class Sibling {
 
  String elementSibling;
  int elementSiblingFrequency;
  
  /**
   * Constructor
   * @param String sibling The sibling element
   * @param int frequency The number of times the sibling element appears 
   * @return {void} N/A
   * 
   */ 
   Sibling(String sibling, int frequency) {
     
     elementSibling = sibling;
     elementSiblingFrequency = frequency;
     
   }
   
}
