class Pistol extends GameObject
{ 
  Pistol(float startX, float startY)
  {
    super(startX, startY, 50);
    this.c = c;
  }//End Pistol

  void update()
  {

  }//End update()
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    
    stroke(100);
    fill(50);
    
    //gun
    rect(0, -10, 3, -15);
    popMatrix();
  }//End render()
}//End Pistol class
