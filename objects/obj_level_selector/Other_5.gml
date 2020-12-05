/// @description Save Game
var _root_list = ds_list_create();

// For every instance, create a map
var _map = ds_map_create();
ds_list_add(_root_list, _map);
ds_list_mark_as_map(_root_list, ds_list_size(_root_list) - 1);

var _obj = object_get_name(object_index);
ds_map_add(_map, "location", location);
ds_map_add(_map, "unlocked", global.unlocked);
ds_map_add(_map, "x", x);
ds_map_add(_map, "y", y);
ds_map_add(_map, "path_position", path_position);

// Wrap the list in a map
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _root_list);

// Save all to string
var _string = json_encode(_wrapper);
scr_savestringtofile("savegame.gario", _string);

// FUCKING OBLITIRATE THE FILE, MAY IT SOULD BE DAMNED TO THE DEEPEST DARKEST POINTS OF HEEEEEEEEEEEEEEEEEEEEELLLLLLLLLLLLLLLLLLLLLLL
ds_map_destroy(_wrapper);
show_debug_message("Gamed Saved!");