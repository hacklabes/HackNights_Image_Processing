import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture myVideo;
OpenCV opencv;

void setup() {
  size(640, 480);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);

  myVideo = new Capture(this, width/2, height/2);
  opencv = new OpenCV(this, width/2, height/2);

  // Possible Values
  //   CASCADE_FRONTALFACE, CASCADE_PROFILEFACE  
  //   CASCADE_EYE, CASCADE_NOSE, CASCADE_MOUTH, CASCADE_RIGHT_EAR
  //   CASCADE_UPPERBODY, CASCADE_LOWERBODY, CASCADE_FULLBODY, CASCADE_PEDESTRIAN
  //   CASCADE_CLOCK
  opencv.loadCascade(OpenCV.CASCADE_NOSE);
  //opencv.loadCascade(dataPath("nexus.xml"), true);

  myVideo.start();
}

void draw() {
  if (myVideo.available()) {
    myVideo.read();
    opencv.loadImage(myVideo);
  }

  pushMatrix();
  scale(2);
  image(myVideo, 0, 0);
  Rectangle[] faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  popMatrix();
}