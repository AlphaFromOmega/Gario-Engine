/// @description Insert description here
// You can write your code in this editor
draw_self();
if (flash > 0)
{
	flash--;
	shader_set(sha_flash);
	draw_self();
	shader_reset();
}
if (instance_exists(obj_player)) {
	dst = point_distance(obj_player.x, obj_player.y, x, y);
	if (dst < 500) {
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fn_menu);
		draw_set_color(c_white);
		draw_text(x, y - 60, moomba_message);	
	}
}