import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class divinity2 extends PApplet {

int posx;
int posy;
float orbit=0;
float orbit2=0;
int followingx = 0;
int followingy = 0;
PImage figure1;

public void setup() {
  
  
  background(0);
  strokeWeight(2);
  stroke(255, 255, 255);
  noFill(); 

  figure1 = loadImage("headv2-02.png");
  figure1.resize(0, 600);
  posx = width/2;
  posy = height/2;
}

public void draw() {
  stroke(255, 255, 255);
  noFill(); 
  background(0);
  rectMode(CENTER);
  imageMode(CENTER);


  pushMatrix();
  translate(posx, posy);
  rotate(radians(45));
  rect(0, 0, 500, 500);
  popMatrix();

  pushMatrix();
  translate(posx, posy); 
  rotate(radians(orbit));

  //planet 1-----------------------------------------------

  ellipse(0, 0, 500, 500);
  ellipse(250, 0, 50, 50);
  ellipse(-250, 0, 100, 100);

  followingx=250;
  followingy=0;

  //moon 1--------------------------------------------------
  translate(followingx, followingy);
  rotate(radians(orbit2));
  ellipse(0, 0, 100, 100);
  ellipse(50, 0, 10, 10);

  orbit-=.15f;
  orbit2-=3;
  popMatrix();

  image(figure1, posx, height-240);

  fill(255);
  ellipse(posx, posy, 100, 100);
}
  public void settings() {  size(1000, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "divinity2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
