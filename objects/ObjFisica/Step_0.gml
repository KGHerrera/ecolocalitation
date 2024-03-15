/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
bolGround		  =	scrBolGround()
insMovilH		  = instance_place(x, y + 1, ObjMovilH)

if(!bolGround) {
	intTempAcc		= intAirAcc
	intTempFric		= intAirFric
} 
else {
	intTempAcc		= intGroundAcc
	intTempFric		= intGroundFric
}


// Velocidad sobre plataforma movil
if(instance_place(x, y + 1, ObjMovilH) and !instance_place(x, y, ObjMovilH) and !place_meeting(x + insMovilH.int_vx, y, ObjBlock)){
	x += insMovilH.int_vx
}

// caida libre
if (!bolGround){
	int_vy = scrApproach(int_vy, int_vyMax, intGravityNorm)
}

// Colicion horizontal

repeat (abs(int_vx)) {		
	
	// Colicion horizontal
	if(layer_exists("Collision")){
		
		if(!scrTileMeeting(x + sign(int_vx), y, "Collision") and !place_meeting(x + sign(int_vx), y, ObjBlock)){
			x += sign(int_vx)
		} else { 
			int_vx = 0; 
			break 
		}
		
		
	}
	
	else if(!place_meeting(x + sign(int_vx), y, ObjBlock)){
		x += sign(int_vx)
	}
	
	else { 
		int_vx = 0; 
		break 
	}
	
}

// Colicion vertical
repeat (abs(int_vy)) { 
	
	if(layer_exists("Collision") and scrTileMeeting(x, y + sign(int_vy), "Collision" )){
			int_vy = 0
			break
	}
	
    if (place_meeting(x, y + sign(int_vy) ,ObjBlock)){
		int_vy = 0
		break
	} else if (place_meeting(x, y + sign(int_vy), ObjPlataform) and !place_meeting(x, y, ObjPlataform) and int_vy >= 0){
		int_vy = 0
		break
	} else if (place_meeting(x, y + sign(int_vy), ObjMovilH) and !place_meeting(x, y, ObjMovilH) and int_vy >= 0){
		int_vy = 0
		break
	}  else if (place_meeting(x, y + sign(int_vy) + 1, ObjMovilY) and !place_meeting(x, y, ObjMovilY) and int_vy >= 0){
		int_vy = instance_place(x, y + sign(int_vy) + 1, ObjMovilY).int_vy
		break
	}
	else {
		y += sign(int_vy)
	}
}

if(int_vx != 0){
	int_vx = scrApproach(int_vx, 0, 0.075);
}

