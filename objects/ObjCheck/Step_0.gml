if(instance_exists(ObjControl)){
	end_ = ObjControl.end_
}

if(place_meeting(x, y, Player) and !end_){
	Player.xcheck = x
	Player.ycheck = y - 2
	check = true
}

displacement += 0.08;
y = y + sin(displacement) * 0.2;

if(check){
	if(image_alpha == 1){
		audio_play_sound(snd_check, 1, false)
		
		if(instance_exists(ObjControl)){
			ObjControl.mensaje_ayuda = "Punto de control ..."
			ObjControl.mensajeTime = 150
			showMessage = true			
		}
		
	}
	image_alpha -= 0.05
	y-= 1
	if(image_alpha == 0){
		instance_destroy()
	}
}
