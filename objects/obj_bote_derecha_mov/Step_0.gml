keyA	  =   keyboard_check_pressed(ord("C")) or gamepad_button_check_pressed(0, gp_shoulderr)


time+= 0.1

if(distance_x > 0){
	x = xstart + scrSineMoveX(distance_x, speed_, time);
}

if (distance_y > 0){
	y = ystart + scrSineMoveX(distance_y, speed_, time);
}



with(select){
	x = other.x
	y = other.y
}

if place_meeting(x,y, obj_player) and !obj_player.barrel{
	
	//animacion de ensanchamiento y normal
	
	with (obj_player){
	 
	isPlaning = false
	no_sprite = true
	sprite_index = sp_nothing
	scaling = true
	
	x = other.x
	y = other.y + 5
	
	other.see = 1
	
	if !other.keyA{
		if (keyRight) {
		other.image_angle -= 5; // Girar hacia la izquierda
	} else if (keyLeft) {
		other.image_angle += 5; // Girar hacia la derecha
	}
	}
	
	
	
	if reload_sound == 10 {
		audio_play_sound(snd_reload, 0 , false)
		var particula = part_system_create(ps_volar)
		part_system_position(particula, x, y)
		
	}
	
	reload_sound--
	
	
	
	if keyJump {
	    scaling = false
    
	    // Calculamos las componentes x e y de la velocidad basadas en el ángulo
	    int_vxMax = 12
	    int_vx = 12 * cos(degtorad(other.image_angle))
	    int_vy = -15 * sin(degtorad(other.image_angle))
    
	    barrel = true
	    no_sprite = false
	    audio_play_sound(snd_shot, 0, false)
	    obj_cam.shakeTimer = 30
	    reload_sound = 10
		
		other.burst = true
		other.see = 0
	}

		
	}
}

if burst{
	instance_create_depth(x , y, -10, obj_burst)
	burst = false
}

with (select){
	image_alpha = other.see
}