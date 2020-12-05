/// @description Insert description here
// You can write your code in this editor
if (instance_exists(collide))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fn_general);
	scr_textborder(collide.x, collide.bbox_top - 10, "Space", c_white, c_black);
	collide = noone;
}