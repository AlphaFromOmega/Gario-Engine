/// @description Details variables for slider
/// @function scr_player_attack(attack_sprite, attack_hitbox);
/// @param attack_sprite
/// @param attack_hitbox
function scr_player_attack(_attack_sprite, _attack_hitbox)
{
	if (sprite_index != _attack_sprite)
	{
		sprite_index = _attack_sprite;
		image_index = 0;
		image_speed = 1;
		ds_list_clear(hitByAttack);
	}
	
	// USe attack hitbox & check for hits

	mask_index = _attack_hitbox;
	var _hitbyattack = ds_list_create();
	var _hits = instance_place_list(x, y, obj_enemy, _hitbyattack, false);
	if (_hits > 0)
	{
		for (var i = 0; i < _hits; i++)
		{
			// If this instance has not been hit by attack
			var _hitID = _hitbyattack[| i];
			if (ds_list_find_index(hitByAttack, _hitID) == -1)
			{
				ds_list_add(hitByAttack, _hitID)
				with (_hitID)
				{
					hp--;
					flash = 3;
					dir = sign(other.image_xscale);
					hsp = dir * 8;
					vsp = -10;
					state = ENEMYSTATE.HIT;
					hitstatecounter = 60;
				}
			}
		}
	}
	ds_list_destroy(_hitbyattack);
	mask_index = spr_gario;
}