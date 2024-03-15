with(obj_player) {
	
	if place_meeting(x + 1, y, obj_trampolin_derecha) {
		//keyboard_key_release(ord("L"))
		int_vy = -10
		int_vx = -8
		int_vxMax = 8
		other.tramp = true
		canDash = true
		dashDuration = maxDash
		isDashing = false
		coldown_right = 20
		keyRight = 0
		jump = false
	}	
}

if(tramp = true){
	audio_play_sound(snd_spring, 1, false)
	tramp = false	
}