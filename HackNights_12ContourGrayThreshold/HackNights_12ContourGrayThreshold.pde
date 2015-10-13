import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
PImage img;
ArrayList<Contour> contours;

Capture myVideo;

void setup() {
  size(640, 960);
  noFill();
  stroke(0, 255, 0);
  myVideo = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  contours = new ArrayList<Contour>();
  myVideo.start();
}

void draw() {
  int threshold = (int)map(mouseX,0,width,0,255);

  if (myVideo.available()) {
      background(0);

    myVideo.read();
    opencv.loadImage(myVideo);
    opencv.gray();
    opencv.threshold(threshold);

    img = opencv.getSnapshot();
    //image(img, 0, 0);

    contours = opencv.findContours();
    
    image(myVideo, 0, 480);

  }

  for (Contour contour : contours) {
    contour.draw();
  }
}