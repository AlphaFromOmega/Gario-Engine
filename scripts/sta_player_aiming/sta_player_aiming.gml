// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sta_player_aiming()
{
	var p1,p2,p3,bbox_side;
	if (!instance_exists(obj_revolver))
	{
		sprite_index = spr_gario_aiming;
		gun = instance_create_depth(x, y, 0, obj_revolver);
	}
	// Calculate Movement
	move = (key_right - key_left) * SPD_WALK/2;
	hsp = move;
	vsp += SPD_GRAVITY;

	// Check Center Frame
	var grounded = (scr_inFloor(tilemap,x,bbox_bottom+1, true) >= 0);
	
	if (move != 0)
	{
		sprite_index = spr_gario_walk_aiming;
		if (sign(move) == image_xscale)
		{
			image_speed = 1;
		}
		else
		{
			image_speed = -1;
		}
	}
	else
	{
		sprite_index = spr_gario_aiming;
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
				y += abs(scr_inFloor(tilemap, x, bbox_bottom + 1, true));
			}
		}
	}

	if (key_fire && reload == 0)
	{
		if (bullets > 0)
		{
			bullets--;
			with (gun)
			{
				fire = true;	
			}
		}
		else
		{
			reload = 60;
		}
	}

	if (mouse_check_button_released(mb_right))
	{
		instance_destroy(gun);
		sprite_index = spr_gario;
		state = PLAYERSTATE.FREE;
	}
}