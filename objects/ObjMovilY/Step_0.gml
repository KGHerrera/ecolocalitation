y += int_vy

repeat(abs(int_vy)){
	if(place_meeting(x, y + sign(int_vy), ObjBlock) or scrTileMeeting(x, y + sign(int_vy), "Collision")){
		int_vy *= -1
		break
	}
}

if(obj_player.int_vy >= -1){
	if(place_meeting(x, y - 1, obj_player) && !place_meeting(x, y, obj_player)){
		with(obj_player) {
			int_vy = other.int_vy
		}
	}

	else if(place_meeting(x, y - 2, obj_player) && !place_meeting(x, y, obj_player)){
		with(obj_player){
			if(y < other.y) y++
			int_vy = other.int_vy
		}
	}

	else if(place_meeting(x, y - 3, obj_player) && !place_meeting(x, y, obj_player)){
		with(obj_player){
			if(y < other.y) y += 2
			int_vy = other.int_vy
		}
	}
	
	else if(place_meeting(x, y - 4, obj_player) && !place_meeting(x, y, obj_player)){
		with(obj_player){
			if(y < other.y) y += 3
			int_vy = other.int_vy
		}
	}
}






