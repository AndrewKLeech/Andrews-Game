abstract class Characters extends GameObject
{

  
  int lives;
  
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
    ellipse(0, 0, halfW, halfW);
    line(-halfW/2, 0, -halfW/2, -20);
    line(halfW/2, 0, halfW/2, -20);
    line(halfW/2, -20, 0, -halfW-10);
    line(-halfW/2, -20, 0, -halfW-10);
    stroke(100);
    fill(50);
    line(0, -30, 0, -40);
    ellipse(-5, -5, 5, 5);
    ellipse(5, -5, 5, 5);
    popMatrix();
  }
  
}
