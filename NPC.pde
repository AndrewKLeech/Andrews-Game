class NPC extends Characters
{ 
  NPC(float startX, float startY, color c)
  {
    super(startX, startY);
    this.c = c;
    lives = 1;
    
  }//End NPC


  void facePlayer(PVector playerPos, boolean inSight)
  {
    if(inSight)
    {

      if(playerPos.dist(pos)<200)
      {
           line(pos.x, pos.y, playerPos.x, playerPos.y);
      theta = atan2(playerPos.y- pos.y, playerPos.x -pos.x)+PI/2;
      }
    }
    else
    {
    }
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
    
    
  }//End update()
}//End NPC class

