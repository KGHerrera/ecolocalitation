/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(instance_exists(obj_player)){
	if(obj_player.talking){
		soundMax = lerp(soundMax, 0.2, 0.05)
	}  else if(obj_player.bol_surface){
		soundMax = lerp(soundMax, 0.8, 0.2)
	}
	else{
		soundMax = lerp(soundMax, end_volume, 0.05)
	}
}


sound_volume = lerp(sound_volume, soundMax, 0.05)
audio_sound_gain(cancion, sound_volume,  1)

if(instance_exists(obj_control)){
	if(obj_control.end_ and timerPitch > 0){
		pitch = lerp(pitch, 0.6, 0.05)
		audio_sound_pitch(cancion, pitch)
		timerPitch--
	} else{
		pitch = lerp(pitch, 1, 0.05)
		audio_sound_pitch(cancion, pitch)
	}
}
