PImage  img, thresh, contrast;

void setup() {
  img = loadImage("queen.jpg");
  thresh = loadImage("queen.jpg");
  contrast = loadImage("queen.jpg");
  size(900, 300);
}

void draw() {
  float thresholdValue = map(mouseX, 0, width, 0, 255);
  float contrastValue = map(mouseY, 0, height, -255, 255);
  float factor = (259*(contrastValue+255))/(255*(259-contrastValue));

  // threshold  
  for (int y=0; y<img.height; y+=1) {
    for (int x=0; x<img.width; x+=1) {
      if (red(img.get(x, y)) > thresholdValue) {
        thresh.set(x, y, color(255));
      } else {
        thresh.set(x, y, color(0));
      }
    }
  }

  // contrast
  for (int y=0; y<img.height; y+=1) {
    for (int x=0; x<img.width; x+=1) {
      color srcC = img.get(x, y);
      float dstC = factor*(red(srcC)-128)+128;
      contrast.set(x, y, color(constrain(dstC, 0, 255)));
    }
  }

  pushMatrix();
  scale(0.42);
  image(img, 0, 0);
  image(thresh, img.width, 0);
  image(contrast, img.height*2, 0);
  popMatrix();
}