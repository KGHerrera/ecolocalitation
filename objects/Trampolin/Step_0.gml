
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
	audio_play_sound(snd_spring, 1, false)
	tramp = false	
}



