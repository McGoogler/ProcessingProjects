import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class recursion_flower extends PApplet {

// Recursion Flower Caleb Sanchez
int time;
float dotSize = 9;
float angleOffsetA;
float angleOffsetB;


public void setup() {  
  beginRecord(PDF, "pattern.pdf");
  colorMode(RGB, 255);
  
  stroke(1);
  fill(255, 255, 255);
  
  background(255);
  
  time=0;

  angleOffsetA = radians(1.5f); 
  angleOffsetB = radians(50);
}

public void draw() {
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

public void seed1(float dotSize, float angle, float x, float y) {
  if (dotSize > 1.0f) {
    float r = random(0, 1.0f);  

    // 99% chance this will happen
    if (r > 0.01f) {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle) * dotSize;
      float newy = y + sin(angle) * dotSize;
      seed1(dotSize * 0.99f, angle - angleOffsetA, newx, newy);
    }
    // 01% chance this will happen
    else {  
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle);
      float newy = y + sin(angle);
      seed2(dotSize * 0.99f, angle + angleOffsetA, newx, newy);
      seed1(dotSize * 0.60f, angle + angleOffsetB, newx, newy);
      seed2(dotSize * 0.50f, angle - angleOffsetB, newx, newy);
    }
  }
}


public void seed2(float dotSize, float angle, float x, float y) {
  if (dotSize > 1.0f) {
    float r = random(0, 1.0f);

    // 99% chance this will happen
    if (r > 0.01f) {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle) * dotSize;
      float newy = y + sin(angle) * dotSize;
      seed2(dotSize * 0.99f, angle + angleOffsetA, newx, newy);
    } 
    // 01% chance this will happen
    else {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle);
      float newy = y + sin(angle);
      seed1(dotSize * 0.99f, angle + angleOffsetA, newx, newy);  
      seed2(dotSize * 0.60f, angle + angleOffsetB, newx, newy);
      seed1(dotSize * 0.50f, angle - angleOffsetB, newx, newy);
    }
  }
}

public void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
    println("end");
  }
}
  public void settings() {  size(1500, 1500);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "recursion_flower" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
