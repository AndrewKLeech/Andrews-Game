void setup()
{
  size(1200, 700);
}//End setup()

//Maps stored in this String array
String[] maps = {"map1.png","map2.png","map3.png"};
String[] mapData = {"map1_spawns.txt","map2_spawns.txt","map3_spawns.txt"};
String[] mapWalls = {"map1_walls.txt","map2_walls.txt","map3_walls.txt"};

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
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
    //Remove all gameObjects at end of level
    for(int i = gameObjects.size() - 1 ; i >= 0;i--)
    {
      gameObjects.remove(i);
    }//End for
  }//End if
  if(loaded == false)
  {
    Level level = new Level(maps[currentLevel],8);
    levels.add(level);
    loaded = true;
    levels.get(currentLevel).load(currentLevel,mapData[currentLevel],mapWalls[currentLevel]);
    for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    println(gameObjects.get(i));
    
  }
  }//End if
}//End loadLevels()

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
      text("x: "+mouseX+" y: "+mouseY, 10, 15);
      text(frameRate, 100,15);
      

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
        
        
        //Weapon pickups
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
        
        //If a character hits a wall stop it from walking through it
        if(other instanceof Walls)
        {
          if (go.pos.x > ((Walls)other).x1 && go.pos.x < ((Walls)other).x2 && go.pos.y > ((Walls)other).y1 && go.pos.y < ((Walls)other).y2)
          {
            go.pos.x =  go.pos.x+1;
            if(abs(go.pos.x - ((Walls)other).x1) < abs(go.pos.y - ((Walls)other).y1) && abs(go.pos.x - ((Walls)other).x1) < abs(go.pos.y - ((Walls)other).y2) && abs(go.pos.x - ((Walls)other).x1) < abs(go.pos.x - ((Walls)other).x2) ) 
            {
                go.pos.x = ((Walls)other).x1;
            }
            if(abs(go.pos.x - ((Walls)other).x2) < abs(go.pos.y - ((Walls)other).y1) && abs(go.pos.x - ((Walls)other).x2) < abs(go.pos.y - ((Walls)other).y2) && abs(go.pos.x - ((Walls)other).x2) < abs(go.pos.x - ((Walls)other).x1) ) 
            {
                go.pos.x = ((Walls)other).x2;
            }
            if(abs(go.pos.y - ((Walls)other).y1) < abs(go.pos.x - ((Walls)other).x1) && abs(go.pos.y - ((Walls)other).y1) < abs(go.pos.x - ((Walls)other).x2) && abs(go.pos.y - ((Walls)other).y1) < abs(go.pos.y - ((Walls)other).y2) ) 
            {
                go.pos.y = ((Walls)other).y1;
            }
            if(abs(go.pos.y - ((Walls)other).y2) < abs(go.pos.x - ((Walls)other).x1) && abs(go.pos.y - ((Walls)other).y2) < abs(go.pos.x - ((Walls)other).x2) && abs(go.pos.y - ((Walls)other).y2) < abs(go.pos.y - ((Walls)other).y1) )
            {
                go.pos.y = ((Walls)other).y2;
            }
          }//End if
        }//End if
      }//End for
    }//End if
    
    //If a bullet hits a wall remove bullet
    if(go instanceof Bullet)
    {
      for(int j = gameObjects.size() -1; j >= 0;j --)
      {
        GameObject other = gameObjects.get(j);
        
        if(other instanceof Walls)
        {
          if (go.pos.x > ((Walls)other).x1 && go.pos.x < ((Walls)other).x2 && go.pos.y > ((Walls)other).y1 && go.pos.y < ((Walls)other).y2)
          {
            gameObjects.remove(go);
          }//End if
        }//End if
      }//End for
    }//End if
  }//End for
}//End checkCollisions()
