PGraphics composite;
PImage source;

void setup() {
  size(1280, 720);
  source = loadImage("img4.png");
  composite = createGraphics(source.width, source.height);
  composite.beginDraw();
  composite.background(0);
  composite.smooth();
  for (int i=0; i<300000; i++) {
    int rndX = (int) random(source.width);
    int rndY = (int) random(source.height);
    int c = source.get(rndX, rndY);
    composite.stroke(red(c), green(c), blue(c), map(brightness(c), 0, 255, 0, 5));
    composite.line(rndX, rndY, rndX+map(brightness(c), 0, 255, 0, 100), rndY+map(brightness(c), 0, 255, -100, 10));
  }
  composite.endDraw();
  image(composite, 0, 0, width, height);
  blend(fade(source, 30), 0 , 0, width, height, 0, 0, width, height, ADD);
}

PGraphics fade(PImage img, float percentage) {
  PGraphics tmpImg = createGraphics(img.width, img.height);
  tmpImg.beginDraw();
  tmpImg.image(img, 0, 0);
  tmpImg.loadPixels();
  for (int i = 0; i < tmpImg.pixels.length; i++) {
    int p = tmpImg.pixels[i];
    float a = alpha(p) * (percentage / 100);
    tmpImg.pixels[i] = color(red(p), green(p), blue(p), a);
  }
  tmpImg.updatePixels();
  tmpImg.endDraw();
  return tmpImg;
}

