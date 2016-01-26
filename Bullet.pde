class Bullet extends GameObject
{
  
  Bullet()
  {
    speed = 20.0f;
  }
  
  void render()
  {
    stroke(c);
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
    
    if (pos.x < 0 || pos.y < 0 || pos.x > width || pos.y > height)
    {
      // Im dead!
      gameObjects.remove(this);
    }
  }
  
  void applyTo(Player player)
  {
    play.lives --;
  }
}