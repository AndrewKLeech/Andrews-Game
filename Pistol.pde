class Pistol extends GameObject
{
  Pistol()
  {
    super(width * 0.5f, height  * 0.5f, 50);   
  }
  
  Pistol(float startX, float startY)
  {
    super(startX, startY, 50);
    this.c = c;
  }



  void update()
  {
    
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate 
    
    stroke(100);
    fill(50);
    
    //gun
    rect(0, -10, 3, -15);
    popMatrix();
  }
  
  void render()
  {
    
  }
}
