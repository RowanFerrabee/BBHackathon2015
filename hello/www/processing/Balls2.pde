ArrayList<Ball> balls;

class Ball{
  PVector position;
  PVector velocity;
  int age;
  int max_age = 100;
  Ball(PVector p, PVector v){
    position = p;
    velocity = v;
    velocity.div(velocity.mag());
    velocity.mult(4);
    age = 0;
  }
  void display(){
    pushStyle();
    fill(200,0,200,(max_age-age));
    stroke(map(age,0,max_age,0,255));
    ellipse(position.x,position.y,20,20);
    popStyle();
  }
  void move(){
    position.add(velocity);
    age++;
  }
  boolean finished(){
  if(age>max_age)
    return true;
  else return false;
  }
}

void setup() {
  size(400, 400);
  balls = new ArrayList<Ball>();  // Create an empty ArrayList
}

void draw() {
  background(255);

  for (int i = balls.size()-1; i >= 0; i--) {
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove().
      balls.remove(i);
    }
  }
}

void mousePressed() {
  // A new ball object is added to the ArrayList, by default to the end.
  balls.add(new Ball(new PVector(mouseX, mouseY), new PVector(random(-3,3),random(-3,3))));
}
