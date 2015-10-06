import processing.video.*;

// this is the number of pixels that have to change between consecutive frames.
int MOVEMENT_THRESHOLD = 20000;

int numPixels;
boolean debug = false;
int flashValue = 0;
Capture video;
PImage frameDiff, previousFrame;

void setup() {
  size(640, 480);
  frameRate(30);

  video = new Capture(this, width, height);
  video.start(); 

  frameDiff = createImage(width, height, ARGB);
  previousFrame = createImage(width, height, ARGB);

  numPixels = video.width * video.height;
}

void draw() {
  if (video.available()) {
    video.read();

    video.loadPixels();
    frameDiff.loadPixels();
    previousFrame.loadPixels();

    int movementSum = 0;
    for (int i = 0; i < numPixels; i++) {
      int frameDiffB = abs((video.pixels[i]&0xFF) - (previousFrame.pixels[i]&0xFF));

      movementSum += (frameDiffB>64)?frameDiffB:0;

      frameDiff.pixels[i] = color(frameDiffB);
      previousFrame.pixels[i] = video.pixels[i];
    }
    previousFrame.updatePixels();
    frameDiff.updatePixels();

    // FLASH
    flashValue = max(0, flashValue-12);
    if (movementSum > MOVEMENT_THRESHOLD && flashValue==0) {
      flashValue = 255;
      println("FLASH");
    }

    // draw stuff
    background(0);
    image(debug?frameDiff:video, 0, 0);
    fill(flashValue, flashValue);
    rect(0, 0, width, height);
  }
}

void keyPressed() {
  if (key == ' ' || key == 'd' || key == 'D') {
    debug = !debug;
  }
}