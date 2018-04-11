/**
 * World of Web Design
 * @author Natalie Mclaren 
 * 
 */
 

PFont f;

int imgs = 0;
int ls = 0;

Image[] images;
Link[] links;
ResponseHandler handler;

// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";


void setup() {
  size(640, 640);
  f = createFont("Arial",16);
  
  handler = new ResponseHandler("http://localhost:8000/api/websites/new");
}

void draw() {
  background(255);
  
  if(saved == "") {
   
    int indent = 25;
    textFont(f);
    fill(0);
    
    // Display everything
    text("You would like to see a typical website design from the year: ", indent, 40);
    text("Input: " + typing,indent,190);
    text("Loading a generated website design from the year " + saved,indent,230); 
  } else {
    formatResponse(handler.getResponseBody()); 
    drawElements();
  }
}



/**
 * drawElements
 * 
 * 
 */
void drawElements() {
 
  background(255);
  
  for (Image i : images) {
     i.display();
   }
   
   for (Link l : links) {
     l.display();
   }
}



/**
 * formatResponse
 * 
 * 
 */
void formatResponse(String[] response) {
  
  for (int i = 0; i < response.length; i++) {
    // Remove array brackets and every object's final curly bracket
    String[] formattedResponse = splitBrackets(response[i]);
    
    for(int k = 0; k < formattedResponse.length-1; k++) {
      // Re-append last curly bracket to make them JSON parsable
      JSONObject json = parseJSONObject(formattedResponse[k].concat("}"));
      
      if (json == null) {
        println("JSONObject could not be parsed");
      } else {
        //println(keyPressed();
        // Find the object matching the given year and insert shape objects into an array for every type of element
        getWebsiteElementCount(json, parseInt(saved));
      }
    }
  }
}



/**
 * getWebsiteElementCount
 * 
 * 
 */
void getWebsiteElementCount(JSONObject object, int year) {
  
  int x = 0;
  int y = 20;
  int lx = 0;
  int ly = 30;
  if(object.getInt("year") == year){
  
    imgs = object.getInt("img");
    ls = object.getInt("a");
    
    images = new Image[imgs]; 
    links = new Link[ls]; 
  
    for(int i = 0; i < imgs; i++) {
       x+=200;
      // Put object in array
      images[i] = new Image(x, y, "testing!");
     }
     
     for(int k = 0; k < ls; k++) {
      //println(l);
       ly+=20;
      // Put object in array
      links[k] = new Link(lx, ly, "testing!");
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



/**
 * keyPressed
 * 
 * 
 */
void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    saved = typing;
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key; 
  }
}
