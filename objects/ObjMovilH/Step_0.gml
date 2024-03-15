x += int_vx

repeat (abs(int_vx)){
	if (place_meeting(x + sign(int_vx), y, ObjBlock) or scrTileMeeting(x + sign(int_vx), y, "Collision")){
		int_vx *= -1
		break
	}
}