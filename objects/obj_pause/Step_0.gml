if instance_exists(obj_control){
	_end = obj_control.end_
}

if (keyboard_check_pressed(ord("P")) or gamepad_button_check_pressed(0, gp_start)) and !_end
		pause = !pause

if pause {
	
	
	if snd_time = 0{
		audio_pause_all()
		audio_play_sound(snd_pause, 0, false)
	}
	snd_time--
	
	
} else {
	surface_free(pauseSurface)
	instance_activate_all()
	audio_resume_all()
	
	snd_time = 0
}