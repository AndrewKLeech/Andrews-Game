class Rifle extends GameObject
{
  Rifle()
  {
    super(width * 0.5f, height  * 0.5f, 50);   
  }//End Shotgun()

  Rifle(float startX, float startY)
  {
    super(startX, startY, 50);
    this.c = c;
  }//End Shotgun

  void update()
  {

  }//End upadte
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    
    stroke(100);
    fill(50);
    
    //gun
    rect(0, -10, 3, -28);
    popMatrix();
  }//End render
}//End Shotgun class
