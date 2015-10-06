import processing.video.*;

Capture myVideo;

void setup() {
  size(640, 480);
  myVideo = new Capture(this, 640, 480);
  myVideo.start();
}

void draw() {
  if (myVideo.available() == true) {
    myVideo.read();
  }
  image(myVideo, 0, 0);
}