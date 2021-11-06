// This sketch will draw a rectangle that follows our mouse position!

// A few more programming things:
// int is a keyword that refers to "integer", we're essentially saying "this variable is a number".
// boolean on the other hand, is a type of variable that can only be either true, or false.
int xpos = 0;
int ypos = 0;
boolean mouseOn = false;

void setup() {

  size(1000,1000);
  noCursor(); // this disables our mouse cursor while it's over our sketch window. Can be useful for aesthetic reasons
  
}

// Here we've got our draw function again, but, you may notice there are a few more functions down below!
// Let's go take a look down there first.
void draw() {
  
  println("Mouse X: " + mouseX);
  println("Mouse Y: " + mouseY);
  
  background(0); // 0 is also just black
  // Calling background at the beginning of draw is actually kind of important!
  // It acts as a "wipe" or reset of the canvas in between frames.
  // So I wonder what happens if we comment it out? Let's see...
  
  /* here's a way to make the sketch only draw the rectangle if you're holding down the mouse
  if (mousePressed == true) {
    isMouseOn();
    if (mouseOn) {
      checkMouse();
      drawRect();
    }
    //println("Mouse press activated");
  }
  */
  
  // Here you can see a few of our functions in use.
  isMouseOn(); // This runs our isMouseOn function
  if (mouseOn) { // If the mouseOn boolean is true, then run this code in the curly braces
    checkMouse(); // Run our checkMouse function (details below)
    drawRect(); // Run our drawRect function (details below)
  }
  
  
}


// So here's our very own custom function!
// checkMouse is pretty simple.
void checkMouse() {
  
  // It just updates our xpos and ypos variables to be equal to wherever our mouse is currently located on the screen.
  // Remember that the draw function will be run over and over, many times per second, for as long as the sketch is active.
  // This is normally only true of the draw function, because it's special.
  // But since we "call" our checkMouse function inside draw, we can get it to run continuously as well!
  xpos = mouseX;
  ypos = mouseY;
  // Also: notice that mouseX and mouseY show up in pink? 
  // This is because they're variables that have been predefined by Processing, we didn't have to create them ourselves!
  
}

// Our next function, isMouseOn, might seem a little scary with all of those different symbols, but we'll walk through it together.
void isMouseOn() {
  // This is an if statement. They're a crucial basic building block of any programming language!
  // Essentially we're telling process "if a certain thing is true, run this code. If it's not, skip this, or do something else."
  
  // In this case, we are trying to figure out if our mouse is currently over the sketch window.
  // We want Processing to check if the statement(s) in between the ( ) is true or false.
  // Here we actually have two statements, separated by the &&. 
  // The && means AND, which means that BOTH statements must be true, or the code in the curly braces won't run.
  // The first one asks Processing if the x coordinate of our mouse on our canvas is greater than or equal to 1.
  
  // The second statement asks if the mouse x coordinate is less than or equal to a variable called width.
  // Again, notice that width is pink.
  // This is another helpful predefined variable, this one is just the width of our canvas in pixels.
  // height is also predefined!
  
  // So we're essentially asking if our mouse x coordinate is in between the left and right side of our canvas.
  // (there is a small problem with this, can you guess what it is?)
  if (mouseX >= 1 && mouseX <= width) { // So IF both of the statements are true, which means our cursor is indeed over our canvas, then...
    mouseOn = true; // set the mouseOn variable to true.
  } else { // But! If those statements aren't true, our cursor is not over our canvas, then run this code...
    mouseOn = false; // that sets the mouseOn variable to false.
  }
  // A small challenge: the flaw I mention above is fixable! See if you can do it :)
}


// And finally, our last function.
// Also probably our most important, since without it, nothing will be drawn on the canvas!
// But it's also fairly simple.
void drawRect() {
  // Draw a rectangle!
  
  rectMode(CENTER); // This is a way to change how Processing draws rectangles.
  // Now that we've set it to CENTER, the rectangles will be drawn around a central point...
  
 
  rect(xpos, ypos, 100, 100); // in our case, that central point is our mouse cursor (represented here by xpos and ypos)
  println("Rectangle generated at xpos:" + xpos + " and ypos:" + ypos); // println is a way to "print" messages to the console.
  // Very handy for debugging code! Use it often!
  
}
// Now that we have met our custom functions, we can go back up to draw!
