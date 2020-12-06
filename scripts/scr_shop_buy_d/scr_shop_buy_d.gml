/// @description Deals with repative code from the shop
/// @function scr_shop_buy(price);
/// @param price
function scr_shop_buy_d(_price)
{
	if (_price <= global.diamonds)
	{
		global.diamonds -= _price;
		return true;
	}
	else
	{
		audio_play_sound(sfx_error, 1, false);
		return false;
	}
}