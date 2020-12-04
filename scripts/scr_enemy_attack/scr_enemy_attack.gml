/// @description Details variables for slider
/// @function scr_player_attack(attack_sprite, attack_hitbox);
/// @param attack_sprite
/// @param attack_hitbox
function scr_enemy_attack(_attack_sprite, _attack_hitbox)
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
		hp--;
		hsp = other.image_xscale * 8;
		vsp = -5;
		state = PLAYERSTATE.HIT;
	}
	mask_index = spr_enemy;
}