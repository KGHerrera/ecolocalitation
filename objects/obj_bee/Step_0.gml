time+= 0.1

if((distance_y == 0 or radius == 0)){
	displacement += 0.08;
	y = y + sin(displacement) * 0.2;
}

if(distance_x != 0){
	x = xstart + scrSineMoveX(distance_x, speed_, time);
	displacement += 0.08;
}

if (distance_y != 0){
	y = ystart  + scrSineMoveX(distance_y, speed_, time);
}

if(radius != 0){
	// Incrementar el ángulo de rotación
	angle += rotate_speed;

	// Calcular las coordenadas x e y basadas en el ángulo y el radio
	x = xstart + lengthdir_x(radius, angle);
	y = ystart + lengthdir_y(radius, angle);
}

if instance_exists(obj_player){
	
	if obj_player.x < x
		image_xscale =  -1
	else {
		image_xscale =  1
	}
}