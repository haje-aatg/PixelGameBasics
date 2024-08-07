//https://processing.org/discourse/beta/num_1196108305.html
//Can detect 4 keys. Some times 5 or 6 on certain computers
boolean[] downKeys = new boolean[256];
boolean[] downCodedKeys = new boolean[256];
//PixelArt
int pixelSize = 4*2;
PFont font;
Player player;
Thing worldThing;

void setup() {
  size(800, 550);
  frameRate(30);
  noStroke();
  font = createFont("Arial", 36, true);
  player = new Player(width/2, height/2);
  player.setPosition(width/2, height/2);// - (groundlvl * pixelSize) - (player.sprite.length * pixelSize));
}

void draw() {
  background(0);
  player.draw();
  player.updateObj();
  println(player.jumpProgress);

  if (downKeys[32]) {
    player.jump();
  }
  if (downCodedKeys[37] || downCodedKeys[38] || downCodedKeys[39] || downCodedKeys[40]) {
    if (downCodedKeys[37]) {
      player.moveX(byte(-pixelSize));
    }
    if (downCodedKeys[39]) {
      player.moveX(byte(pixelSize));
    }
    if (downCodedKeys[38]) {
      player.moveY(byte(-pixelSize));
      //player.jump();
    }
    if (downCodedKeys[40]) {
      player.moveY(byte(pixelSize));
      //player.jump();
    }
  } else {
    player.stopMoving();
  }
}

void keyPressed() {
  if (key == CODED) {
    //print("Code: " + keyCode + ". ");
    if (keyCode<256) {
      downCodedKeys[keyCode] = true;
    }
  } else {
    //print("Key: " + (int)key + ". ");
    if (key<256) {
      downKeys[key] = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    //print("LiftCode: " + keyCode + ". ");
    if (keyCode<256) {
      downCodedKeys[keyCode] = false;
    }
  } else {
    //print("LiftKey: " + (int)key + ". ");
    if (key<256) {
      downKeys[key] = false;
    }
  }
}
