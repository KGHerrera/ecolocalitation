y += intVY

repeat(abs(intVY)){
	if(place_meeting(x, y + sign(intVY), ObjBlock)){
		intVY *= -1
		break
	}
}

if(Player.intVY >= 0){
	if(place_meeting(x, y - 1, Player) && !place_meeting(x, y, Player)){
		with(Player){
			intVY = other.intVY
		}
	}

	if(place_meeting(x, y - 2, Player) && !place_meeting(x, y, Player)){
		with(Player){
			if(y < other.y) y++
			intVY = other.intVY
		}
	}

	if(place_meeting(x, y - 3, Player) && !place_meeting(x, y, Player)){
		with(Player){
			if(y < other.y) y += 2
			intVY = other.intVY
		}
	}
	
	if(place_meeting(x, y - 4, Player) && !place_meeting(x, y, Player)){
		with(Player){
			if(y < other.y) y += 3
			intVY = other.intVY
		}
	}
}

