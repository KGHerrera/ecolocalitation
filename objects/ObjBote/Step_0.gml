if distance_to_object(Player) < 500 or !instance_exists(Player){
  visible = true;
} else {
  visible = false;
}

if(instance_exists(ObjControl)){
	end_ = ObjControl.end_
}

if (distance_to_object(Player) < 40 and Player.bolGround and !end_) {
	inst.visible = true
	if(Player.keyX and Player.bolGround){
		
		if(tipo == "organ" and Player.organicas == 0) showMesaje = true
		else if(tipo == "lata" and Player.latas == 0) showMesaje = true
		else if(tipo == "papel" and Player.papeles == 0) showMesaje = true
		
		
		with(ObjPapel){
			if(startFollow and !followBote and !sumaPuntos and tipo = other.tipo) {
				followBote = true
				follow = other
				other.play = true
			
				if (Player.papel != 0) {
					other.suma += 1
					Player.sound = 1
					Player.puntaje += 100				
					Player.papel -= 1
					
					if(tipo == "organ") Player.organicas -= 1
					else if(tipo == "lata") Player.latas -= 1
					else if(tipo == "papel") Player.papeles -= 1
					
					Player.basuraRecolectada++
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