/// @description Size, Vars and Mode setup
#macro PERCENTMAX 1.01
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h / 2;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
enum TRANS_TRANSISTION
{
	VERTICAL,
	HORIZONTAL,
	LEFT,
	RIGHT,
	UP,
	DOWN,
}
mode = TRANS_MODE.OFF;
percent = 1;
target = room;
trans_out = TRANS_TRANSISTION.VERTICAL;
trans_in = TRANS_TRANSISTION.VERTICAL;