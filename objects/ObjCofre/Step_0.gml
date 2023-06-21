/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(distance_to_object(Player) < 50  and Player.bolGround and pressCont < 1){
	boton.visible = true
	
	if(Player.keyX and pressCont < 1){
		pressCont++
		ObjCam.shakeTimer = 30
		
		if(pressCont == 1){
			sprite_index = spCofreC
			createInstances = true
			//instance_create_depth(x, y - 32, depth - 1, ObjBird)
			
			particula = part_system_create(psFly)
			part_system_position(particula, x, y - 32)
			
			audio_play_sound(snd_bote, 2, false)
			
			var vx_values = []; // Array para almacenar los valores de intVX generados

			repeat(5) {
			    var new_vx;
			    do {
			        new_vx = irandom_range(-6, 6); // Generar un nuevo valor de intVX
			    } until (!array_contains(vx_values, new_vx)); // Repetir si el valor ya existe en el array
    
			    array_push(vx_values, new_vx); // Agregar el valor al array
    
			    with (instance_create_depth(x, y - 32, depth - 1, ObjCandy)) {
			        intVX = new_vx;
			        intVY = irandom_range(-6, -10);
			    }
			}	
			
		}
	} 
	
	
} else{
	boton.visible = false
}



