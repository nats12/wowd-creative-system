import processing.net.*;

/**
 * ResponseHandler Class
 * @author Natalie Mclaren
 * 
 */
class ResponseHandler {
  String requestUrl;
  ElementsHandler elementsHandler;
 
 
  /**
   * Constructor
   * 
   * 
   */ 
  ResponseHandler(String url, ElementsHandler handler) {
    requestUrl = url;
    elementsHandler = handler;
  }
    
  
  /**
   * getUrl
   * 
   * 
   */ 
  String getUrl() {
    
    return requestUrl;
  }
    
  
  /**
   * getResponseBody
   * 
   * 
   */
  String[] getResponseBody() {
  
    return loadStrings(requestUrl);
  }
  
  
  
  /**
   * formatResponse
   * 
   * 
   */
  void formatResponse(String[] response, String saved) {
   
    for (int i = 0; i < response.length; i++) {
      // Remove array brackets and every object's final curly bracket
      String[] formattedResponse = splitBrackets(response[i]);
      
      for(int k = 0; k < formattedResponse.length-1; k++) {
        // Re-append last curly bracket to make them JSON parsable
        JSONObject json = parseJSONObject(formattedResponse[k].concat("}"));
        
        if (json == null) {
          println("JSONObject could not be parsed");
        } else {
          // Find the object matching the given year and insert shape objects into an array for every type of element
          elementsHandler.getWebsiteElementCount(json, parseInt(saved));
        }
      }
    }
  }
  
  
  
  /**
   * splitBrackets
   * 
   * 
   */
  String[] splitBrackets(String responseObject) {
    
    return responseObject.substring(1, responseObject.length()-1).split("},"); 
  }
}
