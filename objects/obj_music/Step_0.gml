/// @description Insert description here
// You can write your code in this editor
if (curtrack != global.music)
{
	audio_stop_sound(curtrack);
	if (global.music != NOMUSIC)
	{
		curtrack = global.music;
		audio_play_sound(curtrack, 1000, true);
	}
}