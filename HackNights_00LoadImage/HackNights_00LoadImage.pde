PImage myImage;

void setup() {
  size(720, 720);
  
  myImage = loadImage("queen.jpg");

  /*Image queen.jpg at the data folder
  
  ├── HackNights_00LoadImage
  │   ├── HackNights_00LoadImage.pde
  │   └── data
  │       └── queen.jpg
  */
  
  /*
  Print in the console the HEX value of the color 
  for the Pixel at position (0,0)
  format of FFBEB089
  */
  println(hex(myImage.get(0,0)));
}
void draw() {
  image(myImage, 0, 0);
}