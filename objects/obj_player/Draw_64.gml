/// @description Insert description here
// You can write your code in this editor
if (state != PLAYERSTATE.CUTSCENE)
{
	if (reload == 0)
	{
		draw_sprite(spr_cylinder, bullets, PANEL_MARGIN + 16, PANEL_MARGIN + 16);
	}
	else
	{
		draw_sprite(spr_cylinder, 6 - reload div (60 / (6 - bullets)), PANEL_MARGIN + 16, PANEL_MARGIN + 16);
	}
	draw_sprite_part(spr_healthbar, 0, 0, 0, 66, 65, PANEL_MARGIN, PANEL_MARGIN);
	for (var i = 0; i < max_hp * 4; i++)
	{
		draw_sprite_part(spr_healthbar, 0, 66, 0, 1, 26, PANEL_MARGIN + 66 + i, PANEL_MARGIN);
	}
	for (var i = 0; i < hp * 4; i++)
	{
		draw_sprite(spr_health, 0, PANEL_MARGIN + 66 + i, PANEL_MARGIN + 13);
	}
	draw_sprite_part(spr_healthbar, 0, 67, 0, 3, 65, PANEL_MARGIN + 66 + max_hp * 4, PANEL_MARGIN);
	draw_sprite(spr_coin, 0, PANEL_MARGIN, PANEL_MARGIN + 80);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fn_general);
	scr_textborder(PANEL_MARGIN + sprite_get_width(spr_coin), PANEL_MARGIN + 80, string(coins_collected_level), c_white, c_black);
	for (i = 0; i < 5; i++)
	{
		if (!gem_collected[4 - i])
		{
			draw_set_alpha(0.25);
		}
		draw_sprite(spr_gui_diamond, 0, gui_width - (PANEL_MARGIN + (sprite_get_width(spr_gui_diamond) * 1.5 * i)), PANEL_MARGIN);
		draw_set_alpha(1);
	}
}