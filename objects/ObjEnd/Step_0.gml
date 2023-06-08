/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(flashAlpha > 0){
	flashAlpha -=0.05
}

if(instance_exists(Player) and instance_exists(ObjCam) and instance_exists(ObjControl)){
	
	if(place_meeting(x, y, Player) and Player.basuraRecolectada >= 20 and Player.isDashing){
		with(ObjControl){
			if(!end_){
				ObjCam.shakeTimer = 80
			}
			end_ = true
		}	
		rotate = true
		
		flashAlpha = 1
		
	} else if (place_meeting(x, y, Player) and Player.basuraRecolectada < 20 and Player.isDashing) {
		if(instance_exists(ObjControl)){
			ObjControl.mensaje_ayuda = mensaje
			ObjControl.mensajeTime = 200
		}
	}

	if(rotate){
		image_xscale = lerp(image_xscale, -3 , 0.1)
		image_yscale = lerp(image_yscale, 3 , 0.1)
	}

	displacement += 0.08;
	y = y + sin(displacement) * 0.2;
}

