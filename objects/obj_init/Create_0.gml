/// @description Game Setup
#macro TILE_SIZE 32
#macro MAXLEVELS 20

// Global Variables
global.unlocked = 0;

global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDir = -1;
global.coins = 0;
global.diamonds = 0;
global.current_level = 0;
global.reload_rate = 60;
global.spread = 15;
global.gun_damage = 1;
global.cuckmonster = false;
global.bullet_count = 1;
global.max_levels = MAXLEVELS;

global.cuckthisjazz[0] = 0;

for (var i = 0; i <= MAXLEVELS; i++)
{
	for (var j = 0; j < 5; j++)
	{
		global.diamonds_collected[i, j] = false;
	}
}

audio_group_load(ag_mus);
audio_group_load(ag_sfx);

heightstoget = sprite_get_width(spr_ts_collide);
tiles = heightstoget / TILE_SIZE;

// Create Tiles
var layerid = layer_create(0, "Tiles");
tilemapid = layer_tilemap_create(layerid, 0, 0, ts_collision, tiles, 1);
for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tilemapid,i,i,0);
}

global.player_luck = 5;
global.player_vitality = 5;
global.player_strength = 5;
global.player_agility = 5;
global.player_fortitude = 5;
