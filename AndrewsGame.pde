void setup()
{
  size(1200, 700);
  //Characters person = new Player('W', 'S', 'A', 'D', ' ', 200, height / 2, color(0, 255, 255));
  //gameObjects.add(person);
  Pistol pistol = new Pistol(width - 200, height / 2);
  gameObjects.add(pistol);
  Shotgun shotgun = new Shotgun(width/4, height / 2);
  gameObjects.add(shotgun);
  Rifle rifle = new Rifle(width - 50, height / 2);
  gameObjects.add(rifle);

}//End setup()

//Maps stored in this String array
String[] maps = {"map1.png","map2.png","map3.png"};
String[] mapData = {"map1_info.txt","map1_info.txt","map1_info.txt"};
int line;
String type;
float px;
float py;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

//Level details stored here
ArrayList<Level> levels = new ArrayList<Level>();

int currentLevel=0;
boolean loaded = false;

boolean[] keys = new boolean[512];

void loadLevels()
{ 
  //If all npc's are dead go to next level
  if(loaded && levels.get(currentLevel).npcCount == 0 && currentLevel<maps.length-1)
  {
    currentLevel++;
    loaded = false;
  }
  if(loaded == false)
  {
    String[] lines = loadStrings(mapData[currentLevel]);
    line=lines.length;
    Level level = new Level(maps[currentLevel],8);
    levels.add(level);
    loaded = true;
    for (int i = 0 ; i < line ; i ++)
    {
      String[] parts = lines[i].split(",");
      type = parts[0];
      println(type);
      px = Float.parseFloat(parts[1]);
      py = Float.parseFloat(parts[2]);
      if(i == 0)
      {
        Characters person = new Player('W', 'S', 'A', 'D', ' ', px,py,color(0, 255, 255));
        gameObjects.add(person);
        println("player");
      }
      else
      {
        Characters person = new NPC(px, py, color(255, 255, 0));
        gameObjects.add(person);
        println("player");
      }

    }
    //for(int i = 0; i < levels.get(currentLevel).npcCount; i++)
    //{
    //    Characters person = new NPC(width - 300+i, height / 2, color(255, 255, 0));
    //    gameObjects.add(person);
    //}
  }
}

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
  //Temp
  loadLevels();
  background(levels.get(currentLevel).map);
    
  for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }//End for
  checkCollisions();
}//End draw()


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
            levels.get(currentLevel).npcCount--;
          }//End if
        }//End if
        
        //Pistol
        if (other instanceof Pistol)
        {
          if (go.pos.dist(other.pos) < go.halfW)
          {
            if (go instanceof Player)
            {
              ((Characters)go).weapon = "pistol";
              ((Player)go).ammo = 8;
              gameObjects.remove(other);
            }//End if
            else if(((Characters)go).weapon == "hands")
            {
              ((Characters)go).weapon = "pistol";
              gameObjects.remove(other);
            }//End if
          }//End if
        }//End if
        
        //Shotgun
        if (other instanceof Shotgun)
        {
          if (go.pos.dist(other.pos) < go.halfW)
          {
            if (go instanceof Player)
            {
              ((Characters)go).weapon = "shotgun";
              ((Player)go).ammo = 4;
              gameObjects.remove(other);
            }//End if
            else if(((Characters)go).weapon == "hands" || ((Characters)go).weapon == "pistol")
            {
              ((Characters)go).weapon = "shotgun";
              gameObjects.remove(other);
            }//End else if
          }//End if
        }//End if
        
        //Rifle
        if (other instanceof Rifle)
        {
          if (go.pos.dist(other.pos) < go.halfW)
          {
            if (go instanceof Player)
            {
              ((Characters)go).weapon = "rifle";
              ((Player)go).ammo = 20;
              gameObjects.remove(other);
            }//End if
            else if(((Characters)go).weapon == "hands" || ((Characters)go).weapon == "pistol")
            {
              ((Characters)go).weapon = "rifle";
              gameObjects.remove(other);
            }//End else if
          }//End if
        }//End if
      }//End for
    }//End if
  }//End for
}//End checkCollisions()
