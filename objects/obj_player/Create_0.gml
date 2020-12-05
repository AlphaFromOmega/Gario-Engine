#macro SPD_WALK 3.5
#macro SPD_GRAVITY 0.4
#macro SPD_JUMP 10

enum PLAYERSTATE
{
	FREE,
	ATTACK,
	ATTACK_COMBO,
	AIM,
	HITGROUND,
	HITAIR,
	DIEGROUND,
	DIEAIR,
	CUTSCENE
}

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

death = 0;
hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;
iframes = 0;
platform = false;


gun = 0;
reload = 0;
bullets = 6;

// Cutscene Variables
tml_dir = 0
tml_jump = false;
tml_attack = false;
tml_aim = false;


// damage variables
damage_ticker = 0;

// Stats
luck = global.player_luck;
strength = global.player_strength;
vitality = global.player_vitality;
agility = global.player_agility;
fortitude = global.player_fortitude;

global.targetX = x;
global.targetY = y;

max_hp = 20 * (vitality / 5);
hp = max_hp;
spd_jump = agility / 5 + SPD_JUMP;
spd_walk = agility / 5 + SPD_WALK;