class Player extends Characters
{
  char move;
  char moveBack;
  char left;
  char right;
  char fire;
  
  
  int ammo;
  
  Player()
  {

  }
  
  Player(char move, char moveBack, char left, char right, char fire, float startX, float startY, color c)
  {
    this.move = move;
    this.moveBack = moveBack;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.c = c;
    lives = 10;
  }

  int elapsed = 12;
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    
    back.x = -sin(theta);
    back.y = cos(theta);
    back.mult(speed);
    
    if (keys[move])
    {
      pos.add(forward);
      moving=true;
    }      
    else
    {
      moving=false;
    }
    if (keys[moveBack])
    {
      pos.add(back);
    }
    if (keys[fire]  && elapsed > 12 && ammo > 0 && weapon!="hands")
    {
      // Create a new bullet instance and add it to the arraylist of bullets
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, 6));
      bullet.c = c;
      bullet.theta = theta;
      gameObjects.add(bullet);
      if(weapon=="shotgun")
      {
        Bullet bullet2 = new Bullet();
        bullet2.pos.x = pos.x;
        bullet2.pos.y = pos.y;
        bullet2.pos.add(PVector.mult(forward, 6));
        bullet2.c = c;
        bullet2.theta = theta -0.1;
        gameObjects.add(bullet2);
        
        Bullet bullet3 = new Bullet();
        bullet3.pos.x = pos.x;
        bullet3.pos.y = pos.y;
        bullet3.pos.add(PVector.mult(forward, 6));
        bullet3.c = c;
        bullet3.theta = theta +0.1;
        gameObjects.add(bullet3);
      }//End if
      elapsed = 0;
      ammo --;
    }//End if
    //make player follow mouse
    theta = atan2(mouseY- pos.y, mouseX -pos.x)+PI/2;
    
    if (pos.x < 0)
    {
      pos.x = width;
    }
    
    if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
    elapsed ++;
  }
}
