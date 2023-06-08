if (end_){
	inicio = false
	animation_time = 130
}

if(wait > 0 and end_){
	wait--
	if(wait = 80){
		instance_create_depth(0,0,  Player.depth + 1 , ObjTransition)
		
		if(instance_exists(ObjOst)){
			ObjOst.end_volume = 0
		}
		
	}
	
	if(wait = 1){
		// Verificar si existe una siguiente habitación
		if room_next(room) != -1
		{
			// Cambiar a la siguiente habitación
			room_goto_next()
		}
		else
		{
			// Cambiar a la primera habitación
			room_goto(room_first);
		 }
	}
	
} 


if (keyboard_check_pressed(ord("R"))) { 
	room_restart()
}

if (keyboard_check_pressed(ord("E"))) { 
	room_goto(room_first)
}

if (keyboard_check_pressed(ord("M"))) { 
	audio_pause_all()
}


if keyboard_check_pressed(ord("N"))
{
    // Verificar si existe una siguiente habitación
    if room_next(room) != -1
    {
        // Cambiar a la siguiente habitación
        room_goto_next()
    }
    else
    {
        // Cambiar a la primera habitación
        room_goto(room_first);
    }
}

