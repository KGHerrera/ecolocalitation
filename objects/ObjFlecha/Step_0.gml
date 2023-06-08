keyRight  =   keyboard_check_pressed(ord("L"))// or gamepad_axis_value(0, gp_axislh)
keyLeft   =   keyboard_check_pressed(ord("J"))// or -gamepad_axis_value(0, gp_axislh)
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



