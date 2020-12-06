/// @description Teleport on Collide
if (!key_press || keyboard_check(vk_space))
{
	if (obj_transition.mode == TRANS_MODE.OFF)
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDir = obj_player.image_xscale;
		scr_slideTransition(TRANS_MODE.GOTO, wipeout, wipein, targetRoom);
		instance_destroy();
	}
}

if (key_press)
{
	collide = other;
}