// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_shop(){
	with (obj_shop) {
		if (file_exists("shop.gario")) {
			var _root_ = scr_loadjsonfromfile("shop.gario");
			var root_l = _root_[? "ROOT"];
			
			var map_guru = root_l[| 0];
			var map_upgr = root_l[| 1];
			var map_extr = root_l[| 2];
			
			shop_guru_luck = map_guru[? "Luck"];
			shop_guru_vitality = map_guru[? "Vitality"];
			shop_guru_strength = map_guru[? "Strength"];
			shop_guru_agility = map_guru[? "Agility"];
			shop_guru_fortitude = map_guru[? "Fortitude"];
			
			shop_upgr_faster_reload = map_upgr[? "Faster Reload"];
			shop_upgr_shot_increase = map_upgr[? "Shot Increase"];
			shop_upgr_damage = map_upgr[? "Damage"];
			
			shop_extr_cuck = map_extr[? "Cuck"];
		}
	}
}