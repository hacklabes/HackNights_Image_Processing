// from: http://www.dfstudios.co.uk/articles/programming/image-programming-algorithms/image-processing-algorithms-part-5-contrast-adjustment/

PImage  src, dst;
float contrastValue;

void setup() {
  src = loadImage("queen.jpg");
  dst = loadImage("queen.jpg");
  size(1440, 720);
}

void draw() {
  background(0);
  contrastValue = map(mouseY, 0, height, -255, 255);
  float factor = (259*(contrastValue+255))/(255*(259-contrastValue));

  for (int y=0; y<src.height; y+=1) {
    for (int x=0; x<src.width; x+=1) {
      color srcC = src.get(x, y);
      float dstC = factor*(red(srcC)-128)+128;
      dst.set(x, y, color(constrain(dstC,0,255)));
    }
  }

  image(src, 0, 0);
  image(dst, src.width, 0);
}