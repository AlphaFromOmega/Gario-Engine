/// @description Checks if a given position is below the floor height, returns the floor depth
/// @function scr_textborder(x, y, text, colour, border_colour);
/// @param x
/// @param y
/// @param text

function scr_textborder(_xx, _yy, _txt, _col, _colb)
{
	draw_set_color(_colb);
	draw_text(_xx + 2, _yy, _txt);
	draw_text(_xx - 2, _yy, _txt);
	draw_text(_xx, _yy + 2, _txt);
	draw_text(_xx, _yy - 2, _txt);
	draw_set_color(_col);
	draw_text(_xx, _yy, _txt)
}