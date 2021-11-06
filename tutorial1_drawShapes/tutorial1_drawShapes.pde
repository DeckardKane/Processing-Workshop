// Here we define some color variables for later use.
// color is a keyword that tells Processing that the value we're defining is, in fact, a color
// Then we give our variable a name (which can be pretty much anything you want)
// The = sign tells Processing we are setting this variable to a certain value
// And then we give it our color! Tools>Color Selector is handy for grabbing a particular color you want!
// We're using a hex value here, but you can use RGB values too (and maybe HSV values too)
// Finally, end our line with a semi-colon. It tells Processing that this line is complete!
color yellow = #FFF534;
color black = #111111;
color white = #FFFFFF;
color red = #E82525;

// Oh, also, if you're wondering, the // makes text a "comment". It's a good way to write notes to yourself/others

/* 
You can also make multi-line comments with /*
This is a handy way to disable sections of code that may not be working right, without completing deleting them
*/

// setup is where you put your sketch "ingredients". All of this runs once, and once only.
// If you're wondering what void means, it's a special programming keyword. We don't need to worry too much about it right now.
// setup is an example of a function. the () next to it are for what we call "arguments".
// Arguments are a way of passing certain values to a function to have them do something with them.
// As you can see here, the () are empty! So we aren't giving any arguments to the setup function.
// The curly braces {} is how we start a contain a chunk of code, in this case our setup function.
// Notice there's one right after our (), and then the closing brace is a few lines down.
// In between them is where we add our setup code!
void setup() {

  size(800, 800); // dimensions of our canvas (in pixels)
  background(white); // background color of the sketch
  
}


// draw runs continuously once you "play" your sketch (using the play button in the upper left!)
void draw() {

  noStroke(); // this disables stroke in our drawing
  fill(#111111); // you can use the variable black we defined up above, or just put in the hex value
  rect(400, 600, 200, 100); // First two values are x and y location coordinates, third and fourth values are how wide (x) and how tall (y)

  // I want to draw a triangle, but I don't know how! I should check the Processing reference pages!
  // Oh hey look! https://processing.org/reference/triangle_.html
  //triangle(120, 300, 232, 80, 344, 300); // each pair of values is one of the points of the triangle in xy coordinates.
  // so the first point of the triangle is at 120, 300. The second point is at 232, 80. And the third point is at 344, 300.

  // Now let's try changing our fill color so we can draw something else
  //fill(yellow);
  
  // Now for some circles
  //ellipse(400, 400, 300, 300); // By default, the first two values set the center point of our circle/ellipse.
  // The third and fourth values set the width and height.
  // There is a function called ellipseMode() that allows you to draw circles/ellipses in different ways, but this is fine for now
  
  //fill(black);
  //ellipse(350, 350, 50, 150);
  //ellipse(450, 350, 50, 150);
  
  // Lastly, an arc
  // In Processing's mind, drawing an arc is basically like making an ellipse, but then only actually drawing part of it.
  //noFill(); // this turns off fill in our drawing
  //stroke(black); // and now we want to reenable stroke, and set it to black
  //arc(400, 500, 100, 50, 0, PI); // the first two values set the x and y coordinates of the starting point of our arc
  // the third and fourth values set the width and height of our arc
  // and the fifth and sixth variables set the starting and stopping angles of the arc
  
}
