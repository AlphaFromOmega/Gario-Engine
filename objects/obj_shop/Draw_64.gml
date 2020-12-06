/// @description Insert description here
// You can write your code in this editor
scr_nineSlice(spr_9sliceui, -16, gui_height - 96, gui_width + 16, gui_height + 16);
draw_sprite(spr_coin, 0, PANEL_MARGIN, gui_height - 48);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_font(fn_menu);
scr_textborder(PANEL_MARGIN + sprite_get_width(spr_coin), gui_height - 48, string(global.coins), c_white, c_black);

scr_nineSlice(spr_9sliceui, gui_width * 2 / 3, -16, gui_width + 16, gui_height + 16);

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
}