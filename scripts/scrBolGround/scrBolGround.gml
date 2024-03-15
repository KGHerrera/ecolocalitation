function scrBolGround(){
	
	if(layer_exists("Collision") and scrTileMeeting(x, y + 1, "Collision")){
		return 1
	}
	
	else if place_meeting(x, y + 1, ObjBlock) return 1
	
	else if (place_meeting(x, y + 1, ObjPlataform) and !place_meeting(x, y, ObjPlataform)){
		if(int_vy >= 0) return 1
	}
	
	else if (place_meeting(x, y + 1, ObjMovilF) and !place_meeting(x, y, ObjMovilF)){
		if(int_vy >= 0) return 1
	}
	
	else if (place_meeting(x, y + 1, ObjMovilY) and !place_meeting(x, y, ObjMovilY)){
		return 1
	}
	
	else if (place_meeting(x, y + 1, ObjMovilH) and !place_meeting(x, y, ObjMovilH)){
		if(int_vy >= 0) return 1
	}
	else return 0
}