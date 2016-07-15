int posx;
int posy;
float orbit=0;
float orbit2=0;
int followingx = 0;
int followingy = 0;
PImage figure1;

void setup() {
  size(1000, 700);
  smooth();
  background(0);
  strokeWeight(2);
  stroke(255, 255, 255);
  noFill(); 

  figure1 = loadImage("headv2-02.png");
  figure1.resize(0, 600);
  posx = width/2;
  posy = height/2;
}

void draw() {
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

  orbit-=.15;
  orbit2-=3;
  popMatrix();

  image(figure1, posx, height-240);

  fill(255);
  ellipse(posx, posy, 100, 100);
}