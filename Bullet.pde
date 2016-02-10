class Bullet extends GameObject
{
  Bullet()
  {
    speed = 20.0f;
  }
  
  void render()
  {
    stroke(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, -15, 0, -5);
    popMatrix();    
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    pos.add(forward);
    
    //Bullet removed if it hits the edge of the screen
    if (pos.x < 0 || pos.y < 0 || pos.x > width || pos.y > height)
    {
      gameObjects.remove(this);
    }//End if
  }//End if
  
  void applyTo(Characters character)
  {
    character.lives --;
  }
}//End Bullet class
