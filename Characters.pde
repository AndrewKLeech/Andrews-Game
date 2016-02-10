abstract class Characters extends GameObject
{
  int lives;
  boolean moving = false;
  int leg=1;
  String weapon = "hands";
  
  Characters(float startX, float startY)
  {
    super(startX, startY, 50);     
  }
  
  void render()
  {
    fire.play();
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(c);
    fill(c);
    rotate(theta); 
    strokeWeight(5);
    
    //upper arms
    line(-halfW/2, 0, -halfW/2, -20);
    line(halfW/2, 0, halfW/2, -20);
    
    //Color for skin
    stroke(189,183,107); 
    fill(189,183,107);
    
    //head
    ellipse(0, 0, halfW, halfW);
        
    //forearms
    
    line(halfW/2, -20, 0, -halfW-10);
    line(-halfW/2, -20, 0, -halfW-10);
    strokeWeight(1);
    
    //Color for eyes and guns
    stroke(100);
    fill(50);
    
    //eyes
    ellipse(-5, -5, 5, 5);
    ellipse(5, -5, 5, 5);
    
    //Weapons
    if(weapon=="pistol")
    {
      rect(-2, -halfW-10, 3, -15);
    }
    if(weapon=="shotgun")
    {
      //Barel
      rect(-2, -halfW-10, 3, -25);
      line(0, -halfW-10, 0, -halfW-35);
      
      //brown
      fill(139,69,19);
      stroke(139,69,19);
      
      //hilt
      rect(-2, -halfW-10, 3, +5);
    }
    if(weapon=="rifle")
    {
      //Barel
      rect(-2, -halfW-10, 3, -25);
      line(0, -halfW-10, 0, -halfW-35);
      
      //brown
      fill(139,69,19);
      stroke(139,69,19);
      
      //hilt
      rect(-2, -halfW-10, 3, +5);
    }
    strokeWeight(5);
    //Animation for moving foward
    if (moving)
    {
      if(leg==1)
      {
        line(-halfW/2.5f, halfW/2, -halfW/2.5f, halfW/2+10);
        if (frameCount % 20 == 0)
        {
          leg=2;
        }//End if
      }//End if
      
      if(leg==2)
      {
        line(halfW/2.5f, halfW/2, halfW/2.5f, halfW/2+10);
        if (frameCount % 40 == 0)
        {
          leg=1;
        }//End if
      }//End if
    }//End if(moving)
    strokeWeight(1);
    popMatrix();
  }//End render
}//End Characters class
