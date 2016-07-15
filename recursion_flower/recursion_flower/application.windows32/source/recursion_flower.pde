// Recursion Flower Caleb Sanchez
int time;
float dotSize = 9;
float angleOffsetA;
float angleOffsetB;
import processing.pdf.*;

void setup() {  
  beginRecord(PDF, "pattern.pdf");
  colorMode(RGB, 255);
  size(1500, 1500);
  stroke(1);
  fill(255, 255, 255);
  smooth();
  background(255);
  
  time=0;

  angleOffsetA = radians(1.5); 
  angleOffsetB = radians(50);
}

void draw() {
  time++;
  println(time);  
  translate(width/2, height/2);          
  for (int i = 0; i<=360; i+=60) {
    pushMatrix();    
    rotate(radians(i));
    seed1(dotSize, radians(270), 0, 0);  // Start the tree
    popMatrix();
  }
  if(time==300){
    setup();
  }
}

void seed1(float dotSize, float angle, float x, float y) {
  if (dotSize > 1.0) {
    float r = random(0, 1.0);  

    // 99% chance this will happen
    if (r > 0.01) {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle) * dotSize;
      float newy = y + sin(angle) * dotSize;
      seed1(dotSize * 0.99, angle - angleOffsetA, newx, newy);
    }
    // 01% chance this will happen
    else {  
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle);
      float newy = y + sin(angle);
      seed2(dotSize * 0.99, angle + angleOffsetA, newx, newy);
      seed1(dotSize * 0.60, angle + angleOffsetB, newx, newy);
      seed2(dotSize * 0.50, angle - angleOffsetB, newx, newy);
    }
  }
}


void seed2(float dotSize, float angle, float x, float y) {
  if (dotSize > 1.0) {
    float r = random(0, 1.0);

    // 99% chance this will happen
    if (r > 0.01) {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle) * dotSize;
      float newy = y + sin(angle) * dotSize;
      seed2(dotSize * 0.99, angle + angleOffsetA, newx, newy);
    } 
    // 01% chance this will happen
    else {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle);
      float newy = y + sin(angle);
      seed1(dotSize * 0.99, angle + angleOffsetA, newx, newy);  
      seed2(dotSize * 0.60, angle + angleOffsetB, newx, newy);
      seed1(dotSize * 0.50, angle - angleOffsetB, newx, newy);
    }
  }
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
    println("end");
  }
}