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
  ResponseHandler(String url, ElementsHandler elHandler) {
    requestUrl = url;
    elementsHandler = elHandler;
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
        JSONObject obj = parseJSONObject(formattedResponse[k].concat("}"));
        
        if (obj == null) {
          println("JSONObject could not be parsed");
        } else {
          if(obj.getInt("year") == parseInt(saved)) {
            print(obj);
            // Find the object matching the given year and insert shape objects into an array for every type of element
            elementsHandler.getWebsiteElementCount(obj);
          }
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
