audio_stop_all();
switch (room) {
    case rm_nivel_1_cuadra:
        cancion = audio_play_sound(ost_level_2, 2, true);
        break;
    
    case rm_mundo_acuatico_1:
        cancion = audio_play_sound(ost_level_3, 2, true);
        break;

    case rm_harden_than_yatagarassu:
        cancion = audio_play_sound(snd_yata, 2, true);
        break;

    case rm_barranco_de_ajo_muerto:
        cancion = audio_play_sound(ost_desert, 2, true);
        break;

    case rm_tu_cuarto:
        cancion = audio_play_sound(ost_cuarto, 2, true);
        break;

    case rm_salva_el_mundo:
        cancion = audio_play_sound(ost_save_the_world, 2, true);
        break;

    case rm_to_the_top:
        cancion = audio_play_sound(ost_to_the_top, 2, true);
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