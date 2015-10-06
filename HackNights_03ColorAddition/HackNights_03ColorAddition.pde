PImage myImage;

void setup() {
  size(720, 720);
  background(0);
  myImage = loadImage("queen.jpg");

  for (int y=0; y<myImage.height; y+=1) {
    for (int x=0; x<myImage.width; x+=1) {
      color cc = myImage.get(x, y);
      myImage.set(x, y, cc+6000);
    }
  }
}

void draw() {
  background(0);
  image(myImage, 0, 0);
}