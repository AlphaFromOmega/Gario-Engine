/// @description Insert description here
// You can write your code in this editor
var _curx, _prevx
if (!route_set)
{
	with (obj_level_marker)
	{
		if (other.location + 1 == level_id)
		{
			other.nextpos = path_position;
			other.nextpoint = path_point;
		}
		if (other.location - 1 == level_id)
		{
			other.prevpos = path_position;
			other.prevpoint = path_point;
		}
		if (other.location == level_id)
		{
			other.level = id;
			other.world = world_number;
		}
	}
	/*
	var nextx, nexty, prevx, prevy
	nextx = path_get_point_x(pt_map, nextpoint) - x;
	nexty = path_get_point_y(pt_map, nextpoint) - y;
	prevx = path_get_point_x(pt_map, prevpoint) - x;
	prevy = path_get_point_y(pt_map, prevpoint) - y;
	
	show_debug_message(string(nextx) + " " + string(nexty) + " " +string(prevx) + " " +string(prevy))
	if (nextx > 0)
	{
		nexthoz = 1;
	}
	else if (nextx < 0)
	{
		nexthoz = -1;
	}
	if (prevx > 0 && nexthoz != 1)
	{
		prevhoz = 1;
	}
	else if (prevx < 0 && nexthoz != -1)
	{
		prevhoz = -1;
	}
	
	
	if (nexty > 0)
	{
		nextver = 1;
	}
	else if (nexty < 0)
	{
		nextver = -1;
	}
	if (prevy > 0 && nexthoz != 1)
	{
		prevver = 1;
	}
	else if (prevy < 0 && nexthoz != -1)
	{
		prevver = -1;
	}
	*/
	route_set = true;
}
if (path_speed == 0)
{
	sprite_index = spr_level_selector;
	if (keyboard_check_pressed(ord("D")) && location < global.unlocked)
	{
		image_xscale = 1;
		path_start(pt_map, 4, path_action_stop, true);
		path_position = targetpos;
		targetx = path_get_point_x(pt_map, nextpoint);
		targety = path_get_point_y(pt_map, nextpoint);
		location++;
		route_set = false;
	}
	if (keyboard_check_pressed(ord("A")) && location > 0)
	{
		image_xscale = -1;
		path_start(pt_map, -4, path_action_stop, true);
		path_position = targetpos;
		targetx = path_get_point_x(pt_map, prevpoint);
		targety = path_get_point_y(pt_map, prevpoint);
		location--;
		route_set = false;
	}
	if (keyboard_check_pressed(vk_space))
	{
		scr_slideTransition(TRANS_MODE.GOTO, TRANS_TRANSISTION.VERTICAL, TRANS_TRANSISTION.VERTICAL, level.room_id)
	}
}
else
{
	sprite_index = spr_level_selector_walk;
}

if (point_distance(x, y, targetx, targety) <= 2)
{
	path_end();
	path_speed = 0;
	targetpos = path_position;
}
