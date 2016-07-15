

void setup() {
  size(1366, 768);
  background(0);
  noLoop();
  noFill();
  stroke(255);
  //frameRate(1);
}


void draw()
{
  translate(width/2, height/2);
  Ysystem (0, 0, 0, 10, 30, 10);
}


void Ysystem (float sx, float sy, float ex, float ey, int angle, int level)
{
  int new_level = level-1;  
  line(sx, sy, ex, ey);
  //rectMode(CENTER);
  //rect(sx,sy,10,10);
  ellipse(sx,sy,10,10);
  
  if (level>0){
    float dist = sqrt( (sx-ex)*(sx-ex)+(sy-ey)*(sy-ey) );
    float dx = (ex-sx)/dist;
    float dy= (ey-sy)/dist;
    //float R = radians(angle);
    
    //float new_dist = 0.9*dist*cos(R);
    float new_dist = dist;//*cos(R);
    
    float new_cx = ex+dx*new_dist;
    float new_cy = ey+dy*new_dist;
    
    //float final_dist = 0.9*dist*sin(R);
    float final_dist = dist;//*sin(R);
    
    float dx1 = -dy;
    float dy1 = dx;
    float dx2 = dy;
    float dy2 = -dx;
    
    
    float new_ex1 = new_cx+dx1*final_dist;
    float new_ey1 = new_cy+dy1*final_dist;
    float new_ex2 = new_cx+dx2*final_dist;
    float new_ey2 = new_cy+dy2*final_dist;
    
    
    Ysystem(ex, ey, new_ex1, new_ey1, angle, new_level);
    Ysystem(ex, ey, new_ex2, new_ey2, angle, new_level);
  }
  return;
  
  
}
