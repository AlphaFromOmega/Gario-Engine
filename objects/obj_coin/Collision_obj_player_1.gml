/// @description Insert description here
// You can write your code in this editorif

if (uncollectable == 0)
{
	with (other)
	{
		coins_collected_level += 1;	
	}
	audio_play_sound(sfx_coin, 1, false);
	instance_destroy();
}
