/// @description Build height table then start game
draw_tilemap(tilemapid, 0, 0);
for (var i = heightstoget - 1; i >= 0; i--)
{
	var top = 0;
	while (top <= TILE_SIZE)
	{
		global.heights[i] = top;
		if (top == TILE_SIZE)
		{
			break;	
		}
		if (surface_getpixel(application_surface, i, top) != c_black)
		{
			break;
		}
		top++;
	}
	var bottom = TILE_SIZE;
	while (bottom <= TILE_SIZE)
	{
		global.inverted_heights[i] = bottom;
		if (bottom == 0)
		{
			break;	
		}
		if (surface_getpixel(application_surface, i, bottom) != c_black)
		{
			break;
		}
		bottom--;
	}
}
if (audio_group_is_loaded(ag_mus) && audio_group_is_loaded(ag_sfx))
{
	scr_slideTransition(TRANS_MODE.NEXT);
}
