/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case ENEMYSTATE.FREE: default:
	{
		script_execute(movestate);
		break;
	}
	case ENEMYSTATE.HIT:
	{
		script_execute(hitstate);
		break;
	}
	case ENEMYSTATE.ATTACK:
	{
		script_execute(attackstate);
		break;
	}
}