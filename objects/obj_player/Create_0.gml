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

max_hp = 20;
hp = max_hp;

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

global.targetX = x;
global.targetY = y;