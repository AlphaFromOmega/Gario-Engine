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
}