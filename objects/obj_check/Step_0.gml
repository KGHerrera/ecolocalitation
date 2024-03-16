if(instance_exists(obj_control)){
	end_ = obj_control.end_
}

if(place_meeting(x, y, obj_player) and !end_){
	obj_player.xcheck = x
	obj_player.ycheck = y - 2
	check = true
}

displacement += 0.08;
y = y + sin(displacement) * 0.2;

if(check){
	if(image_alpha == 1){
		audio_play_sound(snd_check, 1, false)
		
		if(instance_exists(obj_control)){
			obj_control.mensaje_ayuda = "Punto de control ..."
			obj_control.mensajeTime = 150
			showMessage = true			
		}
		
	}
	image_alpha -= 0.05
	y-= 1
	if(image_alpha == 0){
		instance_destroy()
	}
}
