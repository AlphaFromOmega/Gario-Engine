/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case ROOMBASTATE.FREE: default:
	{
		script_execute(movestate);
		break;
	}
	case ROOMBASTATE.HIT:
	{
		script_execute(hitstate);
		break;
	}
	case ROOMBASTATE.ATTACK:
	{
		script_execute(attackstate);
		break;
	}
	case ROOMBASTATE.DEAD:
	{
		if(sprite_index == spr_roomba_elec and scr_animation_end()) {
			sprite_index = spr_roomba_dead;
		}
		script_execute(deadstate);
		break;
	}
}