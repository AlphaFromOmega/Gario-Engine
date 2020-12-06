/// @description Teleport on Collide
if (obj_transition.mode == TRANS_MODE.OFF)
{
	if (obj_camera.level_id >= global.unlocked)
	{
		global.unlocked = obj_camera.level_id + 1;
	}
	global.current_level = obj_camera.level_id;
	global.music = NOMUSIC;
	global.coins += other.coins_collected_level;
	for (i = 0; i < 5; i++)
	{
		if (!(global.diamonds_collected[obj_camera.level_id,i]) && obj_player.diamonds_collected[i])
		{
			global.diamonds++;
			global.diamonds_collected[obj_camera.level_id,i] = obj_player.diamonds_collected[i];
		}
	}
	scr_slideTransition(TRANS_MODE.GOTO, wipeout, wipein, rm_map);
	instance_destroy();
}