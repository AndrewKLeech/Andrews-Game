class Sight extends GameObject
{
  PVector left;
  PVector right;
  
  Sight(float startX, float startY)
  {
    super(startX, startY, 50);   
    left = new PVector(0,0);
    right = new PVector(0,0);
    
  }
  void look(float theta)
  {
    this.theta = theta;
  }
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);

  }
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(c);
    fill(c);
    rotate(theta); 
    line(0,0,-150,-200);
    line(0,0,150,-200);
    line(-150,-200,150,-200);
    popMatrix();
  }//End render
}//End Characters class
