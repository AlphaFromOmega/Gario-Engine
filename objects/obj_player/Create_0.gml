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
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

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

total_coins_collected = global.coins;
coins_collected_level = 0;

// damage variables
damage_ticker = 0;

global.targetX = x;
global.targetY = y;

strength = global.player_strength;
agility = global.player_agility;
fortitude = global.player_fortitude;
luck = global.player_luck;
vitality = global.player_vitality;

max_hp = vitality * 4;
spd_walk = (agility / 5) * SPD_WALK;
spd_jump = (agility / 5) * SPD_JUMP;