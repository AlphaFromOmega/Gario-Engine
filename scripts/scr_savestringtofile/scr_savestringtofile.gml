/// @description Saves string to file
/// @function scr_savestringtofile(filename, string);
/// @param filename
/// @param string

function scr_savestringtofile(_filename, _string)
{
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}