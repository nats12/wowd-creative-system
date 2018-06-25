import processing.net.*;

/**
 * ResponseHandler Class
 * @author Natalie Mclaren
 * 
 */
class ResponseHandler {
   ElementsHandler elementsHandler = new ElementsHandler();
 
  /**
   * Constructor
   * @param String url The url used in the HTTP request
   * @param ElementsHandler elHandler An ElementsHandler object
   * @return {void} N/A 
   */ 
  ResponseHandler(ElementsHandler elHandler) {
    elementsHandler = elHandler;
  }
    
  
  /**
   * getResponseBody
   * Returns the body of the HTTP request 
   * @param N/A
   * @return {String} The body of the HTTP request containing the database data
   */
  String[] getResponseBody(String requestUrl) {
  
    return loadStrings(requestUrl);
  }
  
  
  
  /**
   * formatResponse
   * Formats the response string into a JSONObject for parsing of individual objects 
   * @param String response The HTTP request response
   * @param String year The user's input 
   * @return {void} N/A
   */
  void formatResponseIntoJSON(String[] response, String year) {
   
    for (int i = 0; i < response.length; i++) {
      // Remove array brackets and every object's final curly bracket
      String[] formattedResponse = splitEndBracketAndComma(response[i]);
      
      for(int k = 0; k < formattedResponse.length-1; k++) {
        // Re-append last curly bracket to make them JSON parsable
        JSONObject website = parseJSONObject(formattedResponse[k].concat("}"));
        
        processWebsiteData(website, year);
      }
    }
  }
 
  
  /**
   * processWebsiteData
   * Matches the user's input with the website year found in the response
   * Calls function to extract number of elements found.
   * @param JSONObject website The website (a JSONObject with fields named after elements and a count of how many found) 
   * @param String userInputYear The user's year input 
   * @return {void} N/A
   */
  void processWebsiteData(JSONObject website, String userInputYear) {
    
    if (website == null) {
      println("JSONObject could not be parsed");
    } else {
      if(isAMatch(website.getInt("year"), parseInt(userInputYear))) { // If the user's input year matches a website year in the response 
        elementsHandler.getElementCount(website); // Get a count of different HTML elements to be drawn
      } 
    }
  }


  /**
   * isAMatch
   * Function comparing two integers. 
   * @param int a
   * @param int b
   * @return {boolean} True if parameters are the same, false otherwise
   */
  boolean isAMatch(int a, int b) {
    
    if(a == b) {
      return true;
    }
    
    return false;
  }
  
  
  /**
   * splitBrackets
   * Splits the HTTP response body "}" brackets 
   * @param String responseObject The HTTP response body
   * @return {String[]} The HTTP response body without "}" brackets 
   */
  String[] splitEndBracketAndComma(String responseObject) {
    
    return responseObject.substring(1, responseObject.length()-1).split("},"); 
  }
}
