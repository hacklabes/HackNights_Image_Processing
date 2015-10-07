import gab.opencv.*;

OpenCV opencv;
PImage  img, thresh, contrast;

void setup() {
  img = loadImage("queen.jpg");
  size(900, 300);
  opencv = new OpenCV(this, img);
}

void draw() {
  float tamt = map(mouseX, 0, width, 0, 255);
  float camt = map(mouseY, 0, height, 0, 8);

  opencv.loadImage(img);
  opencv.threshold((int)tamt);
  thresh = opencv.getSnapshot();

  opencv.loadImage(img);
  opencv.contrast(camt);  
  contrast = opencv.getSnapshot();

  pushMatrix();
  scale(0.42);
  image(img, 0, 0);
  image(thresh, img.width, 0);
  image(contrast, img.height*2, 0);
  popMatrix();
}