/// @description Insert description here
world = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

location = 0;
route_set = false;
nextpos = 0;
prevpos = 0;
nextpoint = 0;
prevpoint = 0;

targetpos = 0;
targetx = 0;
targety = 0;
instance_create_depth(x, y, 0, obj_location)