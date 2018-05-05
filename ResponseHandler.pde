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
   * @param String url The url used in the HTTP request
   * @param ElementsHandler elHandler An ElementsHandler object
   * @return {void} N/A 
   */ 
  ResponseHandler(String url, ElementsHandler elHandler) {
    // URL not in use in this version, see getResponseBody().
    requestUrl = url;
    elementsHandler = elHandler;
  }
    
  
  /**
   * getUrl
   * Returns the url used in the HTTP request
   * @param N/A
   * @return {String} requestUrl The request url (one of the API endpoints) 
   */ 
  String getUrl() {
    
    return requestUrl;
  }
    
  
  /**
   * getResponseBody
   * Returns the body of the HTTP request 
   * @param N/A
   * @return {String} The body of the HTTP request containing the database data
   */
  JSONArray getResponseBody() {
  
    return loadJSONArray("data.txt");
  }
  
  
  
  /**
   * formatResponse
   * Formats the response string into a JSONObject for parsing of individual objects 
   * @param String response The HTTP request response
   * @param String year The user's input 
   * @return {void} N/A
   */
  void formatResponse(JSONArray response, String year) {
   
    for (int i = 0; i < response.size(); i++) {
      
        JSONObject obj = response.getJSONObject(i);
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
  
  
  
  /**
   * splitBrackets
   * Splits the HTTP response body "}" brackets 
   * @param String responseObject The HTTP response body
   * @return {String[]} The HTTP response body without "}" brackets 
   */
  String[] splitEndBracketAndComma(String responseObject) {

    return responseObject.substring(1, responseObject.length()).split("},"); 
  }
}
