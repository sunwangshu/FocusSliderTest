/* ---------------------- Supporting Slider Classes ---------------------------*/

// abstract basic slider
public abstract class BasicSlider {
  int x, y, w, h;  // center x, y. w, h means width and height of triangle
  int yBot, yTop;   // y range. Notice val of top y is less than bottom y
  boolean isPressed = false;
  color cNormal = #FFFFFF;
  color cPressed = #FF0000;

  BasicSlider(int _x, int _yBot, int _yTop) {
    x = _x;
    yBot = _yBot;
    yTop = _yTop;
    w = 10;
    h = 10;
  }

  // abstract functions
  
  abstract void update();
  abstract void screenResized(int _x, int _yBot, int _yTop);
  abstract float getVal();
  abstract void setVal(float _val);

  // shared functions
  
  void draw() {
    update();
    if (isPressed) fill(cPressed);
    else fill(cNormal);
    noStroke();
    triangle(x-w/2, y, x+w/2, y-h/2, x+w/2, y+h/2);
  }

  void mousePressed() {
    if (abs(mouseX - (x)) <= w/2 && abs(mouseY - y) <= h/2) {
      isPressed = true;
    }
  }

  void mouseReleased() {
    if (isPressed) {
      isPressed = false;
    }
  }
}

// middle slider that changes value and move
public class FocusSlider extends BasicSlider {
  private float val = 0;  // val = 0 ~ 1 -> yBot to yTop
  final float valMin = 0;
  final float valMax = 0.90;
  FocusSlider(int _x, int _yBot, int _yTop, float _val) {
    super(_x, _yBot, _yTop);
    val = constrain(_val, valMin, valMax);
    y = (int)map(val, 0, 1, yBot, yTop);
  }
  
  public void update() {
    if (isPressed) {
      float newVal = map(mouseY, yBot, yTop, 0, 1);
      val = constrain(newVal, valMin, valMax);
      y = (int)map(val, 0, 1, yBot, yTop);
      println(val);
    }
  }
  
  public void screenResized(int _x, int _yBot, int _yTop) {
    x = _x;
    yBot = _yBot;
    yTop = _yTop;
    y = (int)map(val, 0, 1, yBot, yTop);
  }

  public float getVal() {
     return val;
  }
  
  public void setVal(float _val) {
     val = constrain(_val, valMin, valMax);
     y = (int)map(val, 0, 1, yBot, yTop);
  }
}

// top slider that changes value but doesn't move
public class FocusSlider_Static extends BasicSlider {
  private float val = 0;  // val = 0 ~ 1 -> yBot to yTop
  final float valMin = 0.5;
  final float valMax = 2.0;
  FocusSlider_Static(int _x, int _yBot, int _yTop) {
    super(_x, _yBot, _yTop);
    val = 1;
    y = yTop;
  }

  public void update() {
    if (isPressed) {
      float newVal = map(mouseY, yBot, yTop, 0, 1);
      val = constrain(newVal, 0.5, 2.0);
      println(val);
    }
  }
  
  public void screenResized(int _x, int _yBot, int _yTop) {
    x = _x;
    yBot = _yBot;
    yTop = _yTop;
    y = yTop;
  }

  public float getVal() {
     return val;
  }
  
  public void setVal(float _val) {
     val = constrain(_val, 0.5, 2.0);
  }
  
}