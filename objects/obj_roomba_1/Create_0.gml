/// @description Insert description here
// You can write your code in this editor
walkspeed = 3;
dir = 1;

hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;
iframes = 0;
tilemap = layer_tilemap_get_id("Collision");

hp = 5;
flash = 0;
shot = false;

enum ROOMBASTATE
{
	FREE,
	HIT,
	DEAD,
	ATTACK
}
state = ROOMBASTATE.FREE;
hitstatecounter = 0;
movestate = sta_roomba_move;
hitstate = sta_roomba_hit;
attackstate = sta_roomba_attack;
attack_cooldown = 0;
deadstate = sta_roomba_dead;