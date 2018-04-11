import processing.net.*;

/**
 * ResponseHandler Class
 * @author Natalie Mclaren
 * 
 */
class ResponseHandler {
  String requestUrl;
 
  // Create  the Square
  ResponseHandler(String url) {
    requestUrl = url;
  }
  

  
  String getUrl() {
    
    return requestUrl;
  }
  
  
  String[] getResponseBody() {
    
    return loadStrings(requestUrl);
  }
  
}
