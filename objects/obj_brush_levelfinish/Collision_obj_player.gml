/// @description Teleport on Collide
if (obj_camera.level_id < global.unlocked)
{
	global.unlocked = obj_camera.level_id;
}
global.music = NOMUSIC;
scr_slideTransition(TRANS_MODE.GOTO, wipeout, wipein, rm_map);
instance_destroy();