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
			menu_cost_is_diamonds = false;
			menu[0] = "Gary Boosts";
			menu[1] = "Upgrades";
			menu[2] = "Extras";
			menu[3] = "Exit";
			menu_items = 4;
			menu_cost[0] = 0;
			menu_cost[1] = 0;
			menu_cost[2] = 0;
			menu_cost[3] = 0;
			break;
		}
		case SHOPMENU.GURU:
		{
			menu_items = 0;
			menu_cost_is_diamonds = true;
			if (shop_guru_luck < shop_stat_limit) {
				menu[menu_items] = "Luck";
				menu_cost[menu_items] = shop_stat_cost[shop_guru_luck];
				menu_items += 1;
			}
			if (shop_guru_vitality < shop_stat_limit) {
				menu[menu_items] = "Health";
				menu_cost[menu_items] = shop_stat_cost[shop_guru_vitality];
				menu_items += 1;
			}
			if (shop_guru_strength < shop_stat_limit) {
				menu[menu_items] = "Strength";
				menu_cost[menu_items] = shop_stat_cost[shop_guru_strength];
				menu_items += 1;
			}
			if (shop_guru_agility < shop_stat_limit) {
				menu[menu_items] = "Speed";
				menu_cost[menu_items] = shop_stat_cost[shop_guru_agility];
				menu_items += 1;
			}
			if (shop_guru_fortitude < shop_stat_limit) {
				menu[menu_items] = "DmgResist";
				menu_cost[menu_items] = shop_stat_cost[shop_guru_fortitude];
				menu_items += 1;
			}
			menu[menu_items] = "Back";
			menu_cost[menu_items] = 0;
			menu_items += 1;
			break;
		}
		case SHOPMENU.UPGRADES:
		{
			menu_items = 0;
			menu_cost_is_diamonds = false;
			if (shop_upgr_faster_reload < shop_fast_limit) {
				menu[menu_items] = "FastReload";
				menu_cost[menu_items] = shop_fast_cost[shop_upgr_faster_reload];
				menu_items += 1;
			}
			if (shop_upgr_shot_increase < shop_shot_incr_limit) {
				menu[menu_items] = "Shot++";
				menu_cost[menu_items] = shop_shot_incr[shop_upgr_shot_increase];
				menu_items += 1;
			}
			if (shop_upgr_damage < shop_damage_limit) {
				menu[menu_items] = "Damage++";
				menu_cost[menu_items] = shop_damage_incr[shop_upgr_damage];
				menu_items += 1;
			}
			menu[menu_items] = "Back";
			menu_cost[menu_items] = 0;
			menu_items += 1;
			break;
		}
		case SHOPMENU.EXTRAS:
		{
			menu_items = 0;
			menu_cost_is_diamonds = false;
			if (shop_extr_cuck < shop_cuck_limit) {
				menu[menu_items] = "Cuckmonster";
				menu_cost[menu_items] = shop_cuck_cost[shop_extr_cuck];
				menu_items += 1;
			}
			menu[menu_items] = "Back";
			menu_cost[menu_items] = 0;
			menu_items += 1;
			break;
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
				case 0: //GARY BOOSTS
				{
					newmode = SHOPMENU.GURU;
					break;
				}
				case 1: //UPGRADES
				{
					newmode = SHOPMENU.UPGRADES;
					break;
				}
				case 2: //EXTRAS
				{
					newmode = SHOPMENU.EXTRAS;
					break;
				}
				case 3: //EXIT
				{
					scr_save_shop();
					scr_slideTransition(TRANS_MODE.GOTO, TRANS_TRANSISTION.UP, TRANS_TRANSISTION.DOWN, rm_map);
					break;
				}
			}
		}
		break;
	}
	case SHOPMENU.UPGRADES:
	{
		if (keyboard_check_pressed(vk_space))
		{
			switch (menu[menu_cursor])
			{
				case "Back":
				{
					newmode = SHOPMENU.DEFAULT;
					break;
				}
				case "Shot++":
				{
					success = scr_shop_buy(menu_cost[menu_cursor]);
					if (success) {
						shop_upgr_shot_increase += 1;	
					}
					break;
				}
				case "Damage++":
				{
					success = scr_shop_buy(menu_cost[menu_cursor]);
					if (success) {
						shop_upgr_damage += 1;	
					}
					break;
				}
				case "FastReload":
				{
					success = scr_shop_buy(menu_cost[menu_cursor]);
					if (success) {
						shop_upgr_faster_reload += 1;	
					}
					break;
				}
			}
		}
		break;
	}
	case SHOPMENU.EXTRAS:
	{
		if (keyboard_check_pressed(vk_space))
		{
			switch (menu[menu_cursor])
			{
				case "Cuckmonster":
				{
					success = scr_shop_buy(menu_cost[menu_cursor]);
					if (success) {
						shop_extr_cuck += 1;	
					}
					break;
				}
				case "Back":
				{
					newmode = SHOPMENU.UPGRADES;
					break;
				}
			}
		}
	}
	case SHOPMENU.GURU:
	{
		if (keyboard_check_pressed(vk_space))
		{
			switch (menu[menu_cursor])
			{
				case "Back":
				{
					newmode = SHOPMENU.DEFAULT;
					break;
				}
				case "Luck":
				{
					success = scr_shop_buy_d(menu_cost[menu_cursor]);
					if (success) {
						shop_guru_luck += 1;	
					}
					break;
				}
				case "Health":
				{
					success = scr_shop_buy_d(menu_cost[menu_cursor]);
					if (success) {
						shop_guru_vitality += 1;	
					}
					break;
				}
				case "Strength":
				{
					success = scr_shop_buy_d(menu_cost[menu_cursor]);
					if (success) {
						shop_guru_strength += 1;	
					}
					break;
				}
				case "Speed":
				{
					success = scr_shop_buy_d(menu_cost[menu_cursor]);
					if (success) {
						shop_guru_agility += 1;	
					}
					break;
				}
				case "DmgResist":
				{
					success = scr_shop_buy_d(menu_cost[menu_cursor]);
					if (success) {
						shop_guru_fortitude += 1;	
					}
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
