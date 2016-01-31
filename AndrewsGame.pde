void setup()
{
  size(1200, 700);
}//End setup()

//Maps stored in this String array
String[] maps = {"map1.png","map2.png","map3.png"};
String[] mapData = {"map1_info.txt","map1_info.txt","map1_info.txt"};
int line;
float type; //Type of gameobject from txt file. 1.player 2.NPC 3.Pistol 4.Rifle 5.Shotgun
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
    for(int i = gameObjects.size() - 1 ; i >= 0;i--)
    {
      gameObjects.remove(i);
    }
  }
  if(loaded == false)
  {
    String[] lines = loadStrings(mapData[currentLevel]);
    line=lines.length;
    Level level = new Level(maps[currentLevel],8);
    levels.add(level);
    loaded = true;
    for (int i = 1 ; i < line ; i ++)
    {
      String[] parts = lines[i].split(",");
      type = Float.parseFloat(parts[0]);
      println(type);
      px = Float.parseFloat(parts[1]);
      py = Float.parseFloat(parts[2]);
      if(type == 1)
      {
        Characters person = new Player('W', 'S', 'A', 'D', ' ', px,py,color(0, 255, 255));
        gameObjects.add(person);
        println("player");
      }
      else if(type == 2)
      {
        Characters person = new NPC(px, py, color(255, 255, 0));
        gameObjects.add(person);
        println("player");
      }
      else if(type == 3)
      {
        GameObject gun = new Pistol(px, py);
        gameObjects.add(gun);
      }
      else if(type == 4)
      {
        GameObject gun = new Rifle(px, py);
        gameObjects.add(gun);
      }
      else if(type == 5)
      {
        GameObject gun = new Shotgun(px, py);
        gameObjects.add(gun);
      }

    }
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
