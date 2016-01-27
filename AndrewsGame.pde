void setup()
{
  size(1200, 700);
  Characters person = new Player('W', 'A', 'D', ' ', 200, height / 2, color(0, 255, 255));
  gameObjects.add(person);
  person = new NPC(width - 200, height / 2, color(255, 255, 0));
  gameObjects.add(person);
  Pistol pistol = new Pistol(width - 200, height / 2, color(255, 255, 0));
  gameObjects.add(pistol);
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
            //if this isnt here array gets broken
            j--;
            gameObjects.remove(go);
          }//End if
        }//End if
      }//End for
    }//End if
  }//End for
}//End checkCollisions()
