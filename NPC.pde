class NPC extends Characters
{ 
  NPC(float startX, float startY, color c)
  {
    super(startX, startY);
    this.c = c;
    lives = 1;
    
  }//End NPC

  boolean inSight;
  boolean detectorAlive;
  
  ArrayList<Detector> detectors = new ArrayList<Detector>();
  void spawnDetector()
  {
     Detector detector = new Detector();
     detectors.add(detector);
  }
  
  void update()
  {
     spawnDetector();
   
     detectors.get(0).pos.x = pos.x;
         detectors.get(0).pos.y = pos.y;
       detectors.get(0).pos.add(PVector.mult(forward, 6));
         detectors.get(0).c = c;
         detectors.get(0).theta = theta;
        detectorAlive = true;

           detectors.get(0).update();
          detectors.get(0).render();
          inSight = detectors.get(0).inSight();

    
    if(inSight)
    {
       
       //line(pos.x, pos.y, gameObjects.get(0).pos.x, gameObjects.get(0).pos.y);
       theta = atan2(gameObjects.get(0).pos.y- pos.y, gameObjects.get(0).pos.x -pos.x)+PI/2;
       detectorAlive = false;
    }
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

