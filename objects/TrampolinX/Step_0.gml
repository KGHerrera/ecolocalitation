with(Player) {
	if place_meeting(x + 1, y, TrampolinX) {
		//keyboard_key_release(ord("J"))
		intVY = -10
		intVX = 8
		intVXMax = 8
		other.tramp = true
		canDash = true
		dashDuration = maxDash
		isDashing = false
	}
}

if(tramp = true){
	audio_play_sound(snd_spring, 1, false)
	tramp = false	
}