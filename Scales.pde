// global variables
int rows = 4;
int cols = 10;
int mult = 100;  //  pixel coordinate scale for x and y
int off = 50;    // offset between rows and cols
float wid = 10;  // width of shape
float hgt = 10;  // height of shape
float inc = 1;   // amount of inc for each frame
float min = 10.0;    // min size when breathing
float max = 100.0;    //  max size when breathing
boolean grow = true;  // breathe in first!
float r, g, b, a;  //red, green, blue, alpha
boolean dist = true;



void setup() {
  size(1000, 400);
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  a = 255;
}



void draw() {
  background(255);
  for (int y = 0; y < rows; y++) {    // x coordinate for rows loop
    for (int x = 0; x < cols; x++) {  // y coordinate for cols loop
      draw_shape(x*mult+off, y*mult+off);  // draw shapes in rows and cols
    }
  }
  
  for (float y = 0.5; y < rows; y++) {    // second layer of diagonal scales
    for (float x = 0.5; x < cols; x++) {  
      draw_shape(x*mult+off, y*mult+off);  
    }
  }
  
  incr_size_color();
  if (wid >= max||wid <= min) {   // toggle phases
    grow = !grow;
  }
}


void mouseClicked() {
  changeColor();
}



void changeColor() {
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
}



void incr_size_color() {
  if (grow) {     // grow phase
    wid += inc;
    hgt += inc;
    //a -= 255/(max-min);
  } else {        // shrink phase
    wid -= inc;
    hgt -= inc;
    //a += 255/(max-min);
  }
}



void draw_shape(float x, float y) {
  rectMode(CENTER);
  fill(r, g, b, a);
  stroke(2);
  rect(x, y, wid, hgt);  // draw shapes in rows and cols
  ellipse(x, y+(wid/2), wid, hgt); // draws first circle
  noStroke();
  ellipse(x, y+(wid/2)-5, wid, hgt); // draws second circle circle
}
