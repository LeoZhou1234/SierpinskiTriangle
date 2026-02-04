int len = 20;
int base = 10;
int numCalls = 0;

public void setup() {
  size(750,750);
  noLoop();
}

public void draw() {
  background(50);
  //long startTime = System.nanoTime();
  numCalls = 0;
  sierpinski(0,0,len);
  text("w/s or up/down to change base len", 50, 550);
  text("a/d or left/right to change start len", 50, 575);
  text("current start len: " + Integer.toString(len), 50, 600);
  text("current base len: " + Integer.toString(base), 50, 625);
  text("num recursive calls: " + Integer.toString(numCalls), 50, 650);
  //text("last recursion runtime: " + Long.toString((System.nanoTime()-startTime)/1_000_000) + " ms", 50, 675);
}

void keyPressed() {
  if (key == 'w' || keyCode == UP) {
    base += 5;
  }
  else if (key == 's' || keyCode == DOWN) {
    base = Math.max(1, base-5);
  }
  else if (key == 'a' || keyCode == LEFT) {
    
    len = Math.max(1, len-10);
  }
  else if (key == 'd' || keyCode == RIGHT) {
    len += 10;
  }
  redraw();
}

public void sierpinski(float x, float y, float len)  {
  numCalls++;
  if (len <= base) {
    triangle(x, y, x+len, y, x+len/2, y+len);
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x+len/2, y, len/2);
    sierpinski(x+len/4, y+len/2, len/2);
  }
}
