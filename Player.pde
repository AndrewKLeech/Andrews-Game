class Player extends Characters
{
  char move;
  char left;
  char right;
  char fire;
  
  int ammo;
  
  Player()
  {

  }
  
  Player(char move, char left, char right, char fire, float startX, float startY, color c)
  {
    this.move = move;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.c = c;
    lives = 10;
    ammo = 10;
  }

  int elapsed = 12;
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    
    if (keys[move])
    {
      pos.add(forward);
      moving=true;
    }      
    else
    {
      moving=false;
    }
    if (keys[left])
    {
      theta -= 0.1f;
    }
    if (keys[right])
    {
      theta += 0.1f;
    }      
    if (keys[fire]  && elapsed > 12 && ammo > 0)
    {
      // Create a new bullet instance and add it to the arraylist of bullets
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, 6));
      bullet.c = c;
      bullet.theta = theta;
      gameObjects.add(bullet);
      elapsed = 0;
      ammo --;
      
    }
    
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
