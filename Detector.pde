class Detector extends GameObject
{
  Detector()
  {
    speed = 30.0f;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    popMatrix();    
  }
  
  void update()
  {
    theta = atan2(gameObjects.get(0).pos.y- pos.y, gameObjects.get(0).pos.x -pos.x)+PI/2;
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    pos.add(forward);
    
    //Detector removed if it hits the edge of the screen
    if (pos.x < 0 || pos.y < 0 || pos.x > width || pos.y > height)
    {
      gameObjects.remove(this);
    }//End if
  }//End if
  
  int inSight()
  {
     for(int i = gameObjects.size() - 1 ; i >= 0;i --)
    {
      GameObject other = gameObjects.get(i);
      if (other instanceof Walls)
      {
        if (pos.x > ((Walls)other).x1 && pos.x < ((Walls)other).x2 && pos.y > ((Walls)other).y1 && pos.y < ((Walls)other).y2)
          {
            //Return 2 if wall has been hit
            return 2;
          }//End if
      }
      if (other instanceof Player)
      {
         if (pos.dist(other.pos) < halfW)
          {
            //Return 1 if player has been hit
            return 1;
          }
      }
    }
    //return 0 if nothing has been hit
    return 0;   
  }//End inSight
}//End Bullet class
