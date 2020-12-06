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

enum RROOMBASTATE
{
	FREE,
	HIT,
	DEAD,
}
state = RROOMBASTATE.FREE;
hitstatecounter = 0;
movestate = sta_redroomba_move;
hitstate = sta_redroomba_hit;
deadstate = sta_redroomba_dead;

stabby = instance_create_depth(x + 12, y + 7, 0, obj_knife);
stabby.roomba_god = id;