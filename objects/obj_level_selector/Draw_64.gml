scr_nineSlice(spr_9sliceui, -16, -16, gui_width + 16, 64);

draw_set_font(fn_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _offset = 2;
var _txt = string(level.level_name);
var _col = c_white;
var _xx = PANEL_MARGIN;
var _yy = PANEL_MARGIN;

// Simplify border at somepoint
draw_set_color(c_black);
draw_text(_xx + _offset, _yy, _txt);
draw_text(_xx - _offset, _yy, _txt);
draw_text(_xx, _yy + _offset, _txt);
draw_text(_xx, _yy - _offset, _txt);
draw_set_color(_col);
draw_text(_xx, _yy, _txt)

// Footer Bar
scr_nineSlice(spr_9sliceui, -16, gui_height - 64, gui_width + 16, gui_height + 16);