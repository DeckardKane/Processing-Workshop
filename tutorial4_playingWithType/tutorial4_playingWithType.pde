/* 
Full credit here goes to Tim Rodenbroeker, who originally wrote this code.
Source: https://timrodenbroeker.de/processing-tutorial-kinetic-typography-1/
I didn't get a chance to comment this one much :(
*/

PGraphics pg;
PFont font;
PFont font2;

void setup() {
  font = createFont("RobotoMono-Regular.ttf", 600);
  font2 = createFont("Game Of Squids.ttf", 600); // Thanks for this font, Darrell Flood! https://www.dafont.com/darrell-flood.d4895
  size(800, 800, P2D);
  pg = createGraphics(800, 800, P2D);
}

void draw() {
  background(0);
  
  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.textFont(font2); // Pick which font to use!
  pg.textSize(100);
  pg.pushMatrix();
  pg.translate(width/2, height/2-215);
  pg.textAlign(CENTER, CENTER);
  pg.text("Squid Game", 0, 0);
  pg.popMatrix();
  pg.endDraw();


  int tilesX = 10;
  int tilesY = 10;

  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {

      // WAVE
      int wave = int(sin((frameCount + ( x*y )) * 0.05) * 200);

      // SOURCE
      int sx = x*tileW + wave;
      int sy = y*tileH;
      int sw = tileW;
      int sh = tileH;


      // DESTINATION
      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
 
    }
  }
}
