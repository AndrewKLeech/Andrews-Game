void setup()
{
  size(500, 500);
  Characters person = new Player('W', 'A', 'D', ' ', 200, height / 2, color(0, 255, 255));
  gameObjects.add(person);
  person = new NPC(width - 200, height / 2, color(255, 255, 0));
  gameObjects.add(person);
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

boolean[] keys = new boolean[512];

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

void draw()
{
  background(0);
    
  for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  checkCollisions();
  
  //temp
  line(0,0,width,height);
  line(width/2,height,width/2,0);
  line(0,height/2,width,height/2);
  line(height,0,0,width);
}


void checkCollisions()
{
 for(int i = gameObjects.size() - 1 ; i >= 0;i --)
 {
    GameObject go = gameObjects.get(i);
    if (go instanceof Characters)
    {
      for(int j = gameObjects.size() -1; j >= 0;j --)
      {
        GameObject other = gameObjects.get(j);
        //Bullet
        if (other instanceof Bullet)
        {
          if (go.pos.dist(other.pos) < go.halfW)
          {
            ((Bullet) other).applyTo((Characters)go);
            gameObjects.remove(other);
            j--;
            gameObjects.remove(go);
          }
        }
      }
    }
 } 
}
