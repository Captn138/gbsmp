const RADIUS = 128;

EntityEvents.checkSpawn(event => {
  const entity = event.entity;
  const level = entity.level;

  if (!level || level.dimension !== "minecraft:overworld") return;
  if (!entity.isAlive()) return;

  const hostileTypes = [
    "minecraft:spider",
    "minecraft:cave_spider",
    "minecraft:zombie",
    "minecraft:zombie_villager",
    "minecraft:creeper",
    "minecraft:skeleton",
    "minecraft:enderman",
    "minecraft:slime",
    "minecraft:witch"
  ];

  if (!hostileTypes.includes(entity.type.toString())) return;

  const spawnPos = level.getServer().getLevel("minecraft:overworld").getSharedSpawnPos();
  const dx = entity.x - spawnPos.x;
  const dz = entity.z - spawnPos.z;

  const distanceSq = dx * dx + dz * dz;
  if (distanceSq <= RADIUS * RADIUS) {
    event.cancel();
  }
});
