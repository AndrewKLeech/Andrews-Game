abstract class Characters extends GameObject
{

  
  int lives;
  boolean moving=false;
  int leg=1;
  String weapon = "hands";
  
  Characters()
  {
    super(width * 0.5f, height  * 0.5f, 50);     
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    stroke(c);
    fill(c);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate 
    
    
    //upper arms
    line(-halfW/2, 0, -halfW/2, -20);
    line(halfW/2, 0, halfW/2, -20);
    stroke(255,228,181);  
    fill(255,228,181); 
    //head
    ellipse(0, 0, halfW, halfW);
    

    
    //forearms
    line(halfW/2, -20, 0, -halfW-10);
    line(-halfW/2, -20, 0, -halfW-10);
    
    //eyes
    
    stroke(100);
      fill(50);
    ellipse(-5, -5, 5, 5);
    ellipse(5, -5, 5, 5);
    if(weapon=="pistol")
    {
      //gun
      rect(-2, -halfW-10, 3, -15);
    }
    if(weapon=="shotgun")
    {
      rect(-2, -halfW-10, 3, -25);
    }

    
    //eyes
    ellipse(-5, -5, 5, 5);
    ellipse(5, -5, 5, 5);
    if (moving)
    {
      if(leg==1)
      {
            line(-halfW/2.5f, halfW/2, -halfW/2.5f, halfW/2+10);
            if (frameCount % 20 == 0)
            {
              leg=2;
            }
      }
      if(leg==2)
      {
            line(halfW/2.5f, halfW/2, halfW/2.5f, halfW/2+10);
            if (frameCount % 40 == 0)
            {
              leg=1;
            }
      }
    }
    popMatrix();
  }
}
