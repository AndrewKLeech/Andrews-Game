void setup()
{
  size(1200, 700);
}//End setup()

//Maps stored in this String array
String[] maps = {"map1.png","map2.png","map3.png"};
String[] mapData = {"map1_info.txt","map1_info.txt","map1_info.txt"};

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
    Level level = new Level(maps[currentLevel],8);
    levels.add(level);
    loaded = true;
    levels.get(currentLevel).load(currentLevel,mapData[currentLevel]);
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
