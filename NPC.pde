class NPC extends Characters
{ 
  NPC(float startX, float startY, color c)
  {
    super(startX, startY);
    this.c = c;
    lives = 1;
  }//End NPC

  int elapsed = 12;
  void facePlayer(float x, float y)
  {
    theta = atan2(y- pos.y, x -pos.x)+PI/2;
  }
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    
    if (pos.x < 10)
    {
      pos.x = 10;
    }//End if
    
    if (pos.x > width-10)
    {
      pos.x = width-10;
    }//End if
    
    if (pos.y < 10)
    {
      pos.y = 10;
    }//End if
    
    if (pos.y > height-10)
    {
      pos.y = height-10;
    }//End if
    elapsed ++;
    
    
  }//End update()
}//End NPC class

