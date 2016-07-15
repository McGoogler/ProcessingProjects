/*Important global variables*/
int posx, posy, counter, frames;

/*Animation for planets*/
float orbit=0;
float orbit2=0;
float orbitSpeed=.01;
float orbit2Speed=.03;
float orbitSizeInc=0;
float orbit2SizeInc=0;
float xPlanet1, yPlanet1;
float xPlanet2, yPlanet2;
int planet1Radius = 300;
int planet2Radius = 75;

/*Color variables*/
float red, green, blue;
float redInc, greenInc, blueInc;
float redIncStore=0, greenIncStore=0, blueIncStore=0;

/*----------------------TEST----------------------*/
/*Button setup TEST*/
int circleSize = 40;   
color circleColor, circleHighlight;

int button1FastX, button1FastY;
int button1SlowX, button1SlowY;
int button2FastX, button2FastY;
int button2SlowX, button2SlowY;

boolean button1FastOver = false;
boolean button1SlowOver = false;
boolean button2FastOver = false;
boolean button2SlowOver = false;

int button1GrowX, button1GrowY;
int button1ShrinkX, button1ShrinkY;
int button2GrowX, button2GrowY;
int button2ShrinkX, button2ShrinkY;

boolean button1GrowOver = false;
boolean button1ShrinkOver = false;
boolean button2GrowOver = false;
boolean button2ShrinkOver = false;

int buttonRedX, buttonRedY;
int buttonGreenX, buttonGreenY;
int buttonBlueX, buttonBlueY;

boolean buttonRed = false;
boolean buttonGreen = false;
boolean buttonBlue = false;


/*----------------------TEST----------------------*/


void setup() {
  size(1500, 1000);
  posx = width/2;
  posy = height/2;
  smooth();
  background(0);


  /*----------------------TEST----------------------*/
  /*Button setup TEST*/
  circleColor = color(204);
  circleHighlight = color(255);


  button1FastX = width-100;
  button1FastY = height/6;
  button1SlowX = width-170;
  button1SlowY = height/6;

  button1GrowX = width-100;
  button1GrowY = height/6+50;
  button1ShrinkX = width-170;
  button1ShrinkY = height/6+50;



  button2FastX = width-100;
  button2FastY = height/6+200;
  button2SlowX = width-170;
  button2SlowY = height/6+200;

  button2GrowX = width-100;
  button2GrowY = height/6+250;
  button2ShrinkX = width-170;
  button2ShrinkY = height/6+250;



  buttonRedX = 50;
  buttonRedY = 200;
  buttonGreenX = 100;
  buttonGreenY = 200;
  buttonBlueX = 150;
  buttonBlueY = 200;
  /*----------------------TEST----------------------*/


  strokeWeight(4);
  stroke(255);
  noFill();
  noStroke();

  red=random(0, 255);
  green=random(0, 255);
  blue=random(0, 255);

  redInc =random(.01, 2.5);
  greenInc=random(.01, 2.5);
  blueInc=random(.01, 2.5);
}

void draw() {

  /*----------------------TEST----------------------*/
  /*Buttons*/
  update(mouseX, mouseY);
  
  if (button1FastOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button1FastX, button1FastY, circleSize, circleSize);

  if (button1SlowOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button1SlowX, button1SlowY, circleSize, circleSize);

  if (button1GrowOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button1GrowX, button1GrowY, circleSize, circleSize);

  if (button1ShrinkOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button1ShrinkX, button1ShrinkY, circleSize, circleSize);

  if (button2FastOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button2FastX, button2FastY, circleSize, circleSize);

  if (button2SlowOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button2SlowX, button2SlowY, circleSize, circleSize);

  if (button2GrowOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button2GrowX, button2GrowY, circleSize, circleSize);

  if (button2ShrinkOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  ellipse(button2ShrinkX, button2ShrinkY, circleSize, circleSize);
  
  if (buttonRed) {
    fill(255,0,0);
  } else {
    fill(red,0,0);
  }
  ellipse(buttonRedX, buttonRedY, circleSize, circleSize);
  
  if (buttonGreen) {
    fill(0,255,0);
  } else {
    fill(0,green,0);
  }
  ellipse(buttonGreenX, buttonGreenY, circleSize, circleSize);
  
  if (buttonBlue) {
    fill(0,0,255);
  } else {
    fill(0,0,blue);
  }
  ellipse(buttonBlueX, buttonBlueY, circleSize, circleSize);
  /*----------------------TEST----------------------*/




  /*Interface*/
  noFill();
  stroke(255);
  ellipse(width-135, height/6-70, 70, 70);
  ellipse(width-135, height/6+150, 20, 20);


  noStroke();
  fill(red, green, blue); 
  ellipse(100, 100, 100, 100);






  /* planet1 */
  yPlanet1 = posy + (planet1Radius+orbitSizeInc) * cos(orbit);
  xPlanet1 = posx + (planet1Radius+orbitSizeInc) * sin(orbit);

  /* planet2 */
  yPlanet2 = posy + planet2Radius * cos(orbit2);
  xPlanet2 = posx + planet2Radius * sin(orbit2);

  if (frames>=1200) {
    redInc =random(.01, 2.5);
    greenInc=random(.01, 2.5);
    blueInc=random(.01, 2.5);
    frames=0;
  }

  if (counter%12==0) {
    if (red>=255) {
      red = 255;
      redInc=redInc*-1;
    } else if (red<=0) {
      red=0;
      redInc=redInc*-1;
    }

    if (green>=255) {
      green=255;
      greenInc=greenInc*-1;
    } else if (green<=0) {
      green=0;
      greenInc=greenInc*-1;
    }

    if (blue>=255) {
      blue=255;
      blueInc=blueInc*-1;
    } else if (blue<=0) {
      blue=0;
      blueInc=blueInc*-1;
    }
    stroke(red, green, blue, 90);
    line(xPlanet1, yPlanet1, xPlanet2, yPlanet2);
  }

  noStroke();
  ellipse(xPlanet1, yPlanet1, 10, 10);
  ellipse(xPlanet2, yPlanet2, 10, 10);

  /*incrementation*/
  orbit+=orbitSpeed;
  orbit2+=orbit2Speed;
  counter+=1;

  frames+=1;

  red+=redInc;
  green+=greenInc;
  blue+=blueInc;
}

void mousePressed() {
  if (button1FastOver) {
    //setup();
    orbitSpeed+=.005;
  }

  if (button1SlowOver) {
    //setup();
    orbitSpeed-=.005;
  }

  if (button1GrowOver) {
    //setup();
    planet1Radius+=5;
  }

  if (button1ShrinkOver) {
    //setup();
    planet1Radius-=5;
  }

  if (button2FastOver) {
    //setup();
    orbit2Speed+=.005;
  }

  if (button2SlowOver) {
    //setup();
    orbit2Speed-=.005;
  }

  if (button2GrowOver) {
    //setup();
    planet2Radius+=5;
  }

  if (button2ShrinkOver) {
    //setup();
    planet2Radius-=5;
  }
  
  if (buttonRed) {
    if(redIncStore==0){  
      redIncStore = redInc;
      redInc =0;
    }else{
      redInc =redIncStore;
      redIncStore =0;
    }
  }
  if (buttonGreen) {
  }
  if (buttonBlue) {
  }
}

void mouseReleased() {
}

void update(int x, int y) {
  if (overCircle(button1FastX, button1FastY, circleSize) ) {
    button1FastOver = true;
  } else {
    button1FastOver = false;
  }

  if (overCircle(button1SlowX, button1SlowY, circleSize) ) {
    button1SlowOver = true;
  } else {
    button1SlowOver = false;
  }

  if (overCircle(button1GrowX, button1GrowY, circleSize) ) {
    button1GrowOver = true;
  } else {
    button1GrowOver = false;
  }

  if (overCircle(button1ShrinkX, button1ShrinkY, circleSize) ) {
    button1ShrinkOver = true;
  } else {
    button1ShrinkOver = false;
  }

  if (overCircle(button2FastX, button2FastY, circleSize) ) {
    button2FastOver = true;
  } else {
    button2FastOver = false;
  }

  if (overCircle(button2SlowX, button2SlowY, circleSize) ) {
    button2SlowOver = true;
  } else {
    button2SlowOver = false;
  }

  if (overCircle(button2GrowX, button2GrowY, circleSize) ) {
    button2GrowOver = true;
  } else {
    button2GrowOver = false;
  }

  if (overCircle(button2ShrinkX, button2ShrinkY, circleSize) ) {
    button2ShrinkOver = true;
  } else {
    button2ShrinkOver = false;
  }
  
  
  if (overCircle(buttonRedX, buttonRedY, circleSize) ) {
    buttonRed = true;
  } else {
    buttonRed = false;
  }
  
  if (overCircle(buttonGreenX, buttonGreenY, circleSize) ) {
    buttonGreen = true;
  } else {
    buttonGreen = false;
  }
  
  if (overCircle(buttonBlueX, buttonBlueY, circleSize) ) {
    buttonBlue = true;
  } else {
    buttonBlue = false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}