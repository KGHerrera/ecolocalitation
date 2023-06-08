if (showing_dialog == true) {
	global.draw_set_font(Pixel2)
	var text_x = 30;
	var text_y = 18;
	var height = 32;
	var border = 5;
	var padding = 32;
	
	height = string_height(current_dialog.message);
	
	if (sprite_get_height(current_dialog.sprite) > height) {
		height = sprite_get_height(current_dialog.sprite);
	}
	
	height += padding * 2;
	text_x = sprite_get_width(current_dialog.sprite) + (padding);
	
	draw_set_alpha(alpha);
	
	draw_set_color(c_black); //black
	draw_rectangle(50, 100, display_get_gui_width() - 50, height + 16 + 50, false);
	
	draw_set_color(c_white);
	draw_rectangle(border + 50, border + 100, display_get_gui_width() - border - 50, height - border + 16 + 50, false);
	
	draw_set_color(c_black); //black
	draw_rectangle((border * 2) + 50, (border * 2) + 100, display_get_gui_width() - (border * 2) - 50, height - (border * 2) + 16 + 50, false);
	
	if (current_dialog.sprite != -1) {
		draw_sprite(current_dialog.sprite, 0, border * 3 + 50, border * 3 + 100);
	}
	
	draw_set_color(c_white);
	draw_text_ext(text_x + 50, text_y + 100, current_dialog.message, 32 /*separacion de linea*/, display_get_gui_width() - 192 - 100);
	
	alpha = lerp(alpha, 1, 1);
	global.draw_set_font(Pixel)
}

draw_set_alpha(1);
