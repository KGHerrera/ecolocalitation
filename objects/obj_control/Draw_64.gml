/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)

//draw_text(30, 100, "FPS: " + string(fps))

if(animation_time > 0){
	targetHeight = display_get_gui_height() / 6.5
	targetX = display_get_gui_width() / 1.04
	animation_time--
} else {
	targetHeight = 0
	targetX = -display_get_gui_width()
	
	if(instance_exists(obj_player)){
		if(obj_player.isPlaning or obj_player.talking or mensajeTime > 0){
			targetHeight = display_get_gui_height() / 12
		}	
	}
	
}
 // Altura de las barras negras objetivo
currentHeight = lerp(currentHeight, targetHeight, 0.1) // Calcula la altura actual de las barras
currentX = lerp(currentX, targetX, 0.1)

draw_set_color(c_black)
draw_rectangle(0, 0, display_get_gui_width(), currentHeight, false)
draw_rectangle(0, display_get_gui_height() - currentHeight, display_get_gui_width(), display_get_gui_height(), false)

// texto
draw_set_alpha(1);
draw_set_color(c_white)
draw_set_halign(fa_right)
draw_set_font(PixelWin)

if(inicio){
	var room_name = string_replace_all(room_get_name(room), "_", " ")
	var second_name = "limpia la zona!"
	
} else {
	var room_name = "Felicidades has limpiado la zona!!"
	var second_name = "!sigue asi!"
}

draw_text(currentX, display_get_height() - 100, room_name)
draw_set_font(Pixel2)
draw_text(currentX, display_get_height() - 50, second_name)

draw_set_font(Pixel)
draw_text(display_get_gui_width() -30 , currentMensaje, mensaje_ayuda)

currentMensaje = lerp(currentMensaje, mensajeTarget, 0.1)

if(mensajeTime > 0){
	mensajeTarget = 20
	mensajeTime--
} else {
	mensajeTarget = -50
}

if(keyboard_check(ord("T"))){
	mensajeTime = 100
}


draw_set_halign(fa_left);

draw_set_alpha(1)

