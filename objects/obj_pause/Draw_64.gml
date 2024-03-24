if(pause){
	if(!surface_exists(pauseSurface)){
		
		
		pauseSurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface))
		surface_set_target(pauseSurface)
		
		draw_surface(application_surface, 0, 0)
		surface_reset_target()
		
		instance_deactivate_all(true);
	}
	
	
	draw_surface(pauseSurface, 0, 0)
	
	
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, display_get_gui_width(), display_get_height(), false)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(PixelWin)
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text(display_get_width()/2, display_get_height()/2, "PAUSA")
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white)
	

}