void setup()
{
  size(800, 800);
  Player player = new Player('W', 'A', 'D', ' ', 200, height / 2, color(0, 255, 255));
  gameObjects.add(player);
  NPC npc = new NPC(width - 200, height / 2, color(255, 255, 0));
  gameObjects.add(npc);
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
}

