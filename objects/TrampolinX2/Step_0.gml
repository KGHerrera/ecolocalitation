with(Player) {
	
	if place_meeting(x + 1, y, TrampolinX2) {
		//keyboard_key_release(ord("L"))
		intVY = -10
		intVX = -10
		intVXMax = 10
		other.tramp = true
		canDash = true
		dashDuration = maxDash
		isDashing = false
	}	
}

if(tramp = true){
	image_speed = 2
	
	if(trampTime = 31){
		audio_play_sound(snd_spring, 1, false)
	}
	
	trampTime--
	
	if(trampTime = 0){
		image_speed = 0
		trampTime = 31
		tramp = false
	}
}