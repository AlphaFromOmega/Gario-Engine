/// @description Damages and knocks the player back. Also handles kills logistics
/// @function scr_hit_player(damage, horizontal_knockback, vertical_knockback);
/// @param damage
/// @param horizontal_knockback
/// @param vertical_knockback
function scr_hit_player(_damage, _hkb, _vkb)
{
	with (obj_player)
	{
		if (hp > 0)
		{
			if (damage_ticker == 0) {
				var _grounded = (scr_inFloor(tilemap,x,bbox_bottom+1, true) >= 0);
				if (_damage >= hp)
				{
					// he dead broh
					
					var i;
					for (i = 0; i < obj_player.coins_collected_level; i += 1) {
						coin = instance_create_layer(x, y, "Entities", obj_coin);
						coin.vsp = random_range(-4, -12);
						coin.hsp = random_range(-6, 6);
					}
					obj_player.coins_collected_level = 0;
					
					global.music = NOMUSIC;
					hp = 0;
					if (_grounded)
					{
						// Don't apply knockback, Switch to the ground death state
						state = PLAYERSTATE.DIEGROUND;
					}
					else
					{
						// Apply Knockback, Switch to state death in air
						state = PLAYERSTATE.DIEAIR;
						hsp = _hkb;
						vsp = _vkb;
					}
					audio_play_sound(sfx_death,1,false);
				}
				else
				{
					// BEGIN DAMAGE CODE.
					damage_ticker = 39;
					hp -= _damage;
					if (_grounded)
					{
						iframes = 10;
						state = PLAYERSTATE.HITGROUND;
					}
					else
					{
						state = PLAYERSTATE.HITAIR;
					}
					hsp = _hkb;
					vsp = _vkb;
				}
			}
		}
	}
	if (instance_exists(obj_revolver))
	{
		instance_destroy(obj_revolver);
	}
}