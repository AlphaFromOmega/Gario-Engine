/// @description Insert description here
// You can write your code in this editor
scr_nineSlice(spr_9sliceui, -16, gui_height - 96, gui_width + 16, gui_height + 16);
draw_sprite(spr_coin, 0, PANEL_MARGIN, gui_height - 48);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_font(fn_menu);
scr_textborder(PANEL_MARGIN + sprite_get_width(spr_coin), gui_height - 48, string(global.coins), c_white, c_black);

draw_sprite(spr_diamond, 0, PANEL_MARGIN, gui_height - 88);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_font(fn_menu);
scr_textborder(PANEL_MARGIN + sprite_get_width(spr_diamond), gui_height - 88, string(global.diamonds), c_white, c_black);

scr_nineSlice(spr_9sliceui, menu_x, -16, gui_width + 16, gui_height + 16);

for (var i = 0; i < menu_items; i++)
{
	var _margin = 16;
	var _txt = menu[i];
	if (menu_cursor == i)
	{
		_txt = string_insert("> ", _txt, 0);
		var _col = c_white;
	}
	else
	{
		var _col = c_gray;	
		_margin += nsel_margin;
	}
	var _xx = menu_x + _margin;
	var _yy = menu_y + (menu_itemheight * (i * 2));
	scr_textborder(_xx, _yy, _txt, _col, c_black);
	
	if (menu_cost[i] == 0) {
		//do nothing
	}
	else {
		if (menu_cost_is_diamonds) {
			draw_sprite(spr_diamond, 0, gui_width - PANEL_MARGIN, _yy);
		}
		else {
			draw_sprite(spr_coin, 0, gui_width - PANEL_MARGIN, _yy);
		}
		if (menu_cost[i] > 999) {
			scr_textborder(gui_width - PANEL_MARGIN - 130, _yy, string(menu_cost[i]), _col, c_black);
		}
		else if (menu_cost[i] > 99) {
			scr_textborder(gui_width - PANEL_MARGIN - 100, _yy, string(menu_cost[i]), _col, c_black);
		}
		else if (menu_cost[i] > 9) {
			scr_textborder(gui_width - PANEL_MARGIN - 70, _yy, string(menu_cost[i]), _col, c_black);	
		}
		else {
			scr_textborder(gui_width - PANEL_MARGIN - 40, _yy, string(menu_cost[i]), _col, c_black);
		}
	}
}