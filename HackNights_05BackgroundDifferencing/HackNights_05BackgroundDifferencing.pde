import processing.video.*;

// this is the number of pixels that have to differ from background.
int BACKGROUND_THRESHOLD = 300000;

int numPixels;
boolean debug = false;
Capture video;
PImage frameDiff, backgroundFrame;

void setup() {
  size(640, 480);
  frameRate(30);

  video = new Capture(this, width, height);
  video.start(); 

  frameDiff = createImage(width, height, ARGB);
  backgroundFrame = createImage(width, height, ARGB);

  numPixels = video.width * video.height;
  stroke(255, 0, 0);
  strokeWeight(4);
  noFill();
}

void draw() {
  if (video.available()) {
    video.read();

    video.loadPixels();
    frameDiff.loadPixels();
    backgroundFrame.loadPixels();

    int backgroundSum = 0;
    for (int i = 0; i < numPixels; i++) {
      int frameDiffB = abs((video.pixels[i]&0xFF) - (backgroundFrame.pixels[i]&0xFF));

      backgroundSum += (frameDiffB>64)?frameDiffB:0;

      frameDiff.pixels[i] = color(frameDiffB);
    }
    frameDiff.updatePixels();

    // draw stuff
    background(0);
    image(debug?frameDiff:video, 0, 0);

    if (backgroundSum > BACKGROUND_THRESHOLD) {
      rect(4, 4, width-8, height-8);
    }
  }
}

void keyPressed() {
  if (key == ' ' || key == 'd' || key == 'D') {
    debug = !debug;
  } else if (key == 'c' || key == 'C') {
    backgroundFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
  }
}