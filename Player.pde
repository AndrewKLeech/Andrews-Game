class Player extends Characters
{
  char move;
  char moveBack;
  char moveLeft;
  char moveRight;
  char fire;
  char drop;
  int ammo;
  boolean shoot = false;
  PVector left;
  PVector right;

  
  Player(char move, char moveBack, char moveLeft, char moveRight, char fire, char drop, float startX, float startY, color c)
  {
    super(startX, startY);   
    this.move = move;
    this.moveBack = moveBack;
    this.moveLeft = moveLeft;
    this.moveRight = moveRight;
    this.fire = fire;
    this.drop = drop;
    this.c = c;
    lives = 10;
    left = new PVector(0, 0);
    right = new PVector(0, 0);
  }//End Player

  int elapsed = 12;
  
  void update()
  {
    if(health <= 0)
    {
      gameObjects.remove(this);
    }
    text("Ammo: "+ammo, width*0.9f, 15);
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    back.x = -sin(theta);
    back.y = cos(theta);
    back.mult(speed);
    left.x = -cos(theta);
    left.y = -sin(theta);
    left.mult(speed);
    right.x = cos(theta);
    right.y = sin(theta);
    right.mult(speed);
    
    if (keys[move])
    {
      pos.add(forward);
      moving=true;
    }//End if
    else
    {
      moving=false;
    }//End else
    if (keys[moveBack])
    {
      pos.add(back);
    }//End if
    if (keys[moveLeft])
    {
      pos.add(left);
    }//End if
    if (keys[moveRight])
    {
      pos.add(right);
    }//End if
    if (keys[drop])
    {
      weapon = "hands";
      ammo = 0;
    }//End if
    if (mouseButton == LEFT  && elapsed > 12)
    {
      mouseButton=0;
      shoot = ! shoot;
      if(shoot)
      {
      if(weapon=="hands")
      {
        for(int i = 0; i < gameObjects.size() -1; i++)
        {
          GameObject other = gameObjects.get(i);
          if(other instanceof NPC)
          {
            if (pos.dist(other.pos) < w)
            {
            ((NPC) other).health--;
            }
          }
        }
      }
      if(ammo > 0)
      {
        AudioSnippet fire = sounds.get(0);
      fire.rewind();
      fire.play();
      if(weapon=="pistol" )
      { 
        Bullet bullet = new Bullet();
        bullet.pos.x = pos.x;
        bullet.pos.y = pos.y;
        bullet.pos.add(PVector.mult(forward, 6));
        bullet.c = c;
        bullet.theta = theta;
        gameObjects.add(bullet);
       }//End if
      if(weapon=="shotgun")
      {
        Bullet bullet = new Bullet();
        bullet.pos.x = pos.x;
        bullet.pos.y = pos.y;
        bullet.pos.add(PVector.mult(forward, 6));
        bullet.c = c;
        bullet.theta = theta;
        gameObjects.add(bullet);
        
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
      if(weapon=="rifle")
      { 
        Bullet bullet = new Bullet();
        bullet.pos.x = pos.x;
        bullet.pos.y = pos.y;
        bullet.pos.add(PVector.mult(forward, 6));
        bullet.c = c;
        bullet.theta = theta;
        gameObjects.add(bullet);
       }//End if
       ammo --;
      }
        elapsed = 0;
        
      }
    }//End if

    //make player follow mouse
    //PI/2 added so front of player faces the mouse. Otherwise the player would face 90 degrees left of the mouse
    theta = atan2(mouseY- pos.y, mouseX -pos.x)+PI/2;
    
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
}//End Player class
