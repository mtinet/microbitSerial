
// Example by Tom Igoe

import processing.serial.*;

// The serial port:
Serial myPort;  
String inString = null;
int lf = 10;

void setup() {
  size(200, 200);
    
  // List all the available serial ports:
  printArray(Serial.list());
  
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[3], 115200);
    
  // Send a capital A out the serial port:
  myPort.bufferUntil(lf);
}

void draw() {
  background(51);
  if (mouseOverRect() == true) {
    fill(255, 0, 0);
  } else {
    fill(100, 0, 100);
  }
  rect(50, 50, 100, 100);
  
  fill(255, 255, 0);
  text("received: " + inString, 10, 30);
}

boolean mouseOverRect() {
  return ((mouseX > 50) && (mouseX < 150) && (mouseY >= 50) && (mouseY <= 150));
}


void mousePressed() {
  if (mouseOverRect() == true) {
    myPort.write("abc\n");
    println("abc");
  } else {
    myPort.write("kjh\n");
    println("kjh");
  }
}


void serialEvent(Serial p) {
  inString = p.readString();
}
