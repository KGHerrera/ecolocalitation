
with(Player) {
	if (place_meeting(x, y + 1, Trampolin)) {
		intVY = -13
		other.tramp = true	
		canDash = true
		dashDuration = maxDash
		isDashing = false
	}
}

if(tramp = true){
	
	if(trampTime = 31){
		audio_play_sound(snd_spring, 1, false)
	}
	
	image_speed = 2
	trampTime--
	
	if(trampTime = 0){
		image_speed = 0
		trampTime = 31
		tramp = false
	}
}



