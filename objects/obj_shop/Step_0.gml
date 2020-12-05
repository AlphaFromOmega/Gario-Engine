/// @description Insert description here
// You can write your code in this editor
if (newmode != -1)
{
	mode = newmode;
	for (var i = 0; i < 8; i++)
	{
		menu[i] = ""
	}
	switch (mode)
	{
		case SHOPMENU.DEFAULT:
		{
			menu[3] = "Item2";
			menu[2] = "Item";
			menu[1] = "Folder2";
			menu[0] = "Folder";
			menu_items = 4;
			break;
		}
		case SHOPMENU.TEST:
		{
			menu[1] = "itemsagain";
			menu[0] = "otherstuff";
			menu_items = 2;
			break;
		}
		case SHOPMENU.TEST2:
		{
			menu[1] = "morestuff";
			menu[0] = "thetest2stuff";
			menu_items = 2;
		}
	}
}

switch (mode)
{
	case SHOPMENU.DEFAULT:
	{
		if (keyboard_check_pressed(vk_space))
		{
			switch (menu_cursor)
			{
				case 0:
				{
					newmode = SHOPMENU.TEST
					break;
				}
				case 1:
				{
					newmode = SHOPMENU.TEST2
					break;
				}
				case 2:
				{
					if (scr_shop_buy(500))
					{
						show_debug_message("Buy Successful");
					}
					break;
				}
				case 3:
				{
					if (scr_shop_buy(1000))
					{
						show_debug_message("Buy Successful");
					}
					break;
				}
			}
		}
		break;
	}
	case SHOPMENU.TEST:
	{
		if (keyboard_check_pressed(vk_space))
		{
			switch (menu_cursor)
			{
				case 0:
				{
					newmode = SHOPMENU.TEST
					break;
				}
				case 1:
				{
					newmode = SHOPMENU.TEST2
					break;
				}
			}
		}
		break;
	}
	case SHOPMENU.TEST2:
	{
		if (keyboard_check_pressed(vk_space))
		{
			switch (menu_cursor)
			{
				case 0:
				{
					newmode = SHOPMENU.TEST
					break;
				}
				case 1:
				{
					newmode = SHOPMENU.TEST2
					break;
				}
			}
		}
		break;
	}
}

if (keyboard_check_pressed(ord("W")))
{
	audio_play_sound(sfx_select, 1, false);
	menu_cursor--;
	if (menu_cursor < 0)
	{
		menu_cursor = menu_items - 1;
	}
}
if (keyboard_check_pressed(ord("S")))
{
	audio_play_sound(sfx_select, 1, false);
	menu_cursor++;
	if (menu_cursor > menu_items - 1)
	{
		menu_cursor = 0;
	}
}