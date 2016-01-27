class NPC extends Characters
{
  NPC()
  {

  }//End NPC
  
  NPC(float startX, float startY, color c)
  {
    this.c = c;
    lives = 1;
  }//End NPC

  int elapsed = 12;
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    
    if (pos.x < 0)
    {
      pos.x = width;
    }//End if
    
    if (pos.x > width)
    {
      pos.x = 0;
    }//End if
    
    if (pos.y < 0)
    {
      pos.y = height;
    }//End if
    
    if (pos.y > height)
    {
      pos.y = 0;
    }//End if
    elapsed ++;
  }//End update()
}//End NPC class

