if(follow == Player and (distance_to_object(Player) < 500)){
	displacement += 0.08;
	y = y + sin(displacement) * 0.2;
} 

if distance_to_object(Player) < 500 {
  visible = true;
} else {
  visible = false;
}

if(instance_exists(ObjControl)){
	end_ = ObjControl.end_
	if(end_){
			
		image_alpha-= 0.05
		y-= 2
		if(image_alpha == 0){
			instance_destroy()
		}
	}
}

if (distance_to_object(Player) < 20 and !startFollow and Player.papel < 10 and !end_) {
    startFollow = true
	with(Player){
		sound += 0.2
		papel += 1
		if(sound = 2.0){
			sound = 1
			audio_play_sound(snd_combo, 10, false, .8, 0, sound)
			puntaje += 1000
			
			with(instance_create_layer(x, y - 50, "Instances", ObjText)){
				sprite_index = sp_10008
			}
			
			
		} else {
			audio_play_sound(snd_combo, 10, false, .8, 0, sound)
			puntaje += 20
			with(instance_create_layer(x, y - 50, "Instances", ObjText)){
				
			}
		}
		
	}	
	
} else if(Player.papel == 10 and place_meeting(x, y, Player) and !startFollow){
	if(instance_exists(ObjControl)){
		ObjControl.mensaje_ayuda = mensaje
		ObjControl.mensajeTime = 100
	}
}

if (startFollow){
	
	xTo = follow.x;
	yTo = follow.y;
	
	if(follow.image_xscale < 0 and follow == Player){
		x += (xTo - x) / followRdX + 2;
		y += (yTo - y) / followRdY - 1.5;
	} else if(follow == Player) {
		x += (xTo - x) / followRdX - 2;
		y += (yTo - y) / followRdY - 1.5;
	} else {
		x += (xTo - x) / 12 + followRdBotex;
		y += (yTo - y) / 15 + 0.4;
	}
	
}

