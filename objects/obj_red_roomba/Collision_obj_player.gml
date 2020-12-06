/// @description Insert description here
// You can write your code in this editor
if (state == RROOMBASTATE.DEAD) {
	if (rectangle_in_rectangle(other.x - other.sprite_width/2, other.y - other.sprite_height/2, other.x + other.sprite_width/2, other.y + other.sprite_height/2, x - 3, y - 2, x + 3, y + 2) == 2) {
		other.vsp = -14;
	}

	hsp = other.image_xscale * 6;
	vsp = -4;
}
