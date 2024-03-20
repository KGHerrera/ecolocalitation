time += 0.1


if (giro_en_cruz){
	
	if wait == 0{
		angle_rotate += 2
	}
	
	
	if angle_rotate mod 90 == 0{
		image_angle = scrApproach(image_angle, angle_rotate, 10)
		
		wait +=2
		if (wait = 60) wait = 0
	}
	
} else if (giro_en_diagonal){
	
	if wait == 0{
		angle_rotate += 2
	}
	
	
	if angle_rotate mod 90 == 0{
		image_angle = scrApproach(image_angle, angle_rotate - 45, 10)
		
		wait +=2
		if (wait = 60) wait = 0
	}
	
} else {
	image_angle += 3
}

if(distance_x =! 0){
	x = xstart + scrSineMoveX(distance_x, speed_, time);
}

if (distance_y != 0){
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
	with(instance_create_depth(x , y, -10, obj_burst_2)){
		image_angle = other.image_angle - 90
	}
	burst = false
}

with (select){
	image_alpha = other.see
}

if radius != 0{
	// Incrementar el ángulo de rotación
	angle += rotate_speed;

	// Calcular las coordenadas x e y basadas en el ángulo y el radio
	x = xstart + lengthdir_x(radius, angle);
	y = ystart + lengthdir_y(radius, angle);
}