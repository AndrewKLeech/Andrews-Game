class NPC extends Characters
{ 
  NPC(float startX, float startY, color c)
  {
    super(startX, startY);
    speed = 2.0f;
    this.c = c;
    lives = 1;
    
  }//End NPC

  int inSight = 0;
  boolean detected = false;
  boolean detectorAlive;
  int elapsed = 12;
  ArrayList<Detector> detectors = new ArrayList<Detector>();

  
  void update()
  {
    if(detectorAlive == false)
    {
      Detector detector = new Detector();
     detectors.add(detector);

     detectors.get(0).pos.x = pos.x;
     detectors.get(0).pos.y = pos.y;
     detectors.get(0).pos.add(PVector.mult(forward, 6));
     detectors.get(0).c = c;
     detectors.get(0).theta = theta;
     detectorAlive = true;

    }

    if(detectorAlive = true)
    {
      detectors.get(0).update();
      detectors.get(0).render();
      inSight = detectors.get(0).inSight();
    }
    
   
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    if(inSight == 1)
    {
      detected = true;
        //Face player
       theta = atan2(gameObjects.get(0).pos.y- pos.y, gameObjects.get(0).pos.x -pos.x)+PI/2;
       //Move towards player
       pos.add(forward);
       detectors.remove(0);
       detectorAlive = false;
       
    }
    else if(inSight == 2)
    {
      detectors.remove(0);
       detectorAlive = false;
       detected = false;
    }
    else if(inSight == 0 && detected == true)
    {
      detected = true;
        //Face player
       theta = atan2(gameObjects.get(0).pos.y- pos.y, gameObjects.get(0).pos.x -pos.x)+PI/2;
       //Move towards player
       pos.add(forward);
    }
    if (elapsed > 12 && weapon!="hands" && detected )
    {
      if(weapon=="pistol" )
      { 
        Bullet bullet = new Bullet();
        bullet.pos.x = pos.x;
        bullet.pos.y = pos.y;
        bullet.pos.add(PVector.mult(forward, 15));
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
        elapsed = 0;
    }//End if
    
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
    elapsed++;
  }//End update()
}//End NPC class

