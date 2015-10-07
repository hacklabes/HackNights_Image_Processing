import gab.opencv.*;
import processing.video.*;

Capture myVideo;
OpenCV opencv;

void setup() {
  size(640, 480);
  myVideo = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);

  // from: http://docs.opencv.org/java/org/opencv/video/BackgroundSubtractorMOG.html
  // BackgroundSubtractorMOG(int history, int nmixtures, double backgroundRatio)
  opencv.startBackgroundSubtraction(2, 3, 0.5);

  myVideo.start();
}

void draw() {
  if (myVideo.available()) {
    myVideo.read();
    opencv.loadImage(myVideo);

    opencv.updateBackground();
    opencv.dilate();
    opencv.erode();
  }

  image(myVideo, 0, 0);  

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}