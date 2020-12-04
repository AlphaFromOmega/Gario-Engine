/// @description Teleport on Collide
global.unlocked += 1;
global.music = NOMUSIC;
scr_slideTransition(TRANS_MODE.GOTO, wipeout, wipein, rm_map);
instance_destroy();