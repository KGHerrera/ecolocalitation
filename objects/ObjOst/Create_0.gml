audio_stop_all();
switch (room) {
    case Nivel_1_Cuadra:
        cancion = audio_play_sound(ost_level_2, 2, true);
        break;
    
    case Mundo_Acuatico_1:
        cancion = audio_play_sound(ost_level_3, 2, true);
        break;

    case Harden_than_Yatagarassu:
        cancion = audio_play_sound(snd_yata, 2, true);
        break;

    case Barranco_de_ajo_muerto:
        cancion = audio_play_sound(ost_desert, 2, true);
        break;

    case Tu_Cuarto:
        cancion = audio_play_sound(ost_cuarto, 2, true);
        break;

    case Salva_El_Mundo:
        cancion = audio_play_sound(without, 2, true);
        break;

    case To_The_Top:
        cancion = audio_play_sound(to_the_top, 2, true);
        break;

    default:
        cancion = audio_play_sound(ost_test, 2, true);
        break;
}

sound_volume = 1
sound = 0
soundMax = 1

pitch = 1
timerPitch = 70

end_volume = 1