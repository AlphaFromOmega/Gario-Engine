/// @description Returns a number tuned to a sin wave
/// @function scr_wave(from, to, duration, offset);
/// @param from
/// @param to
/// @param duration
/// @param offset

function scr_wave(_from, _to, _duration, _offset){
	var _a4 = (_to - _from) * 0.5;
	return _from + _a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * _a4;
}