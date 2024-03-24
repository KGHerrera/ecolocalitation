if(follow == obj_player and (distance_to_object(obj_player) < 500)){
	displacement += 0.08;
	y = y + sin(displacement) * 0.2;
} 

if distance_to_object(obj_player) < 500 {
  visible = true;
} else {
  visible = false;
}

if(instance_exists(obj_control)){
	end_ = obj_control.end_
	
	
	
	if(end_){
			
		image_alpha-= 0.05
		y-= 2
		if(image_alpha == 0){
			instance_destroy()
		}
	} else if obj_player.scaling and follow == obj_player and startFollow {
		image_alpha = scrApproach(image_alpha, 0.1, 0.1)
		image_blend = make_color_rgb(255 * image_alpha, 255 * image_alpha, 255 * image_alpha)
	} else {
		image_alpha = scrApproach(image_alpha, 1, 0.1)
		image_blend = make_color_rgb(255 * image_alpha, 255 * image_alpha, 255 * image_alpha)
	}
}

if (distance_to_object(obj_player) < 20 and !startFollow and obj_player.papel < 10 and !end_ and !obj_player.die) {
    startFollow = true
	with(obj_player){
		sound += 0.2
		
		if(other.tipo == "organ") obj_player.organicas += 1
		else if(other.tipo == "lata") obj_player.latas += 1
		else if(other.tipo == "papel") obj_player.papeles += 1
		
		
		
		papel += 1
		if(sound = 2.0){
			sound = 1
			audio_play_sound(snd_combo, 10, false, .8, 0, sound)
			puntaje += 1000
			
			with(instance_create_layer(x, y - 50, layer, obj_text)){
				sprite_index = sp_10008
			}
			
			
		} else {
			audio_play_sound(snd_combo, 10, false, .8, 0, sound)
			puntaje += 20
			with(instance_create_layer(x, y - 50, layer, obj_text)){
				
			}
		}
		
	}	
	
} else if(obj_player.papel == 10 and place_meeting(x, y, obj_player) and !startFollow){
	if(instance_exists(obj_control)){
		obj_control.mensaje_ayuda = mensaje
		obj_control.mensajeTime = 100
	}
}

if (startFollow){
	
	xTo = follow.x;
	yTo = follow.y;
	
	if(follow.image_xscale < 0 and follow == obj_player){
		x += (xTo - x) / followRdX + 2;
		y += (yTo - y) / followRdY - 1.5;
	} else if(follow == obj_player) {
		x += (xTo - x) / followRdX - 2;
		y += (yTo - y) / followRdY - 1.5;
	} else {
		x += (xTo - x) / 12 + followRdBotex;
		y += (yTo - y) / 15 + 0.4;
	}
	
	if(obj_player.die and !followBote){
		startFollow = false
		x = x_init
		y = y_init	
		obj_player.papel = 0
	}
	
}



