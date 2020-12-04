/// @description Insert description here
// You can write your code in this editor

if (!fadeout)
{
	a = max(a - 0.005,0.15);
}
else
{
	a = min(a + 0.005, 1);
}

l += 1;

print = string_copy(str, 1, l);

if (keyboard_check(vk_space))
{
	holdspace++;
}

if (holdspace > 80 || cutscene_end)
{
	fadeout = 1;
}
if (a == 1 && fadeout == 1)
{
	scr_slideTransition(TRANS_MODE.NEXT, TRANS_TRANSISTION.DOWN, TRANS_TRANSISTION.UP);
}