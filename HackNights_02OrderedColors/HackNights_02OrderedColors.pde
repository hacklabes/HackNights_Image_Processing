PImage myImage;
int STEP = 5;
ArrayList<ArrayList<PVector>> groups;

void setup() {
  size(720, 720);
  background(0);
  myImage = loadImage("queen.jpg");
  noStroke();

  // init group arrays
  groups = new ArrayList<ArrayList<PVector>>();
  for (int i=0; i<8; i++) {
    groups.add(new ArrayList<PVector>());
  }

  // add each (x,y) to corresponding group array
  for (int y=0; y<myImage.height; y+=STEP) {
    for (int x=0; x<myImage.width; x+=STEP) {
      int ind = (myImage.get(x, y)&0xff)/32;
      groups.get(ind).add(new PVector(x, y));
    }
  }

  // process groups
  for (int i=0; i<groups.size(); i++) {
    ArrayList<PVector> t = groups.get(i);
    for (int j=0; j<t.size(); j++) {
      PVector pv = t.get(j);
      fill(myImage.get((int)pv.x, (int)pv.y), 200);
      int size = (int)map(i, 0,groups.size(), 32,8);
      pushMatrix();
      translate(pv.x, pv.y);
      rotate(radians(random(-45,45)));
      rect(0,0, size*1.5, size/1.5);
      popMatrix();
    }
  }
}

void draw() {
}