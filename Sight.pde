class Sight extends GameObject
{

  
  Sight(float startX, float startY)
  {
    super(startX, startY, 50);     
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
    strokeWeight(5);
    line(0,0,-30,-50);
    line(0,0,30,-50);
    popMatrix();
  }//End render
}//End Characters class
