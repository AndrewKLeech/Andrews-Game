class Level
{
  PImage map;
  String mapName;
  int npcCount;
  int currentLevel;
  float type; //Type of gameobject from txt file. 1.player 2.NPC 3.Pistol 4.Rifle 5.Shotgun
  float px;
  float py;
  String mapData;
  Level(String mapName, int npcCount)
  {
    this.mapName = mapName;
    this.npcCount = npcCount;
    map = loadImage(mapName);
  }
  void load(int currentLevel, String mapData)
  {
    this.currentLevel = currentLevel;
    this.mapData = mapData;
    String[] lines = loadStrings(mapData);
    
    for (int i = 1 ; i < lines.length; i ++)
    {
      String[] parts = lines[i].split(",");
      type = Float.parseFloat(parts[0]);
      px = Float.parseFloat(parts[1]);
      py = Float.parseFloat(parts[2]);
      if(type == 1)
      {
        Characters person = new Player('W', 'S', 'A', 'D', ' ', px,py,color(0, 255, 255));
        gameObjects.add(person);
      }
      else if(type == 2)
      {
        Characters person = new NPC(px, py, color(255, 255, 0));
        gameObjects.add(person);
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
