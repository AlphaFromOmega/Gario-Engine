/// @description Insert description here
// You can write your code in this editor
if (room == rm_map)
{
	instance_destroy();
}
if (instance_exists(obj_camera))
if (room == obj_camera.room_start)
{
	for (var i = 0; i < 5; i++)
	{
		diamonds_collected[i] = global.diamonds_collected[obj_camera.level_id,i];
	}
	with (obj_diamond)
	{
		if (other.diamonds_collected[gem_type])
		{
			instance_destroy();
		}
	}
}
tilemap = layer_tilemap_get_id("Collision");
x = global.targetX;
y = global.targetY;
image_xscale = global.targetDir;
