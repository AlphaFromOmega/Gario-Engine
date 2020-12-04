/// @description Details variables for slider
/// @function scr_slider(x, y, value, slider);
/// @param x
/// @param y
/// @param value
/// @param slider
function scr_slider(_x, _y, _value, _slider)
{
	var _mouse = false;
	var _slider_width = sprite_get_width(spr_slider);
	if (mouse_check_button(mb_left))
	{
		var _button_x = _x + sprite_get_width(spr_slider) * _value;
		var _button_y = _y;
		var _button_width = sprite_get_width(spr_slider_button);
		var _button_height = sprite_get_height(spr_slider_button);
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _x - _button_width / 2, _button_y - _button_height / 2, _x + _slider_width + _button_width / 2, _button_y + _button_height))
		{
			_mouse = true;
			selected_slider = _slider;
		}
		else
		{
			return _value;
		}
	}
	
	if (selected_slider == _slider)
	{
		if (_mouse)
		{
			_value = (device_mouse_x_to_gui(0) - _x) / _slider_width;
		}
		else
		{
			if (keyboard_check(ord("A")))
			{
				_value -= 0.01;
			}
			if (keyboard_check(ord("D")))
			{
				_value += 0.01;
			}
		}
		return clamp(_value, 0, 1);
	}
	else
	{
		return _value;
	}
}