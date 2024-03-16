/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(distance_to_object(obj_player) < 50  and obj_player.bolGround and pressCont < 1){
	boton.visible = true
	
	if(obj_player.keyX and pressCont < 1){
		pressCont++
		obj_cam.shakeTimer = 30
		
		if(pressCont == 1){
			sprite_index = spCofreC
			createInstances = true
			//instance_create_depth(x, y - 32, depth - 1, ObjBird)
			
			particula = part_system_create(ps_volar)
			part_system_position(particula, x, y - 32)
			
			audio_play_sound(snd_bote, 2, false)
			
		

			var vx_values = [-4, -3, 0, 3, 4]; // Valores específicos de fuerza en el eje x
			var index = 0; // Índice para recorrer los valores de vx_values

			repeat(5) {
			    var new_vx = vx_values[index]; // Tomar el valor correspondiente según el índice
    
			    with (instance_create_depth(x, y - 32, depth - 1, obj_fruta)) {
			        int_vx = new_vx;
			        int_vy = -8; // Fuerza constante en el eje y
			    }
    
			    index++; // Incrementar el índice para el siguiente valor
			}
			
		}
	} 
	
	
} else{
	boton.visible = false
}



