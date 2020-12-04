/// @description Insert description here
// You can write your code in this editor
if (room == rm_map)
{
	instance_destroy();
}
tilemap = layer_tilemap_get_id("Collision");
x = global.targetX;
y = global.targetY;
image_xscale = global.targetDir;