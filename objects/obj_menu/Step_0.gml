/// @description Control Menu

// Item ease in

menu_x += (menu_x_target - menu_x) / menu_speed;
options_y += (options_y_target - options_y) / menu_speed;

// Keyboard Controls
if keyboard_check_pressed(vk_f4)
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}
switch (mode)
{
	case 2:
	{
		scr_slideTransition(TRANS_MODE.NEXT, TRANS_TRANSISTION.UP, TRANS_TRANSISTION.DOWN)
		break;
	}
	case TITLE_MODE.OPTIONS:
	{
		menu_committed = -1;
		if (keyboard_check_pressed(ord("W")))
			{
			audio_play_sound(sfx_select, 1, false);
			menu_cursor--;
			if (menu_cursor < 0)
			{
				menu_cursor = 2;
			}
			selected_slider = menu_cursor;
		}
		if (keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sfx_select, 1, false);
			menu_cursor++;
			if (menu_cursor > 2)
			{
				menu_cursor = 0;
			}
			selected_slider = menu_cursor;
		}
		var mouse_x_gui = device_mouse_x_to_gui(0);
		var mouse_y_gui = device_mouse_y_to_gui(0);
		if (mouse_x_gui > options_x)
		{
			if (mouse_y_gui < (16 - options_y + 192))
			{
				menu_cursor = (mouse_y_gui - 16 - options_y) div (96);
			}
			else
			{
				menu_cursor = (mouse_y_gui - 16 - options_y + 192) div (menu_itemheight * 2) - 6;
			}
		}
		
		var _slider_width = sprite_get_width(spr_slider);
		selected_slider = menu_cursor;
		options_value[0] = scr_slider(options_x + (gui_width - (PANEL_MARGIN + options_x)) / 2 - _slider_width/2, PANEL_MARGIN - options_y + 8 + 64, options_value[0], 0);
		audio_group_set_gain(ag_sfx,options_value[0],0);
		options_value[1] = scr_slider(options_x + (gui_width - (PANEL_MARGIN + options_x)) / 2 - _slider_width/2, PANEL_MARGIN - options_y + 8 + 160, options_value[1], 1);
		audio_group_set_gain(ag_mus,options_value[1],0);
		
		if (window_get_fullscreen())
		{
			options[2] = "Fullscreen: On";
		}
		else
		{
			options[2] = "Fullscreen: Off";
		}
		if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))
		{
			audio_play_sound(sfx_confirm, 1, false);
			switch (menu_cursor)
			{
				case 0: case 1:
				{
					break;
				}
				case 2:
				{
					if (window_get_fullscreen())
					{
						window_set_fullscreen(false);
					}
					else
					{
						window_set_fullscreen(true);
					}
					break;
				}
			}
		}
		if (keyboard_check(vk_escape))
		{
			audio_play_sound(sfx_back, 1, false);
			menu_x_target = gui_width - gui_margin;
			menu_committed = -1;
			options_y_target = gui_height;
			menu_control = true;
			mode = TITLE_MODE.BASE;
		}
		break;
	}
	case 0:
	{
		if (menu_control)
		{
			if (keyboard_check_pressed(ord("W")))
			{
				audio_play_sound(sfx_select, 1, false);
				menu_cursor++;
				if (menu_cursor >= menu_items)
				{
					menu_cursor = 0;
				}
			}
			if (keyboard_check_pressed(ord("S")))
			{
				audio_play_sound(sfx_select, 1, false);
				menu_cursor--;
				if (menu_cursor < 0)
				{
					menu_cursor = menu_items - 1;
				}
			}
			if (keyboard_check_pressed(vk_space))
			{
				audio_play_sound(sfx_confirm, 1, false);
				menu_x_target = gui_width + 400;
				menu_committed = menu_cursor;
				menu_control = false;
			}
	
			var mouse_y_gui = device_mouse_y_to_gui(0);
			if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
			{
				menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 2);
		
				if (mouse_check_button_pressed(mb_left))
				{
					menu_x_target = gui_width + 400;
					menu_committed = menu_cursor;
					menu_control = false;
				}
			}
		}
		break;
	}
}


if (menu_x > gui_width + 300) && (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 3: default:
		{
			scr_slideTransition(TRANS_MODE.NEXT, TRANS_TRANSISTION.UP, TRANS_TRANSISTION.DOWN);
			break;
		}
		case 2: default:
		{
			scr_slideTransition(TRANS_MODE.GOTO, TRANS_TRANSISTION.UP, TRANS_TRANSISTION.DOWN, rm_map);
			break;
		}
		case 1:
		{
			mode = TITLE_MODE.OPTIONS;
			menu_cursor = 0;
			menu_x_target = gui_width + 400;
			options_y_target = 0;
			break;
		}
		case 0:
		{
			game_end();
			break;
		}
	}
}