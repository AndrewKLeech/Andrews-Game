abstract class GameObject
{
  PVector pos;
  PVector forward;
  PVector back;
  float theta = 0.0f;
  float w;
  float halfW;
  float speed = 5.0f;
  color c; 
 
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f, 50);     
  }//End GameObject()
  
  GameObject(float x, float y, float w)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    back = new PVector(-1, 0);
    this.w = w;
    this.halfW = w * 0.5f;
    this.theta = 0.0f;
  }//End GameObject
  
  abstract void update();  
  abstract void render();
}//End GameObject class
