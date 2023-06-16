audio_stop_all();
if(room = Nivel_1_Cuadra){
	cancion = audio_play_sound(ost_level_2, 2, true);
}  else if(room = Mundo_Acuatico_1){
	cancion = audio_play_sound(ost_level_3, 2, true);
}

else if(room == Harden_than_Yatagarassu){
	cancion = audio_play_sound(snd_yata, 2, true);
}

else if(room == minijuego) {
	cancion = audio_play_sound(ost_minijuego, 2, true);
}

else if(room == Puntuacion) {
	cancion = audio_play_sound(ost_pointer, 2, true);
}

else if(room == Barranco_de_ajo_muerto) {
	cancion = audio_play_sound(ost_desert, 2, true);
}

else if(room == Tu_Cuarto) {
	cancion = audio_play_sound(ost_cuarto, 2, true);
}


else {
	cancion = audio_play_sound(ost_test, 2, true);
}
sound_volume = 1
sound = 0
soundMax = 1

pitch = 1
timerPitch = 70

end_volume = 1