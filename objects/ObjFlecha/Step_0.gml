keyRight  = keyboard_check_pressed(ord("L")) or keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(0, gp_padr)
keyLeft   = keyboard_check_pressed(ord("J")) or keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(0, gp_padl)
if keyLeft{
	if(posicion != 2){
		posicion++
		
	} else {
		posicion = 0
	}
}

if keyRight{
	if(posicion != 0){
		posicion--
	} else {
		posicion = 2
	}
}
x = posiciones[posicion].x
displacement += 0.08
y = y + sin(displacement) * 0.2
ObjCam.following = posiciones[posicion]


if(keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderl)){
	if(!ObjCaida.puede_caer){
		ObjCaida.x = x;
		ObjCaida.visible = true;
		ObjCaida.puede_caer = true;
	}

}


