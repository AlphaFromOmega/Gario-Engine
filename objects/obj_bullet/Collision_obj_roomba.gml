/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
with (other)
{
	hp -= global.gun_damage;
	flash = 3;
	hsp = 0;
	vsp = 0;
	state = ROOMBASTATE.HIT;
	hitstatecounter = 40;
}
instance_destroy();