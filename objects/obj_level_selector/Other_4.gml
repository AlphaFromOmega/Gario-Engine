/// @description Load Game
var _curpoint
location = global.current_level;
if (global.loadgame)
{
	if (file_exists("savegame.gario"))
	{
		var _wrapper = scr_loadjsonfromfile("savegame.gario");
		var _list = _wrapper[? "ROOT"];
	
		for (var i = 0; i < ds_list_size(_list); i++)
		{
			var _map = _list[| i];
			location = _map[? "location"];
			global.unlocked = _map[? "unlocked"];
			path_position = _map[? "path_position"];
			x = _map[? "x"];
			y = _map[? "y"];
			global.player_luck = _map[? "luck"];
			global.player_vitality = _map[? "vitality"];
			global.player_strength = _map[? "strength"];
			global.player_agility = _map[? "agility"];
			global.player_fortitude = _map[? "fortitude"];
			global.coins = _map[? "coins"];
			global.diamonds = _map[? "diamonds"];
			var _dc = ds_map_find_value(_map, "diamonds_collected");
			for (var t = 0; t < ds_list_size(_dc); t++) {
				for (var i = 0; i < 5; i++) {
					global.diamonds_collected[t,i] = ds_list_find_index(ds_list_find_index(_dc, t), i);
				}
			}
			global.cuckthisjazz = ds_map_find_value(_map, "oopsies");
			global.spread = _map[? "spread"];
			global.reload_rate = _map[? "reload_rate"];
			global.gun_damage = _map[? "gun_damage"];
			global.cuckmonster = _map[? "cuckmonster"];
			global.bullet_count = _map[? "bullet_count"];
		}
		ds_map_destroy(_wrapper);
		show_debug_message("Game Loaded");
	}
	
	global.loadgame = false;
}
with (obj_level_marker)
{
	if (other.location == level_id)
	{
		other.x = x;
		other.y = y;
		other.targetpos = path_position;
		other.path_position = path_position;
	}
}
show_debug_message(string(path_position));