x += intVX

repeat (abs(intVX)){
	if (place_meeting(x + sign(intVX), y, ObjBlock) or scrTileMeeting(x + sign(intVX), y, "Collision")){
		intVX *= -1
		break
	}
}