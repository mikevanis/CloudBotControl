import processing.serial.*;

PFont font;

Serial eye;

void setup() {
  size(100, 100);
  fill(255);

  font = loadFont("HelveticaNeue-12.vlw");
  textFont(font, 12);
  
  String portName = Serial.list()[0];
  eye = new Serial(this, portName, 115200);
  println("SENT COMMAND");
  //eye.write("40\r");
  //eye.flush();
}

void draw() {
    background(0);
    ellipse(mouseX, mouseY, 10, 10);
  
    fill(255);
    text("X: ", 10, 10);
    text(mouseX-width/2, 30, 10);
    text("Y: ", 10, 20);
    text(mouseY-height/2, 30, 20);
    
    // Send x to robot
    String cmd = Integer.toString(mouseX-width/2);
    eye.write(cmd + "\r");
    while(eye.available() > 0) {
      print(eye.readChar());
    }
    
  }

