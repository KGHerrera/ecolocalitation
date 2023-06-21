/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(distance_to_object(Player) < 50  and Player.bolGround and pressCont < 3){
	boton.visible = true
	if(Player.keyX and pressCont < 4){
		pressCont++
		ObjCam.shakeTimer = 10 * pressCont
		
	
		with(instance_create_depth(x + irandom_range(-32, 32), y -32, depth-1, ObjText)){
			Player.puntaje += 500
			sprite_index = sp_5008
		}
		
		audio_play_sound(snd_coin, 2, false)
		
	} 
	
	
} else{
	boton.visible = false
}