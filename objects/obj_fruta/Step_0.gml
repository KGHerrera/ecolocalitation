/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
event_inherited();

if(timeNoCol > 0){
	timeNoCol--
}

if(timeNoCol == 0){
	if(distance_to_object(obj_player) < 20){
		audio_play_sound(snd_combo, 10, false)
		obj_player.puntaje += 100
		with(instance_create_layer(x, y - 50, layer, obj_text)){
			sprite_index = sp_1008
		}
		
		instance_destroy();
	}
}

if(int_vx != 0){
	int_vx = scrApproach(int_vx, 0, 0.075);
}
