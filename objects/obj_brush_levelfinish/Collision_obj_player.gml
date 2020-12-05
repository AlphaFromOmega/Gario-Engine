/// @description Teleport on Collide
if (obj_camera.level_id >= global.unlocked)
{
	global.unlocked = obj_camera.level_id + 1;
}
global.music = NOMUSIC;
scr_slideTransition(TRANS_MODE.GOTO, wipeout, wipein, rm_map);
instance_destroy();