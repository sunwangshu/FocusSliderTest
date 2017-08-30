FocusSlider slider;
FocusSlider_Static slider2;

void setup() {
  size(100,100);
  slider = new FocusSlider(50, 80, 20, 0.6);
  slider2 = new FocusSlider_Static(50, 80, 20);
}

void draw() {
  background(0);
  slider.draw();
  slider2.draw();
}

void mousePressed() {
  slider.mousePressed();
  slider2.mousePressed();
}

void mouseReleased() {
  slider.mouseReleased();
  slider2.mouseReleased();
}