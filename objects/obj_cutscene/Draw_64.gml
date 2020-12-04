/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_pixel, 0, 0, 0, 1024, 64, 0, c_black, 1);
draw_sprite_ext(spr_pixel, 0, 0, 512, 1024, 64, 0, c_black, 1);

draw_set_color(color);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fn_menu);
draw_text(512, 525, print);

if (holdspace > 0)
{
	draw_set_alpha(scr_wave(0.2, 0.8, 1, 0));
	draw_set_color(c_white);
	draw_text(512, 15, "Hold space to skip");
	draw_set_alpha(1);
}

draw_sprite_ext(spr_pixel, 0, 0, 0, 1024, 576, 0, c_black, a);