/// @description Deals with repative code from the shop
/// @function scr_shop_buy(price);
/// @param price
function scr_shop_buy(_price)
{
	if (_price <= global.coins)
	{
		global.coins -= _price;
		return true;
	}
	else
	{
		audio_play_sound(sfx_error, 1, false);
		return false;
	}
}