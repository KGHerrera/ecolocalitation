x += intVX

repeat (abs(intVX)){
	if (place_meeting(x + sign(intVX), y, ObjBlock)){
		intVX *= -1
		break
	}
}