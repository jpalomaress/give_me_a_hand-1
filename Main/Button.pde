class Button {
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  void update() {

  }

  boolean over() { 
    return true; 
  }

}

class RectButton extends Button {
  RectButton(int ix, int iy, int isize, color ihighlight) {
    x = ix;
    y = iy;
    size = isize;
  
    //highlightcolor = ihighlight;

  }

  void display() {
    stroke(0);
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

