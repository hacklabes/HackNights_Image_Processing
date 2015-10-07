import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
PImage img;
ArrayList<Contour> contours;

Capture myVideo;

void setup() {
  size(640, 480);
  noFill();
  stroke(0, 255, 0);
  myVideo = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  contours = new ArrayList<Contour>();
  myVideo.start();
}

void draw() {
  if (myVideo.available()) {
    myVideo.read();
    opencv.loadImage(myVideo);
    img = opencv.getSnapshot();
    contours = opencv.findContours();
    image(img, 0, 0);
  }

  for (Contour contour : contours) {
    contour.draw();
  }
}