// Mostly from Animated Sprite Processing Tutorial
// https://processing.org/examples/animatedsprite.html

// Class for animating a sequence of GIFs
class Animation {
  PImage[] images;
  int imageCount;
  int frame = 0;
  PVector position;
  
  Animation(PVector p, PImage[] frames) {
    position = p;
    images = frames;
    imageCount = frames.length;
  }

  void display() {
    image(images[frame], position.x, position.y); 
    frame = (frame+1);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

// load in gif frames
PImage[] loadFrames(String imagePrefix, int count) {
  PImage[] images = new PImage[count];

  for (int i = 0; i < count; i++) {
    // Use nf() to number format 'i' into three digits
    String filename = imagePrefix + nf(i, 3) + ".gif";
    images[i] = loadImage(filename);
  }

  return images;
}
