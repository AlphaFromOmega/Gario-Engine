/// @description Insert description here
with (other)
{
	hp--;
	flash = 3;
	hsp = 0;
	vsp = 0;
	state = ENEMYSTATE.HIT;
	hitstatecounter = 40;
}
instance_destroy();