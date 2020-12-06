// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sta_player_die_air()
{
	sprite_index = spr_gario_hit_air;
	// Calculate Movement
	hsp = hsp / 1.005;
	vsp += SPD_GRAVITY;
	
	x += hsp;
	y += vsp;
	if (keyboard_check_pressed(vk_space))
	{
		scr_slideTransition(TRANS_MODE.GOTO, TRANS_TRANSISTION.VERTICAL, TRANS_TRANSISTION.VERTICAL, obj_camera.room_start);
		with (all)
		{
			if !(object_index == obj_music || object_index == obj_transition)
			{
				instance_destroy();
			}
		}
	}
	death++;
}