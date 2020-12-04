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
				vsp = -10;
			}
			if (topleft)
			{
				hsp = 5;
				vsp = -5;
			}
		}
		if (topright)
		{
			if (bottomright)
			{
				hsp = -5;
				vsp = -5;
			}
			if (topleft)
			{
				vsp = 10;
			}
		}
		state = PLAYERSTATE.HIT;
	}
	if (other.damage > 0)
	{
		hp -= other.damage;
	}
}
if (instance_exists(obj_revolver))
{
	instance_destroy(obj_revolver);
}