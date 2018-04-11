/**
 * Natalie Mclaren
 * World of Web Design
 *
 */
 
// Library to sent HTTP requests
import processing.net.*;

Client c;
String data;

void setup() {

  String requestUrl = "http://localhost:8000/api/websites/new";
   
  String[] response = loadStrings(requestUrl);

  
  for (int i = 0; i < response.length; i++) {
    // Remove array brackets and every object's final curly bracket
    String[] formatted = response[i].substring(1, response[i].length()-1).split("},");
    
    for(int k = 0; k < formatted.length-1; k++) {
      // Re-append last curly bracket to make them JSON parsable
      JSONObject json = parseJSONObject(formatted[k].concat("}"));
      
      if (json == null) {
        println("JSONObject could not be parsed");
      } else {
        int year = json.getInt("year");
        println(year);
      }
    }
  }
}

void draw() {

}
