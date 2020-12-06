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

enum ENEMYSTATE
{
	FREE,
	HIT,
	DEAD,
	ATTACK
}
state = ENEMYSTATE.FREE;
hitstatecounter = 0;
movestate = sta_enemy_move;
hitstate = sta_enemy_hit;
attackstate = sta_enemy_attack;
attack_cooldown = 0;