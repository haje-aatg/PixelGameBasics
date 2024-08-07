class Player extends Thing {
  //Skin colurs found in the researvh article
  //https://www.researchgate.net/publication/310443424_Improvement_of_Haar_Feature_Based_Face_Detection_in_OpenCV_Incorporating_Human_Skin_Color_Characteristic/download?_tp=eyJjb250ZXh0Ijp7ImZpcnN0UGFnZSI6Il9kaXJlY3QiLCJwYWdlIjoiX2RpcmVjdCJ9fQ
  color[] skinColour;
  String[] spriteMove;
  boolean movingAnimation = false;
  byte[] jumpCurve;
  int jumpProgress;

  Player(int _x, int _y) {
    super(_x, _y);
    sprite = new String[6];
    sprite[0] = "00200";
    sprite[1] = "00100";
    sprite[2] = "00100";
    sprite[3] = "00100";
    sprite[4] = "00100";
    sprite[5] = "00100";
    spriteMove = new String[6];
    spriteMove[0] = "00200";
    spriteMove[1] = "01110";
    spriteMove[2] = "10101";
    spriteMove[3] = "00100";
    spriteMove[4] = "01010";
    spriteMove[5] = "10001";
    jumpCurve = new byte[] {-4, -4, -2, -2, 0, 0, 2, 2, 4, 4};
    jumpProgress = -1;
  }

  void updateObj() {
    if (jumpProgress >= 0) {
      ypos += jumpCurve[jumpProgress];
      jumpProgress++;
    }
    if (jumpProgress >= jumpCurve.length) {
      jumpProgress = -1;
    }
  }

  void loseLife() {
  }

  void jump() {
    if (jumpProgress == -1) {
      jumpProgress = 0;
    }
  }

  void moveX(byte amount) {
    player.xpos += amount;
    movingAnimation = true;
  }
  void moveY(byte amount) {
    player.ypos += amount;
    movingAnimation = true;
  }

  void stopMoving() {
    movingAnimation = false;
  }

  void draw() {
    if (movingAnimation && frameCount%2==0) {
      drawSpriteC(xpos, ypos, spriteMove);
    } else {
      drawSpriteC(xpos, ypos, sprite);
    }
  }

  void drawSpriteC(int _x, int _y, String[] _sprite) {
    fill(baseColor);
    for (int i = 0; i < _sprite.length; i++) {
      String row = (String) _sprite[i];
      for (int j = 0; j < row.length(); j++) {
        if (row.charAt(j) == '1') {
          fill(baseColor);
          rect(_x+(j * pixelSize), _y+(i * pixelSize), pixelSize, pixelSize);
        } else if (row.charAt(j) == '2') {
          fill(color(255, 215, 200));
          rect(_x+(j * pixelSize), _y+(i * pixelSize), pixelSize, pixelSize);
        }
      }
    }
  }
}
