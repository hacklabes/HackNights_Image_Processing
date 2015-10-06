PImage myImage;
int STEP = 16;

void setup() {
  size(720, 720);
  background(0);
  myImage = loadImage("queen.jpg");

  noStroke();
  for (int y=0; y<myImage.height; y+=STEP) {
    for (int x=0; x<myImage.width; x+=STEP) {
      fill(myImage.get(x, y));
      ellipse(x, y, STEP, STEP);
    }
  }
}

void draw() {
}