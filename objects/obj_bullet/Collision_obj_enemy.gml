/// @description Insert description here
with (other)
{
	hp -= global.gun_damage;
	flash = 3;
	hsp = 0;
	vsp = 0;
	state = ENEMYSTATE.HIT;
	hitstatecounter = 40;
}
instance_destroy();