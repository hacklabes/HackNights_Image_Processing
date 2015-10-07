PImage  src, dst;
float thresholdValue;

void setup() {
  src = loadImage("queen.jpg");
  dst = loadImage("queen.jpg");
  size(1440, 720);
}

void draw() {
  thresholdValue = map(mouseY, 0, height, 0, 255);
  
  for (int y=0; y<src.height; y+=1) {
    for (int x=0; x<src.width; x+=1) {
      if (red(src.get(x, y)) > thresholdValue) {
        dst.set(x, y, color(255));
      } else {
        dst.set(x, y, color(0));
      }
    }
  }

  image(src, 0, 0);
  image(dst, src.width, 0);
}