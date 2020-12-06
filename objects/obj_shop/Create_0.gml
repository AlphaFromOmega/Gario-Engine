/// @description Insert description here
// You can write your code in this editor
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

draw_set_font(fn_menu);
nsel_margin = string_width("> ");

enum SHOPMENU
{
	DEFAULT,
	TEST,
	TEST2
}
newmode = SHOPMENU.DEFAULT;

for (var i = 0; i < 8; i++)
{
	menu[i] = ""
}
for (var i = 0; i < 8; i++)
{
	coins[i] = 0
}
for (var i = 0; i < 8; i++)
{
	gems[i] = 0
}
menu_items = array_length(menu);
menu_cursor = 0;
menu_committed = -1;
menu_itemheight = font_get_size(fn_menu);

menu_x = gui_width * 2 / 3;
menu_y = 64;