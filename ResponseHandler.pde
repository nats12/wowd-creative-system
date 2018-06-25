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
  void formatResponse(String[] response, String year) {
   
    for (int i = 0; i < response.length; i++) {
      // Remove array brackets and every object's final curly bracket
      String[] formattedResponse = splitEndBracketAndComma(response[i]);
      
      for(int k = 0; k < formattedResponse.length-1; k++) {
        // Re-append last curly bracket to make them JSON parsable
        JSONObject obj = parseJSONObject(formattedResponse[k].concat("}"));

        if (obj == null) {
          println("JSONObject could not be parsed");
        } else {
          if(obj.getInt("year") == parseInt(year)) {
            // Find the object matching the given year and insert shape objects into an array for every type of element
            elementsHandler.getWebsiteElementCount(obj);
          } 
        }
      }
    }
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
