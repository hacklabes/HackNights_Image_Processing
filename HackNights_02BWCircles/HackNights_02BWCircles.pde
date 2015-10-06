PImage myImage;
int STEP = 12;

void setup() {
  size(720, 720);
  background(0);
  myImage = loadImage("queen.jpg");

  noStroke();
  for (int y=0; y<myImage.height; y+=STEP) {
    for (int x=0; x<myImage.width; x+=STEP) {
      float greyValue = blue(myImage.get(x, y));
      float ellipseSize = map(greyValue, 0, 255, 1, STEP*1.5);
      fill(greyValue);
      ellipse(x, y, ellipseSize, ellipseSize);
      //x+=ellipseSize;
    }
  }
}

void draw() {
}