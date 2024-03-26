
with(obj_player) {
	if (place_meeting(x, y + 1, obj_trampolin_arriba)) {
		int_vy = 13
		other.tramp = true	
		canDash = true
		dashDuration = maxDash
		isDashing = false
		jump = false
	}
}

if(tramp = true){
	audio_play_sound(snd_spring, 1, false)
	tramp = false	
}



