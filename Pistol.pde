class Pistol extends GameObject
{
  Pistol()
  {
    super(width * 0.5f, height  * 0.5f, 50);   
  }
  
  Pistol(float startX, float startY, color c)
  {
    super(startX, startY, 50);
    this.c = c;
  }



  void update()
  {
    
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    stroke(c);
    fill(c);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate 
    
    stroke(100);
    fill(50);
    
    //gun
    line(0, -30, 0, -40);
    popMatrix();
  }
  
  void render()
  {
    
  }
}
