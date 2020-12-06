/// @description Progress to Transistion


if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO)
	{
		percent = max(0, percent - max((percent / 10), 0.005));
	}
	else
	{
		percent = min(PERCENTMAX, percent + max(((PERCENTMAX - percent) / 10), 0.005));
	}
	if (percent == PERCENTMAX) || (percent == 0)
	{
		switch (mode)
		{
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
		}
	}
}
show_debug_message(string(global.diamonds_collected));
show_debug_message(string(global.cuckthisjazz));