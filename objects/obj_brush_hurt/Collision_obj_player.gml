/// @description Damage and knockback the player
with (other)
{
	var topleft, bottomleft, topright, bottomright;
	
	topleft = instance_position(bbox_left,bbox_top,other);
	bottomleft = instance_position(bbox_left,bbox_bottom,other);
	topright = instance_position(bbox_right,bbox_top,other);
	bottomright = instance_position(bbox_right,bbox_bottom,other);
	
	if (other.knockback)
	{
		if (bottomleft)
		{
			if (bottomright)
			{
				scr_hit_player(other.damage, 0, -10);
			}
			if (topleft)
			{
				scr_hit_player(other.damage, 5, -10);
			}
		}
		if (topright)
		{
			if (bottomright)
			{
				scr_hit_player(other.damage, -5, -5);
			}
			if (topleft)
			{
				scr_hit_player(other.damage, 0, 10);
			}
		}
	}
}
