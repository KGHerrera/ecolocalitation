/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(flashAlpha > 0){
	flashAlpha -=0.05
}

if(instance_exists(obj_player) and instance_exists(obj_cam) and instance_exists(obj_control)){
	
	if(place_meeting(x, y, obj_player) and obj_player.basuraRecolectada >= 00 and obj_player.isDashing){
		with(obj_control){
			if(!end_){
				obj_cam.shakeTimer = 80
			}
			end_ = true
		}	
		rotate = true
		
		flashAlpha = 1
		
	} else if (place_meeting(x, y, obj_player) and obj_player.basuraRecolectada < 20 and obj_player.isDashing) {
		if(instance_exists(obj_control)){
			obj_control.mensaje_ayuda = mensaje
			obj_control.mensajeTime = 200
		}
	}

	if(rotate){
		image_xscale = lerp(image_xscale, -3 , 0.1)
		image_yscale = lerp(image_yscale, 3 , 0.1)
	}

	displacement += 0.08;
	y = y + sin(displacement) * 0.2;
}

