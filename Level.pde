class Level
{
  PImage map;
  String mapName;
  String mapWalls;
  int npcCount;
  int currentLevel;
  float type; //Type of gameobject from txt file. 1.player 2.NPC 3.Pistol 4.Rifle 5.Shotgun
  float px;
  float py;
  float px2;
  float py2;
  String mapData;
  Level(String mapName)
  {
    this.mapName = mapName;
    map = loadImage(mapName);
  }
  void load(int currentLevel, String mapData, String mapWalls)
  {
    this.currentLevel = currentLevel;
    this.mapData = mapData;
    this.mapWalls = mapWalls;
    
    String[] mapDataLines = loadStrings(mapData);
    String[] mapWallLines = loadStrings(mapWalls);
    
    for (int i = 1 ; i < mapDataLines.length; i ++)
    {
      String[] parts = mapDataLines[i].split(",");
      type = Float.parseFloat(parts[0]);
      px = Float.parseFloat(parts[1]);
      py = Float.parseFloat(parts[2]);
      if(type == 1)
      {
        Characters person = new Player('W', 'S', 'A', 'D', ' ','Q', px,py,color(0, 255, 255));
        gameObjects.add(person);
      }
      else if(type == 2)
      {
        Characters person = new NPC(px, py, color(255, 255, 0));
        gameObjects.add(person);
        npcCount++;
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
    for (int i = 1 ; i < mapWallLines.length; i ++)
    {
      String[] parts = mapWallLines[i].split(",");
      px = Float.parseFloat(parts[0]);
      py = Float.parseFloat(parts[1]);
      px2 = Float.parseFloat(parts[2]);
      py2 = Float.parseFloat(parts[3]);
      
      Walls wall = new Walls(px,py,px2,py2);
      gameObjects.add (wall);
      
    }
  }
}
