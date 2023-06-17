/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
event_inherited();

if(timeNoCol > 0){
	timeNoCol--
}

if(timeNoCol == 0){
	if(distance_to_object(Player) < 20){
		audio_play_sound(snd_combo, 10, false)
		Player.puntaje += 100
		with(instance_create_layer(x, y - 50, "Instances", ObjText)){
			sprite_index = sp_1008
		}
		instance_destroy();
	}
}

