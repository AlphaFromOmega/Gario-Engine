/// @description Insert description here
// You can write your code in this editor
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

draw_set_font(fn_menu);
nsel_margin = string_width("> ");

enum SHOPMENU
{
	DEFAULT,
	GURU,
	UPGRADES,
	EXTRAS
}
newmode = SHOPMENU.DEFAULT;

for (var i = 0; i < 8; i++)
{
	menu[i] = "";
}
for (var i = 0; i < 8; i++)
{
	coins[i] = 0;
}
for (var i = 0; i < 8; i++)
{
	gems[i] = 0;
}
for (var i = 0; i < 8; i++)
{
	menu_cost[i] = 0;
}



menu_items = array_length(menu);
menu_cursor = 0;
menu_committed = -1;
menu_itemheight = font_get_size(fn_menu);

menu_x = gui_width * 2 / 3;
menu_y = 64;

shop_stat_cost[0] = 3;
shop_stat_cost[1] = 5;
shop_stat_cost[2] = 8;
shop_stat_cost[3] = 13;
shop_stat_cost[4] = 20;

shop_stat_limit = 5;
shop_fast_limit = 1;
shop_shot_incr_limit = 3;
shop_damage_limit = 3;
shop_cuck_limit = 1;

shop_fast_cost[0] = 250;
shop_shot_incr[0] = 400;
shop_shot_incr[1] = 800;
shop_shot_incr[2] = 1200;
shop_damage_incr[0] = 400;
shop_damage_incr[1] = 800;
shop_damage_incr[2] = 1200;

shop_cuck_cost[0] = 5000;

shop_guru_luck = 0;
shop_guru_vitality = 0;
shop_guru_strength = 0;
shop_guru_agility = 0;
shop_guru_fortitude = 0;
shop_upgr_faster_reload = 0;
shop_upgr_shot_increase = 0;
shop_upgr_damage = 0;
shop_extr_cuck = 0;

success = false;

menu_cost_is_diamonds = false;

scr_load_shop();
