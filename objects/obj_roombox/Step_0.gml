/// @description Insert description here
// You can write your code in this editor
switch (state)
{
	case ROOMBOXSTATE.FREE: default:
	{
		script_execute(movestate);
		break;
	}
	case ROOMBOXSTATE.HIT:
	{
		script_execute(hitstate);
		break;
	}
	case ROOMBOXSTATE.ATTACK:
	{
		script_execute(attackstate);
		break;
	}
}