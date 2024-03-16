/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(distance_to_object(obj_player) < 50  and obj_player.bolGround and pressCont < 1){
	boton.visible = true
	
	if(obj_player.keyX and pressCont < 1){
		pressCont++
		obj_cam.shakeTimer = 20
		
		if(pressCont == 1){
			sprite_index = spCofreC
			createInstances = true
			particula = part_system_create(ps_aire)
			part_system_position(particula, x, y)
			
			with(instance_create_depth(x, y, depth - 1, obj_aire_vertical)){
				image_xscale = 3
				image_yscale = 10
			}
			audio_play_sound(snd_bote, 2, false)
		}
	} 
	
	
} else{
	boton.visible = false
}



