function scrBolGround(){
	
	if(layer_exists("Collision") and scrTileMeeting(x, y + 1, "Collision")){
		return 1
	}
	
	else if place_meeting(x, y + 1, obj_block) return 1
	
	else if (place_meeting(x, y + 1, obj_plataforma) and !place_meeting(x, y, obj_plataforma)){
		if(int_vy >= 0) return 1
	}
	
	else if (place_meeting(x, y + 1, obj_plat_cae) and !place_meeting(x, y, obj_plat_cae)){
		if(int_vy >= 0) return 1
	}
	
	else if (place_meeting(x, y + 1, obj_plat_movil_vertical) and !place_meeting(x, y, obj_plat_movil_vertical)){
		return 1
	}
	
	else if (place_meeting(x, y + 1, obj_plat_movil_horizontal) and !place_meeting(x, y, obj_plat_movil_horizontal)){
		if(int_vy >= 0) return 1
	}
	else return 0
}