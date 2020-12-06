/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(x, y, mouse_x, mouse_y);
if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	obj_player.image_xscale = -1;
}
else
{
	image_yscale = 1;
	obj_player.image_xscale = 1;
}

x = obj_player.x + (-8 * image_yscale);
y = obj_player.y + 5;


if (fire)
{
	audio_play_sound(sfx_shoot, 1, false);
	firingdelay = 15;
	image_index = 1;
	image_speed = 1;
	for (var i = 0; i < global.bullet_count; i++) {
		with (instance_create_depth(x + lengthdir_x(sprite_width,image_angle), y + lengthdir_y(sprite_width,image_angle), -100, obj_bullet))
		{
			speed = 15;
			if (i > 0 and i mod 2 == 0) {
				direction = other.image_angle + (global.spread * floor(i / 2));
				image_angle = direction + (global.spread * floor(i / 2));
			}
			else if (i > 0) {
				direction = other.image_angle - (global.spread * floor(i / 2));
				image_angle = direction - (global.spread * floor(i / 2));
			}
			else {
				direction = other.image_angle;
				image_angle = direction;
			}
		}
	}
	fire = false;
}
