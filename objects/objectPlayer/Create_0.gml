/// @description Insert description here
image_speed = 0;
enum moveStates {
	idle,
	walking
}
state = moveStates.idle;

xPos = x div TILE_WIDTH;
yPos = y div TILE_HEIGHT;

xFrom = xPos;
yFrom = yPos;

xTo = xPos;
yTo = yPos;

walkAnimLength = 0.5;
walkAnimTime = 0;

spriteIdle = spritePlayer;
spriteWalk = spritePlayer;
localFrame = 0; // Frame relative to animation flow
collisionMap = layer_tilemap_get_id(layer_get_id("collision"));