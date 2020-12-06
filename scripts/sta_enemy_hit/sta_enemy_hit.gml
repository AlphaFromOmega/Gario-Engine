// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sta_enemy_hit()
{
	var p1,p2,p3,bbox_side;
	if (hitstatecounter < 35)
	{
		// Calculate Movement
		hsp = hsp / 1.005;
		vsp += SPD_GRAVITY;
		sprite_index = spr_enemy;
	
		// Check Center Frame
		var grounded = (scr_inFloor(tilemap,x,bbox_bottom+1, true) >= 0);
	
		if (vsp < 0)
		{
			grounded = false;
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
		if (position_meeting(bbox_side+hsp, y, obj_brush_roomexit))
		{
			dir *= -1;
			hsp = 0;
		}
		p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
		p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom);
		p3 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,y); 
		if (tilemap_get_at_pixel(tilemap, x, bbox_bottom) > 1) // If on slope, ignore side tiles
		{
			p2 = 0;
			p3 = 0;
		}
		if (p1 == 1) || (p2 == 1) || (p3 == 1)// Inside a tile with collision
		{
			if (hsp > 0)
			{
				x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
				dir = -1;
			}
			else
			{
				x = x - (x mod TILE_SIZE) - (bbox_left - x);
				dir = 1;
			}
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
		if (hitstatecounter == 0 || (hsp == 0 && vsp == 0))
		{
			state = ENEMYSTATE.FREE;
		}
	}
	if (hp <= 0)
	{
		var i;
		for (i = 0; i < 10; i += 1) {
			coin = instance_create_layer(x, y, "Entities", obj_coin);
			coin.dynamic = true;
			coin.uncollectable = 20;
			coin.vsp = random_range(-4, -12);
			coin.hsp = random_range(-6, 6);
		}
		instance_destroy();
	}
	hitstatecounter--;
}