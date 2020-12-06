/// @description Teleport to player
if (room = rm_map)
{
	instance_destroy();
}
if (instance_exists(obj_player))
{
	x = obj_player.x;
	y = obj_player.y;
}