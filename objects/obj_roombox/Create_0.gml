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

enum ROOMBOXSTATE
{
	FREE,
	HIT,
	DEAD,
	ATTACK
}
state = ROOMBOXSTATE.FREE;
hitstatecounter = 0;
movestate = sta_roombox_move;
hitstate = sta_roombox_hit;
attackstate = sta_roombox_attack;
attack_cooldown = 0;