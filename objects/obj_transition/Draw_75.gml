/// @description Draw black bars
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