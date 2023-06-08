if(distance_to_object(Player) < rd){
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
	

if(instance_exists(ObjControl)){
	end_ = ObjControl.end_
}

if(place_meeting(x, y, Player) and !cat and !end_) {
	
	with(instance_create_layer(x, y, "Instances", ObjText)){
		sprite_index = sp_5008
		audio_play_sound(snd_basura, 1, false)
	}
	
	Player.puntaje += 500
	
	cat = true
}
