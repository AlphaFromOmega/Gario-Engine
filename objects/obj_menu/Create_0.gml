/// @description GUI/Vars/Menu setup
#macro PANEL_MARGIN 16

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

enum TITLE_MODE
{
	BASE,
	NEW,
	CONTINUE,
	OPTIONS
}
mode = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width + 400;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; // Lower is faster
menu_font = fn_menu;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

menu[3] = "New Game";
menu[2] = "Continue";
menu[1] = "Options";
menu[0] = "Quit";

menu_items = array_length(menu);

menu_top = menu_y - (menu_itemheight * 2 * menu_items);

menu_cursor = 3;

options_x = PANEL_MARGIN + (gui_width / 2);
options_y = gui_height;
options_y_target = gui_height;

options[3] = "Fullscreen";
options[1] = "Music";
options[0] = "SFX";

options_value[1] = 1;
options_value[0] = 1;

selected_slider = "null";

/*
menu[3] = "New Game";
menu[2] = "Continue";
menu[1] = "Options";
menu[0] = "Quit";
*/
