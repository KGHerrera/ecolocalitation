if(distance_to_object(obj_player) < rd){
	sprite_index = spBirdFly
	fly = true
	image_xscale = -1
}

if(fly){
	y -= 4
	x += 2
}

if(y < 0){
	instance_destroy();
}
	

if(instance_exists(obj_control)){
	end_ = obj_control.end_
}

if(place_meeting(x, y, obj_player) and !cat and !end_) {
	
	with(instance_create_layer(x, y, "Instances", obj_text)){
		sprite_index = sp_5008
		audio_play_sound(snd_basura, 1, false)
	}
	
	obj_player.puntaje += 500
	
	cat = true
}
