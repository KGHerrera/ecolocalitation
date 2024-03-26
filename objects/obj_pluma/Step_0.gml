
displacement += 0.05;
y = y + sin(displacement) * .2;



if(distance_to_object(obj_player) < 5 and obj_player.isPlaning and !coldown){
	if obj_player.int_vxMax < 10 {
		obj_player.int_vxMax = 10
	}
	
	obj_player.int_vy = -6
	obj_player.int_vx = 10 * obj_player.int_move
	coldown = true
	obj_cam.shakeTimer = 30
	audio_play_sound(snd_pluma, 1,false)
}

if coldown {
	
	sprite_index = ef_pluma
	
	if coldown_time == coldown_time_max - 60 {
		image_alpha = 0
	}
	
	coldown_time--
	
	if coldown_time == 0{
		sprite_index = sp_pluma_azul
		coldown = false
		image_alpha = 1
		coldown_time = coldown_time_max
	}
}