/// @description Insert description here
// You can write your code in this editor
if (global.gem_collected[obj_camera.level_id, gem_type] || obj_player.gem_collected[gem_type])
{
	obj_player.gem_collected[gem_type] = true;
	instance_destroy();
}