/// @description Checks if a given position is below the floor height, returns the floor depth
/// @function scr_inFloor(tilemap, x, y, platform_interact);
/// @param tilemap
/// @param x
/// @param y
/// @param platform_interact
function scr_inFloor(_tilemap, _x, _y, _platform_interact)
{
	var pos = tilemap_get_at_pixel(_tilemap, _x, _y);
	if (pos > 0)
	{
		if (pos == 1)	
		{
			return (_y % TILE_SIZE);
		}
		var thefloor = global.heights[(_x % TILE_SIZE) + (pos * TILE_SIZE)];
		return ((_y % TILE_SIZE) - thefloor);
	}
	else
	{
		if (_platform_interact && position_meeting(_x, _y, obj_brush_platform))
		{
			if !(vsp < 0 || (other.object_index == obj_player && key_down))
			{
				return (_y % TILE_SIZE);
			}
		}
		return -(TILE_SIZE - (_y % TILE_SIZE))	
	}
}
