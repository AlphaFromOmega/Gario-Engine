/// @description Draw Menu

// Draw Back Panel
scr_nineSlice(spr_9sliceui, menu_x - (string_width(string_insert("> ", menu[3], 0)) + PANEL_MARGIN), menu_top - PANEL_MARGIN, menu_x + PANEL_MARGIN, menu_y + PANEL_MARGIN);

// Draw Menu Items
draw_set_font(fn_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	var _txt = menu[i];
	if (menu_cursor == i)
	{
		_txt = string_insert("> ", _txt, 0);
		var _col = c_white;
		if (menu_committed != -1)
		{
			_col = c_yellow;
		}
	}
	else
	{
		var _col = c_gray;	
	}
	var _xx = menu_x;
	var _yy = menu_y - (menu_itemheight * (i * 2));
	scr_textborder(_xx, _yy, _txt, _col, c_black);
}

scr_nineSlice(spr_9sliceui, options_x, PANEL_MARGIN - options_y, gui_width - PANEL_MARGIN, (gui_height - PANEL_MARGIN) - options_y);
for (var i = 0; i < 2; i++)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	_txt = options[i];
	if (menu_cursor == i)
	{
		_txt = string_insert("> ", _txt, 0);
		_txt = string_insert(_txt," <", 0);
		_col = c_white;
	}
	else
	{
		_col = c_gray;	
	}
	_xx = options_x + (gui_width - (PANEL_MARGIN + options_x)) / 2;
	_yy = PANEL_MARGIN - options_y + 8 + 96 * i;
	// Simplify border at somepoint
	scr_textborder(_xx, _yy, _txt, _col, c_black);

	_yy += 64;

	var _value = options_value[i];
	var _slider_width = sprite_get_width(spr_slider);
	draw_sprite(spr_slider, 0, _xx - _slider_width / 2, _yy);
	draw_sprite_part(spr_slider, 1, 0, 0, _slider_width * _value, sprite_get_height(spr_slider), _xx - _slider_width / 2, _yy - sprite_get_yoffset(spr_slider));
	draw_sprite(spr_slider_button, 0, _xx + _slider_width * _value - _slider_width / 2, _yy);
	_value = 0;
}
for (var i = 2; i < 3; i++)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	_txt = options[i];
	if (menu_cursor == i)
	{
		_txt = string_insert("> ", _txt, 0);
		_txt = string_insert(_txt," <", 0);
		_col = c_white;
	}
	else
	{
		_col = c_gray;	
	}
	_xx = options_x + (gui_width - (PANEL_MARGIN + options_x)) / 2;
	_yy = PANEL_MARGIN - options_y + 8 + (96 * 2) + ((i - 2) * menu_itemheight * 2);
	
	scr_textborder(_xx, _yy, _txt, _col, c_black);
}