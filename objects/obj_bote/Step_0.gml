if distance_to_object(obj_player) < 500 or !instance_exists(obj_player){
  visible = true;
} else {
  visible = false;
}

if(instance_exists(ObjControl)){
	end_ = ObjControl.end_
}

if (distance_to_object(obj_player) < 40 and obj_player.bolGround and !end_) {
	inst.visible = true
	if((obj_player.keyX) and obj_player.bolGround){
		
		if(tipo == "organ" and obj_player.organicas == 0) showMesaje = true
		else if(tipo == "lata" and obj_player.latas == 0) showMesaje = true
		else if(tipo == "papel" and obj_player.papeles == 0) showMesaje = true
		
		
		with(obj_papel){
			if(startFollow and !followBote and !sumaPuntos and tipo = other.tipo) {
				followBote = true
				follow = other
				other.play = true
			
				if (obj_player.papel != 0) {
					other.suma += 1
					obj_player.sound = 1
					obj_player.puntaje += 100				
					obj_player.papel -= 1
					
					if(tipo == "organ") obj_player.organicas -= 1
					else if(tipo == "lata") obj_player.latas -= 1
					else if(tipo == "papel") obj_player.papeles -= 1
					
					obj_player.basuraRecolectada++
				}	
				
				with(instance_create_layer(x, y - 10, "Instances", ObjText)){
					sprite_index = sp_1008
				}
			} 
		}
	}
   
} else {
	inst.visible = false
}

if(showMesaje){
	if(instance_exists(ObjControl)){
		ObjControl.mensaje_ayuda = mensaje
		ObjControl.mensajeTime = 180
		audio_play_sound(snd_error, 1, false)
	}
	
	showMesaje = false
}

if(play){
	audio_play_sound(snd_bote, 11, false, 1)
	play = false;
}

if(end_){
	image_alpha-= 0.05
	y-=2
	if(image_alpha == 0){
		instance_destroy()
	}
}