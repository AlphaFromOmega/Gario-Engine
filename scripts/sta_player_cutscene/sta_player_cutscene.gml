// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sta_player_cutscene()
{
	var p1,p2,p3,bbox_side;
	// Calculate Movement
	move = tml_dir * SPD_WALK;
	hsp += move;
	vsp += SPD_GRAVITY;

	// Check Center Frame
	var grounded = (scr_inFloor(tilemap,x,bbox_bottom+1, true) >= 0);
	// Jump
	if (grounded || scr_inFloor(tilemap,bbox_left,bbox_bottom + 1, true) >= 0 || scr_inFloor(tilemap,bbox_right,bbox_bottom + 1, true) >= 0)
	{
		if (tml_jump)
		{
			vsp = -SPD_JUMP;
			grounded = false;
			tml_jump = false;
		}
	}
	if (move != 0)
	{
		image_xscale = tml_dir;
		sprite_index = spr_gario_walk;
	}
	else
	{
		sprite_index = spr_gario;
	}
	
	if (!grounded)
	{
		sprite_index = spr_gario_air;
		image_index = clamp(round(vsp), -2, 3) + 2;
	}
	
	//Re apply fractions
	hsp += hsp_fraction;
	vsp += vsp_fraction;

	// Store and Remove fractions
	// Important: go into collision with whole integers ONLY!
	hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
	hsp -= hsp_fraction;
	vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
	vsp -= vsp_fraction;

	
	// Horizontal Collision
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
	p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom);
	p3 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,y); 
	if (tilemap_get_at_pixel(tilemap, x, bbox_bottom) > 1) // If on slope, ignore side tiles
	{
		p2 = 0;
	}
	if (p1 == 1) || (p2 == 1) || (p3 == 1)// Inside a tile with collision
	{
		if (hsp > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
		else x = x - (x mod TILE_SIZE) - (bbox_left - x);
		hsp = 0;
	}
	x += hsp;
	hsp = 0;

	// Vertical Collision
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
		if (!key_down && vsp >= 0) // Check if tile is not a slope 
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
	
	// Walk up slopes
	var floordist = scr_inFloor(tilemap, x, bbox_bottom + vsp, true);
	if (floordist >= 0)
	{
		y += vsp;
		y -= (floordist + 1);
		vsp = 0;
		floordist = -1;
	}
	
	y += vsp;

	// Walk down slopes
	if (grounded)
	{
		y += abs(floordist) - 1;
		if ((bbox_bottom % TILE_SIZE) == TILE_SIZE - 1) // If at base of current tile
		{
			if (tilemap_get_at_pixel(tilemap, x, bbox_bottom + 1) > 1) // If slope continues
			{
				y += abs(scr_inFloor(tilemap, x, bbox_bottom + 1, false));
			}
		}
	}
	if (tml_attack)
	{
		state = PLAYERSTATE.ATTACK;
	}
	if (tml_aim)
	{
		state = PLAYERSTATE.AIM;
	}
	platform = false;
}