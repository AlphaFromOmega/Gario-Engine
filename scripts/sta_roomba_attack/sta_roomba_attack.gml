// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sta_roomba_attack()
{
	var p1,p2,p3,bbox_side;
	hsp = 0;
	vsp += SPD_GRAVITY;
	
	if (!shot and image_index >= 14 and image_index <= 18) {
		shot = true;
		audio_play_sound(sfx_roomba_shoot, 1, false);
		with (instance_create_layer(x, y - sprite_height/4, "Bullets", obj_roombullet))
		{
			speed = 15;
			if (other.image_xscale == -1) {
				direction = 180;
				image_angle = 180;
			}
		}
	}
	
	if (image_index > 28)
	{
		shot = false;
		sprite_index = spr_roomba_idle;
		state = ROOMBASTATE.FREE;
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
