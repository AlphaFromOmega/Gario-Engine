/// @description Insert description here
// You can write your code in this editordraw_self();
if (damage_ticker > 0)
{
	if (damage_ticker mod 16 <= 7)
	{
		shader_set(sha_pflash);
		draw_self();
		shader_reset();
	}
	else 
	{
		shader_set(sha_pflash2);
		draw_self();
		shader_reset();
	}
}
else 
{
	draw_self();	
}