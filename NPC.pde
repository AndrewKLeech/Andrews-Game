class NPC extends Characters
{ 
  NPC(float startX, float startY, color c)
  {
    super(startX, startY);
    this.c = c;
    lives = 1;
    
  }//End NPC

  int inSight = 0;
  boolean detectorAlive;
  int elapsed = 13;
  ArrayList<Detector> detectors = new ArrayList<Detector>();

  void playerDetected()
  {
     if(inSight == 1)
    {
       
       //line(pos.x, pos.y, gameObjects.get(0).pos.x, gameObjects.get(0).pos.y);
       theta = atan2(gameObjects.get(0).pos.y- pos.y, gameObjects.get(0).pos.x -pos.x)+PI/2;
       detectors.remove(0);
       detectorAlive = false;
       
    }
    else if(inSight == 2)
    {
      detectors.remove(0);
       detectorAlive = false;
    }
  }
  
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
     playerDetected();
  
    
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

