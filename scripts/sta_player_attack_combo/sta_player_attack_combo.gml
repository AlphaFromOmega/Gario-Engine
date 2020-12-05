// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sta_player_attack_combo()
{
	var p1,p2,p3,bbox_side;
	hsp = 0;
	vsp += SPD_GRAVITY;
	
	scr_player_attack(spr_gario_punch_combo, spr_gario_punch_combo_hb, strength, 4, -5);
	
	if (key_attack && image_index > 5)
	{
		state = PLAYERSTATE.ATTACK;
	}
	
	if (scr_animation_end())
	{
		sprite_index = spr_gario;
		state = PLAYERSTATE.FREE;
	}
	
	// Vertical collision
	
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
	p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom);
	p3 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,y); 
	
	if (tilemap_get_at_pixel(tilemap, x, bbox_bottom + vsp) <= 1) // Check if tile is not a slope 
	{
		if (vsp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
		p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp) 
		p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp)
		if (p1 == 1) || (p2 == 1)
		{
			if (vsp >= 0) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
			else y = y - (y mod TILE_SIZE) - (bbox_top - y);
			vsp = 0;
		}
		if (vsp >= 0)
		{
			p1 = position_meeting(bbox_left,bbox_bottom + vsp, obj_brush_platform);
			p2 = position_meeting(bbox_right,bbox_bottom + vsp, obj_brush_platform);
			if (p1 == 1) || (p2 == 1)
			{
				y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
				vsp = 0;
			}
		}
	}
	
	y += vsp;
	
	// Walk up slopes
	var floordist = scr_inFloor(tilemap, x, bbox_bottom + vsp, true);
	if (floordist >= 0)
	{
		y += vsp;
		y -= (floordist + 1);
		vsp = 0;
		floordist = -1;
	}
}