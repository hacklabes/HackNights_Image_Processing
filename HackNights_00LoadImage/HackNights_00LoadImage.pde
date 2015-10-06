PImage myImage;

void setup() {
  size(720, 720);
  myImage = loadImage("queen.jpg");
}
void draw() {
  image(myImage, 0, 0);
}