/// @description Save Game
var _root_list = ds_list_create();

// For every instance, create a map
var _map = ds_map_create();
ds_list_add(_root_list, _map);
ds_list_mark_as_map(_root_list, ds_list_size(_root_list) - 1);

ds_map_add(_map, "location", location);
ds_map_add(_map, "unlocked", global.unlocked);
ds_map_add(_map, "x", x);
ds_map_add(_map, "y", y);
ds_map_add(_map, "path_position", path_position);
ds_map_add(_map, "luck", global.player_luck);
ds_map_add(_map, "vitality", global.player_vitality);
ds_map_add(_map, "strength", global.player_strength);
ds_map_add(_map, "agility", global.player_agility);
ds_map_add(_map, "fortitude", global.player_fortitude);
ds_map_add(_map, "coins", global.coins);
ds_map_add(_map, "diamonds", global.diamonds);
var _dc = ds_list_create();
for (var t = 0; t < global.max_levels; t++) {
	var _dct = ds_list_create();
	for (var i = 0; i < 5; i++) {
		ds_list_add(_dct, global.diamonds_collected[t,i]);
	}
	ds_list_add(_dc, _dct);
}
ds_map_add(_map, "diamonds_collected", global.diamonds_collected);
ds_map_add(_map, "spread", global.spread);
ds_map_add(_map, "reload_rate", global.reload_rate);
ds_map_add(_map, "gun_damage", global.gun_damage);
ds_map_add(_map, "cuckmonster", global.cuckmonster);
ds_map_add(_map, "bullet_count", global.bullet_count);

// Wrap the list in a map
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _root_list);

// Save all to string
var _string = json_encode(_wrapper);
scr_savestringtofile("savegame.gario", _string);

// FUCKING OBLITIRATE THE FILE, MAY IT SOULD BE DAMNED TO THE DEEPEST DARKEST POINTS OF HEEEEEEEEEEEEEEEEEEEEELLLLLLLLLLLLLLLLLLLLLLL
ds_map_destroy(_wrapper);
show_debug_message("Gamed Saved!");