Bacteria[] tri;
boolean isMoving = true; 

void setup() {     
  size(600,600);
  tri = new Bacteria[1000];
  for(int i = 0; i < tri.length; i++){
    tri[i] = new Bacteria();
  }
}   

void draw() {    
  background(255);
  for(int i = 0; i < tri.length; i++){
    tri[i].show();
    if (isMoving) {
      tri[i].move();
    }
  }
}  

void mousePressed() {
  isMoving = !isMoving; 
}

class Bacteria {
  float myX, myY;
  int r;  
  
  Bacteria(){
    myX = 300;
    myY = 300;
    r = (int)(Math.random()*144)+1;
  }   

  void show(){
    noStroke();
    fill(20, r, 145);
    ellipse(myX, myY, 5, 5);
  }   

  void move(){
    // Increase speed multiplier for faster movement
    float speedMultiplier = 1.5;

    // Random jitter with increased speed
    float dx = (float)(Math.random()*10 - 5) * speedMultiplier;
    float dy = (float)(Math.random()*10 - 5) * speedMultiplier;

    // Bias toward mouse cursor
    float biasStrength = 1.0;  // strength of attraction to mouse
    float dirX = mouseX - myX;
    float dirY = mouseY - myY;
    float length = dist(myX, myY, mouseX, mouseY);

    if (length != 0) {
      dirX /= length;  // normalize
      dirY /= length;
    }

    dx += dirX * biasStrength;
    dy += dirY * biasStrength;

    myX += dx;
    myY += dy;

    // Bounce back gently near edges to prevent corner drifting
    if (myX < 10) {
      myX = 10;
    } else if (myX > width - 10) {
      myX = width - 10;
    }

    if (myY < 10) {
      myY = 10;
    } else if (myY > height - 10) {
      myY = height - 10;
    }
  }   
}
