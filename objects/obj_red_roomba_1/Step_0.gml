/// @description Insert description here
// You can write your code in this editor
switch (state)
{
	case RROOMBASTATE.FREE: default:
	{
		script_execute(movestate);
		break;
	}
	case RROOMBASTATE.HIT:
	{
		script_execute(hitstate);
		break;
	}
	case ROOMBASTATE.DEAD:
	{
		script_execute(deadstate);
		break;
	}
}