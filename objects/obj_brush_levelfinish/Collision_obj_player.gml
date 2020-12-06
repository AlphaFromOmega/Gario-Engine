/// @description Teleport on Collide
if (obj_transition.mode == TRANS_MODE.OFF)
{
	if (obj_camera.level_id >= global.unlocked)
	{
		global.unlocked = obj_camera.level_id + 1;
	}
	global.current_level = obj_camera.level_id;
	global.music = NOMUSIC;
	global.coins += coins_collected_level;
	scr_slideTransition(TRANS_MODE.GOTO, wipeout, wipein, rm_map);
	instance_destroy();
}