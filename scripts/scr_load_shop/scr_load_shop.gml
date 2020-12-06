// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_shop()
{
	var root_l = ds_list_create();
	with(obj_shop) {
		var guru_map = ds_map_create();
		var upgr_map = ds_map_create();
		var extr_map = ds_map_create();
		
		ds_list_add(root_l, guru_map);
		ds_list_mark_as_map(root_l, ds_list_size(root_l)-1);
		
		ds_list_add(root_l, upgr_map);
		ds_list_mark_as_map(root_l, ds_list_size(root_l)-1);
		
		ds_list_add(root_l, extr_map);
		ds_list_mark_as_map(root_l, ds_list_size(root_l)-1);
		
		ds_map_add(guru_map, "Luck", shop_guru_luck);
		ds_map_add(guru_map, "Vitality", shop_guru_vitality);
		ds_map_add(guru_map, "Strength", shop_guru_strength);
		ds_map_add(guru_map, "Agility", shop_guru_agility);
		ds_map_add(guru_map, "Fortitude", shop_guru_fortitude);
		
		ds_map_add(upgr_map, "Faster Reload", shop_upgr_faster_reload);
		ds_map_add(upgr_map, "Shot Increase", shop_upgr_shot_increase);
		ds_map_add(upgr_map, "Damage", shop_upgr_damage);
		
		ds_map_add(extr_map, "Cuck", shop_extr_cuck);
		
		//finish up
		var _root_ = ds_map_create();
		ds_map_add_list(_root_, "ROOT", root_l);
		var _str_ = json_encode(_root_);
		
		scr_savestringtofile("shop.gario", _str_);
	}
}