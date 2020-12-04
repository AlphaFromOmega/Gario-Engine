/// @description Teleport on Collide
global.targetRoom = targetRoom;
global.targetX = targetX;
global.targetY = targetY;
global.targetDir = obj_player.image_xscale;
scr_slideTransition(TRANS_MODE.GOTO, wipeout, wipein, targetRoom);
instance_destroy();