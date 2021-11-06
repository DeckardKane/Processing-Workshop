/* 
Full credit here goes to Tim Rodenbroeker, who originally wrote this code.
Source: https://timrodenbroeker.de/how-to-rasterize-an-image-with-processing/
I have made a few small tweaks, and added a whole bunch of comments!
*/

// For this next one, find an image you like! We're going to use it in the sketch!
color FG = #111111;
color BG = #f1f1f1;
PImage img;

// Remember, setup runs one time, and one time only.
void setup() {
  size(1000, 1200); // dimensions of the sketch canvas (in pixels)
  background(BG); // background color of the sketch
  img = loadImage("peter.jpg"); // bring in an image of your choice from the data folder
  img.resize(1000, 1200); // set img to a certain size (in this case, same size as canvas)
}

// draw runs continuously when you play the sketch.
// this is where you put things that you want to have change dynamically!
void draw() {
  background(BG); // background color (again)
  fill(FG); // sets the fill color of drawn objects
  noStroke(); // disables stroke on drawn objects
  
  // Note: float is another keyword, similar to int, for defining a number variable. float is typically used for numbers with decimals in them!
  float ratio = float(height)/float(width); // Divide height of canvas by width, to calculate the aspect ratio, so we have a nice square grid
  
  // This next variable is interesting. Notice the function here called map.
  float tilesX = map(mouseX, 0, width, 10, 100); // map is a way to convert numbers.
  // In this case, the first argument, mouseX, is the number we want to convert.
  // The next two arguments, 0 and width, define the lower and upper bounds of what our first value can be.
  // (for us, our mouseX can only ever go as low as 0, and as high as whatever the width of our canvas is, at the moment, 1000)
  // The next two arguments, 10 and 100, are defining the lower and upper bounds of what we want to change our number to.
  // So if mouseX is 1000, it will be converted by the map function to be 100. If mouseX is 0, it will be converted to 10.
  // If mouseX is somewhere in between 0 and 1000, it will be converted to a number somewhere between 10 and 100.
  // We are setting the variable tilesX to be equal whatever the result of this map function is
  
  println("Tiles X: " + tilesX);
  
  float tilesY = ratio * tilesX; // Here we set tilesY (how many tiles on the y axis) by multiplying the aspect ratio times the number of tiles on the x axis.
  // However, tilesY is not currently used due to the way we calculate things down below (this is why tilesY is underlined in yellow)
  
  float tileSize = width / tilesX; // This calculates how big each tile should be by dividing the width of the canvas by how many tiles are on the x axis
  
  // Alright, this next section is probably the trickiest thing we'll look at today.
  // This is a for loop, another important building block of all program languages.
  // A for loop instructs Processing to "repeat a certain task, FOR a certain number of times".
  // This one is saying: increase variable y by the size of the tile every time you run this loop...
  // ...and once it's greater than or equal to the height of the image, STOP.
  for (int y = 0; y < img.height; y += tileSize) {
    for (int x = 0; x < img.width; x += tileSize) { // Oh look, another loop inside the loop! This one does the same thing, but for the x axis (width).
      color c = img.get(x, y); // Again, keep in mind, this is being run every single time the loops run. This bit here extracts the color from the pixel we're currently over.
      float b = map(brightness(c), 0, 255, 1, 0); // This calculates the "brightness" of our color variable above by using a map function.
      // The way we use this down below is very interesting!
      
      // pushMatrix and popMatrix are a little hard to wrap your head around (even for me).
      // A transformation Matrix is used to modify the positioning of objects on our coordinate grid canvas.
      // They're being used here to make placing our rectangles a _lot_ easier.
      pushMatrix();
      translate(x, y); // This part is extremely important!
      
      // We're drawing a rectangle here, and like I said above, the way we use "brightness" (b) is very interesting!
      // Basically, we represent "brightness" in our rasterized image, by making the tiles larger and smaller.
      // Brighter pixels get smaller tiles, and darker areas get larger tiles.
      // But, there's something else interesting here...
      rect(0, 0, b * tileSize, b * tileSize); // ...notice that our first two values are just 0 and 0?
      // That's the "origin" of our coordinate grid canvas. Normally, that would place our rectangle in the upper left hand corner. Why not here?
      // Because of what we've done with translate a few lines up.
      // When we've created a matrix with pushMatrix, and then call translate, we are setting the new origin to be wherever we want.
      // In this case, we've told it to set to our x and y values (which represent where we currently are in our image).
      // And now when we "pop" the matrix...
      popMatrix();
      // That transformation of the origin point is saved, and when the loop runs again, it does this all over again!
    }
  }
}
