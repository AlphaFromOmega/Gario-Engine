/// @description Insert description here
// You can write your code in this editor
x = obj_level_selector.x
y = obj_level_selector.y
if (abs(x - xprevious) < 4 && x - xprevious != 0)
{
	obj_level_selector.image_xscale = sign(x - xprevious);
}