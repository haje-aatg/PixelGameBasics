class Thing {
  int xpos, ypos;
  String[] sprite;
  color baseColor = color(255, 255, 255);

  Thing(int _x, int _y) {
    xpos = _x;
    ypos = _y;
  }

  void updateObj() {
  }

  void setPosition(int _x, int _y) {
    xpos = _x;
    ypos = _y;
  }

  void draw() {
    drawSprite(xpos, ypos);
  }

  void drawSprite(int _x, int _y) {
    fill(baseColor);
    for (int i = 0; i < sprite.length; i++) {
      String row = (String) sprite[i];
      for (int j = 0; j < row.length(); j++) {
        if (row.charAt(j) == '1') {
          rect(_x+(j * pixelSize), _y+(i * pixelSize), pixelSize, pixelSize);
        }
      }
    }
  }
}
