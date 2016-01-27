class Shotgun extends GameObject
{
  Shotgun()
  {
    super(width * 0.5f, height  * 0.5f, 50);   
  }//End Shotgun()

  Shotgun(float startX, float startY)
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
    rect(0, -10, 4, -25);
    line(2, -10, 2, -25);
    
    //brown
    fill(139,69,19);
    stroke(139,69,19);
    
    //hilt
    rect(4, -35, -4, -5);
    popMatrix();
  }//End render
}//End Shotgun class
