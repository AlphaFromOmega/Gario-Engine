// Temp Vars

// Get inputs
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

key_attack = keyboard_check_pressed(vk_space);
key_fire = mouse_check_button_pressed(mb_left);
key_aim = mouse_check_button_pressed(mb_right);
key_reload = keyboard_check_pressed(ord("R"));

switch (state)
{
	case PLAYERSTATE.FREE:
	{
		sta_player_free();
		break;
	}
	case PLAYERSTATE.ATTACK:
	{
		sta_player_punch();
		break;
	}
	case PLAYERSTATE.ATTACK_COMBO:
	{
		sta_player_attack_combo();
		break;
	}
	case PLAYERSTATE.AIM:
	{
		sta_player_aiming();
		break;
	}
	case PLAYERSTATE.HITGROUND:
	{
		sta_player_hit_ground();
		break;
	}
	case PLAYERSTATE.HITAIR:
	{
		sta_player_hit_air();
		break;
	}
	case PLAYERSTATE.DIEGROUND:
	{
		sta_player_die_ground();
		break;
	}
	case PLAYERSTATE.DIEAIR:
	{
		sta_player_die_air();
		break;
	}
	case PLAYERSTATE.CUTSCENE:
	{
		sta_player_cutscene();
		break;
	}
}

if (reload > 0)
{
	reload--;
	if (reload == 0)
	{
		bullets = 6;
	}
}

if (key_reload && bullets < 6 && reload == 0)
{
	reload = 60;
}