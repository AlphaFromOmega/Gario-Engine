/// @description Details variables for slider
/// @function scr_enemy_attack(idle_sprite, attack_sprite, attack_hitbox, damage, horizontal_knocback, vertical_knockback);
/// @param attack_sprite
/// @param attack_hitbox
function scr_enemy_attack(_idle_sprite, _attack_sprite, _attack_hitbox, _damage, _hkb, _vkb)
{
	if (sprite_index != _attack_sprite)
	{
		sprite_index = _attack_sprite;
		image_index = 0;
		image_speed = 1;
	}
	
	// USe attack hitbox & check for hits

	mask_index = _attack_hitbox;
	var _hitID = instance_place(x, y, obj_player);
	with (_hitID)
	{
		scr_hit_player(_damage, _hkb * other.image_xscale, _vkb);
	}
	mask_index = _idle_sprite;
}