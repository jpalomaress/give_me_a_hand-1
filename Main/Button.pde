class Button {
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  void update() {
    if(over()) {
      currentcolor = highlightcolor;
    } else {
      currentcolor = basecolor;
    }
  }

  boolean over() { 
    return true; 
  }

}

class RectButton extends Button {
  RectButton(int ix, int iy, int isize, color icolor, color ihighlight) {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }

  void display() {
    stroke(255);
    fill(currentcolor);
    rect(x, y, size, size);
  }
  
  boolean over(int x, int y) {
    if (x >= this.x && x <= this.x+this.size
      && y >= this.y && y <= this.y+this.size) {
      return true;
    } else {
      return false;
    }
  } 
}

