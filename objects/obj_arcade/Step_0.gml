/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(distance_to_object(obj_player) < 50  and obj_player.bolGround and pressCont < 3){
	boton.visible = true
	if(obj_player.keyX and pressCont < 4){
		pressCont++
		obj_cam.shakeTimer = 10 * pressCont
		
	
		with(instance_create_depth(x + irandom_range(-32, 32), y -32, depth-1, obj_text)){
			obj_player.puntaje += 500
			sprite_index = sp_5008
		}
		
		audio_play_sound(snd_coin, 2, false)
		
	} 
	
	
} else{
	boton.visible = false
}