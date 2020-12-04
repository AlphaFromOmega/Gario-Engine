/// @description Draw black bars
if (instance_exists(obj_player) && obj_player.death > 60)
{
	a = min(a + 0.01, 1);
	draw_sprite_ext(spr_pixel, 0, 0, 0, 1024, 576, 0, c_black, a);
	if (obj_player.death > 120)
	{
		global.music = mus_notanepicgamermoment;
		a1 = min(a1 + 0.01, 1);
		draw_set_alpha(a1);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fn_menu);
		draw_text(512, 288, "Press Space to restart");
	}
}
draw_set_alpha(1);
if (mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black)
	if(mode = TRANS_MODE.INTRO)
	{
		switch (trans_in)
		{
			case TRANS_TRANSISTION.VERTICAL: default:
			{
				draw_rectangle(0, 0, w, percent * h_half, false);
				draw_rectangle(0, h, w, h - (percent * h_half), false);
				break;
			}
			case TRANS_TRANSISTION.HORIZONTAL:
			{
				draw_rectangle(0, 0, percent * w / 2, h, false);
				draw_rectangle(w, 0, w - (percent * w / 2), h, false);
				break;
			}
			case TRANS_TRANSISTION.LEFT:
			{
				draw_rectangle(0, 0, percent * w, h, false);
				break;
			}
			case TRANS_TRANSISTION.RIGHT:
			{
				draw_rectangle(w, 0, w - (percent * w), h, false);
				break;
			}
			case TRANS_TRANSISTION.UP:
			{
				draw_rectangle(0, 0, w, percent * h, false);
				break;
			}
			case TRANS_TRANSISTION.DOWN:
			{
				draw_rectangle(0, h, w , h - (percent * h), false);
				break;
			}
		}
	}
	else
	{
		switch (trans_out)
		{
			case TRANS_TRANSISTION.VERTICAL: default:
			{
				draw_rectangle(0, 0, w, percent * h_half, false);
				draw_rectangle(0, h, w, h - (percent * h_half), false);
				break;
			}
			case TRANS_TRANSISTION.HORIZONTAL:
			{
				draw_rectangle(0, 0, percent * w / 2, h, false);
				draw_rectangle(w, 0, w - (percent * w / 2), h, false);
				break;
			}
			case TRANS_TRANSISTION.LEFT:
			{
				draw_rectangle(0, 0, percent * w, h, false);
				break;
			}
			case TRANS_TRANSISTION.RIGHT:
			{
				draw_rectangle(w, 0, w - (percent * w), h, false);
				break;
			}
			case TRANS_TRANSISTION.UP:
			{
				draw_rectangle(0, 0, w, percent * h, false);
				break;
			}
			case TRANS_TRANSISTION.DOWN:
			{
				draw_rectangle(0, h, w , h - (percent * h), false);
				break;
			}
		}
	}
}