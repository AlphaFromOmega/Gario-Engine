/// @description Checks if a given position is below the floor height, returns the floor depth
/// @function scr_slideTransition(mode, wipeout, wipein targetroom);
/// @param mode
/// @param wipeout
/// @param wipein
/// @param targetroom

function scr_slideTransition()
{
	with (obj_transition)
	{
		mode = argument[0];
		if (argument_count > 1)
		{
			trans_out = argument[1]	
		}
		else
		{
			trans_out = TRANS_TRANSISTION.VERTICAL;
		}
		if (argument_count > 1)
		{
			trans_in = argument[2]	
		}
		else
		{
			trans_in = TRANS_TRANSISTION.VERTICAL;
		}
		if (argument_count > 3)
		{
			target = argument[3]	
		}
	}
}