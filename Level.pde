class Level
{
  PImage map;
  String mapName;
  int npcCount;
  
  Level(String mapName, int npcCount)
  {
    this.mapName = mapName;
    this.npcCount = npcCount;
    map = loadImage(mapName);
  }
}
